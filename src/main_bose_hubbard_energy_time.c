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

	if (argc != 6)
	{
		duprintf("Syntax: %s <param filename> <rho_beta path> <i> <j> <output path>\n", argv[0]);
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

	// number of lattice sites
	const int L = params.L;
	// physical dimension, equal to the maximal occupancy per site + 1
	const size_t d = params.d;

	// load MPO representation of exp(-\beta H/2) from disk
	mpo_t rho_beta;
	duprintf("Loading rho_beta from directory '%s'...\n", argv[2]);
	{
		// read virtual bond dimensions from disk
		size_t *D = (size_t *)MKL_malloc((L + 1)*sizeof(size_t), MEM_DATA_ALIGN);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_beta%g_D.dat", argv[2], L, d - 1, params.beta);
		status = ReadData(filename, D, sizeof(size_t), L + 1);
		if (status < 0)
		{
			duprintf("Error reading virtual bond dimension of rho_beta from directory '%s', exiting...\n", argv[2]);
			return -3;
		}

		const size_t dim[2] = { d, d };
		AllocateMPO(L, dim, D, &rho_beta);
		MKL_free(D);

		for (i = 0; i < L; i++)
		{
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_beta%g_A%i.dat", argv[2], L, d - 1, params.beta, i);
			status = ReadData(filename, rho_beta.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&rho_beta.A[i]));
			if (status < 0)
			{
				duprintf("Error reading %i-th MPO tensor of rho_beta from directory '%s', exiting...\n", i, argv[2]);
				return -3;
			}
		}
	}

	// record Frobenius norm of rho_beta
	const double norm_rho = MPOFrobeniusNorm(&rho_beta);
	duprintf("Frobenius norm of rho_beta: %g, distance to 1: %g\n", norm_rho, fabs(norm_rho - 1));

	// site of local 'A' and 'B' operators
	const int i_site = atoi(argv[3]);
	const int j_site = atoi(argv[4]);
	if (i_site < 0 || i_site >= params.L-1)
	{
		duprintf("'i_site = %i' out of range, must be between 0 and L-2, exiting...\n", i_site);
		return -4;
	}
	if (j_site < 0 || j_site >= params.L-1)
	{
		duprintf("'j_site = %i' out of range, must be between 0 and L-2, exiting...\n", j_site);
		return -4;
	}

	duprintf("\nComputing energy correlation functions for the Bose-Hubbard model on a chain with parameters:\n");
	duprintf("            lattice size L: %i\n", params.L);
	duprintf("    max occupancy per site: %zu\n", params.d - 1);
	duprintf("         kinetic hopping t: %g\n", params.t);
	duprintf("                 Hubbard U: %g\n", params.U);
	duprintf("     chemical potential mu: %g\n", params.mu);
	duprintf("  inverse temperature beta: %g\n", params.beta);
	duprintf("   largest simulation time: %g\n", params.tmax);
	duprintf("                 time step: %g\n", params.dt);
	duprintf("             MPO tolerance: %g\n", params.tol);
	duprintf("max virtual bond dimension: %zu\n", params.maxD);
	duprintf("                  'i' site: %i\n", i_site);
	duprintf("                  'j' site: %i\n", j_site);
	duprintf("           MKL max threads: %i\n", MKL_Get_Max_Threads());
	duprintf("\n");

	// local two-site energy operator
	tensor_t e_loc;
	{
		const size_t d2 = d*d;

		double *h = MKL_malloc(d2*d2 * sizeof(double), MEM_DATA_ALIGN);
		ConstructLocalBoseHubbardEnergyOperator(d - 1, params.t, params.U, h);

		const size_t dim[2] = { d2, d2 };
		AllocateTensor(2, dim, &e_loc);
		CopyRealToComplexMatrix(dim[0], dim[1], h, d2, e_loc.data, d2);

		MKL_free(h);
	}

	// construct two-site Bose-Hubbard Hamiltonian operators
	double **h = (double **)MKL_malloc((L - 1)*sizeof(double *), MEM_DATA_ALIGN);
	ConstructLocalBoseHubbardOperators(L, d - 1, params.t, params.U, params.mu, h);

	// start timer
	const clock_t t_start = clock();

	// apply two-site energy operators
	mpo_t XA, XB;
	CopyMPO(&rho_beta, &XA);
	CopyMPO(&rho_beta, &XB);
	ApplyTwoSiteTopOperator(   &XA.A[i_site], &XA.A[i_site+1], &e_loc, SVD_DISTR_SQRT, params.tol, params.maxD);    // apply energy operator from the top    at sites 'i_site' and 'i_site + 1'
	ApplyTwoSiteBottomOperator(&XB.A[j_site], &XB.A[j_site+1], &e_loc, SVD_DISTR_SQRT, params.tol, params.maxD);    // apply energy operator from the bottom at sites 'j_site' and 'j_site + 1'

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

	MKL_Complex16 *ee_corr = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	MKL_Complex16 *e_avr_i = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	MKL_Complex16 *e_avr_j = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);

	// effective tolerance (truncation weight)
	double *tol_eff_A = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);
	double *tol_eff_B = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);

	// record virtual bond dimensions
	size_t *D_XA = (size_t *)MKL_malloc((nsteps + 1)*(L + 1) * sizeof(size_t), MEM_DATA_ALIGN);
	size_t *D_XB = (size_t *)MKL_malloc((nsteps + 1)*(L + 1) * sizeof(size_t), MEM_DATA_ALIGN);

	int nstart = 0;

	if (params.save_tensors)
	{
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XA", argv[5], L, d - 1); makedir(filename);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XB", argv[5], L, d - 1); makedir(filename);

		// try to open 'n_step' file if it exists, to continue simulation after previous checkpoint
		duprintf("Trying to read 'n_step' file...\n");
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_n_step.dat", argv[5], L, d - 1);
		status = ReadData(filename, &nstart, sizeof(int), 1);
		if (status == 0 && (nstart > 0 && nstart < nsteps))
		{
			duprintf("Continuing simulation after time step %i...\n", nstart);

			// read intermediate results to disk
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_ee_corr_tmp.dat",   argv[5], L, d - 1); status = ReadData(filename, ee_corr,   sizeof(MKL_Complex16), nstart + 1);     if (status < 0) { return status; }
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_e_avr_i_tmp.dat",   argv[5], L, d - 1); status = ReadData(filename, e_avr_i,   sizeof(MKL_Complex16), nstart + 1);     if (status < 0) { return status; }
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_e_avr_j_tmp.dat",   argv[5], L, d - 1); status = ReadData(filename, e_avr_j,   sizeof(MKL_Complex16), nstart + 1);     if (status < 0) { return status; }
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXA_tmp.dat",       argv[5], L, d - 1); status = ReadData(filename, D_XA,      sizeof(size_t), (nstart + 1)*(L + 1));  if (status < 0) { return status; }
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXB_tmp.dat",       argv[5], L, d - 1); status = ReadData(filename, D_XB,      sizeof(size_t), (nstart + 1)*(L + 1));  if (status < 0) { return status; }
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_A_tmp.dat", argv[5], L, d - 1); status = ReadData(filename, tol_eff_A, sizeof(double),  nstart     *(L - 1));  if (status < 0) { return status; }
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_B_tmp.dat", argv[5], L, d - 1); status = ReadData(filename, tol_eff_B, sizeof(double),  nstart     *(L - 1));  if (status < 0) { return status; }

			// re-allocate and fill MPOs
			DeleteMPO(&XB);
			DeleteMPO(&XA);
			const size_t dim[2] = { d, d };
			AllocateMPO(L, dim, &D_XA[nstart*(L + 1)], &XA);
			AllocateMPO(L, dim, &D_XB[nstart*(L + 1)], &XB);
			for (i = 0; i < L; i++)
			{
				sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XA/A%i.dat", argv[5], L, d - 1, i); status = ReadData(filename, XA.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XA.A[i]));  if (status < 0) { return status; }
				sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XB/A%i.dat", argv[5], L, d - 1, i); status = ReadData(filename, XB.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XB.A[i]));  if (status < 0) { return status; }
			}

			// single step
			EvolveLiouvilleMPOPRK(&dyn_time, 1, true,  params.tol, params.maxD, &XA, &tol_eff_A[nstart*(L - 1)]);
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

		// energy correlation function
		ee_corr[n] = ComplexScale(1/square(norm_rho), MPOTraceProduct(&XA, &XB));
		e_avr_i[n] = ComplexScale(1/square(norm_rho), MPOTraceProduct(&XA, &rho_beta));
		e_avr_j[n] = ComplexScale(1/square(norm_rho), MPOTraceProduct(&rho_beta, &XB));

		// record virtual bond dimensions
		MPOBondDims(&XA, &D_XA[n*(L + 1)]);
		MPOBondDims(&XB, &D_XB[n*(L + 1)]);

		// save intermediate results to disk
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_ee_corr_tmp.dat", argv[5], L, d - 1); WriteData(filename, &ee_corr[n], sizeof(MKL_Complex16), 1, true);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_e_avr_i_tmp.dat", argv[5], L, d - 1); WriteData(filename, &e_avr_i[n], sizeof(MKL_Complex16), 1, true);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_e_avr_j_tmp.dat", argv[5], L, d - 1); WriteData(filename, &e_avr_j[n], sizeof(MKL_Complex16), 1, true);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXA_tmp.dat",     argv[5], L, d - 1); WriteData(filename, &D_XA[n*(L + 1)], sizeof(size_t), L + 1, true);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXB_tmp.dat",     argv[5], L, d - 1); WriteData(filename, &D_XB[n*(L + 1)], sizeof(size_t), L + 1, true);
		if (n > 0) {
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_A_tmp.dat", argv[5], L, d - 1); WriteData(filename, &tol_eff_A[(n - 1)*(L - 1)], sizeof(double), L - 1, true);
			sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_B_tmp.dat", argv[5], L, d - 1); WriteData(filename, &tol_eff_B[(n - 1)*(L - 1)], sizeof(double), L - 1, true);
		}
		if (params.save_tensors)
		{
			for (i = 0; i < L; i++)
			{
				sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XA/A%i.dat", argv[5], L, d - 1, i); WriteData(filename, XA.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XA.A[i]), false);
				sprintf(filename, "%s/bose_hubbard_L%i_M%zu_XB/A%i.dat", argv[5], L, d - 1, i); WriteData(filename, XB.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XB.A[i]), false);
			}
		}

		// record completed step
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_n_step.dat", argv[5], L, d - 1); WriteData(filename, &n, sizeof(int), 1, false);

		// final time step nowhere used; note that index n == nsteps would be out of range for effective tolerance
		if (n == nsteps) {
			break;
		}

		// single step
		EvolveLiouvilleMPOPRK(&dyn_time, 1, true,  params.tol, params.maxD, &XA, &tol_eff_A[n*(L - 1)]);
		EvolveLiouvilleMPOPRK(&dyn_time, 1, false, params.tol, params.maxD, &XB, &tol_eff_B[n*(L - 1)]);
	}

	const MKL_Complex16 ee_cum = ComplexSubtract(ee_corr[nsteps], ComplexMultiply(e_avr_i[nsteps], e_avr_j[nsteps]));
	duprintf("energy correlation at t = %g: (%g, %g), corresponding cumulant: (%g, %g)\n", params.tmax, ee_corr[nsteps].real, ee_corr[nsteps].imag, ee_cum.real, ee_cum.imag);

	const clock_t t_end = clock();
	double cpu_time = (double)(t_end - t_start) / CLOCKS_PER_SEC;
	duprintf("\nFinished simulation, CPU time: %g seconds\n", cpu_time);
	int nbuffers;
	MKL_INT64 nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));

	// save results to disk
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_ee_corr.dat",   argv[5], L, d - 1); WriteData(filename, ee_corr, sizeof(MKL_Complex16), nsteps + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_e_avr_i.dat",   argv[5], L, d - 1); WriteData(filename, e_avr_i, sizeof(MKL_Complex16), nsteps + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_e_avr_j.dat",   argv[5], L, d - 1); WriteData(filename, e_avr_j, sizeof(MKL_Complex16), nsteps + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_A.dat", argv[5], L, d - 1); WriteData(filename, tol_eff_A, sizeof(double), nsteps*(L - 1), false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_B.dat", argv[5], L, d - 1); WriteData(filename, tol_eff_B, sizeof(double), nsteps*(L - 1), false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXA.dat",       argv[5], L, d - 1); WriteData(filename, D_XA, sizeof(size_t), (nsteps + 1)*(L + 1), false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_DXB.dat",       argv[5], L, d - 1); WriteData(filename, D_XB, sizeof(size_t), (nsteps + 1)*(L + 1), false);

	// clean up
	MKL_free(D_XB);
	MKL_free(D_XA);
	MKL_free(tol_eff_B);
	MKL_free(tol_eff_A);
	MKL_free(e_avr_j);
	MKL_free(e_avr_i);
	MKL_free(ee_corr);
	DeleteDynamicsData(&dyn_time);
	DeleteMPO(&XB);
	DeleteMPO(&XA);
	DeleteMPO(&rho_beta);
	DeleteLocalHamiltonianOperators(L, h);
	MKL_free(h);
	DeleteTensor(&e_loc);

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
