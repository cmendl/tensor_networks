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

	// initialize quantum numbers with zeros
	mps->qd = (qnumber_t *)MKL_calloc(d, sizeof(qnumber_t), MEM_DATA_ALIGN);
	mps->qD = (qnumber_t **)MKL_malloc((L + 1) * sizeof(qnumber_t *), MEM_DATA_ALIGN);
	for (i = 0; i < L + 1; i++)
	{
		mps->qD[i] = (qnumber_t *)MKL_calloc(D[i], sizeof(qnumber_t), MEM_DATA_ALIGN);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Delete a matrix product state (free memory)
///
void DeleteMPS(mps_t *restrict mps)
{
	int i;

	for (i = 0; i < mps->L + 1; i++)
	{
		MKL_free(mps->qD[i]);
	}
	MKL_free(mps->qD);
	MKL_free(mps->qd);

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
/// \brief Copy a matrix product state, allocating memory for the copy
///
void CopyMPS(const mps_t *restrict src, mps_t *restrict dst)
{
	dst->L = src->L;
	dst->d = src->d;

	dst->A = (tensor_t *)MKL_calloc(src->L, sizeof(tensor_t), MEM_DATA_ALIGN);

	int i;
	for (i = 0; i < src->L; i++)
	{
		CopyTensor(&src->A[i], &dst->A[i]);
	}

	// copy physical quantum numbers
	dst->qd = (qnumber_t *)MKL_malloc(src->d * sizeof(qnumber_t), MEM_DATA_ALIGN);
	memcpy(dst->qd, src->qd, src->d * sizeof(qnumber_t));
	// copy virtual bond quantum numbers
	dst->qD = (qnumber_t **)MKL_malloc((src->L + 1) * sizeof(qnumber_t *), MEM_DATA_ALIGN);
	for (i = 0; i < src->L + 1; i++)
	{
		const size_t D = (i < src->L ? src->A[i].dim[1] : src->A[src->L-1].dim[2]);
		dst->qD[i] = (qnumber_t *)MKL_malloc(D * sizeof(qnumber_t), MEM_DATA_ALIGN);
		memcpy(dst->qD[i], src->qD[i], D * sizeof(qnumber_t));
	}
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


//________________________________________________________________________________________________________________________
///
/// \brief Merge two neighboring MPS tensors
///
void MergeMPSTensorPair(const tensor_t *restrict A0, const tensor_t *restrict A1, tensor_t *restrict A)
{
	assert(A0->ndim == 3);
	assert(A1->ndim == 3);

	tensor_t t;

	// combine A0 and A1 by contracting the shared bond
	const int perm01[3] = { 1, 0, 2 };
	TransposeTensor(perm01, A1, A);
	MultiplyTensor(A0, A, 1, &t);
	DeleteTensor(A);

	// pair original physical dimensions of A0 and A1
	assert(t.ndim == 4);
	const int perm12[4] = { 0, 2, 1, 3 };
	TransposeTensor(perm12, &t, A);
	DeleteTensor(&t);

	// combine original physical dimensions of A0 and A1
	const size_t dim[3] = { A->dim[0]*A->dim[1], A->dim[2], A->dim[3] };
	ReshapeTensor(3, dim, A);
}


//________________________________________________________________________________________________________________________
///
/// \brief Merge all tensors of a MPS to obtain the vector representation on the full Hilbert space
///
void MergeMPSFull(const mps_t *restrict mps, tensor_t *restrict A)
{
	assert(mps->L > 0);

	if (mps->L == 1)
	{
		CopyTensor(&mps->A[0], A);
	}
	else
	{
		tensor_t B;
		tensor_t *s, *t;

		if (mps->L % 2 == 0)    // L even
		{
			s = A;
			t = &B;
		}
		else                    // L odd
		{
			s = &B;
			t = A;
		}

		// special case i == 1
		{
			MergeMPSTensorPair(&mps->A[0], &mps->A[1], s);
		}
		int i;
		for (i = 2; i < mps->L; i++)
		{
			MergeMPSTensorPair(s, &mps->A[i], t);
			DeleteTensor(s);
			// swap 's' and 't' pointers
			tensor_t *r = s;
			s = t;
			t = r;
		}
		// ensure that pointers match, i.e., final result is stored in 'A'
		assert(s == A);
	}

	// virtual bond dimensions must be 1
	assert(A->ndim == 3);
	assert(A->dim[1] == 1 && A->dim[2] == 1);

	// drop virtual bonds
	const size_t dim[1] = { A->dim[0] };
	ReshapeTensor(1, dim, A);
}


//________________________________________________________________________________________________________________________
///
/// \brief Split a d x D0 x D2 tensor 'A' into two tensors 'A0' and 'A1',
/// with the joining bond dimension determined by the specified tolerance and restricted to maxD
///
///                |                           |                   |
///          ______|______                 ____|____           ____|____
///         /      d      \               /    d0   \         /    d1   \
///         |             |               |         |         |         |
///      ---|D0    A    D2|---   -->   ---|D0 A0  D1|---   ---|D1 A1  D2|---
///         |             |               |         |         |         |
///         \_____________/               \_________/         \_________/
///
trunc_info_t SplitMPSTensor(const tensor_t *restrict A, const qnumber_t *restrict qA0, const qnumber_t *restrict qA2,
	const size_t d0, const size_t d1, const qnumber_t *restrict qd0, const qnumber_t *restrict qd1,
	const svd_distr_t svd_distr, const double tol, const size_t maxD, const bool renormalize,
	tensor_t *restrict A0, tensor_t *restrict A1, qnumber_t *restrict *qbond)
{
	assert(tol >= 0);
	assert(maxD > 0);
	assert(A->ndim == 3);
	assert(A->dim[0] == d0*d1);

	// reshape 'A' tensor into dimensions d0 x d1 x D0 x D2
	tensor_t As;
	{
		const size_t dim[4] = { d0, d1, A->dim[1], A->dim[2] };

		As.ndim = 4;
		As.dim = (size_t *)MKL_malloc(4 * sizeof(size_t), MEM_DATA_ALIGN);
		memcpy(As.dim, dim, 4*sizeof(size_t));
		assert(NumTensorElements(&As) == NumTensorElements(A));

		#ifdef _DEBUG
		As.dnames = (string_t *)MKL_calloc(As.ndim, sizeof(string_t), MEM_DATA_ALIGN);
		#endif

		// just copy data pointers
		As.data = A->data;
	}

	// reorder and regroup levels: d0 x d1 x D0 x D2 -> d0 x D0 x d1 x D2 -> (d0 * D0) x (d1 * D2)
	tensor_t Ar;
	{
		const int perm12[4] = { 0, 2, 1, 3 };
		TransposeTensor(perm12, &As, &Ar);

		const size_t dim[2] = { d0 * A->dim[1], d1 * A->dim[2] };
		ReshapeTensor(2, dim, &Ar);
	}

	// 'As' no longer needed
	#ifdef _DEBUG
	MKL_free(As.dnames);
	#endif
	MKL_free(As.dim);

	// compute quantum numbers of matrix representation
	qnumber_t *q0 = (qnumber_t *)MKL_malloc(d0 * A->dim[1] * sizeof(qnumber_t), MEM_DATA_ALIGN);
	qnumber_t *q2 = (qnumber_t *)MKL_malloc(d1 * A->dim[2] * sizeof(qnumber_t), MEM_DATA_ALIGN);
	size_t i, j;
	// q0
	for (j = 0; j < A->dim[1]; j++)
	{
		for (i = 0; i < d0; i++)
		{
			q0[i + d0*j] = AddQuantumNumbers(qd0[i], qA0[j]);
		}
	}
	// q2
	for (j = 0; j < A->dim[2]; j++)
	{
		for (i = 0; i < d1; i++)
		{
			q2[i + d1*j] = SubtractQuantumNumbers(qA2[j], qd1[i]);
		}
	}

	// temporary version of A1 until final transposition
	tensor_t A1t;

	// actually perform splitting
	trunc_info_t ti = SplitMatrix(&Ar, q0, q2, svd_distr, tol, maxD, renormalize, A0, &A1t, qbond);
	assert(A0->ndim == 2 && A0->dim[0] == d0 * A->dim[1]);
	assert(A1t.ndim == 2 && A1t.dim[1] == d1 * A->dim[2]);
	assert(A0->dim[1] == A1t.dim[0]);

	// quantum numbers of matrix representation and 'Ar' no longer needed
	MKL_free(q2);
	MKL_free(q0);
	DeleteTensor(&Ar);

	// reshape (and transpose) A0 and A1 to restore original physical dimensions
	// A0
	{
		const size_t dim[3] = { d0, A->dim[1], A0->dim[1] };
		ReshapeTensor(3, dim, A0);
	}
	// A1
	{
		const size_t dim[3] = { A1t.dim[0], d1, A->dim[2] };
		ReshapeTensor(3, dim, &A1t);

		const int perm[3] = { 1, 0, 2 };
		TransposeTensor(perm, &A1t, A1);

		DeleteTensor(&A1t);
	}

	return ti;
}
