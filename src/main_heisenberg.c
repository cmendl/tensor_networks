#include "hamiltonian_heisenberg.h"
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
		duprintf("Syntax: %s <param filename> <jA> <jB> <output path>\n", argv[0]);
		duprintf("Git commit %s\n", GIT_COMMIT);
		return -1;
	}

	sim_params_t params = { 0 };
	int status = ParseParameterFile(argv[1], &params);
	if (status < 0)
	{
		duprintf("Error parsing parameter file, exiting...\n");
		return -2;
	}
	if (params.d != 2)
	{
		duprintf("Physical dimension must be 2 for the Heisenberg model, exiting...\n");
		return -1;
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

	// site of local 'A' and 'B' operators
	const int jA = atoi(argv[2]);
	const int jB = atoi(argv[3]);
	if (jA < 0 || jA >= params.L)
	{
		duprintf("'jA = %i' out of range, must be between 0 and L-1, exiting...\n", jA);
		return -4;
	}
	if (jB < 0 || jB >= params.L)
	{
		duprintf("'jB = %i' out of range, must be between 0 and L-1, exiting...\n", jB);
		return -4;
	}

	duprintf("Starting a Heisenberg simulation on a chain with parameters:\n");
	duprintf("            lattice size L: %i\n", params.L);
	duprintf("      J coupling constants: (%g, %g, %g)\n", params.Jx, params.Jy, params.Jz);
	duprintf("          external field h: %g\n", params.hext);
	duprintf("  inverse temperature beta: %g\n", params.beta);
	duprintf("           delta beta step: %g\n", params.dbeta);
	duprintf("   largest simulation time: %g\n", params.tmax);
	duprintf("                 time step: %g\n", params.dt);
	duprintf("             MPO tolerance: %g\n", params.tol);
	duprintf("max virtual bond dimension: %zu\n", params.maxD);
	duprintf("               renormalize: %s\n", params.renormalize ? "true" : "false");
	duprintf("         'A' operator site: %i\n", jA);
	duprintf("         'B' operator site: %i\n", jB);
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

	// bond operation parameters
	bond_op_params_t bond_op_params;
	bond_op_params.tol  = params.tol;
	bond_op_params.maxD = params.maxD;
	bond_op_params.renormalize = params.renormalize;

	// ladder operators
	tensor_t Sup, Sdn;
	{
		const size_t dim[2] = { 2, 2 };
		AllocateTensor(2, dim, &Sup);
		AllocateTensor(2, dim, &Sdn);
		// (0 1)
		// (0 0)
		Sup.data[2] = 1;
		// (0 0)
		// (1 0)
		Sdn.data[1] = 1;
	}

	// construct two-site Heisenberg Hamiltonian operators
	double **h = (double **)algn_malloc((L - 1)*sizeof(double *));
	ConstructLocalHeisenbergOperators(L, params.Jx, params.Jy, params.Jz, params.hext, h);

	// start timer
	const clock_t t_cpu_start = clock();
	#ifndef PROFILER_ENABLE
	// at least record wall time
	const int64_t t_wall_start = GetTimeTicks();
	#endif
	InitProfiler(&std_profiler);

	// compute exp(-\beta H/2) as MPO
	mpo_t rho_beta;
	{
		// initialize rho_beta by the scaled identity operation (such that Frobenius norm is 1)
		CreateIdentityMPO(L, 2, &rho_beta);
		for (i = 0; i < L; i++)
		{
			ScaleTensor(sqrt(0.5), &rho_beta.A[i]);
		}

		// number of imaginary time steps
		const int nsteps = (params.beta == 0 ? 0 : (int)round(0.5*params.beta / params.dbeta));
		if (nsteps != 0 && fabs(2*nsteps*params.dbeta/params.beta - 1) > 1e-14)
		{
			duprintf("Cannot find an integer 'n' such that n*dbeta == beta/2, exiting...\n");
			return -4;
		}

		// compute evolution dynamics data required for Strang splitting evolution
		dynamics_data_t dyn;
		ComputeDynamicsDataStrang(L, params.dbeta, 4, (const double **)h, &dyn);

		// effective tolerance (truncation weight)
		double *tol_eff_beta = (double *)algn_calloc(nsteps*(L - 1), sizeof(double));

		// perform evolution
		EvolveMPOStrang(&dyn, nsteps, &bond_op_params, true, &rho_beta, tol_eff_beta);

		// save effective tolerance to disk
		sprintf(filename, "%s/heisenberg_L%i_tol_eff_beta.dat", argv[4], L);
		WriteData(filename, tol_eff_beta, sizeof(double), nsteps*(L - 1), false);

		algn_free(tol_eff_beta);
		DeleteDynamicsData(&dyn);
	}

	const double norm_rho = MPOFrobeniusNorm(&rho_beta);
	duprintf("Frobenius norm of rho_beta: %g\n", norm_rho);

	// apply single-site operators 'A' and 'B'
	mpo_t XA, XB;
	CopyMPO(&rho_beta, &XA);
	CopyMPO(&rho_beta, &XB);
	ApplySingleSiteTopOperator(   &Sup, &XA.A[jA]); // apply ladder-up operator from the top at site 'jA'
	ApplySingleSiteBottomOperator(&Sup, &XB.A[jB]); // apply ladder-up operator from the bottom at site 'jB'

	// compute dynamics data for time evolution
	dynamics_data_t dyn_time;
	ComputeDynamicsDataPRK(L, params.dt*_Complex_I, 4, (const double **)h, &dyn_time);

	// perform time evolution and compute response function at several time points

	const int nsteps = (int)round(0.5*params.tmax / params.dt);
	if (fabs(2*nsteps*params.dt/params.tmax - 1) > 1e-14)
	{
		duprintf("Cannot find an integer 'n' such that n*dt == tmax/2, exiting...\n");
		return -4;
	}

	double complex *chi = (double complex *)algn_malloc((nsteps + 1)*sizeof(double complex));

	// effective tolerance (truncation weight)
	double *tol_eff_A = (double *)algn_calloc(nsteps*(L - 1), sizeof(double));
	double *tol_eff_B = (double *)algn_calloc(nsteps*(L - 1), sizeof(double));

	// record virtual bond dimensions
	size_t *D_XA = (size_t *)algn_malloc((nsteps + 1)*(L + 1) * sizeof(size_t));
	size_t *D_XB = (size_t *)algn_malloc((nsteps + 1)*(L + 1) * sizeof(size_t));

	// response function at time t = 0
	chi[0] = MPOTraceProduct(&XA, &XB) / square(norm_rho);
	// initial virtual bond dimensions
	MPOBondDims(&XA, D_XA);
	MPOBondDims(&XB, D_XB);

	int n;
	for (n = 0; n < nsteps; n++)
	{
		duprintf("time step %i / %i\n", n + 1, nsteps);

		// single step
		EvolveLiouvilleMPOPRK(&dyn_time, 1, true,  &bond_op_params, &XA, &tol_eff_A[n*(L - 1)]);
		EvolveLiouvilleMPOPRK(&dyn_time, 1, false, &bond_op_params, &XB, &tol_eff_B[n*(L - 1)]);

		chi[n + 1] = MPOTraceProduct(&XA, &XB) / square(norm_rho);

		// record virtual bond dimensions
		MPOBondDims(&XA, &D_XA[(n + 1)*(L + 1)]);
		MPOBondDims(&XB, &D_XB[(n + 1)*(L + 1)]);
	}

	duprintf("chi at t = %g: %g%+gi\n", params.tmax, creal(chi[nsteps]), cimag(chi[nsteps]));
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

	// save results to disk
	sprintf(filename, "%s/heisenberg_L%i_chi.dat", argv[4], L); WriteData(filename, chi, sizeof(double complex), nsteps + 1, false);
	sprintf(filename, "%s/heisenberg_L%i_tol_eff_A.dat", argv[4], L); WriteData(filename, tol_eff_A, sizeof(double), nsteps*(L - 1), false);
	sprintf(filename, "%s/heisenberg_L%i_tol_eff_B.dat", argv[4], L); WriteData(filename, tol_eff_B, sizeof(double), nsteps*(L - 1), false);
	sprintf(filename, "%s/heisenberg_L%i_DXA.dat", argv[4], L); WriteData(filename, D_XA, sizeof(size_t), (nsteps + 1)*(L + 1), false);
	sprintf(filename, "%s/heisenberg_L%i_DXB.dat", argv[4], L); WriteData(filename, D_XB, sizeof(size_t), (nsteps + 1)*(L + 1), false);

	// clean up
	algn_free(D_XB);
	algn_free(D_XA);
	algn_free(tol_eff_B);
	algn_free(tol_eff_A);
	algn_free(chi);
	DeleteDynamicsData(&dyn_time);
	DeleteMPO(&XB);
	DeleteMPO(&XA);
	DeleteMPO(&rho_beta);
	DeleteLocalHeisenbergOperators(L, h);
	algn_free(h);
	DeleteTensor(&Sdn);
	DeleteTensor(&Sup);

	#ifdef USE_MKL
	MKL_Free_Buffers();

	int nbuffers;
	MKL_INT64 nbytes_alloc;
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
