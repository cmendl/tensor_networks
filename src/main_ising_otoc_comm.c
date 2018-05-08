#include "hamiltonian_ising.h"
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
/// \brief Contruct matrix product operator representation of single-site operator sum_{i=i0}^i1 op_i
///
static void ConstructOperatorSumMPO(const int L, const int i0, const int i1, const tensor_t *restrict op, mpo_t *mpo)
{
	int i;

	assert(L >= 2);
	assert(0 <= i0 && i0 < L);
	assert(0 <= i1 && i1 < L);
	assert(i0 <= i1);
	assert(op->ndim == 2);
	assert(op->dim[0] == 2 && op->dim[1] == 2);

	// allocate matrix product operator
	{
		// virtual bond dimensions
		size_t *D = (size_t *)MKL_malloc((L + 1)*sizeof(size_t), MEM_DATA_ALIGN);
		D[0] = 1;
		for (i = 1; i < L; i++)
		{
			if (i0 < i && i <= i1)
			{
				D[i] = 2;
			}
			else
			{
				D[i] = 1;
			}
		}
		D[L] = 1;

		const size_t dim[2] = { 2, 2 };
		AllocateMPO(L, dim, D, mpo);
		MKL_free(D);
	}

	// local identity operator
	MKL_Complex16 id[4] = { 0 };
	id[0].real = 1;
	id[3].real = 1;

	for (i = 0; i < L; i++)
	{
		if (i < i0)
		{
			// preceding "trivial" tensors
			memcpy(mpo->A[i].data, id, 4*sizeof(MKL_Complex16));
		}
		else if (i == i0)
		{
			assert(mpo->A[i].dim[2] == 1);

			// construct first 'W' tensor
			memcpy(&mpo->A[i].data[0], op->data, 4*sizeof(MKL_Complex16));
			if (i0 < i1)
			{
				memcpy(&mpo->A[i].data[4], id, 4*sizeof(MKL_Complex16));
			}
		}
		else if (i < i1)
		{
			assert(mpo->A[i].dim[2] == 2 && mpo->A[i].dim[3] == 2);

			// construct intermediate 'W' tensors
			memcpy(&mpo->A[i].data[ 0], id,       4*sizeof(MKL_Complex16)); // (0,0) block
			memcpy(&mpo->A[i].data[ 4], op->data, 4*sizeof(MKL_Complex16)); // (1,0) block
			memcpy(&mpo->A[i].data[12], id,       4*sizeof(MKL_Complex16)); // (1,1) block
		}
		else if (i == i1)
		{
			assert(i0 < i1);
			assert(mpo->A[i].dim[2] == 2 && mpo->A[i].dim[3] == 1);

			// construct last 'W' tensor
			memcpy(&mpo->A[i].data[0], id,       4*sizeof(MKL_Complex16));
			memcpy(&mpo->A[i].data[4], op->data, 4*sizeof(MKL_Complex16));
		}
		else
		{
			assert(i1 < i);

			// trailing "trivial" tensors
			memcpy(mpo->A[i].data, id, 4*sizeof(MKL_Complex16));
		}
	}
}


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
//


int main(int argc, char *argv[])
{
	int i;
	size_t j;

	if (argc != 6)
	{
		duprintf("Syntax: %s <param filename> <op, either X, Y or Z> <i0: first (zero-based) lattice index of OTOC operator> <i1: last lattice index of OTOC operator> <output path>\n", argv[0]);
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

	// try to create output path if it does not exist yet
	makedir(argv[5]);

	// open simulation log file for writing
	char filename[2048];
	sprintf(filename, "%s/simulation.log", argv[5]);
	fd_log = fopen(filename, "w");
	if (fd_log == NULL)
	{
		duprintf("Cannot open log file '%s', exiting...\n", filename);
		return -3;
	}

	// OTOC operation
	const char op_c = *argv[2];
	if (op_c != 'X' && op_c != 'Y' && op_c != 'Z')
	{
		duprintf("OTOC operator 'op' must be either X, Y or Z, exiting...\n");
		return -4;
	}
	// range of OTOC operators
	const int i0 = atoi(argv[3]);
	const int i1 = atoi(argv[4]);
	if (i0 < 0 || i0 >= params.L)
	{
		duprintf("'i0 = %i' invalid, must be between 0 and L-1, exiting...\n", i0);
		return -5;
	}
	if (i1 < 0 || i1 >= params.L)
	{
		duprintf("'i1 = %i' invalid, must be between 0 and L-1, exiting...\n", i1);
		return -5;
	}
	if (i0 > i1)
	{
		duprintf("'i0 = %i, i1 = %i' invalid, require i0 <= i1, exiting...\n", i0, i1);
		return -5;
	}

	duprintf("Computing OTOC commutators for the Ising model on a chain with parameters:\n");
	duprintf("            lattice size L: %i\n", params.L);
	duprintf("       J coupling constant: %g\n", params.J);
	duprintf(" magnetic field strength h: %g\n", params.hext);
	duprintf(" magnetic field strength g: %g\n", params.gext);
	duprintf("  inverse temperature beta: %g\n", params.beta);
	duprintf("           delta beta step: %g\n", params.dbeta);
	duprintf("   largest simulation time: %g\n", params.tmax);
	duprintf("                 time step: %g\n", params.dt);
	duprintf("             MPO tolerance: %g\n", params.tol);
	duprintf("max virtual bond dimension: %zu\n", params.maxD);
	duprintf("               renormalize: %s\n", params.renormalize ? "true" : "false");
	duprintf(" OTOC operation of W and V: %c\n", op_c);
	duprintf("   range of OTOC operators: from site %i to %i\n", i0, i1);
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

	// Pauli matrices
	tensor_t sigma_x, sigma_y, sigma_z;
	{
		const size_t dim[2] = { 2, 2 };
		AllocateTensor(2, dim, &sigma_x);
		AllocateTensor(2, dim, &sigma_y);
		AllocateTensor(2, dim, &sigma_z);
		// sigma_x
		// (0  1)
		// (1  0)
		sigma_x.data[1].real = 1;
		sigma_x.data[2].real = 1;
		// sigma_y
		// (0 -i)
		// (i  0)
		sigma_y.data[1].imag =  1;
		sigma_y.data[2].imag = -1;
		// sigma_z
		// (1  0)
		// (0 -1)
		sigma_z.data[0].real =  1;
		sigma_z.data[3].real = -1;
	}

	// construct MPO representation of OTOC operator
	mpo_t op;
	if (op_c == 'X')
	{
		ConstructOperatorSumMPO(L, i0, i1, &sigma_x, &op);
	}
	else if (op_c == 'Y')
	{
		ConstructOperatorSumMPO(L, i0, i1, &sigma_y, &op);
	}
	else
	{
		assert(op_c == 'Z');
		ConstructOperatorSumMPO(L, i0, i1, &sigma_z, &op);
	}

	// construct two-site Ising Hamiltonian operators
	double **h = (double **)MKL_malloc((L - 1)*sizeof(double *), MEM_DATA_ALIGN);
	ConstructLocalIsingOperators(L, params.J, params.hext, params.gext, h);

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
		CreateIdentityMPO(L, 2, &exp_betaH);
		const MKL_Complex16 invsqrt2 = { sqrt(0.5), 0 };
		for (i = 0; i < L; i++)
		{
			ScaleTensor(invsqrt2, &exp_betaH.A[i]);
		}

		// number of imaginary time steps
		const int nsteps = (params.beta == 0 ? 0 : (int)round(params.beta / params.dbeta));
		if (nsteps != 0 && fabs(nsteps*params.dbeta/params.beta - 1) > 1e-14)
		{
			duprintf("Cannot find an integer 'n' such that n*dbeta == beta, exiting...\n");
			return -4;
		}

		const MKL_Complex16 dbeta = { params.dbeta, 0 };

		// compute evolution dynamics data required for Strang splitting evolution
		dynamics_data_t dyn;
		ComputeDynamicsDataStrang(L, dbeta, 4, (const double **)h, &dyn);

		// effective tolerance (truncation weight)
		double *tol_eff_beta = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);

		// perform imaginary time evolution; using "normalization" to keep A[0] matrix entries of order 1
		EvolveMPOStrang(&dyn, nsteps, &bond_op_params, true, &exp_betaH, tol_eff_beta);

		// record virtual bond dimensions
		size_t *D_beta = (size_t *)MKL_malloc((L + 1) * sizeof(size_t), MEM_DATA_ALIGN);
		MPOBondDims(&exp_betaH, D_beta);

		// save effective tolerances and virtual bond dimensions to disk
		sprintf(filename, "%s/ising_L%i_tol_eff_beta.dat", argv[5], L); WriteData(filename, tol_eff_beta, sizeof(double), nsteps*(L - 1), false);
		sprintf(filename, "%s/ising_L%i_D_beta.dat",       argv[5], L); WriteData(filename, D_beta, sizeof(size_t), L + 1, false);

		MKL_free(D_beta);
		MKL_free(tol_eff_beta);
		DeleteDynamicsData(&dyn);
	}

	// record trace of exp(-beta H)
	const double Zbeta = ComplexReal(MPOTrace(&exp_betaH));
	duprintf("Trace of exp_betaH: %g\n", Zbeta);

	// compute local magnetization
	{
		double *magnetization = (double *)MKL_malloc(L*sizeof(double), MEM_DATA_ALIGN);

		mpo_t exp_betaH_n;
		CopyMPO(&exp_betaH, &exp_betaH_n);

		int i;
		for (i = 0; i < L; i++)
		{
			// apply sigma_z at site i
			ApplySingleSiteTopOperator(&sigma_z, &exp_betaH_n.A[i]);

			magnetization[i] = ComplexReal(MPOTrace(&exp_betaH_n)) / Zbeta;

			// restore original tensor at site i
			DeleteTensor(&exp_betaH_n.A[i]);
			CopyTensor(&exp_betaH.A[i], &exp_betaH_n.A[i]);
		}

		// save magnetization to disk
		sprintf(filename, "%s/ising_L%i_magnetization.dat", argv[5], L);
		WriteData(filename, magnetization, sizeof(double), L, false);

		// clean up
		DeleteMPO(&exp_betaH_n);
		MKL_free(magnetization);
	}

	// compute total energy
	{
		// construct matrix product operator representation
		mpo_t mpoH;
		ConstructIsingMPO(L, params.J, params.hext, params.gext, &mpoH);

		const double energy = ComplexReal(MPOTraceProduct(&exp_betaH, &mpoH)) / Zbeta;
		duprintf("Total energy Tr[exp(-beta H) H]: %g\n", energy);

		// save energy to disk
		sprintf(filename, "%s/ising_L%i_energy.dat", argv[5], L);
		WriteData(filename, &energy, sizeof(double), 1, false);

		DeleteMPO(&mpoH);
	}

	duprintf("Current CPU time: %g seconds\n", (double)(clock() - t_cpu_start) / CLOCKS_PER_SEC);
	int nbuffers;
	MKL_INT64 nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));

	duprintf("\nStarting time evolution...\n");

	// time-evolve W(t) MPO
	mpo_t XW;
	CopyMPO(&op, &XW);

	// compute dynamics data for time evolution
	dynamics_data_t dyn_time;
	const MKL_Complex16 idt = { 0, params.dt };
	ComputeDynamicsDataPRK(L, idt, 4, (const double **)h, &dyn_time);

	// perform time evolution and compute OTOCs at several time points

	const int nsteps = (int)round(params.tmax / params.dt);
	if (fabs(nsteps*params.dt/params.tmax - 1) > 1e-14)
	{
		duprintf("Cannot find an integer 'n' such that n*dt == tmax, exiting...\n");
		return -4;
	}

	MKL_Complex16 *otoc = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	MKL_Complex16 *gf   = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);

	// effective tolerance (truncation weight)
	double *tol_eff_W = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);

	// record virtual bond dimensions
	size_t *D_XW = (size_t *)MKL_malloc((nsteps + 1)*(L + 1) * sizeof(size_t), MEM_DATA_ALIGN);

	int nstart = 0;

	if (params.save_tensors)
	{
		sprintf(filename, "%s/ising_L%i_XW", argv[5], L); makedir(filename);

		// try to open 'n_step' file if it exists, to continue simulation after previous checkpoint
		duprintf("Trying to read 'n_step' file...\n");
		sprintf(filename, "%s/ising_L%i_n_step.dat", argv[5], L);
		status = ReadData(filename, &nstart, sizeof(int), 1);
		if (status == 0 && (nstart > 0 && nstart < nsteps))
		{
			duprintf("Continuing simulation after time step %i...\n", nstart);

			// read intermediate results from disk
			sprintf(filename, "%s/ising_L%i_otoc_tmp.dat",      argv[5], L); status = ReadData(filename, otoc,      sizeof(MKL_Complex16), nstart + 1);     if (status < 0) { return status; }
			sprintf(filename, "%s/ising_L%i_gf_tmp.dat",        argv[5], L); status = ReadData(filename, gf,        sizeof(MKL_Complex16), nstart + 1);     if (status < 0) { return status; }
			sprintf(filename, "%s/ising_L%i_DXW_tmp.dat",       argv[5], L); status = ReadData(filename, D_XW,      sizeof(size_t), (nstart + 1)*(L + 1));  if (status < 0) { return status; }
			sprintf(filename, "%s/ising_L%i_tol_eff_W_tmp.dat", argv[5], L); status = ReadData(filename, tol_eff_W, sizeof(double),  nstart     *(L - 1));  if (status < 0) { return status; }

			// re-allocate and fill MPOs
			DeleteMPO(&XW);
			const size_t dim[2] = { 2, 2 };
			AllocateMPO(L, dim, &D_XW[nstart*(L + 1)], &XW);
			for (i = 0; i < L; i++)
			{
				sprintf(filename, "%s/ising_L%i_XW/A%i.dat", argv[5], L, i);
				status = ReadData(filename, XW.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XW.A[i]));
				if (status < 0) { return status; }
			}

			// single step; "forward" and "backward" are reversed in Heisenberg picture
			EvolveLiouvilleMPOPRK(&dyn_time, 1, false, &bond_op_params, &XW, &tol_eff_W[nstart*(L - 1)]);

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
			// W(t) V(0) and V(0) W(t)
			mpo_t WV, VW;
			MPOComposition(&XW, &op, &WV);
			MPOComposition(&op, &XW, &VW);

			// effectively flip sign of V(0) W(t)
			const MKL_Complex16 neg1 = { -1, 0 };
			cblas_zscal(NumTensorElements(&VW.A[0]), &neg1, VW.A[0].data, 1);

			// W(t) V(0) - V(0) W(t)
			mpo_t WVcomm;
			MPOAdd(&WV, &VW, &WVcomm);
			DeleteMPO(&VW);
			DeleteMPO(&WV);

			// exp(-beta H) (W(t) V(0) - V(0) W(t))
			mpo_t exp_betaH_WVcomm;
			MPOComposition(&exp_betaH, &WVcomm, &exp_betaH_WVcomm);

			otoc[n] = ComplexScale(1/Zbeta, MPOTraceProduct(&WVcomm, &exp_betaH_WVcomm));
			  gf[n] = ComplexScale(1/Zbeta, MPOTrace(&exp_betaH_WVcomm));

			// clean up
			DeleteMPO(&exp_betaH_WVcomm);
			DeleteMPO(&WVcomm);
		}

		// record virtual bond dimensions
		MPOBondDims(&XW, &D_XW[n*(L + 1)]);

		// save intermediate results to disk
		sprintf(filename, "%s/ising_L%i_otoc_tmp.dat", argv[5], L); WriteData(filename, &otoc[n], sizeof(MKL_Complex16), 1, true);
		sprintf(filename, "%s/ising_L%i_gf_tmp.dat",   argv[5], L); WriteData(filename, &gf[n],   sizeof(MKL_Complex16), 1, true);
		sprintf(filename, "%s/ising_L%i_DXW_tmp.dat",  argv[5], L); WriteData(filename, &D_XW[n*(L + 1)], sizeof(size_t), L + 1, true);
		if (n > 0) {
			sprintf(filename, "%s/ising_L%i_tol_eff_W_tmp.dat", argv[5], L); WriteData(filename, &tol_eff_W[(n - 1)*(L - 1)], sizeof(double), L - 1, true);
		}
		if (params.save_tensors)
		{
			for (i = 0; i < L; i++)
			{
				sprintf(filename, "%s/ising_L%i_XW/A%i.dat", argv[5], L, i); WriteData(filename, XW.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XW.A[i]), false);
			}
		}

		// record completed step
		sprintf(filename, "%s/ising_L%i_n_step.dat", argv[5], L); WriteData(filename, &n, sizeof(int), 1, false);

		// final time step nowhere used; note that index n == nsteps would be out of range for effective tolerance
		if (n == nsteps) {
			break;
		}

		// single step; "forward" and "backward" are reversed in Heisenberg picture
		EvolveLiouvilleMPOPRK(&dyn_time, 1, false, &bond_op_params, &XW, &tol_eff_W[n*(L - 1)]);
	}

	duprintf("At t = %g:\n", params.tmax);
	duprintf("<[W(t), V(0)]^2> = (%g, %g)\n", otoc[nsteps].real, otoc[nsteps].imag);
	duprintf("<[W(t), V(0)]>   = (%g, %g)\n",   gf[nsteps].real,   gf[nsteps].imag);
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
	nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));

	// save results to disk
	sprintf(filename, "%s/ising_L%i_otoc.dat",      argv[5], L); WriteData(filename, otoc, sizeof(MKL_Complex16),   nsteps + 1, false);
	sprintf(filename, "%s/ising_L%i_gf.dat",        argv[5], L); WriteData(filename, gf,   sizeof(MKL_Complex16),   nsteps + 1, false);
	sprintf(filename, "%s/ising_L%i_tol_eff_W.dat", argv[5], L); WriteData(filename, tol_eff_W, sizeof(double),  nsteps*(L - 1), false);
	sprintf(filename, "%s/ising_L%i_DXW.dat",       argv[5], L); WriteData(filename, D_XW, sizeof(size_t), (nsteps + 1)*(L + 1), false);

	// clean up
	MKL_free(D_XW);
	MKL_free(tol_eff_W);
	MKL_free(gf);
	MKL_free(otoc);
	DeleteDynamicsData(&dyn_time);
	DeleteMPO(&XW);
	DeleteMPO(&exp_betaH);
	DeleteLocalIsingOperators(L, h);
	MKL_free(h);
	DeleteMPO(&op);
	DeleteTensor(&sigma_z);
	DeleteTensor(&sigma_y);
	DeleteTensor(&sigma_x);

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
