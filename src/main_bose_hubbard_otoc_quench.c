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

	// sites 'i' and 'j'
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

	duprintf("Computing OTOCs after a quench from initial |11...1> for the Bose-Hubbard model on a chain with parameters:\n");
	duprintf("            lattice size L: %i\n", params.L);
	duprintf("    max occupancy per site: %zu\n", params.d - 1);
	duprintf("         kinetic hopping t: %g\n", params.t);
	duprintf("                 Hubbard U: %g\n", params.U);
	duprintf("     chemical potential mu: %g\n", params.mu);
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

	// single-site projection operator
	tensor_t proj;
	{
		const size_t dim[2] = { d, d };
		AllocateTensor(2, dim, &proj);
		proj.data[1 + 1*d].real = 1;
	}

	// construct two-site Bose-Hubbard Hamiltonian operators
	double **h = (double **)MKL_malloc((L - 1)*sizeof(double *), MEM_DATA_ALIGN);
	ConstructLocalBoseHubbardOperators(L, d - 1, params.t, params.U, params.mu, h);

	// perform time evolution and compute OTOCs at several time points

	const int nsteps = (int)round(params.tmax / params.dt);
	if (fabs(nsteps*params.dt/params.tmax - 1) > 1e-14)
	{
		duprintf("Cannot find an integer 'n' such that n*dt == tmax, exiting...\n");
		return -4;
	}

	// time dependent creation operator at site 'j': exp(-i H t) b^dagger_j exp(i H t)
	mpo_t bdjt;
	CreateIdentityMPO(L, d, &bdjt);
	ApplySingleSiteBottomOperator(&bdjt.A[j_site], &bd);

	// compute dynamics data for time evolution
	dynamics_data_t dyn_time;
	const MKL_Complex16 idt = { 0, params.dt };
	ComputeDynamicsDataPRK(L, idt, d*d, (const double **)h, &dyn_time);

	MKL_Complex16 *otoc1 = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	MKL_Complex16 *otoc2 = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	MKL_Complex16 *gf    = (MKL_Complex16 *)MKL_malloc((nsteps + 1)*sizeof(MKL_Complex16), MEM_DATA_ALIGN);

	// effective tolerance (truncation weight)
	double *tol_eff = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);

	// record virtual bond dimensions
	size_t *D = (size_t *)MKL_malloc((nsteps + 1)*(L + 1) * sizeof(size_t), MEM_DATA_ALIGN);

	duprintf("Starting time evolution...\n");

	// start timer
	const clock_t t_cpu_start = clock();
	const unsigned long long t_wall_start = GetTimeTicks();

	int n;
	for (n = 0; n <= nsteps; n++)
	{
		duprintf("time step %i / %i\n", n, nsteps);

		// OTOCs at current time point
		{
			// time dependent annihilation operator at site 'j': exp(-i H t) b_j exp(i H t)
			mpo_t bjt;
			ConjugateTransposeMPO(&bdjt, &bjt);

			// apply single-site projection operators
			mpo_t proj_bdjt;
			CopyMPO(&bdjt, &proj_bdjt);
			for (i = 0; i < L; i++)
			{
				ApplySingleSiteTopOperator(&proj_bdjt.A[i], &proj);     // projection operator at site i
			}

			// backup copy of tensors at site 'i'
			tensor_t bdAi, bAi;
			CopyTensor(&proj_bdjt.A[i_site], &bdAi);
			CopyTensor(      &bjt.A[i_site], &bAi);

			ApplySingleSiteBottomOperator(&proj_bdjt.A[i_site], &bd);   //     creation operator at site i
			ApplySingleSiteBottomOperator(      &bjt.A[i_site], &b);    // annihilation operator at site i

			otoc1[n] = MPOTraceProduct(&proj_bdjt, &bjt);

			// restore original tensors
			DeleteTensor(&proj_bdjt.A[i_site]);
			DeleteTensor(      &bjt.A[i_site]);
			CopyTensor(&bdAi, &proj_bdjt.A[i_site]);
			CopyTensor( &bAi,       &bjt.A[i_site]);

			ApplySingleSiteBottomOperator(&proj_bdjt.A[i_site], &b);    // annihilation operator at site i
			ApplySingleSiteBottomOperator(      &bjt.A[i_site], &bd);   //     creation operator at site i

			otoc2[n] = MPOTraceProduct(&proj_bdjt, &bjt);
			   gf[n] = MPOTrace(&proj_bdjt);

			// restore original tensors
			DeleteTensor(&proj_bdjt.A[i_site]);
			DeleteTensor(      &bjt.A[i_site]);
			MoveTensorData(&bdAi, &proj_bdjt.A[i_site]);
			MoveTensorData( &bAi,       &bjt.A[i_site]);

			DeleteMPO(&bjt);
			DeleteMPO(&proj_bdjt);
		}

		// record virtual bond dimensions
		GetVirtualBondDimensions(&bdjt, &D[n*(L + 1)]);

		// final time step nowhere used; note that index n == nsteps would be out of range for effective tolerance
		if (n == nsteps) {
			break;
		}

		// single step
		EvolveLiouvilleMPOPRK(&dyn_time, 1, true,  params.tol, params.maxD, &bdjt, &tol_eff[n*(L - 1)]);
	}

	duprintf("At t = %g:\n", params.tmax);
	duprintf("<11...1| bj^dagger(t) bi^dagger(0) bj(t) bi(0) |11...1> = (%g, %g)\n", otoc1[nsteps].real, otoc1[nsteps].imag);
	duprintf("<11...1| bj^dagger(t) bi(0) bj(t) bi^dagger(0) |11...1> = (%g, %g)\n", otoc2[nsteps].real, otoc2[nsteps].imag);
	duprintf("<11...1| bj^dagger(t) bi(0) |11...1>                    = (%g, %g)\n",    gf[nsteps].real,    gf[nsteps].imag);

	const clock_t t_cpu_end = clock();
	const unsigned long long t_wall_end = GetTimeTicks();
	double cpu_time = (double)(t_cpu_end  - t_cpu_start ) / CLOCKS_PER_SEC;
	double walltime = (double)(t_wall_end - t_wall_start) / GetTimeResolution();
	duprintf("\nFinished simulation, CPU time: %g seconds, wall clock time: %g seconds\n", cpu_time, walltime);
	int nbuffers;
	MKL_INT64 nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));

	// save results to disk
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_otoc1.dat",   argv[4], L, d - 1); WriteData(filename, otoc1, sizeof(MKL_Complex16),   nsteps + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_otoc2.dat",   argv[4], L, d - 1); WriteData(filename, otoc2, sizeof(MKL_Complex16),   nsteps + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_gf.dat",      argv[4], L, d - 1); WriteData(filename, gf,    sizeof(MKL_Complex16),   nsteps + 1, false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_tol_eff.dat", argv[4], L, d - 1); WriteData(filename, tol_eff, sizeof(double),  nsteps*(L - 1), false);
	sprintf(filename, "%s/bose_hubbard_L%i_M%zu_D.dat",       argv[4], L, d - 1); WriteData(filename, D, sizeof(size_t), (nsteps + 1)*(L + 1), false);

	// clean up
	MKL_free(D);
	MKL_free(tol_eff);
	MKL_free(gf);
	MKL_free(otoc2);
	MKL_free(otoc1);
	DeleteDynamicsData(&dyn_time);
	DeleteMPO(&bdjt);
	DeleteLocalHamiltonianOperators(L, h);
	MKL_free(h);
	DeleteTensor(&proj);
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
