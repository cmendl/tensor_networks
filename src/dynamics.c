/// \file dynamics.c
/// \brief Time evolution (real and imaginary) of matrix product operators

#include "dynamics.h"
#include "complex.h"
#include "util.h"


//________________________________________________________________________________________________________________________
///
/// \brief Allocate memory for evolution dynamics data
///
void AllocateDynamicsData(const int L, const int m, const MKL_Complex16 dt, dynamics_data_t *dyn)
{
	assert(L > 1);
	assert(m > 0);

	dyn->L = L;
	dyn->m = m;
	dyn->dt = dt;

	// allocate memory for array; individual tensors must be allocated separately
	dyn->exp_h = algn_calloc((L - 1)*m, sizeof(tensor_t));
}


//________________________________________________________________________________________________________________________
///
/// \brief Delete evolution dynamics data (free memory)
///
void DeleteDynamicsData(dynamics_data_t *dyn)
{
	int i;
	for (i = 0; i < (dyn->L - 1)*dyn->m; i++)
	{
		DeleteTensor(&dyn->exp_h[i]);
	}
	algn_free(dyn->exp_h);

	dyn->m = 0;
	dyn->L = 0;
}


//________________________________________________________________________________________________________________________
///
/// \brief Apply two-site operators 'opT' from the top and 'opB' from the bottom to even or odd bonds only, and orthonormalize complementary bonds;
/// 'opT' and 'opB' must point to arrays of length 'L - 1' (ignored if NULL pointers)
///
static void EvenOddUpdate(const tensor_t *restrict opT, const tensor_t *restrict opB, const int parity, const sweep_dir_t direction, const bond_op_params_t *restrict params, mpo_t *restrict mpo, double *restrict tol_eff)
{
	int istart, istop, iinc;
	svd_distr_t distr;
	if (direction == SWEEP_LEFT_TO_RIGHT)
	{
		istart = 0;
		istop  = mpo->L - 1;
		iinc   = 1;
		distr  = SVD_DISTR_RIGHT;
	}
	else if (direction == SWEEP_RIGHT_TO_LEFT)
	{
		istart = mpo->L - 2;
		istop  = -1;
		iinc   = -1;
		distr  = SVD_DISTR_LEFT;
	}
	else
	{
		// invalid direction
		assert(false);
	}

	int i;
	for (i = istart; i != istop; i += iinc)
	{
		trunc_info_t ti;
		if (((i - parity) & 1) == 0)
		{
			tensor_t A;
			MergeMPOTensorPair(&mpo->A[i], &mpo->A[i+1], &A);
			DeleteTensor(&mpo->A[i]);
			DeleteTensor(&mpo->A[i+1]);
			algn_free(mpo->qD[i+1]);

			if (opT != NULL)
			{
				tensor_t M;
				MoveTensorData(&A, &M);
				ComposeMPOTensors(&opT[i], &M, &A);
				DeleteTensor(&M);
			}

			if (opB != NULL)
			{
				tensor_t M;
				MoveTensorData(&A, &M);
				ComposeMPOTensors(&M, &opB[i], &A);
				DeleteTensor(&M);
			}

			ti = SplitMPOTensor(&A, mpo->qD[i], mpo->qD[i+2], mpo->d[0], mpo->d[0], mpo->qd[0], mpo->qd[0], distr, params, &mpo->A[i], &mpo->A[i+1], &mpo->qD[i+1]);
			DeleteTensor(&A);
		}
		else
		{
			qnumber_t *qDi1_new;
			ti = CompressMPOTensors(&mpo->A[i], &mpo->A[i+1], mpo->qD[i], mpo->qD[i+1], mpo->qD[i+2], mpo->qd[0], mpo->qd[0], distr, params, &qDi1_new);
			algn_free(mpo->qD[i+1]);
			mpo->qD[i+1] = qDi1_new;
		}
		tol_eff[i] = fmax(tol_eff[i], ti.tol_eff);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Apply two-site operators 'opT' from the top and 'opB' from the bottom; 'opT' and 'opB' must point to arrays of length 'L - 1'
///
static double LatticeTwoSiteSweep(const tensor_t *restrict opT, const tensor_t *restrict opB, const sweep_dir_t direction, const bond_op_params_t *restrict params, mpo_t *restrict mpo, double *restrict tol_eff)
{
	assert(mpo->d[0] == mpo->d[1]);

	double nsigma = 0;

	int istart, istop, iinc;
	svd_distr_t distr;
	if (direction == SWEEP_LEFT_TO_RIGHT)
	{
		istart = 0;
		istop  = mpo->L - 1;
		iinc   = 1;
		distr  = SVD_DISTR_RIGHT;
	}
	else if (direction == SWEEP_RIGHT_TO_LEFT)
	{
		istart = mpo->L - 2;
		istop  = -1;
		iinc   = -1;
		distr  = SVD_DISTR_LEFT;
	}
	else
	{
		// invalid direction
		assert(false);
	}

	int i;
	for (i = istart; i != istop; i += iinc)
	{
		tensor_t A;
		MergeMPOTensorPair(&mpo->A[i], &mpo->A[i+1], &A);
		DeleteTensor(&mpo->A[i]);
		DeleteTensor(&mpo->A[i+1]);
		algn_free(mpo->qD[i+1]);

		if (opT != NULL)
		{
			tensor_t M;
			MoveTensorData(&A, &M);
			ComposeMPOTensors(&opT[i], &M, &A);
			DeleteTensor(&M);
		}

		if (opB != NULL)
		{
			tensor_t M;
			MoveTensorData(&A, &M);
			ComposeMPOTensors(&M, &opB[i], &A);
			DeleteTensor(&M);
		}

		trunc_info_t ti = SplitMPOTensor(&A, mpo->qD[i], mpo->qD[i+2], mpo->d[0], mpo->d[0], mpo->qd[0], mpo->qd[0], distr, params, &mpo->A[i], &mpo->A[i+1], &mpo->qD[i+1]);
		DeleteTensor(&A);

		nsigma = ti.nsigma;
		tol_eff[i] = fmax(tol_eff[i], ti.tol_eff);
	}

	return nsigma;
}


//________________________________________________________________________________________________________________________
///
/// \brief Compute the evolution dynamics data required for Strang splitting evolution
///
void ComputeDynamicsDataStrang(const int L, const MKL_Complex16 dt, const size_t d2, const double **h, dynamics_data_t *restrict dyn)
{
	int i, j;
	assert(d2 > 0);

	AllocateDynamicsData(L, 4, dt, dyn);

	// dummy virtual bonds
	const size_t dim[4] = { d2, d2, 1, 1 };

	// four versions
	const MKL_Complex16 dt_steps[4] = { dt, ComplexScale(0.5, dt), ComplexScale(-1, dt), ComplexScale(-0.5, dt) };

	for (j = 0; j < 4; j++)
	{
		for (i = 0; i < L - 1; i++)
		{
			AllocateTensor(4, dim, &dyn->exp_h[i + j*(L - 1)]);
			MatrixExp(d2, dt_steps[j], h[i], dyn->exp_h[i + j*(L - 1)].data);
		}
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Perform a Strang splitting evolution
///
/// Reference:
///     Steven R. White and Adrian E. Feiguin
///     Real-time evolution using the density matrix renormalization group
///     Phys. Rev. Lett. 93, 076401 (2004)
///
void EvolveMPOStrang(const dynamics_data_t *restrict dyn, const int nsteps, const bond_op_params_t *restrict params, const bool normalize, mpo_t *restrict mpo, double *restrict tol_eff)
{
	const int L = mpo->L;

	assert(dyn->L == L);
	assert(dyn->m == 4);
	assert(mpo->d[0] == mpo->d[1]);

	int n;
	for (n = 0; n < nsteps; n++)
	{
		                LatticeTwoSiteSweep(&dyn->exp_h[L-1], NULL, SWEEP_LEFT_TO_RIGHT, params, mpo, &tol_eff[n*(L-1)]);
		double nsigma = LatticeTwoSiteSweep(&dyn->exp_h[L-1], NULL, SWEEP_RIGHT_TO_LEFT, params, mpo, &tol_eff[n*(L-1)]);

		if (normalize)
		{
			assert(nsigma > 0);
			MKL_Complex16 alpha = { 1/nsigma, 0 };
			cblas_zscal(NumTensorElements(&mpo->A[0]), &alpha, mpo->A[0].data, 1);
		}
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Perform a Strang splitting Liouville evolution of the form exp(-i t H) X exp(i t H) with X the MPO
///
/// Reference:
///     Steven R. White and Adrian E. Feiguin
///     Real-time evolution using the density matrix renormalization group
///     Phys. Rev. Lett. 93, 076401 (2004)
///
void EvolveLiouvilleMPOStrang(const dynamics_data_t *restrict dyn, const int nsteps, const bond_op_params_t *restrict params, const bool normalize, mpo_t *restrict mpo, double *restrict tol_eff)
{
	const int L = mpo->L;

	assert(dyn->L == L);
	assert(dyn->m == 4);
	assert(mpo->d[0] == mpo->d[1]);

	int n;
	for (n = 0; n < nsteps; n++)
	{
		                LatticeTwoSiteSweep(&dyn->exp_h[L-1], &dyn->exp_h[3*(L-1)], SWEEP_LEFT_TO_RIGHT, params, mpo, &tol_eff[n*(L-1)]);
		double nsigma = LatticeTwoSiteSweep(&dyn->exp_h[L-1], &dyn->exp_h[3*(L-1)], SWEEP_RIGHT_TO_LEFT, params, mpo, &tol_eff[n*(L-1)]);

		if (normalize)
		{
			assert(nsigma > 0);
			MKL_Complex16 alpha = { 1/nsigma, 0 };
			cblas_zscal(NumTensorElements(&mpo->A[0]), &alpha, mpo->A[0].data, 1);
		}
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Compute the evolution dynamics data required for operator splitting
/// using a fourth-order partitioned Runge-Kutta (PRK) method
///
/// Reference:
///     Sergio Blanes and Per C. Moan.
///     Practical symplectic partitioned Runge-Kutta and Runge-Kutta-Nystrom methods.
///     J. Comput. Appl. Math. 142, 313-330 (2002)
///
void ComputeDynamicsDataPRK(const int L, const MKL_Complex16 dt, const size_t d2, const double **h, dynamics_data_t *restrict dyn)
{
	int i, j;
	assert(d2 > 0);

	const double coeff_a[4] = {
		 0.0792036964311957,
		 0.353172906049774,
		-0.0420650803577195,
		 0.21937695575349958    // 1 - 2*(a[0] + a[1] + a[2])
	};

	const double coeff_b[3] = {
		 0.209515106613362,
		-0.143851773179818,
		 0.434336666566456      // 0.5 - (b[0] + b[1])
	};

	AllocateDynamicsData(L, 14, dt, dyn);

	// dummy virtual bonds
	const size_t dim[4] = { d2, d2, 1, 1 };

	// 'a' coefficients
	for (j = 0; j < 4; j++)
	{
		for (i = 0; i < L - 1; i++)
		{
			// a[j]*dt
			const MKL_Complex16 adt = { coeff_a[j]*dt.real, coeff_a[j]*dt.imag };
			AllocateTensor(4, dim,  &dyn->exp_h[i + (L-1)*2*j]);
			MatrixExp(d2, adt, h[i], dyn->exp_h[i + (L-1)*2*j].data);

			// -a[j]*dt
			const MKL_Complex16 nadt = { -coeff_a[j]*dt.real, -coeff_a[j]*dt.imag };
			AllocateTensor(4, dim,   &dyn->exp_h[i + (L-1)*(2*j+1)]);
			MatrixExp(d2, nadt, h[i], dyn->exp_h[i + (L-1)*(2*j+1)].data);
		}
	}

	// 'b' coefficients
	for (j = 0; j < 3; j++)
	{
		for (i = 0; i < L - 1; i++)
		{
			// b[j]*dt
			const MKL_Complex16 bdt = { coeff_b[j]*dt.real, coeff_b[j]*dt.imag };
			AllocateTensor(4, dim,  &dyn->exp_h[i + (L-1)*2*(j+4)]);
			MatrixExp(d2, bdt, h[i], dyn->exp_h[i + (L-1)*2*(j+4)].data);

			// -b[j]*dt
			const MKL_Complex16 nbdt = { -coeff_b[j]*dt.real, -coeff_b[j]*dt.imag };
			AllocateTensor(4, dim,   &dyn->exp_h[i + (L-1)*(2*(j+4)+1)]);
			MatrixExp(d2, nbdt, h[i], dyn->exp_h[i + (L-1)*(2*(j+4)+1)].data);
		}
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Perform a partitioned Runge-Kutta (PRK) splitting evolution of the form exp(-i t H) X with X the MPO
///
void EvolveMPOPRK(const dynamics_data_t *restrict dyn, const int nsteps, const bool forward, const bond_op_params_t *restrict params, mpo_t *restrict mpo, double *restrict tol_eff)
{
	const int L = mpo->L;

	assert(dyn->L == L);
	assert(dyn->m == 14);
	assert(mpo->d[0] == mpo->d[1]);

	// TODO: can combine first and last sub-step into one sub-step

	const int offset = (forward ? 0 : 1);

	int n;
	for (n = 0; n < nsteps; n++)
	{
		EvenOddUpdate(&dyn->exp_h[( 0+offset)*(L-1)], NULL, 0, SWEEP_LEFT_TO_RIGHT, params, mpo, &tol_eff[n*(L-1)]);    // a[0]
		EvenOddUpdate(&dyn->exp_h[( 8+offset)*(L-1)], NULL, 1, SWEEP_RIGHT_TO_LEFT, params, mpo, &tol_eff[n*(L-1)]);    // b[0]
		EvenOddUpdate(&dyn->exp_h[( 2+offset)*(L-1)], NULL, 0, SWEEP_LEFT_TO_RIGHT, params, mpo, &tol_eff[n*(L-1)]);    // a[1]
		EvenOddUpdate(&dyn->exp_h[(10+offset)*(L-1)], NULL, 1, SWEEP_RIGHT_TO_LEFT, params, mpo, &tol_eff[n*(L-1)]);    // b[1]
		EvenOddUpdate(&dyn->exp_h[( 4+offset)*(L-1)], NULL, 0, SWEEP_LEFT_TO_RIGHT, params, mpo, &tol_eff[n*(L-1)]);    // a[2]
		EvenOddUpdate(&dyn->exp_h[(12+offset)*(L-1)], NULL, 1, SWEEP_RIGHT_TO_LEFT, params, mpo, &tol_eff[n*(L-1)]);    // b[2]
		EvenOddUpdate(&dyn->exp_h[( 6+offset)*(L-1)], NULL, 0, SWEEP_LEFT_TO_RIGHT, params, mpo, &tol_eff[n*(L-1)]);    // a[3]
		EvenOddUpdate(&dyn->exp_h[(12+offset)*(L-1)], NULL, 1, SWEEP_RIGHT_TO_LEFT, params, mpo, &tol_eff[n*(L-1)]);    // b[2]
		EvenOddUpdate(&dyn->exp_h[( 4+offset)*(L-1)], NULL, 0, SWEEP_LEFT_TO_RIGHT, params, mpo, &tol_eff[n*(L-1)]);    // a[2]
		EvenOddUpdate(&dyn->exp_h[(10+offset)*(L-1)], NULL, 1, SWEEP_RIGHT_TO_LEFT, params, mpo, &tol_eff[n*(L-1)]);    // b[1]
		EvenOddUpdate(&dyn->exp_h[( 2+offset)*(L-1)], NULL, 0, SWEEP_LEFT_TO_RIGHT, params, mpo, &tol_eff[n*(L-1)]);    // a[1]
		EvenOddUpdate(&dyn->exp_h[( 8+offset)*(L-1)], NULL, 1, SWEEP_RIGHT_TO_LEFT, params, mpo, &tol_eff[n*(L-1)]);    // b[0]
		EvenOddUpdate(&dyn->exp_h[( 0+offset)*(L-1)], NULL, 0, SWEEP_LEFT_TO_RIGHT, params, mpo, &tol_eff[n*(L-1)]);    // a[0]
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Perform a partitioned Runge-Kutta (PRK) splitting Liouville evolution of the form exp(-i t H) X exp(i t H) with X the MPO
///
void EvolveLiouvilleMPOPRK(const dynamics_data_t *restrict dyn, const int nsteps, const bool forward, const bond_op_params_t *restrict params, mpo_t *restrict mpo, double *restrict tol_eff)
{
	const int L = mpo->L;

	assert(dyn->L == L);
	assert(dyn->m == 14);
	assert(mpo->d[0] == mpo->d[1]);

	// TODO: can combine first and last sub-step into one sub-step

	const int offsetF = (forward ? 0 : 1);
	const int offsetB = (forward ? 1 : 0);

	int n;
	for (n = 0; n < nsteps; n++)
	{
		EvenOddUpdate(&dyn->exp_h[( 0+offsetF)*(L-1)], &dyn->exp_h[( 0+offsetB)*(L-1)], 0, SWEEP_LEFT_TO_RIGHT, params, mpo, &tol_eff[n*(L-1)]);    // a[0]
		EvenOddUpdate(&dyn->exp_h[( 8+offsetF)*(L-1)], &dyn->exp_h[( 8+offsetB)*(L-1)], 1, SWEEP_RIGHT_TO_LEFT, params, mpo, &tol_eff[n*(L-1)]);    // b[0]
		EvenOddUpdate(&dyn->exp_h[( 2+offsetF)*(L-1)], &dyn->exp_h[( 2+offsetB)*(L-1)], 0, SWEEP_LEFT_TO_RIGHT, params, mpo, &tol_eff[n*(L-1)]);    // a[1]
		EvenOddUpdate(&dyn->exp_h[(10+offsetF)*(L-1)], &dyn->exp_h[(10+offsetB)*(L-1)], 1, SWEEP_RIGHT_TO_LEFT, params, mpo, &tol_eff[n*(L-1)]);    // b[1]
		EvenOddUpdate(&dyn->exp_h[( 4+offsetF)*(L-1)], &dyn->exp_h[( 4+offsetB)*(L-1)], 0, SWEEP_LEFT_TO_RIGHT, params, mpo, &tol_eff[n*(L-1)]);    // a[2]
		EvenOddUpdate(&dyn->exp_h[(12+offsetF)*(L-1)], &dyn->exp_h[(12+offsetB)*(L-1)], 1, SWEEP_RIGHT_TO_LEFT, params, mpo, &tol_eff[n*(L-1)]);    // b[2]
		EvenOddUpdate(&dyn->exp_h[( 6+offsetF)*(L-1)], &dyn->exp_h[( 6+offsetB)*(L-1)], 0, SWEEP_LEFT_TO_RIGHT, params, mpo, &tol_eff[n*(L-1)]);    // a[3]
		EvenOddUpdate(&dyn->exp_h[(12+offsetF)*(L-1)], &dyn->exp_h[(12+offsetB)*(L-1)], 1, SWEEP_RIGHT_TO_LEFT, params, mpo, &tol_eff[n*(L-1)]);    // b[2]
		EvenOddUpdate(&dyn->exp_h[( 4+offsetF)*(L-1)], &dyn->exp_h[( 4+offsetB)*(L-1)], 0, SWEEP_LEFT_TO_RIGHT, params, mpo, &tol_eff[n*(L-1)]);    // a[2]
		EvenOddUpdate(&dyn->exp_h[(10+offsetF)*(L-1)], &dyn->exp_h[(10+offsetB)*(L-1)], 1, SWEEP_RIGHT_TO_LEFT, params, mpo, &tol_eff[n*(L-1)]);    // b[1]
		EvenOddUpdate(&dyn->exp_h[( 2+offsetF)*(L-1)], &dyn->exp_h[( 2+offsetB)*(L-1)], 0, SWEEP_LEFT_TO_RIGHT, params, mpo, &tol_eff[n*(L-1)]);    // a[1]
		EvenOddUpdate(&dyn->exp_h[( 8+offsetF)*(L-1)], &dyn->exp_h[( 8+offsetB)*(L-1)], 1, SWEEP_RIGHT_TO_LEFT, params, mpo, &tol_eff[n*(L-1)]);    // b[0]
		EvenOddUpdate(&dyn->exp_h[( 0+offsetF)*(L-1)], &dyn->exp_h[( 0+offsetB)*(L-1)], 0, SWEEP_LEFT_TO_RIGHT, params, mpo, &tol_eff[n*(L-1)]);    // a[0]
	}
}
