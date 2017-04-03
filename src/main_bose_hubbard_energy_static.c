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

	if (argc != 3)
	{
		duprintf("Syntax: %s <param filename> <output path>\n", argv[0]);
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

	duprintf("Computing static energy-energy correlations for the Bose-Hubbard model on a chain with parameters:\n");
	duprintf("            lattice size L: %i\n", params.L);
	duprintf("    max occupancy per site: %zu\n", params.d - 1);
	duprintf("         kinetic hopping t: %g\n", params.t);
	duprintf("                 Hubbard U: %g\n", params.U);
	duprintf("     chemical potential mu: %g\n", params.mu);
	duprintf("  inverse temperature beta: %g\n", params.beta);
	duprintf("           delta beta step: %g\n", params.dbeta);
	duprintf("             MPO tolerance: %g\n", params.tol);
	duprintf("max virtual bond dimension: %zu\n", params.maxD);
	duprintf("           MKL max threads: %i\n", MKL_Get_Max_Threads());
	duprintf("\n");

	// number of lattice sites
	const int L = params.L;
	// physical dimension, equal to the maximal occupancy per site + 1
	const size_t d = params.d;

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

	// compute exp(-\beta H/2) as MPO
	mpo_t rho_beta;
	{
		// initialize rho_beta by the identity operation
		CreateIdentityMPO(L, d, &rho_beta);

		const int nsteps = (int)round(0.5*params.beta / params.dbeta);
		if (fabs(2*nsteps*params.dbeta/params.beta - 1) > 1e-14)
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
		EvolveMPOStrang(&dyn, nsteps, params.tol, params.maxD, true, &rho_beta, tol_eff_beta);

		// record virtual bond dimensions
		size_t *D_beta = (size_t *)MKL_malloc((L + 1) * sizeof(size_t), MEM_DATA_ALIGN);
		MPOBondDims(&rho_beta, D_beta);

		// save effective tolerances and virtual bond dimensions to disk
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff_beta.dat", argv[2], L, d - 1); WriteData(filename, tol_eff_beta, sizeof(double), nsteps*(L - 1), false);
		sprintf(filename, "%s/bose_hubbard_L%i_M%zu_D_beta.dat",       argv[2], L, d - 1); WriteData(filename, D_beta, sizeof(size_t), L + 1, false);

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

	// all computations actually real-valued

	duprintf("\nComputing static energy-energy correlations...\n");

	mpo_t XA, XB;
	CopyMPO(&rho_beta, &XA);
	CopyMPO(&rho_beta, &XB);

	double *ee_corr = (double *)MKL_malloc((L-1)*(L-1)*sizeof(double), MEM_DATA_ALIGN);
	double *e_avr_A = (double *)MKL_malloc((L-1)      *sizeof(double), MEM_DATA_ALIGN);
	double *e_avr_B = (double *)MKL_malloc((L-1)      *sizeof(double), MEM_DATA_ALIGN);

	int jB;
	for (jB = 0; jB < L-1; jB++)
	{
		// backup copy of tensor at site 'jB' and 'jB+1'
		tensor_t XBj, XBj1;
		CopyTensor(&XB.A[jB  ], &XBj);
		CopyTensor(&XB.A[jB+1], &XBj1);

		// apply two-site energy operator from the bottom at sites 'jB' and 'jB+1'
		ApplyTwoSiteBottomOperator(&XB.A[jB], &XB.A[jB+1], &e_loc, SVD_DISTR_SQRT, 0, 65536);

		e_avr_B[jB] = ComplexReal(MPOTraceProduct(&rho_beta, &XB));

		int jA;
		for (jA = 0; jA < L-1; jA++)
		{
			// backup copy of tensor at site 'jA' and 'jA+1'
			tensor_t XAj, XAj1;
			CopyTensor(&XA.A[jA  ], &XAj);
			CopyTensor(&XA.A[jA+1], &XAj1);

			// apply two-site energy operator from the top at sites 'jA' and 'jA+1'
			ApplyTwoSiteTopOperator(&XA.A[jA], &XA.A[jA+1], &e_loc, SVD_DISTR_SQRT, 0, 65536);

			// <e_{jB,jB+1} e_{jA,jA+1}> energy-energy correlation
			ee_corr[jA + (L-1)*jB] = ComplexReal(MPOTraceProduct(&XA, &XB));

			if (jB == 0)
			{
				e_avr_A[jA] = ComplexReal(MPOTraceProduct(&XA, &rho_beta));
			}

			// restore original tensors
			DeleteTensor(&XA.A[jA]);
			DeleteTensor(&XA.A[jA+1]);
			MoveTensorData(&XAj,  &XA.A[jA]);
			MoveTensorData(&XAj1, &XA.A[jA+1]);
		}

		// restore original tensors
		DeleteTensor(&XB.A[jB]);
		DeleteTensor(&XB.A[jB+1]);
		MoveTensorData(&XBj,  &XB.A[jB]);
		MoveTensorData(&XBj1, &XB.A[jB+1]);
	}

	const clock_t t_end = clock();
	double cpu_time = (double)(t_end - t_start) / CLOCKS_PER_SEC;
	duprintf("\nFinished simulation, CPU time: %g seconds\n", cpu_time);
	nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));

	// save results to disk
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_ee_corr.dat", argv[2], L, d - 1); WriteData(filename, ee_corr, sizeof(double), (L-1)*(L-1), false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_e_avr_A.dat", argv[2], L, d - 1); WriteData(filename, e_avr_A, sizeof(double), L-1,         false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_e_avr_B.dat", argv[2], L, d - 1); WriteData(filename, e_avr_B, sizeof(double), L-1,         false);

	// clean up
	MKL_free(e_avr_B);
	MKL_free(e_avr_A);
	MKL_free(ee_corr);
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
