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

	// site of local 'A' and 'B' operators
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

	duprintf("Computing hole Green's function for the Bose-Hubbard model on a chain with parameters:\n");
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

	// bosonic creation operator
	tensor_t bd;
	{
		const size_t dim[2] = { d, d };
		AllocateTensor(2, dim, &bd);
		for (j = 0; j < d - 1; j++)
		{
			bd.data[(j+1) + j*d].real = sqrt(1.0 + j);
		}
	}
	// bosonic annihilation operator
	tensor_t b;
	{
		const size_t dim[2] = { d, d };
		AllocateTensor(2, dim, &b);
		for (j = 0; j < d - 1; j++)
		{
			b.data[j + (j+1)*d].real = sqrt(1.0 + j);
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
		GetVirtualBondDimensions(&rho_beta, D_beta);

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
	ApplySingleSiteTopOperator(   &XA.A[i_site], &bd);  // apply creation     operator from the top at site 'i'
	ApplySingleSiteBottomOperator(&XB.A[j_site], &b);   // apply annihilation operator from the bottom at site 'j'

	// compute dynamics data for time evolution
	dynamics_data_t dyn_time;
	const MKL_Complex16 idt = { 0, params.dt };
	ComputeDynamicsDataPRK(L, idt, d*d, (const double **)h, &dyn_time);

	// perform time evolution and compute hole Green's function at several time points

	const int nsteps = (int)round(0.5*params.tmax / params.dt);
	if (fabs(2*nsteps*params.dt/params.tmax - 1) > 1e-14)
	{
		duprintf("Cannot find an integer 'n' such that n*dt == tmax/2, exiting...\n");
		return -4;
	}

	MKL_Complex16 *gf  = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	MKL_Complex16 *gfA = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	MKL_Complex16 *gfB = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);

	// effective tolerance (truncation weight)
	double *tol_eff_A = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);
	double *tol_eff_B = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);

	// record virtual bond dimensions
	size_t *D_XA = (size_t *)MKL_malloc((nsteps + 1)*(L + 1) * sizeof(size_t), MEM_DATA_ALIGN);
	size_t *D_XB = (size_t *)MKL_malloc((nsteps + 1)*(L + 1) * sizeof(size_t), MEM_DATA_ALIGN);

	// response function at time t = 0
	gf [0] = ComplexScale(1/square(norm_rho), MPOTraceProduct(&XA, &XB));
	gfA[0] = ComplexScale(1/square(norm_rho), MPOTraceProduct(&XA, &rho_beta));
	gfB[0] = ComplexScale(1/square(norm_rho), MPOTraceProduct(&rho_beta, &XB));
	// initial virtual bond dimensions
	GetVirtualBondDimensions(&XA, D_XA);
	GetVirtualBondDimensions(&XB, D_XB);

	int n;
	for (n = 0; n < nsteps; n++)
	{
		duprintf("time step %i / %i\n", n + 1, nsteps);

		// single step
		EvolveLiouvilleMPOPRK(&dyn_time, 1, false, params.tol, params.maxD, &XA, &tol_eff_A[n*(L - 1)]);
		EvolveLiouvilleMPOPRK(&dyn_time, 1, true,  params.tol, params.maxD, &XB, &tol_eff_B[n*(L - 1)]);

		gf [n + 1] = ComplexScale(1/square(norm_rho), MPOTraceProduct(&XA, &XB));
		gfA[n + 1] = ComplexScale(1/square(norm_rho), MPOTraceProduct(&XA, &rho_beta));
		gfB[n + 1] = ComplexScale(1/square(norm_rho), MPOTraceProduct(&rho_beta, &XB));

		// record virtual bond dimensions
		GetVirtualBondDimensions(&XA, &D_XA[(n + 1)*(L + 1)]);
		GetVirtualBondDimensions(&XB, &D_XB[(n + 1)*(L + 1)]);
	}

	duprintf("hole Green's function at t = %g: (%g, %g)\n", params.tmax, gf[nsteps].real, gf[nsteps].imag);

	const clock_t t_end = clock();
	double cpu_time = (double)(t_end - t_start) / CLOCKS_PER_SEC;
	duprintf("\nFinished simulation, CPU time: %g seconds\n", cpu_time);
	nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));

	// save results to disk
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_gfhole.dat",    argv[4], L, d - 1); WriteData(filename, gf,  sizeof(MKL_Complex16), nsteps + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_gfholeA.dat",   argv[4], L, d - 1); WriteData(filename, gfA, sizeof(MKL_Complex16), nsteps + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_gfholeB.dat",   argv[4], L, d - 1); WriteData(filename, gfB, sizeof(MKL_Complex16), nsteps + 1, false);
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
	MKL_free(gfB);
	MKL_free(gfA);
	MKL_free(gf);
	DeleteDynamicsData(&dyn_time);
	DeleteMPO(&XB);
	DeleteMPO(&XA);
	DeleteMPO(&rho_beta);
	DeleteLocalHamiltonianOperators(L, h);
	MKL_free(h);
	DeleteTensor(&b);
	DeleteTensor(&bd);

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
