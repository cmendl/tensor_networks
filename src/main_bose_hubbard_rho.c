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
#include <memory.h>
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

	if (argc != 3)
	{
		duprintf("Syntax: %s <param filename> <output path>\n", argv[0]);
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
	makedir(argv[2]);

	// open simulation log file for writing
	char filename[2048];
	sprintf(filename, "%s/simulation.log", argv[2]);
	fd_log = fopen(filename, "w");
	if (fd_log == NULL)
	{
		duprintf("Cannot open log file '%s', exiting...\n", filename);
		return -3;
	}

	duprintf("Computing exp(-beta H/2) for the Bose-Hubbard Hamiltonian on a chain with parameters:\n");
	duprintf("            lattice size L: %i\n", params.L);
	duprintf("    max occupancy per site: %zu\n", params.d - 1);
	duprintf("         kinetic hopping t: %g\n", params.t);
	duprintf("                 Hubbard U: %g\n", params.U);
	duprintf("     chemical potential mu: %g\n", params.mu);
	duprintf("  inverse temperature beta: %g\n", params.beta);
	duprintf("           delta beta step: %g\n", params.dbeta);
	duprintf("             MPO tolerance: %g\n", params.tol);
	duprintf("max virtual bond dimension: %zu\n", params.maxD);
	duprintf("               renormalize: %s\n", params.renormalize ? "true" : "false");
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

	// physical quantum numbers
	qnumber_t *qd = (qnumber_t *)algn_malloc(d * sizeof(qnumber_t));
	for (j = 0; j < d; j++)
	{
		qd[j] = j;
	}

	// number operator
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

	// compute exp(-\beta H/2) as MPO
	mpo_t rho_beta;

	// initialize rho_beta by the scaled identity operation (such that Frobenius norm is 1)
	CreateIdentityMPO(L, d, &rho_beta);
	for (i = 0; i < L; i++)
	{
		ScaleTensor(1.0 / sqrt(d), &rho_beta.A[i]);
	}
	memcpy(rho_beta.qd[0], qd, d*sizeof(qnumber_t));
	memcpy(rho_beta.qd[1], qd, d*sizeof(qnumber_t));

	// number of imaginary time steps
	const int nsteps = (params.beta == 0 ? 0 : (int)round(0.5*params.beta / params.dbeta));
	if (nsteps != 0 && fabs(2*nsteps*params.dbeta/params.beta - 1) > 1e-14)
	{
		duprintf("Cannot find an integer 'n' such that n*dbeta == beta/2, exiting...\n");
		return -4;
	}

	// compute evolution dynamics data required for Strang splitting evolution
	dynamics_data_t dyn;
	ComputeDynamicsDataStrang(L, params.dbeta, d*d, (const double **)h, &dyn);

	// effective tolerance (truncation weight)
	double *tol_eff = (double *)algn_calloc(nsteps*(L - 1), sizeof(double));

	// perform imaginary time evolution
	EvolveMPOStrang(&dyn, nsteps, &bond_op_params, true, &rho_beta, tol_eff);

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
	int nbuffers;
	MKL_INT64 nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));
	#endif

	// record virtual bond dimensions
	size_t *D_beta = (size_t *)algn_malloc((L + 1) * sizeof(size_t));
	MPOBondDims(&rho_beta, D_beta);

	// record Frobenius norm
	const double norm_rho = MPOFrobeniusNorm(&rho_beta);
	duprintf("Frobenius norm of rho_beta: %g, distance to 1: %g\n", norm_rho, fabs(norm_rho - 1));

	// save MPO tensors of rho_beta, virtual bond dimensions and quantum numbers, and effective tolerances to disk
	for (i = 0; i < L; i++)
	{
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_beta%g_A%i.dat", argv[2], L, d - 1, params.beta, i);
		WriteData(filename, rho_beta.A[i].data, sizeof(double complex), NumTensorElements(&rho_beta.A[i]), false);
	}
	for (i = 0; i < L + 1; i++)
	{
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_beta%g_qD%i.dat", argv[2], L, d - 1, params.beta, i);
		WriteData(filename, rho_beta.qD[i], sizeof(qnumber_t), D_beta[i], false);
	}
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_beta%g_D.dat",       argv[2], L, d - 1, params.beta);  WriteData(filename, D_beta, sizeof(size_t), L + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_beta%g_tol_eff.dat", argv[2], L, d - 1, params.beta);  WriteData(filename, tol_eff, sizeof(double), nsteps*(L - 1), false);

	// clean up
	algn_free(D_beta);
	algn_free(tol_eff);
	DeleteDynamicsData(&dyn);
	DeleteMPO(&rho_beta);
	DeleteLocalBoseHubbardOperators(L, h);
	algn_free(h);
	DeleteTensor(&bn);
	algn_free(qd);

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
