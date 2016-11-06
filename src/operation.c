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
		ContractionOperatorStepRight(&psi->A[i], &op->A[i], &t);
	}

	// 't' should now be a 1x1x1 tensor
	assert(t.ndim == 3);
	assert(t.dim[0] == 1 && t.dim[1] == 1 && t.dim[2] == 1);

	const MKL_Complex16 avr = t.data[0];

	DeleteTensor(&t);

	return avr;
}
