#include "hamiltonian_heisenberg.h"
#include "dynamics.h"
#include "complex.h"
#include "sim_params.h"
#include "profiler.h"
#include "dupio.h"
#include <mkl.h>
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
///
/// \brief Apply two-site operator 'opT' from the top
///
static trunc_info_t ApplyTwoSiteTopOperator(const tensor_t *restrict opT, const bond_op_params_t *restrict params, const qnumber_t *restrict qd0, const qnumber_t *restrict qd1, tensor_t *restrict A0, tensor_t *restrict A1, const qnumber_t *restrict qA0, const qnumber_t *restrict qA2, qnumber_t *restrict *qbond)
{
	const size_t d0 = A0->dim[0];
	const size_t d1 = A1->dim[0];

	tensor_t M;
	MergeMPOTensorPair(A0, A1, &M);
	DeleteTensor(A0);
	DeleteTensor(A1);

	tensor_t A;
	ComposeMPOTensors(opT, &M, &A);
	DeleteTensor(&M);

	trunc_info_t ti = SplitMPOTensor(&A, qA0, qA2, d0, d1, qd0, qd1, SVD_DISTR_SQRT, params, A0, A1, qbond);
	DeleteTensor(&A);

	return ti;
}


//________________________________________________________________________________________________________________________
///
/// \brief Apply two-site operator 'opB' from the bottom
///
static trunc_info_t ApplyTwoSiteBottomOperator(const tensor_t *restrict opB, const bond_op_params_t *restrict params, const qnumber_t *restrict qd0, const qnumber_t *restrict qd1, tensor_t *restrict A0, tensor_t *restrict A1, const qnumber_t *restrict qA0, const qnumber_t *restrict qA2, qnumber_t *restrict *qbond)
{
	double nsigma = 0;

	const size_t d0 = A0->dim[0];
	const size_t d1 = A1->dim[0];

	tensor_t M;
	MergeMPOTensorPair(A0, A1, &M);
	DeleteTensor(A0);
	DeleteTensor(A1);

	tensor_t A;
	ComposeMPOTensors(&M, opB, &A);
	DeleteTensor(&M);

	trunc_info_t ti = SplitMPOTensor(&A, qA0, qA2, d0, d1, qd0, qd1, SVD_DISTR_SQRT, params, A0, A1, qbond);
	DeleteTensor(&A);

	return ti;
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

	// enable peak memory recording
	MKL_Peak_Mem_Usage(MKL_PEAK_MEM_ENABLE);

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
	if (params.Jx != params.Jy)
	{
		duprintf("Jx must be equal to Jy for the Heisenberg XXZ model, exiting...\n");
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

	// sites (j,j+1) of local current operators
	const int jA = atoi(argv[2]);
	const int jB = atoi(argv[3]);
	if (jA < 0 || jA >= params.L-1)
	{
		duprintf("'jA = %i' out of range, must be between 0 and L-2, exiting...\n", jA);
		return -4;
	}
	if (jB < 0 || jB >= params.L-1)
	{
		duprintf("'jB = %i' out of range, must be between 0 and L-2, exiting...\n", jB);
		return -4;
	}

	duprintf("Computing spin current correlations for the Heisenberg XXZ model on a chain with parameters:\n");
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
	duprintf("     'J_{jA,jA+1}' site jA: %i\n", jA);
	duprintf("     'J_{jB,jB+1}' site jB: %i\n", jB);
	duprintf("           MKL max threads: %i\n", MKL_Get_Max_Threads());
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

	// physical quantum numbers (magnetization times 2)
	const qnumber_t qd[2] = { 1, -1 };

	// local current operator
	tensor_t J;
	{
		// dummy virtual bonds
		const size_t dim[4] = { 4, 4, 1, 1 };
		AllocateTensor(4, dim, &J);
		//
		// sx_j sy_{j+1} - sy_j sx_{j+1}:
		//
		//  / 0   0   0   0 \
		//  | 0   0  -i/2 0 |
		//  | 0   i/2 0   0 |
		//  \ 0   0   0   0 /
		//
		J.data[6].imag =  0.5;
		J.data[9].imag = -0.5;
	}

	// construct two-site Heisenberg Hamiltonian operators
	double **h = (double **)MKL_malloc((L - 1)*sizeof(double *), MEM_DATA_ALIGN);
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
		const MKL_Complex16 invsqrt2 = { sqrt(0.5), 0 };
		for (i = 0; i < L; i++)
		{
			ScaleTensor(invsqrt2, &rho_beta.A[i]);
		}
		memcpy(rho_beta.qd[0], qd, 2*sizeof(qnumber_t));
		memcpy(rho_beta.qd[1], qd, 2*sizeof(qnumber_t));

		// number of imaginary time steps
		const int nsteps = (params.beta == 0 ? 0 : (int)round(0.5*params.beta / params.dbeta));
		if (nsteps != 0 && fabs(2*nsteps*params.dbeta/params.beta - 1) > 1e-14)
		{
			duprintf("Cannot find an integer 'n' such that n*dbeta == beta/2, exiting...\n");
			return -4;
		}

		const MKL_Complex16 dbeta = { params.dbeta, 0 };

		// compute evolution dynamics data required for Strang splitting evolution
		dynamics_data_t dyn;
		ComputeDynamicsDataStrang(L, dbeta, 4, (const double **)h, &dyn);

		// effective tolerance (truncation weight)
		double *tol_eff_beta = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);

		// perform evolution
		EvolveMPOStrang(&dyn, nsteps, &bond_op_params, true, &rho_beta, tol_eff_beta);

		// save effective tolerance to disk
		sprintf(filename, "%s/heisenberg_XXZ_L%i_tol_eff_beta.dat", argv[4], L);
		WriteData(filename, tol_eff_beta, sizeof(double), nsteps*(L - 1), false);

		MKL_free(tol_eff_beta);
		DeleteDynamicsData(&dyn);
	}

	const double norm_rho = MPOFrobeniusNorm(&rho_beta);
	duprintf("Frobenius norm of rho_beta: %g\n", norm_rho);

	// apply two-site current operators
	mpo_t XA, XB;
	CopyMPO(&rho_beta, &XA);
	CopyMPO(&rho_beta, &XB);
	MKL_free(XA.qD[jA+1]);
	MKL_free(XB.qD[jB+1]);
	ApplyTwoSiteTopOperator(   &J, &bond_op_params, qd, qd, &XA.A[jA], &XA.A[jA+1], XA.qD[jA], XA.qD[jA+2], &XA.qD[jA+1]);  // apply current operator from the top    at sites '(jA, jA+1)'
	ApplyTwoSiteBottomOperator(&J, &bond_op_params, qd, qd, &XB.A[jB], &XB.A[jB+1], XB.qD[jB], XB.qD[jB+2], &XB.qD[jB+1]);  // apply current operator from the bottom at sites '(jB, jB+1)'

	// compute dynamics data for time evolution
	dynamics_data_t dyn_time;
	const MKL_Complex16 idt = { 0, params.dt };
	ComputeDynamicsDataPRK(L, idt, 4, (const double **)h, &dyn_time);

	// perform time evolution and compute response function at several time points

	const int nsteps = (int)round(0.5*params.tmax / params.dt);
	if (fabs(2*nsteps*params.dt/params.tmax - 1) > 1e-14)
	{
		duprintf("Cannot find an integer 'n' such that n*dt == tmax/2, exiting...\n");
		return -4;
	}

	MKL_Complex16 *chi = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);

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

		// response function
		chi [n] = ComplexScale(1/square(norm_rho), MPOTraceProduct(&XA, &XB));
		// averages of XA and XB are zero

		// record virtual bond dimensions
		MPOBondDims(&XA, &D_XA[n*(L + 1)]);
		MPOBondDims(&XB, &D_XB[n*(L + 1)]);

		// final time step nowhere used; note that index n == nsteps would be out of range for effective tolerance
		if (n == nsteps) {
			break;
		}

		// single step
		EvolveLiouvilleMPOPRK(&dyn_time, 1, true,  &bond_op_params, &XA, &tol_eff_A[n*(L - 1)]);
		EvolveLiouvilleMPOPRK(&dyn_time, 1, false, &bond_op_params, &XB, &tol_eff_B[n*(L - 1)]);
	}

	duprintf("chi at t = %g: (%g, %g)\n", params.tmax, chi[nsteps].real, chi[nsteps].imag);
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
	int nbuffers;
	MKL_INT64 nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));

	// save results to disk
	sprintf(filename, "%s/heisenberg_XXZ_L%i_chi.dat",       argv[4], L); WriteData(filename, chi, sizeof(MKL_Complex16), nsteps + 1, false);
	sprintf(filename, "%s/heisenberg_XXZ_L%i_tol_eff_A.dat", argv[4], L); WriteData(filename, tol_eff_A, sizeof(double), nsteps*(L - 1), false);
	sprintf(filename, "%s/heisenberg_XXZ_L%i_tol_eff_B.dat", argv[4], L); WriteData(filename, tol_eff_B, sizeof(double), nsteps*(L - 1), false);
	sprintf(filename, "%s/heisenberg_XXZ_L%i_DXA.dat",       argv[4], L); WriteData(filename, D_XA, sizeof(size_t), (nsteps + 1)*(L + 1), false);
	sprintf(filename, "%s/heisenberg_XXZ_L%i_DXB.dat",       argv[4], L); WriteData(filename, D_XB, sizeof(size_t), (nsteps + 1)*(L + 1), false);

	// clean up
	MKL_free(D_XB);
	MKL_free(D_XA);
	MKL_free(tol_eff_B);
	MKL_free(tol_eff_A);
	MKL_free(chi);
	DeleteDynamicsData(&dyn_time);
	DeleteMPO(&XB);
	DeleteMPO(&XA);
	DeleteMPO(&rho_beta);
	DeleteLocalHeisenbergOperators(L, h);
	MKL_free(h);
	DeleteTensor(&J);

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
