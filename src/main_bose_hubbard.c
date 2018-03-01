#include "hamiltonian_bose_hubbard.h"
#include "dynamics.h"
#include "complex.h"
#include "sim_params.h"
#include "dupio.h"
#include <mkl.h>
#include <memory.h>
#include <time.h>
#include <stdio.h>

#if !defined(NQNUMBER) || NQNUMBER != 1
#error Bose-Hubbard model requires one quantum number (particle number)
#endif

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

	duprintf("Computing response functions for the Bose-Hubbard model on a chain with parameters:\n");
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
	duprintf("         'A' operator site: %i\n", jA);
	duprintf("         'B' operator site: %i\n", jB);
	duprintf("           MKL max threads: %i\n", MKL_Get_Max_Threads());
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
	qnumber_t *qd = (qnumber_t *)MKL_malloc(d * sizeof(qnumber_t), MEM_DATA_ALIGN);
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
			bn.data[j + j*d].real = (double)j;
		}
	}

	// construct two-site Bose-Hubbard Hamiltonian operators
	double **h = (double **)MKL_malloc((L - 1)*sizeof(double *), MEM_DATA_ALIGN);
	ConstructLocalBoseHubbardOperators(L, d - 1, params.t, params.U, params.mu, h);

	// start timer
	const clock_t t_start = clock();

	// compute exp(-\beta H/2) as MPO
	mpo_t rho_beta;
	{
		// initialize rho_beta by the scaled identity operation (such that Frobenius norm is 1)
		CreateIdentityMPO(L, d, &rho_beta);
		const MKL_Complex16 invsqrt_d = { 1.0 / sqrt(d), 0 };
		for (i = 0; i < L; i++)
		{
			ScaleTensor(invsqrt_d, &rho_beta.A[i]);
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

		const MKL_Complex16 dbeta = { params.dbeta, 0 };

		// compute evolution dynamics data required for Strang splitting evolution
		dynamics_data_t dyn;
		ComputeDynamicsDataStrang(L, dbeta, d*d, (const double **)h, &dyn);

		// effective tolerance (truncation weight)
		double *tol_eff_beta = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);

		// perform imaginary time evolution
		EvolveMPOStrang(&dyn, nsteps, &bond_op_params, true, &rho_beta, tol_eff_beta);

		// record virtual bond dimensions
		size_t *D_beta = (size_t *)MKL_malloc((L + 1) * sizeof(size_t), MEM_DATA_ALIGN);
		MPOBondDims(&rho_beta, D_beta);

		// save effective tolerances and virtual bond dimensions to disk
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_beta.dat", argv[4], L, d - 1); WriteData(filename, tol_eff_beta, sizeof(double), nsteps*(L - 1), false);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_D_beta.dat",       argv[4], L, d - 1); WriteData(filename, D_beta, sizeof(size_t), L + 1, false);

		MKL_free(D_beta);
		MKL_free(tol_eff_beta);
		DeleteDynamicsData(&dyn);
	}

	// record Frobenius norm of rho_beta
	const double norm_rho = MPOFrobeniusNorm(&rho_beta);
	duprintf("Frobenius norm of rho_beta: %g, distance to 1: %g\n", norm_rho, fabs(norm_rho - 1));

	duprintf("Current CPU time: %g seconds\n", (double)(clock() - t_start) / CLOCKS_PER_SEC);
	int nbuffers;
	MKL_INT64 nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));

	duprintf("\nApplying single-site operators and starting time evolution...\n");

	// apply single-site operators 'A' and 'B'
	mpo_t XA, XB;
	CopyMPO(&rho_beta, &XA);
	CopyMPO(&rho_beta, &XB);
	ApplySingleSiteTopOperator(   &bn, &XA.A[jA]);  // apply number operator from the top at site 'jA'
	ApplySingleSiteBottomOperator(&bn, &XB.A[jB]);  // apply number operator from the bottom at site 'jB'

	// compute dynamics data for time evolution
	dynamics_data_t dyn_time;
	const MKL_Complex16 idt = { 0, params.dt };
	ComputeDynamicsDataPRK(L, idt, d*d, (const double **)h, &dyn_time);

	// perform time evolution and compute response function at several time points

	const int nsteps = (int)round(0.5*params.tmax / params.dt);
	if (fabs(2*nsteps*params.dt/params.tmax - 1) > 1e-14)
	{
		duprintf("Cannot find an integer 'n' such that n*dt == tmax/2, exiting...\n");
		return -4;
	}

	MKL_Complex16 *chi  = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	MKL_Complex16 *chiA = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	MKL_Complex16 *chiB = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);

	// effective tolerance (truncation weight)
	double *tol_eff_A = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);
	double *tol_eff_B = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);

	// record virtual bond dimensions
	size_t *D_XA = (size_t *)MKL_malloc((nsteps + 1)*(L + 1) * sizeof(size_t), MEM_DATA_ALIGN);
	size_t *D_XB = (size_t *)MKL_malloc((nsteps + 1)*(L + 1) * sizeof(size_t), MEM_DATA_ALIGN);

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
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_chi_tmp.dat",       argv[4], L, d - 1); status = ReadData(filename, chi,       sizeof(MKL_Complex16), nstart + 1);     if (status < 0) { return status; }
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_chiA_tmp.dat",      argv[4], L, d - 1); status = ReadData(filename, chiA,      sizeof(MKL_Complex16), nstart + 1);     if (status < 0) { return status; }
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_chiB_tmp.dat",      argv[4], L, d - 1); status = ReadData(filename, chiB,      sizeof(MKL_Complex16), nstart + 1);     if (status < 0) { return status; }
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
			// copy physical quantum numbers
			memcpy(XA.qd[0], qd, d*sizeof(qnumber_t));
			memcpy(XA.qd[1], qd, d*sizeof(qnumber_t));
			memcpy(XB.qd[0], qd, d*sizeof(qnumber_t));
			memcpy(XB.qd[1], qd, d*sizeof(qnumber_t));
			// read tensor data from disk
			for (i = 0; i < L; i++)
			{
				sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XA/A%i.dat", argv[4], L, d - 1, i); status = ReadData(filename, XA.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XA.A[i]));  if (status < 0) { return status; }
				sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XB/A%i.dat", argv[4], L, d - 1, i); status = ReadData(filename, XB.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XB.A[i]));  if (status < 0) { return status; }
			}
			// read virtual bond quantum numbers from disk
			for (i = 0; i < L + 1; i++)
			{
				sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XA/qD%i.dat", argv[4], L, d - 1, i); status = ReadData(filename, XA.qD[i], sizeof(qnumber_t), D_XA[i + nstart*(L + 1)]);  if (status < 0) { return status; }
				sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XB/qD%i.dat", argv[4], L, d - 1, i); status = ReadData(filename, XB.qD[i], sizeof(qnumber_t), D_XB[i + nstart*(L + 1)]);  if (status < 0) { return status; }
			}

			// single step
			EvolveLiouvilleMPOPRK(&dyn_time, 1, true,  &bond_op_params, &XA, &tol_eff_A[nstart*(L - 1)]);
			EvolveLiouvilleMPOPRK(&dyn_time, 1, false, &bond_op_params, &XB, &tol_eff_B[nstart*(L - 1)]);

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

		// response function
		chi [n] = ComplexScale(1/square(norm_rho), MPOTraceProduct(&XA, &XB));
		chiA[n] = ComplexScale(1/square(norm_rho), MPOTraceProduct(&XA, &rho_beta));
		chiB[n] = ComplexScale(1/square(norm_rho), MPOTraceProduct(&rho_beta, &XB));

		// record virtual bond dimensions
		MPOBondDims(&XA, &D_XA[n*(L + 1)]);
		MPOBondDims(&XB, &D_XB[n*(L + 1)]);

		// save intermediate results to disk
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_chi_tmp.dat",  argv[4], L, d - 1); WriteData(filename, &chi [n], sizeof(MKL_Complex16), 1, true);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_chiA_tmp.dat", argv[4], L, d - 1); WriteData(filename, &chiA[n], sizeof(MKL_Complex16), 1, true);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_chiB_tmp.dat", argv[4], L, d - 1); WriteData(filename, &chiB[n], sizeof(MKL_Complex16), 1, true);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXA_tmp.dat",  argv[4], L, d - 1); WriteData(filename, &D_XA[n*(L + 1)], sizeof(size_t), L + 1, true);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXB_tmp.dat",  argv[4], L, d - 1); WriteData(filename, &D_XB[n*(L + 1)], sizeof(size_t), L + 1, true);
		if (n > 0) {
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_A_tmp.dat", argv[4], L, d - 1); WriteData(filename, &tol_eff_A[(n - 1)*(L - 1)], sizeof(double), L - 1, true);
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_B_tmp.dat", argv[4], L, d - 1); WriteData(filename, &tol_eff_B[(n - 1)*(L - 1)], sizeof(double), L - 1, true);
		}
		if (params.save_tensors)
		{
			// save tensor data to disk
			for (i = 0; i < L; i++)
			{
				sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XA/A%i.dat", argv[4], L, d - 1, i); WriteData(filename, XA.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XA.A[i]), false);
				sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XB/A%i.dat", argv[4], L, d - 1, i); WriteData(filename, XB.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XB.A[i]), false);
			}

			// save virtual bond quantum numbers to disk
			for (i = 0; i < L + 1; i++)
			{
				sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XA/qD%i.dat", argv[4], L, d - 1, i); status = WriteData(filename, XA.qD[i], sizeof(qnumber_t), D_XA[i + n*(L + 1)], false);
				sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XB/qD%i.dat", argv[4], L, d - 1, i); status = WriteData(filename, XB.qD[i], sizeof(qnumber_t), D_XB[i + n*(L + 1)], false);
			}
		}

		// record completed step
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_n_step.dat", argv[4], L, d - 1); WriteData(filename, &n, sizeof(int), 1, false);

		// final time step nowhere used; note that index n == nsteps would be out of range for effective tolerance
		if (n == nsteps) {
			break;
		}

		// single step
		EvolveLiouvilleMPOPRK(&dyn_time, 1, true,  &bond_op_params, &XA, &tol_eff_A[n*(L - 1)]);
		EvolveLiouvilleMPOPRK(&dyn_time, 1, false, &bond_op_params, &XB, &tol_eff_B[n*(L - 1)]);
	}

	const MKL_Complex16 chi_cum = ComplexSubtract(chi[nsteps], ComplexMultiply(chiA[nsteps], chiB[nsteps]));
	duprintf("chi at t = %g: (%g, %g), corresponding cumulant: (%g, %g)\n", params.tmax, chi[nsteps].real, chi[nsteps].imag, chi_cum.real, chi_cum.imag);

	const clock_t t_end = clock();
	double cpu_time = (double)(t_end - t_start) / CLOCKS_PER_SEC;
	duprintf("\nFinished simulation, CPU time: %g seconds\n", cpu_time);
	nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));

	// save results to disk
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_chi.dat",       argv[4], L, d - 1); WriteData(filename, chi,  sizeof(MKL_Complex16), nsteps + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_chiA.dat",      argv[4], L, d - 1); WriteData(filename, chiA, sizeof(MKL_Complex16), nsteps + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_chiB.dat",      argv[4], L, d - 1); WriteData(filename, chiB, sizeof(MKL_Complex16), nsteps + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_A.dat", argv[4], L, d - 1); WriteData(filename, tol_eff_A, sizeof(double), nsteps*(L - 1), false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_B.dat", argv[4], L, d - 1); WriteData(filename, tol_eff_B, sizeof(double), nsteps*(L - 1), false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXA.dat",       argv[4], L, d - 1); WriteData(filename, D_XA, sizeof(size_t), (nsteps + 1)*(L + 1), false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXB.dat",       argv[4], L, d - 1); WriteData(filename, D_XB, sizeof(size_t), (nsteps + 1)*(L + 1), false);

	// clean up
	MKL_free(D_XB);
	MKL_free(D_XA);
	MKL_free(tol_eff_B);
	MKL_free(tol_eff_A);
	MKL_free(chiB);
	MKL_free(chiA);
	MKL_free(chi);
	DeleteDynamicsData(&dyn_time);
	DeleteMPO(&XB);
	DeleteMPO(&XA);
	DeleteMPO(&rho_beta);
	DeleteLocalBoseHubbardOperators(L, h);
	MKL_free(h);
	DeleteTensor(&bn);
	MKL_free(qd);

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
