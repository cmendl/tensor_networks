/// \file minimization.c
/// \brief Energy minimization and ground state computation

#include "minimization.h"
#include "operation.h"
#include "lanczos.h"
#include "util.h"
#include <stdlib.h>
#include <memory.h>


//________________________________________________________________________________________________________________________
///
/// \brief Container of Hamiltonian data for applying site-local Hamiltonian operator
///
typedef struct
{
	const tensor_t *L;      //!< left tensor network block
	const tensor_t *R;      //!< right tensor network block
	const tensor_t *W;      //!< local Hamiltonian operator
	size_t Mdim[3];         //!< dimensions of the 'M' tensor, which the Hamiltonian is applied to
}
local_hamiltonian_data_t;


//________________________________________________________________________________________________________________________
///
/// \brief Wrapper function for applying site-local Hamiltonian operator, required for Lanczos iteration
///
static void ApplyLocalHamiltonianWrapper(const size_t n, const void *restrict data, const double complex *restrict v, double complex *restrict ret)
{
	const local_hamiltonian_data_t *hdata = (local_hamiltonian_data_t *)data;

	// interpret input vector as MPS tensor entries
	tensor_t M;
	M.ndim = 3;
	M.dim  = (size_t *)hdata->Mdim;
	M.data = (double complex *)v;
	#ifdef _DEBUG
	string_t dnames[3] = { 0 };
	M.dnames = dnames;
	#endif
	assert(n == NumTensorElements(&M));

	tensor_t HM;
	ApplyLocalHamiltonian(hdata->L, hdata->R, hdata->W, &M, &HM);
	assert(n == NumTensorElements(&HM));
	memcpy(ret, HM.data, n*sizeof(double complex));

	DeleteTensor(&HM);
}


//________________________________________________________________________________________________________________________
///
/// \brief Minimize site-local energy by a Lanczos iteration; memory will be allocated for result 'M_opt'
///
void MinimizeLocalEnergy(const tensor_t *restrict L, const tensor_t *restrict R, const tensor_t *restrict W, const tensor_t *restrict M_start, double *restrict en_min, tensor_t *restrict M_opt)
{
	assert(M_start->ndim == 3);

	const int maxiter = 25;
	const int n = NumTensorElements(M_start);

	local_hamiltonian_data_t hdata;
	hdata.L = L;
	hdata.R = R;
	hdata.W = W;
	hdata.Mdim[0] = M_start->dim[0];
	hdata.Mdim[1] = M_start->dim[1];
	hdata.Mdim[2] = M_start->dim[2];

	AllocateTensor(M_start->ndim, M_start->dim, M_opt);

	LanczosIteration(n, ApplyLocalHamiltonianWrapper, &hdata, M_start->data, maxiter, en_min, M_opt->data);
}


//________________________________________________________________________________________________________________________
///
/// \brief Approximate the ground state MPS by left and right sweeps and local single-site optimizations;
/// virtual bond dimensions of starting state 'psi' can only decrease
///
/// Reference:
///     Ulrich Schollwock
///     The density-matrix renormalization group in the age of matrix product states
///     Annals of Physics 326, 96-192 (2011)
///
void CalculateGroundStateLocalSinglesite(const mpo_t *restrict H, const int maxiter, double *restrict en_min, mps_t *restrict psi)
{
	const int L = H->L;

	assert(psi->d == H->d[0]);
	assert(psi->d == H->d[1]);

	int i;

	// right-normalize input matrix product state
	for (i = L - 1; i > 0; i--)
	{
		MPSUnitaryRightProjection(&psi->A[i], &psi->A[i-1]);
	}
	// leftmost tensor
	{
		// dummy tensor at site "-1"
		tensor_t t;
		const size_t dim[3] = { 1, 1, 1 };
		AllocateTensor(3, dim, &t);
		t.data[0] = 1;

		MPSUnitaryRightProjection(&psi->A[0], &t);

		DeleteTensor(&t);
	}

	tensor_t *BL = (tensor_t *)algn_malloc(L * sizeof(tensor_t));
	tensor_t *BR = (tensor_t *)algn_malloc(L * sizeof(tensor_t));

	ComputeRightOperatorBlocks(psi, H, BR);

	// initialize left blocks by 1x1x1 identity (only leftmost block actually used)
	for (i = 0; i < L; i++)
	{
		const size_t dim[3] = { 1, 1, 1 };
		AllocateTensor(3, dim, &BL[i]);
		BL[i].data[0] = 1;
	}

	// TODO: number of iterations should be determined by tolerance and some convergence measure
	int n;
	for (n = 0; n < maxiter; n++)
	{
		double en;

		// sweep from left to right
		for (i = 0; i < L - 1; i++)
		{
			tensor_t A_opt;
			MinimizeLocalEnergy(&BL[i], &BR[i], &H->A[i], &psi->A[i], &en, &A_opt);
			assert(A_opt.ndim == 3);
			assert(psi->A[i].dim[0] == A_opt.dim[0] && psi->A[i].dim[1] == A_opt.dim[1] && psi->A[i].dim[2] == A_opt.dim[2]);
			DeleteTensor(&psi->A[i]);
			MoveTensorData(&A_opt, &psi->A[i]);

			MPSUnitaryLeftProjection(&psi->A[i], &psi->A[i+1]);

			// update the left blocks
			DeleteTensor(&BL[i+1]);
			ContractionOperatorStepLeft(&psi->A[i], &H->A[i], &BL[i], &BL[i+1]);
		}

		// sweep from right to left
		for (i = L - 1; i > 0; i--)
		{
			tensor_t A_opt;
			MinimizeLocalEnergy(&BL[i], &BR[i], &H->A[i], &psi->A[i], &en, &A_opt);
			assert(A_opt.ndim == 3);
			assert(psi->A[i].dim[0] == A_opt.dim[0] && psi->A[i].dim[1] == A_opt.dim[1] && psi->A[i].dim[2] == A_opt.dim[2]);
			DeleteTensor(&psi->A[i]);
			MoveTensorData(&A_opt, &psi->A[i]);

			MPSUnitaryRightProjection(&psi->A[i], &psi->A[i-1]);

			// update the right blocks
			DeleteTensor(&BR[i-1]);
			ContractionOperatorStepRight(&psi->A[i], &H->A[i], &BR[i], &BR[i-1]);
		}

		// right-normalize leftmost tensor to ensure that 'psi' is normalized
		{
			// dummy tensor at site "-1"
			tensor_t t;
			const size_t dim[3] = { 1, 1, 1 };
			AllocateTensor(3, dim, &t);
			t.data[0] = 1;

			MPSUnitaryRightProjection(&psi->A[0], &t);

			DeleteTensor(&t);
		}

		// record energy after each sweep
		en_min[n] = en;
	}

	// clean up
	for (i = 0; i < L; i++)
	{
		DeleteTensor(&BR[i]);
		DeleteTensor(&BL[i]);
	}
	algn_free(BR);
	algn_free(BL);
}


//________________________________________________________________________________________________________________________
///
/// \brief Approximate the ground state MPS by left and right sweeps and optimizing local two-site MPS tensors;
/// computationally more expensive than single-site optimizations but probably less prone to be stuck in local minima
///
/// Reference:
///     Ulrich Schollwock
///     The density-matrix renormalization group in the age of matrix product states
///     Annals of Physics 326, 96-192 (2011)
///
void CalculateGroundStateLocalTwosite(const mpo_t *restrict H, const int maxiter, const bond_op_params_t *restrict bond_op_params, double *restrict entropy, double *restrict en_min, mps_t *restrict psi)
{
	const int L = H->L;

	const size_t d = psi->d;
	assert(d == H->d[0]);
	assert(d == H->d[1]);

	// effectively disable quantum numbers for now by setting them to zero
	qnumber_t *qd = (qnumber_t *)algn_calloc(d, sizeof(qnumber_t));

	int i;

	// merge neighboring Hamiltonian MPO tensors
	tensor_t *W2 = (tensor_t *)algn_malloc((L-1)*sizeof(tensor_t));
	for (i = 0; i < L - 1; i++)
	{
		MergeMPOTensorPair(&H->A[i], &H->A[i+1], &W2[i]);
	}

	// right-normalize input matrix product state
	for (i = L - 1; i > 0; i--)
	{
		MPSUnitaryRightProjection(&psi->A[i], &psi->A[i-1]);
	}
	// leftmost tensor
	{
		// dummy tensor at site "-1"
		tensor_t t;
		const size_t dim[3] = { 1, 1, 1 };
		AllocateTensor(3, dim, &t);
		t.data[0] = 1;

		MPSUnitaryRightProjection(&psi->A[0], &t);

		DeleteTensor(&t);
	}

	tensor_t *BL = (tensor_t *)algn_malloc(L * sizeof(tensor_t));
	tensor_t *BR = (tensor_t *)algn_malloc(L * sizeof(tensor_t));

	ComputeRightOperatorBlocks(psi, H, BR);

	// initialize left blocks by 1x1x1 identity (only leftmost block actually used)
	for (i = 0; i < L; i++)
	{
		const size_t dim[3] = { 1, 1, 1 };
		AllocateTensor(3, dim, &BL[i]);
		BL[i].data[0] = 1;
	}

	// TODO: number of iterations should be determined by tolerance and some convergence measure
	int n;
	for (n = 0; n < maxiter; n++)
	{
		double en;

		// sweep from left to right
		for (i = 0; i < L - 1; i++)
		{
			// merge neighboring MPS tensors
			tensor_t A_cur;
			MergeMPSTensorPair(&psi->A[i], &psi->A[i+1], &A_cur);
			assert(A_cur.dim[0] == d*d);
			DeleteTensor(&psi->A[i]);
			DeleteTensor(&psi->A[i+1]);

			// minimize local two-site energy using merged tensor as starting point
			tensor_t A_opt;
			MinimizeLocalEnergy(&BL[i], &BR[i+1], &W2[i], &A_cur, &en, &A_opt);
			DeleteTensor(&A_cur);

			// split optimized two-site MPS tensor into two tensors
			assert(A_opt.ndim == 3);
			assert(A_opt.dim[0] == d*d);
			// set virtual bond quantum numbers to zero
			qnumber_t *qD0 = (qnumber_t *)algn_calloc(A_opt.dim[1], sizeof(qnumber_t));
			qnumber_t *qD2 = (qnumber_t *)algn_calloc(A_opt.dim[2], sizeof(qnumber_t));
			qnumber_t *qbond;
			SplitMPSTensor(&A_opt, qD0, qD2, d, d, qd, qd, SVD_DISTR_RIGHT, bond_op_params, &psi->A[i], &psi->A[i+1], &qbond);
			algn_free(qbond);
			algn_free(qD2);
			algn_free(qD0);
			DeleteTensor(&A_opt);

			// update the left blocks
			DeleteTensor(&BL[i+1]);
			ContractionOperatorStepLeft(&psi->A[i], &H->A[i], &BL[i], &BL[i+1]);
		}

		// sweep from right to left
		for (i = L - 1; i > 0; i--)
		{
			// merge neighboring MPS tensors
			tensor_t A_cur;
			MergeMPSTensorPair(&psi->A[i-1], &psi->A[i], &A_cur);
			assert(A_cur.dim[0] == d*d);
			DeleteTensor(&psi->A[i-1]);
			DeleteTensor(&psi->A[i]);

			// minimize local two-site energy using merged tensor as starting point
			tensor_t A_opt;
			MinimizeLocalEnergy(&BL[i-1], &BR[i], &W2[i-1], &A_cur, &en, &A_opt);
			DeleteTensor(&A_cur);

			// split optimized two-site MPS tensor into two tensors
			assert(A_opt.ndim == 3);
			assert(A_opt.dim[0] == d*d);
			// set virtual bond quantum numbers to zero
			qnumber_t *qD0 = (qnumber_t *)algn_calloc(A_opt.dim[1], sizeof(qnumber_t));
			qnumber_t *qD2 = (qnumber_t *)algn_calloc(A_opt.dim[2], sizeof(qnumber_t));
			qnumber_t *qbond;
			trunc_info_t ti = SplitMPSTensor(&A_opt, qD0, qD2, d, d, qd, qd, SVD_DISTR_LEFT, bond_op_params, &psi->A[i-1], &psi->A[i], &qbond);
			algn_free(qbond);
			algn_free(qD2);
			algn_free(qD0);
			DeleteTensor(&A_opt);

			entropy[i - 1] = ti.entropy;

			// update the right blocks
			DeleteTensor(&BR[i-1]);
			ContractionOperatorStepRight(&psi->A[i], &H->A[i], &BR[i], &BR[i-1]);
		}

		// right-normalize leftmost tensor to ensure that 'psi' is normalized
		{
			// dummy tensor at site "-1"
			tensor_t t;
			const size_t dim[3] = { 1, 1, 1 };
			AllocateTensor(3, dim, &t);
			t.data[0] = 1;

			MPSUnitaryRightProjection(&psi->A[0], &t);

			DeleteTensor(&t);
		}

		// record energy after each sweep
		en_min[n] = en;
	}

	// clean up
	for (i = 0; i < L - 1; i++)
	{
		DeleteTensor(&W2[i]);
	}
	algn_free(W2);
	for (i = 0; i < L; i++)
	{
		DeleteTensor(&BR[i]);
		DeleteTensor(&BL[i]);
	}
	algn_free(BR);
	algn_free(BL);

	algn_free(qd);
}
