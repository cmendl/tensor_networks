/// \file mps.c
/// \brief Matrix product state (MPS)

#include "mps.h"
#include "dupio.h"
#include <mkl.h>
#include <stdlib.h>
#include <memory.h>
#include <stdio.h>


//________________________________________________________________________________________________________________________
///
/// \brief Allocate memory for a matrix product state (MPS) with open boundary conditions
///
void AllocateMPS(const int L, const size_t d, const size_t *D, mps_t *restrict mps)
{
	mps->L = L;
	mps->d = d;

	assert(L >= 1);

	mps->A = (tensor_t *)MKL_calloc(L, sizeof(tensor_t), MEM_DATA_ALIGN);

	int i;
	for (i = 0; i < L; i++)
	{
		const size_t dim[3] = { d, D[i], D[i+1] };
		AllocateTensor(3, dim, &mps->A[i]);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Delete a matrix product state (free memory)
///
void DeleteMPS(mps_t *restrict mps)
{
	int i;
	for (i = 0; i < mps->L; i++)
	{
		DeleteTensor(&mps->A[i]);
	}
	MKL_free(mps->A);

	mps->d = 0;
	mps->L = 0;
}


//________________________________________________________________________________________________________________________
///
/// \brief Contraction step from left to right
///
void ContractionStepLeft(const tensor_t *restrict A, const tensor_t *restrict L, tensor_t *restrict Lnext)
{
	assert(A->ndim == 3);
	assert(L->ndim == 2);

	tensor_t t;

	// multiply by conjugated 'A' tensor
	{
		// interchange the first two levels of 'A' and complex-conjugate the entries
		tensor_t Astar;
		const int perm01[3] = { 1, 0, 2 };
		ConjugateTransposeTensor(perm01, A, &Astar);
		// perform multiplication
		MultiplyTensor(L, &Astar, 1, &t);
		// initial values stored in 'Astar' no longer required
		DeleteTensor(&Astar);
	}

	// multiply by 'A' tensor
	{
		// interchange the first and last level of 'A'
		tensor_t Atp;
		const int perm02[3] = { 2, 1, 0 };
		TransposeTensor(perm02, A, &Atp);
		// perform multiplication
		MultiplyTensor(&Atp, &t, 2, Lnext);
		DeleteTensor(&Atp);
		DeleteTensor(&t);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Contraction step from left to right, with a matrix product operator sandwiched in between
///
void ContractionOperatorStepLeft(const tensor_t *restrict A, const tensor_t *restrict W, const tensor_t *restrict L, tensor_t *restrict Lnext)
{
	assert(A->ndim == 3);
	assert(W->ndim == 4);
	assert(L->ndim == 3);

	tensor_t r, s, t;

	// multiply with conjugated 'A' tensor
	{
		// interchange the first two levels of 'A' and complex-conjugate the entries
		tensor_t Astar;
		const int perm01[3] = { 1, 0, 2 };
		ConjugateTransposeTensor(perm01, A, &Astar);
		// perform multiplication
		MultiplyTensor(L, &Astar, 1, &t);
		// initial values stored in 'Astar' no longer required
		DeleteTensor(&Astar);
	}

	// multiply with 'W' tensor
	{
		// interchange levels in 'W'
		const int perm012[4] = { 1, 2, 0, 3 };
		TransposeTensor(perm012, W, &s);
		// interchange levels in 't'
		const int perm123[4] = { 0, 2, 3, 1 };
		TransposeTensor(perm123, &t, &r);
		DeleteTensor(&t);
		// perform multiplication and store result in 't'
		MultiplyTensor(&r, &s, 2, &t);
		DeleteTensor(&r);
		DeleteTensor(&s);
	}

	// multiply with 'A' tensor
	{
		// interchange levels in 't'
		const int perm123[4] = { 0, 3, 1, 2 };
		TransposeTensor(perm123, &t, &r);
		DeleteTensor(&t);
		// interchange levels in 'A'
		const int perm02[3] = { 2, 1, 0 };
		TransposeTensor(perm02, A, &t);
		// perform multiplication
		MultiplyTensor(&t, &r, 2, Lnext);
		// tensors 't' and 'r' no longer required
		DeleteTensor(&t);
		DeleteTensor(&r);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Contraction step from right to left
///
void ContractionStepRight(const tensor_t *restrict A, const tensor_t *restrict R, tensor_t *restrict Rnext)
{
	assert(A->ndim == 3);
	assert(R->ndim == 2);

	tensor_t t, s;

	// multiply by 'A' tensor
	{
		MultiplyTensor(A, R, 1, &t);
	}

	// multiply by conjugated and transposed 'A' tensor
	{
		// interchange the last two levels of 'A' and complex-conjugate the entries
		tensor_t Astar;
		const int perm12[3] = { 0, 2, 1 };
		ConjugateTransposeTensor(perm12, A, &Astar);
		// interchange first two levels of 't' and store result in 's'
		const int perm01[3] = { 1, 0, 2 };
		TransposeTensor(perm01, &t, &s);
		DeleteTensor(&t);
		// perform multiplication
		MultiplyTensor(&s, &Astar, 2, Rnext);
		// tensors 'Astar' and 's' no longer required
		DeleteTensor(&Astar);
		DeleteTensor(&s);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Contraction step from right to left, with a matrix product operator sandwiched in between
///
void ContractionOperatorStepRight(const tensor_t *restrict A, const tensor_t *restrict W, const tensor_t *restrict R, tensor_t *restrict Rnext)
{
	assert(A->ndim == 3);
	assert(W->ndim == 4);
	assert(R->ndim == 3);

	tensor_t r, s, t;

	// multiply with 'A' tensor
	{
		MultiplyTensor(A, R, 1, &t);
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

	// multiply with conjugated 'A' tensor
	{
		// interchange last two levels of 'A' and conjugate entries
		tensor_t Astar;
		const int perm12[3] = { 0, 2, 1 };
		ConjugateTransposeTensor(perm12, A, &Astar);
		// interchange levels 0 <-> 2 in 't'
		const int perm02[4] = { 2, 1, 0, 3 };
		TransposeTensor(perm02, &t, &r);
		DeleteTensor(&t);
		// perform multiplication
		MultiplyTensor(&r, &Astar, 2, Rnext);
		// tensors 'Astar' and 'r' no longer required
		DeleteTensor(&Astar);
		DeleteTensor(&r);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Calculate the norm of a matrix product state (contract with conjugated version of itself)
///
double CalculateMPSNorm(const mps_t *restrict mps)
{
	const int L = mps->L;

	tensor_t t;

	// initialize 't' by identity matrix
	assert(mps->A[L-1].ndim == 3);
	const size_t t_dim[2] = { mps->A[L-1].dim[2], mps->A[L-1].dim[2] };
	AllocateTensor(2, t_dim, &t);
	IdentityTensor(&t);

	int i;
	for (i = L-1; i >= 0; i--)
	{
		tensor_t tnext;
		ContractionStepRight(&mps->A[i], &t, &tnext);
		DeleteTensor(&t);
		MoveTensorData(&tnext, &t);
	}

	// 't' should now be a 1x1 matrix
	assert(t.ndim == 2);
	assert(t.dim[0] == 1 && t.dim[1] == 1);

	// imaginary part should be zero up to numerical rounding errors
	const double norm = t.data[0].real;

	DeleteTensor(&t);

	return norm;
}


//________________________________________________________________________________________________________________________
///
/// \brief Unitarily project local site tensor 'A' using a Singular Value Decomposition A = U S V^H,
/// overwriting A by the 'U' matrix and distributing S V^H to the right neighboring tensor
///
void MPSUnitaryLeftProjection(tensor_t *restrict A, tensor_t *restrict Anext)
{
	assert(A->ndim == 3);
	assert(Anext->ndim == 3);

	int info;

	// combine physical dimension and first (leftwards) virtual dimension into one dimension
	const size_t m = A->dim[0] * A->dim[1];
	const size_t n = A->dim[2];
	const size_t k = (m <= n ? m : n);  // min(m, n)

	double *sigma = MKL_malloc(k * sizeof(double), MEM_DATA_ALIGN);
	double *superb = MKL_malloc((k - 1) * sizeof(double), MEM_DATA_ALIGN);
	tensor_t vt;
	const size_t dim_kn[2] = { k, n };
	AllocateTensor(2, dim_kn, &vt);
	// overwrite 'A' by the 'U' matrix
	info = LAPACKE_zgesvd(LAPACK_COL_MAJOR, 'O', 'S', (lapack_int)m, (lapack_int)n, A->data, (lapack_int)m, sigma, NULL, (lapack_int)m, vt.data, (lapack_int)k, superb);
	if (info != 0) {
		duprintf("Call of LAPACK function 'zgesvd()' in 'MPSUnitaryLeftProjection()' failed, return value: %i\n", info);
		exit(-1);
	}
	MKL_free(superb);

	// adjust last dimension of 'A'
	A->dim[2] = k;

	// distribute singular values to the 'V^H' matrix
	size_t j;
	for (j = 0; j < n; j++)
	{
		size_t i;
		for (i = 0; i < k; i++)
		{
			vt.data[i + k*j].real *= sigma[i];
			vt.data[i + k*j].imag *= sigma[i];
		}
	}

	// multiply right tensor neighbor by S V^H
	{
		// bring virtual bond dimension to the front
		tensor_t t;
		const int perm01[3] = { 1, 0, 2 };
		TransposeTensor(perm01, Anext, &t);
		DeleteTensor(Anext);
		// perform multiplication
		tensor_t s;
		MultiplyTensor(&vt, &t, 1, &s);
		DeleteTensor(&t);
		// restore dimension ordering
		TransposeTensor(perm01, &s, Anext);
		DeleteTensor(&s);
	}

	// clean up
	DeleteTensor(&vt);
	MKL_free(sigma);
}


//________________________________________________________________________________________________________________________
///
/// \brief Unitarily project local site tensor 'A' using a Singular Value Decomposition A = U S V^H,
/// overwriting A by the 'V^H' matrix and distributing U S to the left neighboring tensor
///
void MPSUnitaryRightProjection(tensor_t *restrict A, tensor_t *restrict Aprev)
{
	assert(A->ndim == 3);
	assert(Aprev->ndim == 3);

	const int perm12[3] = { 0, 2, 1 };

	// interchange (leftwards and rightwards) virtual bond dimensions
	tensor_t B, Bprev;
	TransposeTensor(perm12, A, &B);
	TransposeTensor(perm12, Aprev, &Bprev);
	DeleteTensor(A);
	DeleteTensor(Aprev);

	MPSUnitaryLeftProjection(&B, &Bprev);

	// reverse interchange of virtual bond dimensions
	TransposeTensor(perm12, &B, A);
	TransposeTensor(perm12, &Bprev, Aprev);
	DeleteTensor(&B);
	DeleteTensor(&Bprev);
}
