/// \file operation.c
/// \brief Operations between matrix product states and operators

#include "operation.h"


//________________________________________________________________________________________________________________________
///
/// \brief Compute the expectation value <psi | op | psi>
///
MKL_Complex16 OperatorAverage(const mps_t *restrict psi, const mpo_t *restrict op)
{
	const int L = psi->L;
	assert(L == op->L);

	tensor_t t;

	// initialize 't' by identity matrix
	assert(psi->A[L-1].ndim == 3);
	assert( op->A[L-1].ndim == 4);
	assert( op->A[L-1].dim[3] == 1);
	const size_t t_dim[3] = { psi->A[L-1].dim[2], 1, psi->A[L-1].dim[2] };
	AllocateTensor(3, t_dim, &t);
	size_t j;
	for (j = 0; j < psi->A[L-1].dim[2]; j++)
	{
		t.data[j + j*psi->A[L-1].dim[2]].real = 1;
	}

	int i;
	for (i = L-1; i >= 0; i--)
	{
		tensor_t tnext;
		ContractionOperatorStepRight(&psi->A[i], &op->A[i], &t, &tnext);
		DeleteTensor(&t);
		MoveTensorData(&tnext, &t);
	}

	// 't' should now be a 1x1x1 tensor
	assert(t.ndim == 3);
	assert(t.dim[0] == 1 && t.dim[1] == 1 && t.dim[2] == 1);

	const MKL_Complex16 avr = t.data[0];

	DeleteTensor(&t);

	return avr;
}


//________________________________________________________________________________________________________________________
///
/// \brief Compute all partial contractions from the left; BL must point to an array of (uninitialized) tensors of length L at input
///
void ComputeLeftOperatorBlocks(const mps_t *restrict psi, const mpo_t *restrict op, tensor_t *restrict BL)
{
	const int L = psi->L;
	assert(L == op->L);

	// initialize leftmost block by identity matrix
	assert(psi->A[0].ndim == 3);
	assert( op->A[0].ndim == 4);
	assert( op->A[0].dim[2] == 1);
	const size_t t_dim[3] = { psi->A[0].dim[1], 1, psi->A[0].dim[1] };
	AllocateTensor(3, t_dim, &BL[0]);
	size_t j;
	for (j = 0; j < psi->A[0].dim[1]; j++)
	{
		BL[0].data[j + j*psi->A[0].dim[1]].real = 1;
	}

	int i;
	for (i = 0; i < L-1; i++)
	{
		ContractionOperatorStepLeft(&psi->A[i], &op->A[i], &BL[i], &BL[i+1]);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Compute all partial contractions from the right; BR must point to an array of (uninitialized) tensors of length L at input
///
void ComputeRightOperatorBlocks(const mps_t *restrict psi, const mpo_t *restrict op, tensor_t *restrict BR)
{
	const int L = psi->L;
	assert(L == op->L);

	// initialize rightmost block by identity matrix
	assert(psi->A[L-1].ndim == 3);
	assert( op->A[L-1].ndim == 4);
	assert( op->A[L-1].dim[3] == 1);
	const size_t t_dim[3] = { psi->A[L-1].dim[2], 1, psi->A[L-1].dim[2] };
	AllocateTensor(3, t_dim, &BR[L-1]);
	size_t j;
	for (j = 0; j < psi->A[L-1].dim[2]; j++)
	{
		BR[L-1].data[j + j*psi->A[L-1].dim[2]].real = 1;
	}

	int i;
	for (i = L-1; i > 0; i--)
	{
		ContractionOperatorStepRight(&psi->A[i], &op->A[i], &BR[i], &BR[i-1]);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Apply site-local Hamiltonian operator required for variational energy minimization
///
/// To-be contracted tensor network:
///
///  ______                           ______
///        \                         /
///       2|---                   ---|2
///        |                         |
///        |                         |
///        |                         |
///        |          __|__          |
///        |         /  0  \         |
///   L   1|---   ---|2 W 3|---   ---|1   R
///        |         \__1__/         |
///        |            |            |
///        |                         |
///        |          __|__          |
///        |         /  0  \         |
///       0|---   ---|1 M 2|---   ---|0
///  ______/         \_____/         \______
///
///
void ApplyLocalHamiltonian(const tensor_t *restrict L, const tensor_t *restrict R, const tensor_t *restrict W, const tensor_t *restrict M, tensor_t *restrict HM)
{
	assert(L->ndim == 3);
	assert(R->ndim == 3);
	assert(W->ndim == 4);
	assert(M->ndim == 3);

	tensor_t r, s, t;

	// multiply 'M' with 'R' tensor
	{
		MultiplyTensor(M, R, 1, &t);
	}

	// multiply with 'W' tensor
	{
		// interchange levels 1 <-> 2 in W and t
		const int perm12[4] = { 0, 2, 1, 3 };
		TransposeTensor(perm12, W, &s);
		TransposeTensor(perm12, &t, &r);
		DeleteTensor(&t);
		// perform multiplication and store result in 't'
		MultiplyTensor(&s, &r, 2, &t);
		DeleteTensor(&r);
		DeleteTensor(&s);
	}

	// multiply 't' and 'L' tensors
	{
		// interchange levels 1 <-> 3 in t
		const int perm13[4] = { 0, 3, 2, 1 };
		TransposeTensor(perm13, &t, &s);
		DeleteTensor(&t);
		// perform multiplication and store result in 't'
		MultiplyTensor(&s, L, 2, &t);
		DeleteTensor(&s);
		// interchange levels 1 <-> 2 in t
		assert(t.ndim == 3);
		const int perm12[3] = { 0, 2, 1 };
		TransposeTensor(perm12, &t, HM);
		DeleteTensor(&t);
	}
}
