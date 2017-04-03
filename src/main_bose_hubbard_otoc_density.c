#include "hamiltonian.h"
#include "dynamics.h"
#include "complex.h"
#include "sim_params.h"
#include "dupio.h"
#include <mkl.h>
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
//


int main(int argc, char *argv[])
{
	int i;
	size_t j;

	if (argc != 5)
	{
		duprintf("Syntax: %s <param filename> <i> <j> <output path>\n", argv[0]);
		return -1;
	}

	// enable peak memory recording
	MKL_Peak_Mem_Usage(MKL_PEAK_MEM_ENABLE);

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

	duprintf("Computing density OTOCs for the Bose-Hubbard model on a chain with parameters:\n");
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
	duprintf("                  'i' site: %i\n", i_site);
	duprintf("                  'j' site: %i\n", j_site);
	duprintf("           MKL max threads: %i\n", MKL_Get_Max_Threads());
	duprintf("\n");

	// number of lattice sites
	const int L = params.L;
	// physical dimension, equal to the maximal occupancy per site + 1
	const size_t d = params.d;

	// bosonic number operator
	tensor_t bn;
	{
		const size_t dim[2] = { d, d };
		AllocateTensor(2, dim, &bn);
		for (j = 0; j < d; j++)
		{
			bn.data[j + j*d].real = (double)j;
		}
	}

	// construct two-site Bose-Hubbard Hamiltonian operators
	double **h = (double **)MKL_malloc((L - 1)*sizeof(double *), MEM_DATA_ALIGN);
	ConstructLocalBoseHubbardOperators(L, d - 1, params.t, params.U, params.mu, h);

	// start timer
	const clock_t t_cpu_start = clock();
	const unsigned long long t_wall_start = GetTimeTicks();

	// compute exp(-beta H) as MPO
	mpo_t exp_betaH;
	{
		// initialize exp_betaH by the identity operation
		CreateIdentityMPO(L, d, &exp_betaH);

		const int nsteps = (int)round(params.beta / params.dbeta);
		if (fabs(nsteps*params.dbeta/params.beta - 1) > 1e-14)
		{
			duprintf("Cannot find an integer 'n' such that n*dbeta == beta, exiting...\n");
			return -4;
		}

		const MKL_Complex16 dbeta = { params.dbeta, 0 };

		// compute evolution dynamics data required for Strang splitting evolution
		dynamics_data_t dyn;
		ComputeDynamicsDataStrang(L, dbeta, d*d, (const double **)h, &dyn);

		// effective tolerance (truncation weight)
		double *tol_eff_beta = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);

		// perform imaginary time evolution; using "normalization" to keep A[0] matrix entries of order 1
		EvolveMPOStrang(&dyn, nsteps, params.tol, params.maxD, true, &exp_betaH, tol_eff_beta);

		// record virtual bond dimensions
		size_t *D_beta = (size_t *)MKL_malloc((L + 1) * sizeof(size_t), MEM_DATA_ALIGN);
		MPOBondDims(&exp_betaH, D_beta);

		// save effective tolerances and virtual bond dimensions to disk
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_beta.dat", argv[4], L, d - 1); WriteData(filename, tol_eff_beta, sizeof(double), nsteps*(L - 1), false);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_D_beta.dat",       argv[4], L, d - 1); WriteData(filename, D_beta, sizeof(size_t), L + 1, false);

		MKL_free(D_beta);
		MKL_free(tol_eff_beta);
		DeleteDynamicsData(&dyn);
	}

	// record trace of exp(-beta H)
	const double Zbeta = ComplexReal(MPOTrace(&exp_betaH));
	duprintf("Trace of exp_betaH: %g\n", Zbeta);

	// compute local density
	{
		double *density = (double *)MKL_malloc(L*sizeof(double), MEM_DATA_ALIGN);

		mpo_t exp_betaH_n;
		CopyMPO(&exp_betaH, &exp_betaH_n);

		int i;
		for (i = 0; i < L; i++)
		{
			// apply number operator at site i
			ApplySingleSiteTopOperator(&exp_betaH_n.A[i], &bn);

			density[i] = ComplexReal(MPOTrace(&exp_betaH_n)) / Zbeta;

			// restore original tensor at site i
			DeleteTensor(&exp_betaH_n.A[i]);
			CopyTensor(&exp_betaH.A[i], &exp_betaH_n.A[i]);
		}

		// save density to disk
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_density.dat", argv[4], L, d - 1);
		WriteData(filename, density, sizeof(double), L, false);

		// clean up
		DeleteMPO(&exp_betaH_n);
		MKL_free(density);
	}

	// compute total energy
	{
		// construct matrix product operator representation
		mpo_t mpoH;
		ConstructBoseHubbardMPO(L, d - 1, params.t, params.U, params.mu, &mpoH);

		const double energy = ComplexReal(MPOTraceProduct(&exp_betaH, &mpoH)) / Zbeta;
		duprintf("Total energy Tr[exp(-beta H) H]: %g\n", energy);

		// save energy to disk
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_energy.dat", argv[4], L, d - 1);
		WriteData(filename, &energy, sizeof(double), 1, false);

		DeleteMPO(&mpoH);
	}

	duprintf("Current CPU time: %g seconds\n", (double)(clock() - t_cpu_start) / CLOCKS_PER_SEC);
	int nbuffers;
	MKL_INT64 nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));

	duprintf("\nStarting time evolution...\n");

	// time-evolve two MPOs
	mpo_t XA, XB;
	CopyMPO(&exp_betaH, &XA);
	CreateIdentityMPO(L, d, &XB);
	ApplySingleSiteBottomOperator(&XA.A[j_site], &bn);  //  number operator at site j
	ApplySingleSiteBottomOperator(&XB.A[j_site], &bn);   // number operator at site j ('top' or 'bottom' irrelevant here since 'XB' starts as identity)

	// compute dynamics data for time evolution
	dynamics_data_t dyn_time;
	const MKL_Complex16 idt = { 0, params.dt };
	ComputeDynamicsDataPRK(L, idt, d*d, (const double **)h, &dyn_time);

	// perform time evolution and compute OTOCs at several time points

	const int nsteps = (int)round(params.tmax / params.dt);
	if (fabs(nsteps*params.dt/params.tmax - 1) > 1e-14)
	{
		duprintf("Cannot find an integer 'n' such that n*dt == tmax, exiting...\n");
		return -4;
	}

	MKL_Complex16 *n_otoc  = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	MKL_Complex16 *nn_corr = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);

	// effective tolerance (truncation weight)
	double *tol_eff_A = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);
	double *tol_eff_B = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);

	// record virtual bond dimensions
	size_t *D_XA = (size_t *)MKL_malloc((nsteps + 1)*(L + 1) * sizeof(size_t), MEM_DATA_ALIGN);
	size_t *D_XB = (size_t *)MKL_malloc((nsteps + 1)*(L + 1) * sizeof(size_t), MEM_DATA_ALIGN);

	int n;
	for (n = 0; n <= nsteps; n++)
	{
		duprintf("time step %i / %i\n", n, nsteps);

		// density OTOC at current time point
		{
			// backup copy of tensors at site 'i'
			tensor_t XAi, XBi;
			CopyTensor(&XA.A[i_site], &XAi);
			CopyTensor(&XB.A[i_site], &XBi);

			ApplySingleSiteBottomOperator(&XA.A[i_site], &bn);  // number operator at site i
			ApplySingleSiteBottomOperator(&XB.A[i_site], &bn);  // number operator at site i

			n_otoc[n]  = ComplexScale(1/Zbeta, MPOTraceProduct(&XA, &XB));
			nn_corr[n] = ComplexScale(1/Zbeta, MPOTrace(&XA));

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
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_otoc_tmp.dat",    argv[4], L, d - 1); WriteData(filename, &n_otoc[n],  sizeof(MKL_Complex16), 1, true);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_nn_corr_tmp.dat", argv[4], L, d - 1); WriteData(filename, &nn_corr[n], sizeof(MKL_Complex16), 1, true);

		// final time step nowhere used; note that index n == nsteps would be out of range for effective tolerance
		if (n == nsteps) {
			break;
		}

		// single step
		EvolveLiouvilleMPOPRK(&dyn_time, 1, true,  params.tol, params.maxD, &XA, &tol_eff_A[n*(L - 1)]);
		EvolveLiouvilleMPOPRK(&dyn_time, 1, true,  params.tol, params.maxD, &XB, &tol_eff_B[n*(L - 1)]);
	}

	duprintf("At t = %g:\n", params.tmax);
	duprintf("<n_j(t) n_i(0) n_j(t) n_i(0)> = (%g, %g)\n",  n_otoc[nsteps].real,  n_otoc[nsteps].imag);
	duprintf("<n_j(t) n_i(0)>               = (%g, %g)\n", nn_corr[nsteps].real, nn_corr[nsteps].imag);

	const clock_t t_cpu_end = clock();
	const unsigned long long t_wall_end = GetTimeTicks();
	double cpu_time = (double)(t_cpu_end  - t_cpu_start ) / CLOCKS_PER_SEC;
	double walltime = (double)(t_wall_end - t_wall_start) / GetTimeResolution();
	duprintf("\nFinished simulation, CPU time: %g seconds, wall clock time: %g seconds\n", cpu_time, walltime);
	nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));

	// save results to disk
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_n_otoc.dat",    argv[4], L, d - 1); WriteData(filename,  n_otoc, sizeof(MKL_Complex16), nsteps + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_nn_corr.dat",   argv[4], L, d - 1); WriteData(filename, nn_corr, sizeof(MKL_Complex16), nsteps + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_A.dat", argv[4], L, d - 1); WriteData(filename, tol_eff_A, sizeof(double), nsteps*(L - 1), false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_B.dat", argv[4], L, d - 1); WriteData(filename, tol_eff_B, sizeof(double), nsteps*(L - 1), false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXA.dat",       argv[4], L, d - 1); WriteData(filename, D_XA, sizeof(size_t), (nsteps + 1)*(L + 1), false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXB.dat",       argv[4], L, d - 1); WriteData(filename, D_XB, sizeof(size_t), (nsteps + 1)*(L + 1), false);

	if (params.save_tensors)
	{
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XA", argv[4], L, d - 1); makedir(filename);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XB", argv[4], L, d - 1); makedir(filename);

		for (i = 0; i < L; i++)
		{
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XA/A%i.dat", argv[4], L, d - 1, i); WriteData(filename, XA.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XA.A[i]), false);
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XB/A%i.dat", argv[4], L, d - 1, i); WriteData(filename, XB.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XB.A[i]), false);
		}
	}

	// clean up
	MKL_free(D_XB);
	MKL_free(D_XA);
	MKL_free(tol_eff_B);
	MKL_free(tol_eff_A);
	MKL_free(nn_corr);
	MKL_free(n_otoc);
	DeleteDynamicsData(&dyn_time);
	DeleteMPO(&XB);
	DeleteMPO(&XA);
	DeleteMPO(&exp_betaH);
	DeleteLocalHamiltonianOperators(L, h);
	MKL_free(h);
	DeleteTensor(&bn);

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

	fclose(fd_log);

	return 0;
}
