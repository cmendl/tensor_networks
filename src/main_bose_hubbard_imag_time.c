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

	duprintf("Computing temperature dependence of density and energy for the Bose-Hubbard model on a chain with parameters:\n");
	duprintf("              lattice size L: %i\n", params.L);
	duprintf("      max occupancy per site: %zu\n", params.d - 1);
	duprintf("           kinetic hopping t: %g\n", params.t);
	duprintf("                   Hubbard U: %g\n", params.U);
	duprintf("       chemical potential mu: %g\n", params.mu);
	duprintf("max inverse temperature beta: %g\n", params.beta);
	duprintf("             delta beta step: %g\n", params.dbeta);
	duprintf("               MPO tolerance: %g\n", params.tol);
	duprintf("  max virtual bond dimension: %zu\n", params.maxD);
	duprintf("             MKL max threads: %i\n", MKL_Get_Max_Threads());
	duprintf("\n");

	// number of lattice sites
	const int L = params.L;
	// physical dimension, equal to the maximal occupancy per site + 1
	const size_t d = params.d;

	// bosonic number operator
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

	const int nsteps = (int)round(params.beta / params.dbeta) + 1;
	if (fabs((nsteps - 1)*params.dbeta/params.beta - 1) > 1e-14)
	{
		duprintf("Cannot find an integer 'n' such that n*dbeta == beta, exiting...\n");
		return -4;
	}

	// initialize 'rho' by the identity operation
	mpo_t rho;
	CreateIdentityMPO(L, d, &rho);

	const MKL_Complex16 dbeta = { params.dbeta, 0 };

	// compute evolution dynamics data required for Strang splitting evolution
	dynamics_data_t dyn;
	ComputeDynamicsDataStrang(L, dbeta, d*d, (const double **)h, &dyn);

	// virtual bond dimensions
	size_t *D = (size_t *)MKL_malloc(nsteps*(L + 1) * sizeof(size_t), MEM_DATA_ALIGN);

	// effective tolerance (truncation weight)
	double *tol_eff = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);

	// local density and total energy
	double *density = (double *)MKL_malloc(nsteps*L * sizeof(double), MEM_DATA_ALIGN);
	double *energy  = (double *)MKL_malloc(nsteps   * sizeof(double), MEM_DATA_ALIGN);

	// construct matrix product operator representation of Hamiltonian
	mpo_t mpoH;
	ConstructBoseHubbardMPO(L, d - 1, params.t, params.U, params.mu, &mpoH);

	// start timer
	const clock_t t_start = clock();

	int n;
	for (n = 0; n < nsteps; n++)
	{
		duprintf("imaginary time step %i / %i, beta = %g\n", n, nsteps - 1, n*params.dbeta);

		// record virtual bond dimensions
		GetVirtualBondDimensions(&rho, &D[n*(L + 1)]);

		// record trace of exp(-beta H)
		const double Z = ComplexReal(MPOTrace(&rho));

		// compute local density
		{
			mpo_t rho_n;
			CopyMPO(&rho, &rho_n);

			int i;
			for (i = 0; i < L; i++)
			{
				// apply number operator at site i
				ApplySingleSiteTopOperator(&rho_n.A[i], &bn);

				density[i + n*L] = ComplexReal(MPOTrace(&rho_n)) / Z;

				// restore original tensor at site i
				DeleteTensor(&rho_n.A[i]);
				CopyTensor(&rho.A[i], &rho_n.A[i]);
			}

			DeleteMPO(&rho_n);
		}

		// compute total energy
		energy[n] = ComplexReal(MPOTraceProduct(&rho, &mpoH)) / Z;

		// perform a single imaginary time evolution step; using "normalization" to keep A[0] matrix entries of order 1
		EvolveMPOStrang(&dyn, 1, params.tol, params.maxD, true, &rho, &tol_eff[n*(L - 1)]);
	}

	const clock_t t_end = clock();
	double cpu_time = (double)(t_end - t_start) / CLOCKS_PER_SEC;
	duprintf("\nFinished simulation, CPU time: %g seconds\n", cpu_time);
	int nbuffers;
	MKL_INT64 nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));

	// save results to disk
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_D.dat",       argv[2], L, d - 1); WriteData(filename, D,       sizeof(size_t), nsteps*(L + 1), false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff.dat", argv[2], L, d - 1); WriteData(filename, tol_eff, sizeof(double), nsteps*(L - 1), false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_density.dat", argv[2], L, d - 1); WriteData(filename, density, sizeof(double), nsteps*L,       false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_energy.dat",  argv[2], L, d - 1); WriteData(filename, energy,  sizeof(double), nsteps,         false);

	// clean up
	DeleteMPO(&mpoH);
	MKL_free(energy);
	MKL_free(density);
	MKL_free(tol_eff);
	MKL_free(D);
	DeleteDynamicsData(&dyn);
	DeleteMPO(&rho);
	DeleteLocalHamiltonianOperators(L, h);
	MKL_free(h);
	DeleteTensor(&bn);

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
