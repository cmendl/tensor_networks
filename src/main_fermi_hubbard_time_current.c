#include "hamiltonian.h"
#include "dynamics.h"
#include "complex.h"
#include "sim_params.h"
#include "dupio.h"
#include <mkl.h>
#include <string.h>
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
///
/// \brief Construct local charge and spin current operators
///
/// Convention for local site basis is |0>, |up>, |dn>, |up,dn>
///
static void ConstructLocalCurrentOperators(const double t, tensor_t *restrict Jc, tensor_t *restrict Js)
{
	const double id[2*2] = { 1,  0,  0,  1 };   // 2 x 2 identity matrix
	const double ad[2*2] = { 0,  1,  0,  0 };   // creation operator
	const double a [2*2] = { 0,  0,  1,  0 };   // annihilation operator
	const double F [2*2] = { 1,  0,  0, -1 };   // Jordan-Wigner "F" operator (same as sigma_z)

	double adI[4*4] = { 0 };        KroneckerProductRealSquare(2, ad, id, adI);
	double a_I[4*4] = { 0 };        KroneckerProductRealSquare(2, a,  id, a_I);
	double Iad[4*4] = { 0 };        KroneckerProductRealSquare(2, id, ad, Iad);
	double I_a[4*4] = { 0 };        KroneckerProductRealSquare(2, id, a,  I_a);

	double adF[4*4] = { 0 };        KroneckerProductRealSquare(2, ad, F,  adF);
	double a_F[4*4] = { 0 };        KroneckerProductRealSquare(2, a,  F,  a_F);
	double Fad[4*4] = { 0 };        KroneckerProductRealSquare(2, F,  ad, Fad);
	double F_a[4*4] = { 0 };        KroneckerProductRealSquare(2, F,  a,  F_a);

	double adFa_I[16*16] = { 0 };   KroneckerProductRealSquare(4, adF, a_I, adFa_I);
	double a_FadI[16*16] = { 0 };   KroneckerProductRealSquare(4, a_F, adI, a_FadI);
	double IadF_a[16*16] = { 0 };   KroneckerProductRealSquare(4, Iad, F_a, IadF_a);
	double I_aFad[16*16] = { 0 };   KroneckerProductRealSquare(4, I_a, Fad, I_aFad);

	// dummy virtual bonds
	const size_t dim[4] = { 16, 16, 1, 1 };
	AllocateTensor(4, dim, Jc);
	AllocateTensor(4, dim, Js);

	size_t i, j;
	for (j = 0; j < 16; j++)
	{
		for (i = 0; i < 16; i++)
		{
			// factor 't' from commutator with Hamiltonian

			Jc->data[i + j*16].real = 0;
			Jc->data[i + j*16].imag = t * (- adFa_I[i + j*16] + a_FadI[i + j*16] - IadF_a[i + j*16] + I_aFad[i + j*16]);

			Js->data[i + j*16].real = 0;
			Js->data[i + j*16].imag = t * (- adFa_I[i + j*16] + a_FadI[i + j*16] + IadF_a[i + j*16] - I_aFad[i + j*16]);
		}
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Current operator type: charge or spin
///
typedef enum
{
	CHARGE_CURRENT = 0,
	SPIN_CURRENT   = 1,
}
current_type_t;


//________________________________________________________________________________________________________________________
//


int main(int argc, char *argv[])
{
	int i;
	size_t j;

	if (argc != 7)
	{
		duprintf("Syntax: %s <param filename> <rho_beta path> charge/spin <jA> <jB> <output path>\n", argv[0]);
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
	makedir(argv[6]);

	// open simulation log file for writing
	char filename[2048];
	sprintf(filename, "%s/simulation.log", argv[6]);
	fd_log = fopen(filename, "w");
	if (fd_log == NULL)
	{
		duprintf("Cannot open log file '%s', exiting...\n", filename);
		return -3;
	}

	current_type_t current_type;
	if (strcmp(argv[3], "charge") == 0)
	{
		current_type = CHARGE_CURRENT;
	}
	else if (strcmp(argv[3], "spin") == 0)
	{
		current_type = SPIN_CURRENT;
	}
	else
	{
		duprintf("Unknown current type \"%s\", must be either \"charge\" or \"spin\", exiting...\n", argv[3]);
		return -4;
	}

	// sites (j,j+1) of local current operators
	const int jA = atoi(argv[4]);
	const int jB = atoi(argv[5]);
	if (jA < 0 || jA >= params.L - 1)
	{
		duprintf("'jA = %i' out of range, must be between 0 and L-2, exiting...\n", jA);
		return -4;
	}
	if (jB < 0 || jB >= params.L - 1)
	{
		duprintf("'jB = %i' out of range, must be between 0 and L-2, exiting...\n", jB);
		return -4;
	}

	duprintf("Computing %s current correlations for the Fermi-Hubbard model on a chain with parameters:\n", argv[3]);
	duprintf("            lattice size L: %i\n", params.L);
	duprintf("         kinetic hopping t: %g\n", params.t);
	duprintf("                 Hubbard U: %g\n", params.U);
	duprintf("     chemical potential mu: %g\n", params.mu);
	duprintf("  inverse temperature beta: %g\n", params.beta);
	duprintf("   largest simulation time: %g\n", params.tmax);
	duprintf("                 time step: %g\n", params.dt);
	duprintf("             MPO tolerance: %g\n", params.tol);
	duprintf("max virtual bond dimension: %zu\n", params.maxD);
	duprintf("               renormalize: %s\n", params.renormalize ? "true" : "false");
	duprintf("     'J_{jA,jA+1}' site jA: %i\n", jA);
	duprintf("     'J_{jB,jB+1}' site jB: %i\n", jB);
	duprintf("           MKL max threads: %i\n", MKL_Get_Max_Threads());
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

	// physical quantum numbers
	const qnumber_t qd[4] = { 0, 1, 1, 2 };

	// local current operator
	tensor_t J;
	{
		if (current_type == CHARGE_CURRENT)
		{
			tensor_t Js;
			ConstructLocalCurrentOperators(params.t, &J, &Js);
			DeleteTensor(&Js);
		}
		else if (current_type == SPIN_CURRENT)
		{
			tensor_t Jc;
			ConstructLocalCurrentOperators(params.t, &Jc, &J);
			DeleteTensor(&Jc);
		}
		else
		{
			assert(false);
		}
	}

	// load MPO representation of exp(-\beta H/2) from disk
	mpo_t rho_beta;
	duprintf("Loading rho_beta from directory '%s'...\n", argv[2]);
	{
		// read virtual bond dimensions from disk
		size_t *D = (size_t *)MKL_malloc((L + 1)*sizeof(size_t), MEM_DATA_ALIGN);
		sprintf(filename, "%s/fermi_hubbard_L%i_beta%g_D.dat", argv[2], L, params.beta);
		status = ReadData(filename, D, sizeof(size_t), L + 1);
		if (status < 0)
		{
			duprintf("Error reading virtual bond dimension of rho_beta from directory '%s', exiting...\n", argv[2]);
			return -3;
		}

		const size_t dim[2] = { 4, 4 };
		AllocateMPO(L, dim, D, &rho_beta);
		memcpy(rho_beta.qd[0], qd, 4*sizeof(qnumber_t));
		memcpy(rho_beta.qd[1], qd, 4*sizeof(qnumber_t));

		for (i = 0; i < L; i++)
		{
			sprintf(filename, "%s/fermi_hubbard_L%i_beta%g_A%i.dat", argv[2], L, params.beta, i);
			status = ReadData(filename, rho_beta.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&rho_beta.A[i]));
			if (status < 0)
			{
				duprintf("Error reading %i-th MPO tensor of rho_beta from directory '%s', exiting...\n", i, argv[2]);
				return -3;
			}
		}
		for (i = 0; i < L + 1; i++)
		{
			sprintf(filename, "%s/fermi_hubbard_L%i_beta%g_qD%i.dat", argv[2], L, params.beta, i);
			status = ReadData(filename, rho_beta.qD[i], sizeof(qnumber_t), D[i]);
			if (status < 0)
			{
				duprintf("Error reading %i-th bond quantum numbers of rho_beta from directory '%s', exiting...\n", i, argv[2]);
				return -3;
			}
		}

		MKL_free(D);
	}

	// record Frobenius norm of rho_beta
	const double norm_rho = MPOFrobeniusNorm(&rho_beta);
	duprintf("Frobenius norm of rho_beta: %g, distance to 1: %g\n", norm_rho, fabs(norm_rho - 1));

	// construct two-site Fermi-Hubbard Hamiltonian operators
	double **h = (double **)MKL_malloc((L - 1)*sizeof(double *), MEM_DATA_ALIGN);
	ConstructLocalFermiHubbardOperators(L, params.t, params.U, params.mu, h);

	// start timer
	const clock_t t_start = clock();

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
	ComputeDynamicsDataPRK(L, idt, 4*4, (const double **)h, &dyn_time);

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
		sprintf(filename, "%s/fermi_hubbard_L%i_XA", argv[6], L); makedir(filename);
		sprintf(filename, "%s/fermi_hubbard_L%i_XB", argv[6], L); makedir(filename);

		// try to open 'n_step' file if it exists, to continue simulation after previous checkpoint
		duprintf("Trying to read 'n_step' file...\n");
		sprintf(filename, "%s/fermi_hubbard_L%i_n_step.dat", argv[6], L);
		status = ReadData(filename, &nstart, sizeof(int), 1);
		if (status == 0 && (nstart > 0 && nstart < nsteps))
		{
			duprintf("Continuing simulation after time step %i...\n", nstart);

			// read intermediate results to disk
			sprintf(filename, "%s/fermi_hubbard_L%i_chi_tmp.dat",       argv[6], L); status = ReadData(filename, chi,       sizeof(MKL_Complex16), nstart + 1);     if (status < 0) { return status; }
			sprintf(filename, "%s/fermi_hubbard_L%i_chiA_tmp.dat",      argv[6], L); status = ReadData(filename, chiA,      sizeof(MKL_Complex16), nstart + 1);     if (status < 0) { return status; }
			sprintf(filename, "%s/fermi_hubbard_L%i_chiB_tmp.dat",      argv[6], L); status = ReadData(filename, chiB,      sizeof(MKL_Complex16), nstart + 1);     if (status < 0) { return status; }
			sprintf(filename, "%s/fermi_hubbard_L%i_DXA_tmp.dat",       argv[6], L); status = ReadData(filename, D_XA,      sizeof(size_t), (nstart + 1)*(L + 1));  if (status < 0) { return status; }
			sprintf(filename, "%s/fermi_hubbard_L%i_DXB_tmp.dat",       argv[6], L); status = ReadData(filename, D_XB,      sizeof(size_t), (nstart + 1)*(L + 1));  if (status < 0) { return status; }
			sprintf(filename, "%s/fermi_hubbard_L%i_tol_eff_A_tmp.dat", argv[6], L); status = ReadData(filename, tol_eff_A, sizeof(double),  nstart     *(L - 1));  if (status < 0) { return status; }
			sprintf(filename, "%s/fermi_hubbard_L%i_tol_eff_B_tmp.dat", argv[6], L); status = ReadData(filename, tol_eff_B, sizeof(double),  nstart     *(L - 1));  if (status < 0) { return status; }

			// re-allocate and fill MPOs
			DeleteMPO(&XB);
			DeleteMPO(&XA);
			const size_t dim[2] = { 4, 4 };
			AllocateMPO(L, dim, &D_XA[nstart*(L + 1)], &XA);
			AllocateMPO(L, dim, &D_XB[nstart*(L + 1)], &XB);
			// copy physical quantum numbers
			memcpy(XA.qd[0], qd, 4*sizeof(qnumber_t));
			memcpy(XA.qd[1], qd, 4*sizeof(qnumber_t));
			memcpy(XB.qd[0], qd, 4*sizeof(qnumber_t));
			memcpy(XB.qd[1], qd, 4*sizeof(qnumber_t));
			// read tensor data from disk
			for (i = 0; i < L; i++)
			{
				sprintf(filename, "%s/fermi_hubbard_L%i_XA/A%i.dat", argv[6], L, i); status = ReadData(filename, XA.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XA.A[i]));  if (status < 0) { return status; }
				sprintf(filename, "%s/fermi_hubbard_L%i_XB/A%i.dat", argv[6], L, i); status = ReadData(filename, XB.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XB.A[i]));  if (status < 0) { return status; }
			}
			// read virtual bond quantum numbers from disk
			for (i = 0; i < L + 1; i++)
			{
				sprintf(filename, "%s/fermi_hubbard_L%i_XA/qD%i.dat", argv[6], L, i); status = ReadData(filename, XA.qD[i], sizeof(qnumber_t), D_XA[i + nstart*(L + 1)]);  if (status < 0) { return status; }
				sprintf(filename, "%s/fermi_hubbard_L%i_XB/qD%i.dat", argv[6], L, i); status = ReadData(filename, XB.qD[i], sizeof(qnumber_t), D_XB[i + nstart*(L + 1)]);  if (status < 0) { return status; }
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
		sprintf(filename, "%s/fermi_hubbard_L%i_chi_tmp.dat",  argv[6], L); WriteData(filename, &chi [n], sizeof(MKL_Complex16), 1, true);
		sprintf(filename, "%s/fermi_hubbard_L%i_chiA_tmp.dat", argv[6], L); WriteData(filename, &chiA[n], sizeof(MKL_Complex16), 1, true);
		sprintf(filename, "%s/fermi_hubbard_L%i_chiB_tmp.dat", argv[6], L); WriteData(filename, &chiB[n], sizeof(MKL_Complex16), 1, true);
		sprintf(filename, "%s/fermi_hubbard_L%i_DXA_tmp.dat",  argv[6], L); WriteData(filename, &D_XA[n*(L + 1)], sizeof(size_t), L + 1, true);
		sprintf(filename, "%s/fermi_hubbard_L%i_DXB_tmp.dat",  argv[6], L); WriteData(filename, &D_XB[n*(L + 1)], sizeof(size_t), L + 1, true);
		if (n > 0) {
			sprintf(filename, "%s/fermi_hubbard_L%i_tol_eff_A_tmp.dat", argv[6], L); WriteData(filename, &tol_eff_A[(n - 1)*(L - 1)], sizeof(double), L - 1, true);
			sprintf(filename, "%s/fermi_hubbard_L%i_tol_eff_B_tmp.dat", argv[6], L); WriteData(filename, &tol_eff_B[(n - 1)*(L - 1)], sizeof(double), L - 1, true);
		}
		if (params.save_tensors)
		{
			// save tensor data to disk
			for (i = 0; i < L; i++)
			{
				sprintf(filename, "%s/fermi_hubbard_L%i_XA/A%i.dat", argv[6], L, i); WriteData(filename, XA.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XA.A[i]), false);
				sprintf(filename, "%s/fermi_hubbard_L%i_XB/A%i.dat", argv[6], L, i); WriteData(filename, XB.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XB.A[i]), false);
			}

			// save virtual bond quantum numbers to disk
			for (i = 0; i < L + 1; i++)
			{
				sprintf(filename, "%s/fermi_hubbard_L%i_XA/qD%i.dat", argv[6], L, i); status = WriteData(filename, XA.qD[i], sizeof(qnumber_t), D_XA[i + n*(L + 1)], false);
				sprintf(filename, "%s/fermi_hubbard_L%i_XB/qD%i.dat", argv[6], L, i); status = WriteData(filename, XB.qD[i], sizeof(qnumber_t), D_XB[i + n*(L + 1)], false);
			}
		}

		// record completed step
		sprintf(filename, "%s/fermi_hubbard_L%i_n_step.dat", argv[6], L); WriteData(filename, &n, sizeof(int), 1, false);

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
	int nbuffers;
	MKL_INT64 nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	duprintf("MKL memory usage: currently %lld bytes in %d buffer(s)\n", nbytes_alloc, nbuffers);
	duprintf("                       peak %lld bytes\n", MKL_Peak_Mem_Usage(MKL_PEAK_MEM));

	// save results to disk
	sprintf(filename, "%s/fermi_hubbard_L%i_chi.dat",       argv[6], L); WriteData(filename, chi,  sizeof(MKL_Complex16), nsteps + 1, false);
	sprintf(filename, "%s/fermi_hubbard_L%i_chiA.dat",      argv[6], L); WriteData(filename, chiA, sizeof(MKL_Complex16), nsteps + 1, false);
	sprintf(filename, "%s/fermi_hubbard_L%i_chiB.dat",      argv[6], L); WriteData(filename, chiB, sizeof(MKL_Complex16), nsteps + 1, false);
	sprintf(filename, "%s/fermi_hubbard_L%i_tol_eff_A.dat", argv[6], L); WriteData(filename, tol_eff_A, sizeof(double), nsteps*(L - 1), false);
	sprintf(filename, "%s/fermi_hubbard_L%i_tol_eff_B.dat", argv[6], L); WriteData(filename, tol_eff_B, sizeof(double), nsteps*(L - 1), false);
	sprintf(filename, "%s/fermi_hubbard_L%i_DXA.dat",       argv[6], L); WriteData(filename, D_XA, sizeof(size_t), (nsteps + 1)*(L + 1), false);
	sprintf(filename, "%s/fermi_hubbard_L%i_DXB.dat",       argv[6], L); WriteData(filename, D_XB, sizeof(size_t), (nsteps + 1)*(L + 1), false);

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
	DeleteLocalHamiltonianOperators(L, h);
	MKL_free(h);
	DeleteMPO(&rho_beta);
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
