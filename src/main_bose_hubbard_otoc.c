#include "hamiltonian_bose_hubbard.h"
#include "dynamics.h"
#include "sim_params.h"
#include "profiler.h"
#include "dupio.h"
#include <math.h>
#ifdef USE_MKL
#include <mkl.h>
#endif
#ifdef _OPENMP
#include <omp.h>
#endif
#include <time.h>
#include <stdio.h>

// for creating directories
#ifdef _WIN32
#include <windows.h>
#include <direct.h>

static int makedir(const char *path)
{
	return _mkdir(path);
}

#else

#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

static int makedir(const char *path)
{
	return mkdir(path, 0755);
}

#endif


//________________________________________________________________________________________________________________________
///
/// \brief Local MPO update by single-site operator 'opT' from the top
///
static void ApplySingleSiteTopOperator(const tensor_t *restrict opT, tensor_t *restrict A)
{
	assert(A->ndim == 4);

	tensor_t t;
	MoveTensorData(A, &t);
	// result of multiplication again stored in 'A'
	MultiplyTensor(opT, &t, 1, A);
	DeleteTensor(&t);
}


//________________________________________________________________________________________________________________________
///
/// \brief Local MPO update by single-site operator 'opB' from the bottom
///
static void ApplySingleSiteBottomOperator(const tensor_t *restrict opB, tensor_t *restrict A)
{
	assert(A->ndim == 4);

	tensor_t s, t;

	// transpose incoming physical dimension to the back
	const int perm0[4] = { 0, 3, 1, 2 };
	TransposeTensor(perm0, A, &s);
	DeleteTensor(A);

	// apply operator
	MultiplyTensor(&s, opB, 1, &t);
	DeleteTensor(&s);

	// restore ordering of dimensions
	const int perm1[4] = { 0, 2, 3, 1 };
	TransposeTensor(perm1, &t, A);
	DeleteTensor(&t);
}


//________________________________________________________________________________________________________________________
//


int main(int argc, char *argv[])
{
	int i;
	size_t j;

	if (argc != 5)
	{
		duprintf("Syntax: %s <param filename> <i> <j> <output path>\n", argv[0]);
		duprintf("Git commit %s\n", GIT_COMMIT);
		return -1;
	}

	// enable peak memory recording
	#ifdef USE_MKL
	MKL_Peak_Mem_Usage(MKL_PEAK_MEM_ENABLE);
	#endif

	sim_params_t params = { 0 };
	int status = ParseParameterFile(argv[1], &params);
	if (status < 0)
	{
		duprintf("Error parsing parameter file, exiting...\n");
		return -2;
	}

	// try to create output path if it does not exist yet
	makedir(argv[4]);

	// open simulation log file for writing
	char filename[2048];
	sprintf(filename, "%s/simulation.log", argv[4]);
	fd_log = fopen(filename, "w");
	if (fd_log == NULL)
	{
		duprintf("Cannot open log file '%s', exiting...\n", filename);
		return -3;
	}

	// sites 'i' and 'j'
	const int i_site = atoi(argv[2]);
	const int j_site = atoi(argv[3]);
	if (i_site < 0 || i_site >= params.L)
	{
		duprintf("'i = %i' out of range, must be between 0 and L-1, exiting...\n", i_site);
		return -4;
	}
	if (j_site < 0 || j_site >= params.L)
	{
		duprintf("'j = %i' out of range, must be between 0 and L-1, exiting...\n", j_site);
		return -4;
	}

	duprintf("Computing OTOCs for the Bose-Hubbard model on a chain with parameters:\n");
	duprintf("            lattice size L: %i\n", params.L);
	duprintf("    max occupancy per site: %zu\n", params.d - 1);
	duprintf("         kinetic hopping t: %g\n", params.t);
	duprintf("                 Hubbard U: %g\n", params.U);
	duprintf("     chemical potential mu: %g\n", params.mu);
	duprintf("  inverse temperature beta: %g\n", params.beta);
	duprintf("           delta beta step: %g\n", params.dbeta);
	duprintf("   largest simulation time: %g\n", params.tmax);
	duprintf("                 time step: %g\n", params.dt);
	duprintf("             MPO tolerance: %g\n", params.tol);
	duprintf("max virtual bond dimension: %zu\n", params.maxD);
	duprintf("               renormalize: %s\n", params.renormalize ? "true" : "false");
	duprintf("                  'i' site: %i\n", i_site);
	duprintf("                  'j' site: %i\n", j_site);
	#ifdef USE_MKL
	duprintf("           MKL max threads: %i\n", MKL_Get_Max_Threads());
	#endif
	#ifdef _OPENMP
	duprintf("        OpenMP max threads: %i\n", omp_get_max_threads());
	#endif
	duprintf("\n");
	duprintf("Git commit %s\n", GIT_COMMIT);
	duprintf("\n");

	// number of lattice sites
	const int L = params.L;
	// physical dimension, equal to the maximal occupancy per site + 1
	const size_t d = params.d;

	// bond operation parameters
	bond_op_params_t bond_op_params;
	bond_op_params.tol  = params.tol;
	bond_op_params.maxD = params.maxD;
	bond_op_params.renormalize = params.renormalize;

	// bosonic creation operator
	tensor_t bd;
	{
		const size_t dim[2] = { d, d };
		AllocateTensor(2, dim, &bd);
		for (j = 0; j < d - 1; j++)
		{
			bd.data[(j+1) + j*d] = sqrt(1.0 + j);
		}
	}
	// bosonic annihilation operator
	tensor_t b;
	{
		const size_t dim[2] = { d, d };
		AllocateTensor(2, dim, &b);
		for (j = 0; j < d - 1; j++)
		{
			b.data[j + (j+1)*d] = sqrt(1.0 + j);
		}
	}
	// bosonic number operator
	tensor_t bn;
	{
		const size_t dim[2] = { d, d };
		AllocateTensor(2, dim, &bn);
		for (j = 0; j < d; j++)
		{
			bn.data[j + j*d] = j;
		}
	}

	// construct two-site Bose-Hubbard Hamiltonian operators
	double **h = (double **)algn_malloc((L - 1)*sizeof(double *));
	ConstructLocalBoseHubbardOperators(L, d - 1, params.t, params.U, params.mu, h);

	// start timer
	const clock_t t_cpu_start = clock();
	#ifndef PROFILER_ENABLE
	// at least record wall time
	const int64_t t_wall_start = GetTimeTicks();
	#endif
	InitProfiler(&std_profiler);

	// compute exp(-beta H) as MPO
	mpo_t exp_betaH;
	{
		// initialize exp_betaH by the scaled identity operation (such that Frobenius norm is 1)
		CreateIdentityMPO(L, d, &exp_betaH);
		for (i = 0; i < L; i++)
		{
			ScaleTensor(1.0 / sqrt(d), &exp_betaH.A[i]);
		}

		// number of imaginary time steps
		const int nsteps = (params.beta == 0 ? 0 : (int)round(params.beta / params.dbeta));
		if (nsteps != 0 && fabs(nsteps*params.dbeta/params.beta - 1) > 1e-14)
		{
			duprintf("Cannot find an integer 'n' such that n*dbeta == beta, exiting...\n");
			return -4;
		}

		// compute evolution dynamics data required for Strang splitting evolution
		dynamics_data_t dyn;
		ComputeDynamicsDataStrang(L, params.dbeta, d*d, (const double **)h, &dyn);

		// effective tolerance (truncation weight)
		double *tol_eff_beta = (double *)algn_calloc(nsteps*(L - 1), sizeof(double));

		// perform imaginary time evolution; using "normalization" to keep A[0] matrix entries of order 1
		EvolveMPOStrang(&dyn, nsteps, &bond_op_params, true, &exp_betaH, tol_eff_beta);

		// record virtual bond dimensions
		size_t *D_beta = (size_t *)algn_malloc((L + 1) * sizeof(size_t));
		MPOBondDims(&exp_betaH, D_beta);

		// save effective tolerances and virtual bond dimensions to disk
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_beta.dat", argv[4], L, d - 1); WriteData(filename, tol_eff_beta, sizeof(double), nsteps*(L - 1), false);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_D_beta.dat",       argv[4], L, d - 1); WriteData(filename, D_beta, sizeof(size_t), L + 1, false);

		algn_free(D_beta);
		algn_free(tol_eff_beta);
		DeleteDynamicsData(&dyn);
	}

	// record trace of exp(-beta H)
	const double Zbeta = creal(MPOTrace(&exp_betaH));
	duprintf("Trace of exp_betaH: %g\n", Zbeta);

	// compute local density
	{
		double *density = (double *)algn_malloc(L*sizeof(double));

		mpo_t exp_betaH_n;
		CopyMPO(&exp_betaH, &exp_betaH_n);

		int i;
		for (i = 0; i < L; i++)
		{
			// apply number operator at site i
			ApplySingleSiteTopOperator(&bn, &exp_betaH_n.A[i]);

			density[i] = creal(MPOTrace(&exp_betaH_n)) / Zbeta;

			// restore original tensor at site i
			DeleteTensor(&exp_betaH_n.A[i]);
			CopyTensor(&exp_betaH.A[i], &exp_betaH_n.A[i]);
		}

		// save density to disk
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_density.dat", argv[4], L, d - 1);
		WriteData(filename, density, sizeof(double), L, false);

		// clean up
		DeleteMPO(&exp_betaH_n);
		algn_free(density);
	}

	// compute total energy
	{
		// construct matrix product operator representation
		mpo_t mpoH;
		ConstructBoseHubbardMPO(L, d - 1, params.t, params.U, params.mu, &mpoH);

		const double energy = creal(MPOTraceProduct(&exp_betaH, &mpoH)) / Zbeta;
		duprintf("Total energy Tr[exp(-beta H) H]: %g\n", energy);

		// save energy to disk
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_energy.dat", argv[4], L, d - 1);
		WriteData(filename, &energy, sizeof(double), 1, false);

		DeleteMPO(&mpoH);
	}

	duprintf("Current CPU time: %g seconds\n", (double)(clock() - t_cpu_start) / CLOCKS_PER_SEC);
	#ifdef USE_MKL
	int nbuffers;
	MKL_INT64 nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));
	#endif

	duprintf("\nStarting time evolution...\n");

	// time-evolve two MPOs
	mpo_t XA, XB;
	CopyMPO(&exp_betaH, &XA);
	CreateIdentityMPO(L, d, &XB);
	ApplySingleSiteBottomOperator(&bd, &XA.A[j_site]);  //     creation operator at site j
	ApplySingleSiteBottomOperator(&b,  &XB.A[j_site]);  // annihilation operator at site j ('top' or 'bottom' irrelevant here since 'XB' starts as identity)

	// compute dynamics data for time evolution
	dynamics_data_t dyn_time;
	ComputeDynamicsDataPRK(L, params.dt*_Complex_I, d*d, (const double **)h, &dyn_time);

	// perform time evolution and compute OTOCs at several time points

	const int nsteps = (int)round(params.tmax / params.dt);
	if (fabs(nsteps*params.dt/params.tmax - 1) > 1e-14)
	{
		duprintf("Cannot find an integer 'n' such that n*dt == tmax, exiting...\n");
		return -4;
	}

	double complex *otoc1 = (double complex *)algn_malloc((nsteps + 1)*sizeof(double complex));
	double complex *otoc2 = (double complex *)algn_malloc((nsteps + 1)*sizeof(double complex));
	double complex *gf    = (double complex *)algn_malloc((nsteps + 1)*sizeof(double complex));

	// effective tolerance (truncation weight)
	double *tol_eff_A = (double *)algn_calloc(nsteps*(L - 1), sizeof(double));
	double *tol_eff_B = (double *)algn_calloc(nsteps*(L - 1), sizeof(double));

	// record virtual bond dimensions
	size_t *D_XA = (size_t *)algn_malloc((nsteps + 1)*(L + 1) * sizeof(size_t));
	size_t *D_XB = (size_t *)algn_malloc((nsteps + 1)*(L + 1) * sizeof(size_t));

	int nstart = 0;

	if (params.save_tensors)
	{
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XA", argv[4], L, d - 1); makedir(filename);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XB", argv[4], L, d - 1); makedir(filename);

		// try to open 'n_step' file if it exists, to continue simulation after previous checkpoint
		duprintf("Trying to read 'n_step' file...\n");
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_n_step.dat", argv[4], L, d - 1);
		status = ReadData(filename, &nstart, sizeof(int), 1);
		if (status == 0 && (nstart > 0 && nstart < nsteps))
		{
			duprintf("Continuing simulation after time step %i...\n", nstart);

			// read intermediate results to disk
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_otoc1_tmp.dat",     argv[4], L, d - 1); status = ReadData(filename, otoc1,     sizeof(double complex), nstart + 1);    if (status < 0) { return status; }
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_otoc2_tmp.dat",     argv[4], L, d - 1); status = ReadData(filename, otoc2,     sizeof(double complex), nstart + 1);    if (status < 0) { return status; }
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_gf_tmp.dat",        argv[4], L, d - 1); status = ReadData(filename, gf,        sizeof(double complex), nstart + 1);    if (status < 0) { return status; }
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXA_tmp.dat",       argv[4], L, d - 1); status = ReadData(filename, D_XA,      sizeof(size_t), (nstart + 1)*(L + 1));  if (status < 0) { return status; }
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXB_tmp.dat",       argv[4], L, d - 1); status = ReadData(filename, D_XB,      sizeof(size_t), (nstart + 1)*(L + 1));  if (status < 0) { return status; }
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_A_tmp.dat", argv[4], L, d - 1); status = ReadData(filename, tol_eff_A, sizeof(double),  nstart     *(L - 1));  if (status < 0) { return status; }
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_B_tmp.dat", argv[4], L, d - 1); status = ReadData(filename, tol_eff_B, sizeof(double),  nstart     *(L - 1));  if (status < 0) { return status; }

			// re-allocate and fill MPOs
			DeleteMPO(&XB);
			DeleteMPO(&XA);
			const size_t dim[2] = { d, d };
			AllocateMPO(L, dim, &D_XA[nstart*(L + 1)], &XA);
			AllocateMPO(L, dim, &D_XB[nstart*(L + 1)], &XB);
			for (i = 0; i < L; i++)
			{
				sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XA/A%i.dat", argv[4], L, d - 1, i); status = ReadData(filename, XA.A[i].data, sizeof(double complex), NumTensorElements(&XA.A[i]));  if (status < 0) { return status; }
				sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XB/A%i.dat", argv[4], L, d - 1, i); status = ReadData(filename, XB.A[i].data, sizeof(double complex), NumTensorElements(&XB.A[i]));  if (status < 0) { return status; }
			}

			// single step
			EvolveLiouvilleMPOPRK(&dyn_time, 1, true, &bond_op_params, &XA, &tol_eff_A[nstart*(L - 1)]);
			EvolveLiouvilleMPOPRK(&dyn_time, 1, true, &bond_op_params, &XB, &tol_eff_B[nstart*(L - 1)]);

			nstart++;
		}
		else
		{
			duprintf("Could not read 'n_step' file, or step out of range; starting from step 0...\n");
			nstart = 0;
		}
	}

	int n;
	for (n = nstart; n <= nsteps; n++)
	{
		duprintf("time step %i / %i\n", n, nsteps);

		// OTOCs at current time point
		{
			// backup copy of tensors at site 'i'
			tensor_t XAi, XBi;
			CopyTensor(&XA.A[i_site], &XAi);
			CopyTensor(&XB.A[i_site], &XBi);

			ApplySingleSiteBottomOperator(&bd, &XA.A[i_site]);  //     creation operator at site i
			ApplySingleSiteBottomOperator(&b,  &XB.A[i_site]);  // annihilation operator at site i

			otoc1[n] = MPOTraceProduct(&XA, &XB) / Zbeta;

			// restore original tensors
			DeleteTensor(&XA.A[i_site]);
			DeleteTensor(&XB.A[i_site]);
			CopyTensor(&XAi, &XA.A[i_site]);
			CopyTensor(&XBi, &XB.A[i_site]);

			ApplySingleSiteBottomOperator(&b,  &XA.A[i_site]);  // annihilation operator at site i
			ApplySingleSiteBottomOperator(&bd, &XB.A[i_site]);  //     creation operator at site i

			otoc2[n] = MPOTraceProduct(&XA, &XB) / Zbeta;
			   gf[n] = MPOTrace(&XA) / Zbeta;

			// restore original tensors
			DeleteTensor(&XA.A[i_site]);
			DeleteTensor(&XB.A[i_site]);
			MoveTensorData(&XAi, &XA.A[i_site]);
			MoveTensorData(&XBi, &XB.A[i_site]);
		}

		// record virtual bond dimensions
		MPOBondDims(&XA, &D_XA[n*(L + 1)]);
		MPOBondDims(&XB, &D_XB[n*(L + 1)]);

		// save intermediate results to disk
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_otoc1_tmp.dat", argv[4], L, d - 1); WriteData(filename, &otoc1[n], sizeof(double complex), 1, true);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_otoc2_tmp.dat", argv[4], L, d - 1); WriteData(filename, &otoc2[n], sizeof(double complex), 1, true);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_gf_tmp.dat",    argv[4], L, d - 1); WriteData(filename, &gf[n],    sizeof(double complex), 1, true);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXA_tmp.dat",   argv[4], L, d - 1); WriteData(filename, &D_XA[n*(L + 1)], sizeof(size_t), L + 1, true);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXB_tmp.dat",   argv[4], L, d - 1); WriteData(filename, &D_XB[n*(L + 1)], sizeof(size_t), L + 1, true);
		if (n > 0) {
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_A_tmp.dat", argv[4], L, d - 1); WriteData(filename, &tol_eff_A[(n - 1)*(L - 1)], sizeof(double), L - 1, true);
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_B_tmp.dat", argv[4], L, d - 1); WriteData(filename, &tol_eff_B[(n - 1)*(L - 1)], sizeof(double), L - 1, true);
		}
		if (params.save_tensors)
		{
			for (i = 0; i < L; i++)
			{
				sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XA/A%i.dat", argv[4], L, d - 1, i); WriteData(filename, XA.A[i].data, sizeof(double complex), NumTensorElements(&XA.A[i]), false);
				sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XB/A%i.dat", argv[4], L, d - 1, i); WriteData(filename, XB.A[i].data, sizeof(double complex), NumTensorElements(&XB.A[i]), false);
			}
		}

		// record completed step
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_n_step.dat", argv[4], L, d - 1); WriteData(filename, &n, sizeof(int), 1, false);

		// final time step nowhere used; note that index n == nsteps would be out of range for effective tolerance
		if (n == nsteps) {
			break;
		}

		// single step
		EvolveLiouvilleMPOPRK(&dyn_time, 1, true, &bond_op_params, &XA, &tol_eff_A[n*(L - 1)]);
		EvolveLiouvilleMPOPRK(&dyn_time, 1, true, &bond_op_params, &XB, &tol_eff_B[n*(L - 1)]);
	}

	duprintf("At t = %g:\n", params.tmax);
	duprintf("<bj^dagger(t) bi^dagger(0) bj(t) bi(0)> = %g%+gi\n", creal(otoc1[nsteps]), cimag(otoc1[nsteps]));
	duprintf("<bj^dagger(t) bi(0) bj(t) bi^dagger(0)> = %g%+gi\n", creal(otoc2[nsteps]), cimag(otoc2[nsteps]));
	duprintf("<bj^dagger(t) bi(0)>                    = %g%+gi\n",    creal(gf[nsteps]),    cimag(gf[nsteps]));
	duprintf("\n");

	const clock_t t_cpu_end = clock();
	double cpu_time = (double)(t_cpu_end  - t_cpu_start ) / CLOCKS_PER_SEC;
	duprintf("CPU time: %g seconds\n", cpu_time);
	#ifndef PROFILER_ENABLE
	const int64_t t_wall_end = GetTimeTicks();
	double walltime = (double)(t_wall_end - t_wall_start) / GetTimeResolution();
	duprintf("Wall clock time: %g seconds\n", walltime);
	#endif
	PrintProfilerReport(&std_profiler);
	#ifdef USE_MKL
	nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));
	#endif

	// save results to disk
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_otoc1.dat",     argv[4], L, d - 1); WriteData(filename, otoc1, sizeof(double complex),  nsteps + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_otoc2.dat",     argv[4], L, d - 1); WriteData(filename, otoc2, sizeof(double complex),  nsteps + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_gf.dat",        argv[4], L, d - 1); WriteData(filename, gf,    sizeof(double complex),  nsteps + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_A.dat", argv[4], L, d - 1); WriteData(filename, tol_eff_A, sizeof(double),  nsteps*(L - 1), false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_B.dat", argv[4], L, d - 1); WriteData(filename, tol_eff_B, sizeof(double),  nsteps*(L - 1), false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXA.dat",       argv[4], L, d - 1); WriteData(filename, D_XA, sizeof(size_t), (nsteps + 1)*(L + 1), false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXB.dat",       argv[4], L, d - 1); WriteData(filename, D_XB, sizeof(size_t), (nsteps + 1)*(L + 1), false);

	// clean up
	algn_free(D_XB);
	algn_free(D_XA);
	algn_free(tol_eff_B);
	algn_free(tol_eff_A);
	algn_free(gf);
	algn_free(otoc2);
	algn_free(otoc1);
	DeleteDynamicsData(&dyn_time);
	DeleteMPO(&XB);
	DeleteMPO(&XA);
	DeleteMPO(&exp_betaH);
	DeleteLocalBoseHubbardOperators(L, h);
	algn_free(h);
	DeleteTensor(&bn);
	DeleteTensor(&b);
	DeleteTensor(&bd);

	#ifdef USE_MKL
	MKL_Free_Buffers();

	nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	if (nbytes_alloc > 0)
	{
		duprintf("\nMKL memory leak detected! MKL still uses %lld bytes in %d buffer(s).\n", nbytes_alloc, nbuffers);
	}
	else
	{
		duprintf("\nMKL memory leak check appears to be fine.\n");
	}
	#endif

	fclose(fd_log);

	return 0;
}
