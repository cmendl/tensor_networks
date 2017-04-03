#include "hamiltonian.h"
#include "dynamics.h"
#include "complex.h"
#include "sim_params.h"
#include "dupio.h"
#include <mkl.h>
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
		duprintf("Syntax: %s <param filename> <jA> <jB> <output path>\n", argv[0]);
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

	duprintf("Computing exp(-beta H/2) for Heisenberg Hamiltonian on a chain with parameters:\n");
	duprintf("            lattice size L: %i\n", params.L);
	duprintf("      J coupling constants: (%g, %g, %g)\n", params.Jx, params.Jy, params.Jz);
	duprintf("          external field h: %g\n", params.hext);
	duprintf("  inverse temperature beta: %g\n", params.beta);
	duprintf("           delta beta step: %g\n", params.dbeta);
	duprintf("             MPO tolerance: %g\n", params.tol);
	duprintf("max virtual bond dimension: %zu\n", params.maxD);
	duprintf("           MKL max threads: %i\n", MKL_Get_Max_Threads());
	duprintf("\n");

	// number of lattice sites
	const int L = params.L;

	// construct two-site Bose-Hubbard Hamiltonian operators
	double **h = (double **)MKL_malloc((L - 1)*sizeof(double *), MEM_DATA_ALIGN);
	ConstructLocalHeisenbergOperators(L, params.Jx, params.Jy, params.Jz, params.hext, h);

	// initialize rho_beta by the identity operation
	mpo_t rho_beta;
	CreateIdentityMPO(L, 2, &rho_beta);

	// compute exp(-\beta H/2) as MPO
	const int nsteps = (int)round(0.5*params.beta / params.dbeta);
	if (fabs(2*nsteps*params.dbeta/params.beta - 1) > 1e-14)
	{
		duprintf("Cannot find an integer 'n' such that n*dbeta == beta/2, exiting...\n");
		return -4;
	}

	const MKL_Complex16 dbeta = { params.dbeta, 0 };

	// compute evolution dynamics data required for Strang splitting evolution
	dynamics_data_t dyn;
	ComputeDynamicsDataStrang(L, dbeta, 4, (const double **)h, &dyn);

	// effective tolerance (truncation weight)
	double *tol_eff = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);

	// perform evolution
	EvolveMPOStrang(&dyn, nsteps, params.tol, params.maxD, true, &rho_beta, tol_eff);

	const double norm_rho = MPOFrobeniusNorm(&rho_beta);
	duprintf("Frobenius norm of rho_beta: %g\n", norm_rho);

	// record virtual bond dimensions
	size_t *D_rho_beta = (size_t *)MKL_malloc((L + 1) * sizeof(size_t), MEM_DATA_ALIGN);
	MPOBondDims(&rho_beta, D_rho_beta);

	// ladder operators
	tensor_t Sup, Sdn;
	{
		const size_t dim[2] = { 2, 2 };
		AllocateTensor(2, dim, &Sup);
		AllocateTensor(2, dim, &Sdn);
		// (0 1)
		// (0 0)
		Sup.data[2].real = 1;
		// (0 0)
		// (1 0)
		Sdn.data[1].real = 1;
	}

	// apply single-site operators 'A' and 'B'
	duprintf("'A' operator site: %i\n", jA);
	duprintf("'B' operator site: %i\n", jB);
	mpo_t XA, XB;
	CopyMPO(&rho_beta, &XA);
	CopyMPO(&rho_beta, &XB);
	ApplySingleSiteTopOperator(   &XA.A[jA], &Sup); // apply ladder-up operator from the top at site 'jA'
	ApplySingleSiteBottomOperator(&XB.A[jB], &Sup); // apply ladder-up operator from the bottom at site 'jB'

	// static response function
	const MKL_Complex16 chi = ComplexScale(1/square(norm_rho), MPOTraceProduct(&XA, &XB));
	duprintf("chi: (%g, %g)\n", chi.real, chi.imag);

	// merge MPO to compare with reference
	tensor_t rho_beta_full;
	MergeMPOFull(&rho_beta, &rho_beta_full);

	// save results to disk
	sprintf(filename, "%s/heisenberg_L%i_chi.dat", argv[4], L);         WriteData(filename, &chi, sizeof(MKL_Complex16), 1, false);
	sprintf(filename, "%s/heisenberg_L%i_tol_eff.dat", argv[4], L);     WriteData(filename, tol_eff, sizeof(double), nsteps*(L - 1), false);
	sprintf(filename, "%s/heisenberg_L%i_D_rho_beta.dat", argv[4], L);  WriteData(filename, D_rho_beta, sizeof(size_t), L + 1, false);
	sprintf(filename, "%s/heisenberg_L%i_rho_beta.dat", argv[4], L);    WriteData(filename, rho_beta_full.data, sizeof(MKL_Complex16), NumTensorElements(&rho_beta_full), false);

	// clean up
	DeleteTensor(&rho_beta_full);
	DeleteMPO(&XB);
	DeleteMPO(&XA);
	MKL_free(D_rho_beta);
	MKL_free(tol_eff);
	DeleteDynamicsData(&dyn);
	DeleteMPO(&rho_beta);
	DeleteLocalHamiltonianOperators(L, h);
	MKL_free(h);
	DeleteTensor(&Sdn);
	DeleteTensor(&Sup);

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

	fclose(fd_log);

	return 0;
}
