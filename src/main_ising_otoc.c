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
///
/// \brief Extract virtual bond dimensions from a matrix product operator
///
static inline void GetVirtualBondDimensions(const mpo_t *mpo, size_t *D)
{
	const int L = mpo->L;

	int i;
	for (i = 0; i < L; i++)
	{
		assert(mpo->A[i].ndim == 4);
		assert(i < L - 1 ? mpo->A[i].dim[3] == mpo->A[i+1].dim[2] : 1);
		D[i] = mpo->A[i].dim[2];
	}
	D[L] = mpo->A[L-1].dim[3];
}


//________________________________________________________________________________________________________________________
//


int main(int argc, char *argv[])
{
	int i;
	size_t j;

	if (argc != 5)
	{
		duprintf("Syntax: %s <param filename> <op, either X or Z> <range: 0 for centered site, 1 for half lattice, 2 for complete lattice> <output path>\n", argv[0]);
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

	// OTOC operation
	const char op_c = *argv[2];
	if (op_c != 'X' && op_c != 'Z')
	{
		duprintf("OTOC operator 'op' must be either 'X' or 'Z', exiting...\n");
		return -4;
	}
	// range of OTOC operators
	const int range = atoi(argv[3]);
	if (range < 0 || range >= 3)
	{
		duprintf("'range = %i' invalid, must be 0, 1 or 2, exiting...\n", range);
		return -5;
	}
	const char *range_str[3] = { "centered single site", "half lattice", "full lattice" };

	duprintf("Computing OTOCs for the Ising model on a chain with parameters:\n");
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
	duprintf(" OTOC operation of W and V: %c\n", op_c);
	duprintf("   range of OTOC operators: %s\n", range_str[range]);
	duprintf("           MKL max threads: %i\n", MKL_Get_Max_Threads());
	duprintf("\n");

	// number of lattice sites
	const int L = params.L;

	// Pauli matrices sigma_x and sigma_z
	tensor_t sigma_x, sigma_z;
	{
		const size_t dim[2] = { 2, 2 };
		AllocateTensor(2, dim, &sigma_x);
		AllocateTensor(2, dim, &sigma_z);
		// sigma_x
		// (0  1)
		// (1  0)
		sigma_x.data[1].real = 1;
		sigma_x.data[2].real = 1;
		// sigma_z
		// (1  0)
		// (0 -1)
		sigma_z.data[0].real =  1;
		sigma_z.data[3].real = -1;
	}

	// OTOC operation
	tensor_t op;
	if (op_c == 'X')
	{
		CopyTensor(&sigma_x, &op);
	}
	else
	{
		assert(op_c == 'Z');
		CopyTensor(&sigma_z, &op);
	}

	// construct two-site Ising Hamiltonian operators
	double **h = (double **)MKL_malloc((L - 1)*sizeof(double *), MEM_DATA_ALIGN);
	ConstructLocalIsingOperators(L, params.J, params.hext, params.gext, h);

	// start timer
	const clock_t t_cpu_start = clock();
	const unsigned long long t_wall_start = GetTimeTicks();

	// compute exp(-beta H) as MPO
	mpo_t exp_betaH;
	{
		// initialize exp_betaH by the identity operation
		CreateIdentityMPO(L, 2, &exp_betaH);

		const int nsteps = (int)round(params.beta / params.dbeta);
		if (fabs(nsteps*params.dbeta/params.beta - 1) > 1e-14)
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
		EvolveMPOStrang(&dyn, nsteps, params.tol, params.maxD, true, &exp_betaH, tol_eff_beta);

		// record virtual bond dimensions
		size_t *D_beta = (size_t *)MKL_malloc((L + 1) * sizeof(size_t), MEM_DATA_ALIGN);
		GetVirtualBondDimensions(&exp_betaH, D_beta);

		// save effective tolerances and virtual bond dimensions to disk
		sprintf(filename, "%s/ising_L%i_tol_eff_beta.dat", argv[4], L); WriteData(filename, tol_eff_beta, sizeof(double), nsteps*(L - 1), false);
		sprintf(filename, "%s/ising_L%i_D_beta.dat",       argv[4], L); WriteData(filename, D_beta, sizeof(size_t), L + 1, false);

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
			// apply number operator at site i
			ApplySingleSiteTopOperator(&exp_betaH_n.A[i], &sigma_z);

			magnetization[i] = ComplexReal(MPOTrace(&exp_betaH_n)) / Zbeta;

			// restore original tensor at site i
			DeleteTensor(&exp_betaH_n.A[i]);
			CopyTensor(&exp_betaH.A[i], &exp_betaH_n.A[i]);
		}

		// save magnetization to disk
		sprintf(filename, "%s/ising_L%i_magnetization.dat", argv[4], L);
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
		sprintf(filename, "%s/ising_L%i_energy.dat", argv[4], L);
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
	CreateIdentityMPO(L, 2, &XB);
	if (range == 0)
	{
		// centered single site
		ApplySingleSiteBottomOperator(&XA.A[(L-1)/2], &op);
		ApplySingleSiteBottomOperator(&XB.A[(L-1)/2], &op);     // 'top' or 'bottom' irrelevant here since 'XB' starts as identity
	}
	else if (range == 1)
	{
		// half lattice
		for (i = 0; i < L/2; i++)
		{
			ApplySingleSiteBottomOperator(&XA.A[i], &op);
			ApplySingleSiteBottomOperator(&XB.A[i], &op);       // 'top' or 'bottom' irrelevant here since 'XB' starts as identity
		}
	}
	else
	{
		assert(range == 2);

		// full lattice
		for (i = 0; i < L; i++)
		{
			ApplySingleSiteBottomOperator(&XA.A[i], &op);
			ApplySingleSiteBottomOperator(&XB.A[i], &op);       // 'top' or 'bottom' irrelevant here since 'XB' starts as identity
		}
	}

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
	double *tol_eff_A = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);
	double *tol_eff_B = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);

	// record virtual bond dimensions
	size_t *D_XA = (size_t *)MKL_malloc((nsteps + 1)*(L + 1) * sizeof(size_t), MEM_DATA_ALIGN);
	size_t *D_XB = (size_t *)MKL_malloc((nsteps + 1)*(L + 1) * sizeof(size_t), MEM_DATA_ALIGN);

	int nstart = 0;

	if (params.save_tensors)
	{
		sprintf(filename, "%s/ising_L%i_XA", argv[4], L); makedir(filename);
		sprintf(filename, "%s/ising_L%i_XB", argv[4], L); makedir(filename);

		// try to open 'n_step' file if it exists, to continue simulation after previous checkpoint
		duprintf("Trying to read 'n_step' file...\n");
		sprintf(filename, "%s/ising_L%i_n_step.dat", argv[4], L);
		status = ReadData(filename, &nstart, sizeof(int), 1);
		if (status == 0 && (nstart > 0 && nstart < nsteps))
		{
			duprintf("Continuing simulation after time step %i...\n", nstart);

			// read intermediate results from disk
			sprintf(filename, "%s/ising_L%i_otoc_tmp.dat",      argv[4], L); status = ReadData(filename, otoc,      sizeof(MKL_Complex16), nstart + 1);     if (status < 0) { return status; }
			sprintf(filename, "%s/ising_L%i_gf_tmp.dat",        argv[4], L); status = ReadData(filename, gf,        sizeof(MKL_Complex16), nstart + 1);     if (status < 0) { return status; }
			sprintf(filename, "%s/ising_L%i_DXA_tmp.dat",       argv[4], L); status = ReadData(filename, D_XA,      sizeof(size_t), (nstart + 1)*(L + 1));  if (status < 0) { return status; }
			sprintf(filename, "%s/ising_L%i_DXB_tmp.dat",       argv[4], L); status = ReadData(filename, D_XB,      sizeof(size_t), (nstart + 1)*(L + 1));  if (status < 0) { return status; }
			sprintf(filename, "%s/ising_L%i_tol_eff_A_tmp.dat", argv[4], L); status = ReadData(filename, tol_eff_A, sizeof(double),  nstart     *(L - 1));  if (status < 0) { return status; }
			sprintf(filename, "%s/ising_L%i_tol_eff_B_tmp.dat", argv[4], L); status = ReadData(filename, tol_eff_B, sizeof(double),  nstart     *(L - 1));  if (status < 0) { return status; }

			// re-allocate and fill MPOs
			DeleteMPO(&XB);
			DeleteMPO(&XA);
			const size_t dim[2] = { 2, 2 };
			AllocateMPO(L, dim, &D_XA[nstart*(L + 1)], &XA);
			AllocateMPO(L, dim, &D_XB[nstart*(L + 1)], &XB);
			for (i = 0; i < L; i++)
			{
				sprintf(filename, "%s/ising_L%i_XA/A%i.dat", argv[4], L, i); status = ReadData(filename, XA.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XA.A[i]));  if (status < 0) { return status; }
				sprintf(filename, "%s/ising_L%i_XB/A%i.dat", argv[4], L, i); status = ReadData(filename, XB.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XB.A[i]));  if (status < 0) { return status; }
			}

			// single step; "forward" and "backward" are reversed in Heisenberg picture
			EvolveLiouvilleMPOPRK(&dyn_time, 1, false, params.tol, params.maxD, &XA, &tol_eff_A[nstart*(L - 1)]);
			EvolveLiouvilleMPOPRK(&dyn_time, 1, false, params.tol, params.maxD, &XB, &tol_eff_B[nstart*(L - 1)]);

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
			// copy current MPOs
			mpo_t XAop, XBop;
			CopyMPO(&XA, &XAop);
			CopyMPO(&XB, &XBop);

			if (range == 0)
			{
				// centered single site
				ApplySingleSiteBottomOperator(&XAop.A[(L-1)/2], &op);
				ApplySingleSiteBottomOperator(&XBop.A[(L-1)/2], &op);
			}
			else if (range == 1)
			{
				// half lattice
				for (i = 0; i < L/2; i++)
				{
					ApplySingleSiteBottomOperator(&XAop.A[i], &op);
					ApplySingleSiteBottomOperator(&XBop.A[i], &op);
				}
			}
			else
			{
				assert(range == 2);

				// full lattice
				for (i = 0; i < L; i++)
				{
					ApplySingleSiteBottomOperator(&XAop.A[i], &op);
					ApplySingleSiteBottomOperator(&XBop.A[i], &op);
				}
			}

			otoc[n] = ComplexScale(1/Zbeta, MPOTraceProduct(&XAop, &XBop));
			  gf[n] = ComplexScale(1/Zbeta, MPOTrace(&XAop));

			// clean up
			DeleteMPO(&XAop);
			DeleteMPO(&XBop);
		}

		// record virtual bond dimensions
		GetVirtualBondDimensions(&XA, &D_XA[n*(L + 1)]);
		GetVirtualBondDimensions(&XB, &D_XB[n*(L + 1)]);

		// save intermediate results to disk
		sprintf(filename, "%s/ising_L%i_otoc_tmp.dat", argv[4], L); WriteData(filename, &otoc[n], sizeof(MKL_Complex16), 1, true);
		sprintf(filename, "%s/ising_L%i_gf_tmp.dat",   argv[4], L); WriteData(filename, &gf[n],   sizeof(MKL_Complex16), 1, true);
		sprintf(filename, "%s/ising_L%i_DXA_tmp.dat",  argv[4], L); WriteData(filename, &D_XA[n*(L + 1)], sizeof(size_t), L + 1, true);
		sprintf(filename, "%s/ising_L%i_DXB_tmp.dat",  argv[4], L); WriteData(filename, &D_XB[n*(L + 1)], sizeof(size_t), L + 1, true);
		if (n > 0) {
			sprintf(filename, "%s/ising_L%i_tol_eff_A_tmp.dat", argv[4], L); WriteData(filename, &tol_eff_A[(n - 1)*(L - 1)], sizeof(double), L - 1, true);
			sprintf(filename, "%s/ising_L%i_tol_eff_B_tmp.dat", argv[4], L); WriteData(filename, &tol_eff_B[(n - 1)*(L - 1)], sizeof(double), L - 1, true);
		}
		if (params.save_tensors)
		{
			for (i = 0; i < L; i++)
			{
				sprintf(filename, "%s/ising_L%i_XA/A%i.dat", argv[4], L, i); WriteData(filename, XA.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XA.A[i]), false);
				sprintf(filename, "%s/ising_L%i_XB/A%i.dat", argv[4], L, i); WriteData(filename, XB.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XB.A[i]), false);
			}
		}

		// record completed step
		sprintf(filename, "%s/ising_L%i_n_step.dat", argv[4], L); WriteData(filename, &n, sizeof(int), 1, false);

		// final time step nowhere used; note that index n == nsteps would be out of range for effective tolerance
		if (n == nsteps) {
			break;
		}

		// single step; "forward" and "backward" are reversed in Heisenberg picture
		EvolveLiouvilleMPOPRK(&dyn_time, 1, false, params.tol, params.maxD, &XA, &tol_eff_A[n*(L - 1)]);
		EvolveLiouvilleMPOPRK(&dyn_time, 1, false, params.tol, params.maxD, &XB, &tol_eff_B[n*(L - 1)]);
	}

	duprintf("At t = %g:\n", params.tmax);
	duprintf("<W(t) V(0) W(t) V(0)> = (%g, %g)\n", otoc[nsteps].real, otoc[nsteps].imag);
	duprintf("<W(t) V(0)>           = (%g, %g)\n",   gf[nsteps].real,   gf[nsteps].imag);

	const clock_t t_cpu_end = clock();
	const unsigned long long t_wall_end = GetTimeTicks();
	double cpu_time = (double)(t_cpu_end  - t_cpu_start ) / CLOCKS_PER_SEC;
	double walltime = (double)(t_wall_end - t_wall_start) / GetTimeResolution();
	duprintf("\nFinished simulation, CPU time: %g seconds, wall clock time: %g seconds\n", cpu_time, walltime);
	nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));

	// save results to disk
	sprintf(filename, "%s/ising_L%i_otoc.dat",      argv[4], L); WriteData(filename, otoc, sizeof(MKL_Complex16),   nsteps + 1, false);
	sprintf(filename, "%s/ising_L%i_gf.dat",        argv[4], L); WriteData(filename, gf,   sizeof(MKL_Complex16),   nsteps + 1, false);
	sprintf(filename, "%s/ising_L%i_tol_eff_A.dat", argv[4], L); WriteData(filename, tol_eff_A, sizeof(double),  nsteps*(L - 1), false);
	sprintf(filename, "%s/ising_L%i_tol_eff_B.dat", argv[4], L); WriteData(filename, tol_eff_B, sizeof(double),  nsteps*(L - 1), false);
	sprintf(filename, "%s/ising_L%i_DXA.dat",       argv[4], L); WriteData(filename, D_XA, sizeof(size_t), (nsteps + 1)*(L + 1), false);
	sprintf(filename, "%s/ising_L%i_DXB.dat",       argv[4], L); WriteData(filename, D_XB, sizeof(size_t), (nsteps + 1)*(L + 1), false);

	// clean up
	MKL_free(D_XB);
	MKL_free(D_XA);
	MKL_free(tol_eff_B);
	MKL_free(tol_eff_A);
	MKL_free(gf);
	MKL_free(otoc);
	DeleteDynamicsData(&dyn_time);
	DeleteMPO(&XB);
	DeleteMPO(&XA);
	DeleteMPO(&exp_betaH);
	DeleteLocalHamiltonianOperators(L, h);
	MKL_free(h);
	DeleteTensor(&op);
	DeleteTensor(&sigma_z);
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
