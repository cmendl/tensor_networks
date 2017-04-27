/// \file mpo.c
/// \brief Matrix product operator (MPO)

#include "mpo.h"
#include "dupio.h"
#include <mkl.h>
#include <stdlib.h>
#include <memory.h>
#include <stdio.h>


//________________________________________________________________________________________________________________________
///
/// \brief Allocate memory for a matrix product operator (MPO) with open boundary conditions
///
void AllocateMPO(const int L, const size_t d[2], const size_t *D, mpo_t *restrict mpo)
{
	mpo->L = L;
	mpo->d[0] = d[0];
	mpo->d[1] = d[1];

	assert(L >= 1);

	mpo->A = (tensor_t *)MKL_calloc(L, sizeof(tensor_t), MEM_DATA_ALIGN);

	int i;
	for (i = 0; i < L; i++)
	{
		const size_t dim[4] = { d[0], d[1], D[i], D[i+1] };
		AllocateTensor(4, dim, &mpo->A[i]);
	}

	// initialize quantum numbers with zeros
	mpo->qd[0] = (qnumber_t *)MKL_calloc(d[0], sizeof(qnumber_t), MEM_DATA_ALIGN);
	mpo->qd[1] = (qnumber_t *)MKL_calloc(d[1], sizeof(qnumber_t), MEM_DATA_ALIGN);
	mpo->qD = (qnumber_t **)MKL_malloc((L + 1) * sizeof(qnumber_t *), MEM_DATA_ALIGN);
	for (i = 0; i < L + 1; i++)
	{
		mpo->qD[i] = (qnumber_t *)MKL_calloc(D[i], sizeof(qnumber_t), MEM_DATA_ALIGN);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Delete a matrix product operator (free memory)
///
void DeleteMPO(mpo_t *mpo)
{
	int i;

	for (i = 0; i < mpo->L + 1; i++)
	{
		MKL_free(mpo->qD[i]);
	}
	MKL_free(mpo->qD);
	MKL_free(mpo->qd[1]);
	MKL_free(mpo->qd[0]);

	for (i = 0; i < mpo->L; i++)
	{
		DeleteTensor(&mpo->A[i]);
	}
	MKL_free(mpo->A);

	mpo->d[0] = 0;
	mpo->d[1] = 0;
	mpo->L = 0;
}


//________________________________________________________________________________________________________________________
///
/// \brief Copy a matrix product operator, allocating memory for the copy
///
void CopyMPO(const mpo_t *restrict src, mpo_t *restrict dst)
{
	dst->L = src->L;
	dst->d[0] = src->d[0];
	dst->d[1] = src->d[1];

	dst->A = (tensor_t *)MKL_calloc(src->L, sizeof(tensor_t), MEM_DATA_ALIGN);

	int i;
	for (i = 0; i < src->L; i++)
	{
		CopyTensor(&src->A[i], &dst->A[i]);
	}

	// copy physical quantum numbers
	dst->qd[0] = (qnumber_t *)MKL_malloc(src->d[0] * sizeof(qnumber_t), MEM_DATA_ALIGN);
	dst->qd[1] = (qnumber_t *)MKL_malloc(src->d[1] * sizeof(qnumber_t), MEM_DATA_ALIGN);
	memcpy(dst->qd[0], src->qd[0], src->d[0] * sizeof(qnumber_t));
	memcpy(dst->qd[1], src->qd[1], src->d[1] * sizeof(qnumber_t));
	// copy virtual bond quantum numbers
	dst->qD = (qnumber_t **)MKL_malloc((src->L + 1) * sizeof(qnumber_t *), MEM_DATA_ALIGN);
	for (i = 0; i < src->L + 1; i++)
	{
		const size_t D = MPOBondDim(src, i);
		dst->qD[i] = (qnumber_t *)MKL_malloc(D * sizeof(qnumber_t), MEM_DATA_ALIGN);
		memcpy(dst->qD[i], src->qD[i], D * sizeof(qnumber_t));
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Create identity matrix product operator, with all virtual bond dimensions equal to 1
///
void CreateIdentityMPO(const int L, const size_t d, mpo_t *restrict mpo)
{
	int i;

	// set virtual bond dimensions to 1
	size_t *D = (size_t *)MKL_malloc((L + 1)*sizeof(size_t), MEM_DATA_ALIGN);
	for (i = 0; i <= L; i++) {
		D[i] = 1;
	}

	const size_t dim[2] = { d, d };
	AllocateMPO(L, dim, D, mpo);
	MKL_free(D);

	for (i = 0; i < L; i++)
	{
		// set to identity tensor
		size_t j;
		for (j = 0; j < d; j++)
		{
			mpo->A[i].data[j + j*d].real = 1;
		}
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Pointwise conjugate of entries
///
void ConjugateMPO(mpo_t *restrict mpo)
{
	int i;
	for (i = 0; i < mpo->L; i++)
	{
		ConjugateTensor(&mpo->A[i]);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Transpose physical dimensions of a MPO
///
/// Memory will be allocated for 'mpoT'.
///
void TransposeMPO(const mpo_t *restrict mpo, mpo_t *restrict mpoT)
{
	mpoT->L = mpo->L;
	// transposed physical dimensions
	mpoT->d[0] = mpo->d[1];
	mpoT->d[1] = mpo->d[0];

	mpoT->A = (tensor_t *)MKL_calloc(mpo->L, sizeof(tensor_t), MEM_DATA_ALIGN);

	// interchange physical dimensions
	const int perm[4] = { 1, 0, 2, 3 };

	int i;
	for (i = 0; i < mpo->L; i++)
	{
		TransposeTensor(perm, &mpo->A[i], &mpoT->A[i]);
		assert(mpoT->A[i].dim[0] == mpoT->d[0]);
		assert(mpoT->A[i].dim[1] == mpoT->d[1]);
	}

	// interchange and copy physical quantum numbers
	mpoT->qd[0] = (qnumber_t *)MKL_malloc(mpo->d[1] * sizeof(qnumber_t), MEM_DATA_ALIGN);
	mpoT->qd[1] = (qnumber_t *)MKL_malloc(mpo->d[0] * sizeof(qnumber_t), MEM_DATA_ALIGN);
	memcpy(mpoT->qd[0], mpo->qd[1], mpo->d[1] * sizeof(qnumber_t));
	memcpy(mpoT->qd[1], mpo->qd[0], mpo->d[0] * sizeof(qnumber_t));
	// flip signs of virtual bond quantum numbers
	mpoT->qD = (qnumber_t **)MKL_malloc((mpo->L + 1) * sizeof(qnumber_t *), MEM_DATA_ALIGN);
	for (i = 0; i < mpo->L + 1; i++)
	{
		const size_t D = MPOBondDim(mpo, i);
		mpoT->qD[i] = (qnumber_t *)MKL_malloc(D * sizeof(qnumber_t), MEM_DATA_ALIGN);
		size_t j;
		for (j = 0; j < D; j++)
		{
			mpoT->qD[i][j] = NegateQuantumNumber(mpo->qD[i][j]);
		}
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Conjugate-transpose physical dimensions of a MPO
///
/// Memory will be allocated for 'mpoH'.
///
void ConjugateTransposeMPO(const mpo_t *restrict mpo, mpo_t *restrict mpoH)
{
	mpoH->L = mpo->L;
	// transposed physical dimensions
	mpoH->d[0] = mpo->d[1];
	mpoH->d[1] = mpo->d[0];

	mpoH->A = (tensor_t *)MKL_calloc(mpo->L, sizeof(tensor_t), MEM_DATA_ALIGN);

	// interchange physical dimensions
	const int perm[4] = { 1, 0, 2, 3 };

	int i;
	for (i = 0; i < mpo->L; i++)
	{
		ConjugateTransposeTensor(perm, &mpo->A[i], &mpoH->A[i]);
		assert(mpoH->A[i].dim[0] == mpoH->d[0]);
		assert(mpoH->A[i].dim[1] == mpoH->d[1]);
	}

	// interchange and copy physical quantum numbers
	mpoH->qd[0] = (qnumber_t *)MKL_malloc(mpo->d[1] * sizeof(qnumber_t), MEM_DATA_ALIGN);
	mpoH->qd[1] = (qnumber_t *)MKL_malloc(mpo->d[0] * sizeof(qnumber_t), MEM_DATA_ALIGN);
	memcpy(mpoH->qd[0], mpo->qd[1], mpo->d[1] * sizeof(qnumber_t));
	memcpy(mpoH->qd[1], mpo->qd[0], mpo->d[0] * sizeof(qnumber_t));
	// flip signs of virtual bond quantum numbers
	mpoH->qD = (qnumber_t **)MKL_malloc((mpo->L + 1) * sizeof(qnumber_t *), MEM_DATA_ALIGN);
	for (i = 0; i < mpo->L + 1; i++)
	{
		const size_t D = MPOBondDim(mpo, i);
		mpoH->qD[i] = (qnumber_t *)MKL_malloc(D * sizeof(qnumber_t), MEM_DATA_ALIGN);
		size_t j;
		for (j = 0; j < D; j++)
		{
			mpoH->qD[i][j] = NegateQuantumNumber(mpo->qD[i][j]);
		}
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Merge two neighboring MPO tensors
///
void MergeMPOTensorPair(const tensor_t *restrict A0, const tensor_t *restrict A1, tensor_t *restrict A)
{
	assert(A0->ndim == 4);
	assert(A1->ndim == 4);

	tensor_t t;

	// combine A0 and A1 by contracting the shared bond
	const int perm4[4] = { 1, 2, 0, 3 };
	TransposeTensor(perm4, A1, A);
	MultiplyTensor(A0, A, 1, &t);
	DeleteTensor(A);

	// pair original physical dimensions of A0 and A1
	assert(t.ndim == 6);
	const int perm6[6] = { 0, 2, 4, 1, 3, 5 };
	TransposeTensor(perm6, &t, A);
	DeleteTensor(&t);

	// combine original physical dimensions of A0 and A1
	const size_t dim[4] = { A->dim[0]*A->dim[1], A->dim[2]*A->dim[3], A->dim[4], A->dim[5] };
	ReshapeTensor(4, dim, A);
}


//________________________________________________________________________________________________________________________
///
/// \brief Merge all tensors of a MPO to obtain the matrix representation on the full Hilbert space
///
void MergeMPOFull(const mpo_t *restrict mpo, tensor_t *restrict A)
{
	assert(mpo->L > 0);

	if (mpo->L == 1)
	{
		CopyTensor(&mpo->A[0], A);
	}
	else
	{
		tensor_t B;
		tensor_t *s, *t;

		if (mpo->L % 2 == 0)    // L even
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
			MergeMPOTensorPair(&mpo->A[0], &mpo->A[1], s);
		}
		int i;
		for (i = 2; i < mpo->L; i++)
		{
			MergeMPOTensorPair(s, &mpo->A[i], t);
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
	assert(A->ndim == 4);
	assert(A->dim[2] == 1 && A->dim[3] == 1);

	// drop virtual bonds
	const size_t dim[2] = { A->dim[0], A->dim[1] };
	ReshapeTensor(2, dim, A);
}


//________________________________________________________________________________________________________________________
///
/// \brief Compute the trace of a MPO
///
MKL_Complex16 MPOTrace(const mpo_t *restrict X)
{
	// dimensions must agree, otherwise "trace" not well defined
	assert(X->d[0] == X->d[1]);

	// start with 1D vector
	MKL_Complex16 *v = (MKL_Complex16 *)MKL_malloc(sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	v[0].real = 1;
	v[0].imag = 0;

	int i;
	for (i = X->L-1; i >= 0; i--)
	{
		assert(X->A[i].ndim == 4);
		assert(X->A[i].dim[0] == X->d[0] && X->A[i].dim[1] == X->d[1]);
		assert(i == 0 || X->A[i].dim[2] == X->A[i-1].dim[3]);

		const MKL_Complex16 zero = { 0, 0 };
		const MKL_Complex16 one  = { 1, 0 };

		// trace out physical dimensions
		const size_t D[2] = { X->A[i].dim[2], X->A[i].dim[3] };
		MKL_Complex16 *t = (MKL_Complex16 *)MKL_calloc(D[0]*D[1], sizeof(MKL_Complex16), MEM_DATA_ALIGN);
		size_t j;
		for (j = 0; j < X->d[0]; j++)
		{
			cblas_zaxpy(D[0]*D[1], &one, &X->A[i].data[j + j*X->d[0]], X->d[0]*X->d[1], t, 1);
		}

		// w = t*v
		MKL_Complex16 *w = (MKL_Complex16 *)MKL_malloc(D[0]*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
		cblas_zgemv(CblasColMajor, CblasNoTrans, D[0], D[1], &one, t, D[0], v, 1, &zero, w, 1);
		MKL_free(t);

		// update 'v' vector
		MKL_free(v);
		v = w;
	}

	// after traversing chain from right to left, v should again be a 1D vector

	MKL_Complex16 tr = v[0];
	MKL_free(v);

	return tr;
}


//________________________________________________________________________________________________________________________
///
/// \brief Reduction by one lattice site for computing the trace of a MPO product Tr[Y.X]
///        with X consisting of 'A' tensors and Y of 'B' tensors
///
void MPOTraceProductTensorReduce(const tensor_t *restrict A, const tensor_t *restrict B, tensor_t *restrict R)
{
	tensor_t s, t;

	assert(A->ndim == 4);
	assert(B->ndim == 4);
	assert(R->ndim == 2);

	// multiply 'B' with 'R' tensor
	MultiplyTensor(B, R, 1, &t);
	DeleteTensor(R);

	// flip first physical with first virtual bond dimension in 'BR'
	const int permBR[4] = { 2, 1, 0, 3 };
	TransposeTensor(permBR, &t, &s);
	DeleteTensor(&t);
	// flip virtual bond dimensions in 'A'
	const int permA[4] = { 0, 1, 3, 2 };
	TransposeTensor(permA, A, &t);

	// multiply 'BR' with 'A' tensor and store result back in 'R'
	MultiplyTensor(&s, &t, 3, R);
	DeleteTensor(&s);
	DeleteTensor(&t);
}


//________________________________________________________________________________________________________________________
///
/// \brief Compute the trace of a MPO product Tr[Y.X]
///
MKL_Complex16 MPOTraceProduct(const mpo_t *restrict X, const mpo_t *restrict Y)
{
	assert(X->L == Y->L);

	// start with 1x1 identity tensor
	tensor_t R;
	const size_t dim[2] = { 1, 1 };
	AllocateTensor(2, dim, &R);
	IdentityTensor(&R);

	int i;
	for (i = X->L-1; i >= 0; i--)
	{
		MPOTraceProductTensorReduce(&X->A[i], &Y->A[i], &R);
	}

	// after traversing chain from right to left, R should again be a 1x1 tensor
	assert(R.ndim == 2);
	assert(R.dim[0] == 1 && R.dim[1] == 1);

	MKL_Complex16 tr = R.data[0];
	DeleteTensor(&R);

	return tr;
}


//________________________________________________________________________________________________________________________
///
/// \brief Compute the Frobenius norm sqrt(Tr[X^dagger.X])
///
double MPOFrobeniusNorm(const mpo_t *X)
{
	// start with 1x1 identity tensor
	tensor_t R;
	const size_t dim[2] = { 1, 1 };
	AllocateTensor(2, dim, &R);
	IdentityTensor(&R);

	int i;
	for (i = X->L-1; i >= 0; i--)
	{
		tensor_t Ai_dagger;
		const int perm[4] = { 1, 0, 2, 3 }; // transpose physical dimensions
		ConjugateTransposeTensor(perm, &X->A[i], &Ai_dagger);

		MPOTraceProductTensorReduce(&X->A[i], &Ai_dagger, &R);

		DeleteTensor(&Ai_dagger);
	}

	// after traversing chain from right to left, R should again be a 1x1 tensor
	assert(R.ndim == 2);
	assert(R.dim[0] == 1 && R.dim[1] == 1);

	MKL_Complex16 tr = R.data[0];
	DeleteTensor(&R);

	return sqrt(tr.real);
}


//________________________________________________________________________________________________________________________
///
/// \brief Reduction by one lattice site for computing the trace of a MPO quad-product Tr[X.Y.Z.W]
///
void MPOTraceQuadProductTensorReduce(const tensor_t *restrict A, const tensor_t *restrict B, const tensor_t *restrict C, const tensor_t *restrict D, tensor_t *restrict R)
{
	tensor_t s, t;

	assert(A->ndim == 4);
	assert(B->ndim == 4);
	assert(C->ndim == 4);
	assert(D->ndim == 4);
	assert(R->ndim == 4);

	// product with 'A'
	{
		// multiply 'A' with 'R' tensor
		MultiplyTensor(A, R, 1, &t);
		DeleteTensor(R);
	}

	// product with 'B'
	{
		// transpose 'AR' and 'B' tensors
		const int permAR[6] = { 3, 0, 2, 1, 4, 5 };
		TransposeTensor(permAR, &t, &s);
		DeleteTensor(&t);
		const int permB[4] = { 2, 0, 1, 3 };
		TransposeTensor(permB, B, &t);

		// multiply 'B' with 'AR' tensor and store result back in 'R'
		MultiplyTensor(&t, &s, 2, R);
		DeleteTensor(&s);
		DeleteTensor(&t);
	}

	// product with 'C'
	{
		// transpose 'ABR' and 'C' tensors
		const int permABR[6] = { 0, 3, 2, 4, 1, 5 };
		TransposeTensor(permABR, R, &s);
		DeleteTensor(R);
		const int permC[4] = { 2, 0, 1, 3 };
		TransposeTensor(permC, C, &t);

		// multiply 'C' with 'ABR' tensor and store result back in 'R'
		MultiplyTensor(&t, &s, 2, R);
		DeleteTensor(&s);
		DeleteTensor(&t);
	}

	// product with 'D'
	{
		// transpose 'ABCR' and 'D' tensors
		const int permABCR[6] = { 3, 2, 0, 1, 4, 5 };
		TransposeTensor(permABCR, R, &s);
		DeleteTensor(R);
		const int permD[4] = { 0, 1, 3, 2 };
		TransposeTensor(permD, D, &t);

		// multiply 'ABCR' with 'D' tensor and store result back in 'R'
		MultiplyTensor(&s, &t, 3, R);
		DeleteTensor(&s);
		DeleteTensor(&t);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Compute the trace of a MPO quad-product Tr[X.Y.Z.W]
///
MKL_Complex16 MPOTraceQuadProduct(const mpo_t *restrict X, const mpo_t *restrict Y, const mpo_t *restrict Z, const mpo_t *restrict W)
{
	assert(X->L == Y->L);
	assert(Y->L == Z->L);
	assert(Z->L == W->L);

	// start with 1x1x1x1 identity tensor
	tensor_t R;
	const size_t dim[4] = { 1, 1, 1, 1 };
	AllocateTensor(4, dim, &R);
	IdentityTensor(&R);

	int i;
	for (i = X->L-1; i >= 0; i--)
	{
		MPOTraceQuadProductTensorReduce(&X->A[i], &Y->A[i], &Z->A[i], &W->A[i], &R);
	}

	// after traversing chain from right to left, R should again be a 1x1x1x1 tensor
	assert(R.ndim == 4);
	assert(R.dim[0] == 1 && R.dim[1] == 1 && R.dim[2] == 1 && R.dim[3] == 1);

	MKL_Complex16 tr = R.data[0];
	DeleteTensor(&R);

	return tr;
}


//________________________________________________________________________________________________________________________
///
/// \brief Add two MPOs: Z = X + Y
///
void MPOAdd(const mpo_t *restrict X, const mpo_t *restrict Y, mpo_t *restrict Z)
{
	// dimensions must be compatible
	assert(X->L == Y->L);
	assert(X->d[0] == Y->d[0]);
	assert(X->d[1] == Y->d[1]);

	const int L = X->L;
	assert(L >= 1);

	const size_t d[2] = { X->d[0], X->d[1] };

	int i;

	// add virtual bond dimensions, except for first and last virtual bond with dimension 1
	size_t *D = (size_t *)MKL_malloc((L + 1)*sizeof(size_t), MEM_DATA_ALIGN);
	// leftmost (dummy) virtual bond
	{
		assert(X->A[0].dim[2] == 1);
		assert(Y->A[0].dim[2] == 1);
		D[0] = 1;
	}
	for (i = 1; i < L; i++)
	{
		D[i] = X->A[i].dim[2] + Y->A[i].dim[2];
	}
	// rightmost (dummy) virtual bond
	{
		assert(X->A[L-1].dim[3] == 1);
		assert(Y->A[L-1].dim[3] == 1);
		D[L] = 1;
	}

	AllocateMPO(L, d, D, Z);
	MKL_free(D);

	// store tensors in X and Y as diagonal blocks in output tensors
	for (i = 0; i < L; i++)
	{
		const size_t DX0 = X->A[i].dim[2];
		const size_t DX1 = X->A[i].dim[3];
		const size_t DY0 = Y->A[i].dim[2];
		const size_t DY1 = Y->A[i].dim[3];
		const size_t DZ0 = Z->A[i].dim[2];
		// dummy virtual bond dimensions on the left and right ends must be 1
		assert(i > 0   || (DX0 == 1 && DY0 == 1 && DZ0 == 1));
		assert(i < L-1 || (DX1 == 1 && DY1 == 1));

		// leading dimensions
		const size_t ldX = d[0]*d[1] * DX0;
		const size_t ldY = d[0]*d[1] * DY0;
		const size_t ldZ = d[0]*d[1] * DZ0;

		size_t j;
		for (j = 0; j < DX1; j++)
		{
			memcpy(&Z->A[i].data[ldZ*j], &X->A[i].data[ldX*j], ldX*sizeof(MKL_Complex16));
		}
		for (j = 0; j < DY1; j++)
		{
			const size_t offset0 = (i == 0   ? 0 : ldX);
			const size_t offsetL = (i == L-1 ? 0 : DX1);
			memcpy(&Z->A[i].data[offset0 + ldZ*(offsetL + j)], &Y->A[i].data[ldY*j], ldY*sizeof(MKL_Complex16));
		}
	}

	// copy physical quantum numbers (must agree with quantum numbers stored in Y)
	memcpy(Z->qd[0], X->qd[0], X->d[0] * sizeof(qnumber_t));
	memcpy(Z->qd[1], X->qd[1], X->d[1] * sizeof(qnumber_t));

	// concatenate virtual bond quantum numbers
	for (i = 0; i < L + 1; i++)
	{
		const size_t DX = MPOBondDim(X, i);
		const size_t DY = MPOBondDim(Y, i);
		#ifndef NDEBUG
		const size_t DZ = MPOBondDim(Z, i);
		#endif
		assert((0 == i || i == L) || (DZ == DX + DY));

		memcpy(Z->qD[i], X->qD[i], DX * sizeof(qnumber_t));
		if (0 < i && i < L)
		{
			memcpy(Z->qD[i] + DX, Y->qD[i], DY * sizeof(qnumber_t));
		}
		else
		{
			assert(DX == 1 && DY == 1 && DZ == 1);
			assert(Y->qD[i][0] == X->qD[i][0]);
		}
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Split a d x d x D0 x D2 tensor 'A' into two tensors 'A0' and 'A1',
/// with the joining bond dimension determined by the specified tolerance and restricted to maxD
///
///                |                           |                   |
///          ______|______                 ____|____           ____|____
///         /      d      \               /    d0   \         /    d1   \
///         |             |               |         |         |         |
///      ---|D0    A    D2|---   -->   ---|D0 A0  D1|---   ---|D1 A1  D2|---
///         |             |               |         |         |         |
///         \______d______/               \____d0___/         \____d1___/
///                |                           |                   |
///                |                           |                   |
///
trunc_info_t SplitMPOTensor(const tensor_t *restrict A, const qnumber_t *restrict qA0, const qnumber_t *restrict qA2,
	const size_t d0, const size_t d1, const qnumber_t *restrict qd0, const qnumber_t *restrict qd1,
	const svd_distr_t svd_distr, const bond_op_params_t *restrict params,
	tensor_t *restrict A0, tensor_t *restrict A1, qnumber_t *restrict *qbond)
{
	assert(params->tol >= 0);
	assert(params->maxD > 0);
	assert(A->ndim == 4);
	assert(A->dim[0] == d0*d1);
	assert(A->dim[1] == d0*d1);

	// reshape 'A' tensor into dimensions d0 x d1 x d0 x d1 x D0 x D2
	tensor_t As;
	{
		const size_t dim[6] = { d0, d1, d0, d1, A->dim[2], A->dim[3] };

		As.ndim = 6;
		As.dim = (size_t *)MKL_malloc(6 * sizeof(size_t), MEM_DATA_ALIGN);
		memcpy(As.dim, dim, 6*sizeof(size_t));
		assert(NumTensorElements(&As) == NumTensorElements(A));

		#ifdef _DEBUG
		As.dnames = (string_t *)MKL_calloc(As.ndim, sizeof(string_t), MEM_DATA_ALIGN);
		#endif

		// just copy data pointers
		As.data = A->data;
	}

	// reorder and regroup levels: d0 x d1 x d0 x d1 x D0 x D2 -> d0 x d0 x D0 x d1 x d1 x D2 -> (d0^2 * D0) x (d1^2 * D2)
	tensor_t Ar;
	{
		const int perm[6] = { 0, 3, 1, 4, 2, 5 };
		TransposeTensor(perm, &As, &Ar);

		const size_t dim[2] = { d0 * d0 * A->dim[2], d1 * d1 * A->dim[3] };
		ReshapeTensor(2, dim, &Ar);
	}

	// 'As' no longer needed
	#ifdef _DEBUG
	MKL_free(As.dnames);
	#endif
	MKL_free(As.dim);

	// compute quantum numbers of matrix representation
	qnumber_t *q0 = (qnumber_t *)MKL_malloc(d0 * d0 * A->dim[2] * sizeof(qnumber_t), MEM_DATA_ALIGN);
	qnumber_t *q2 = (qnumber_t *)MKL_malloc(d1 * d1 * A->dim[3] * sizeof(qnumber_t), MEM_DATA_ALIGN);
	size_t i, j, k;
	// q0
	for (k = 0; k < A->dim[2]; k++)
	{
		for (j = 0; j < d0; j++)
		{
			for (i = 0; i < d0; i++)
			{
				q0[i + d0*(j + d0*k)] = SubtractQuantumNumbers(AddQuantumNumbers(qd0[i], qA0[k]), qd0[j]);
			}
		}
	}
	// q2
	for (k = 0; k < A->dim[3]; k++)
	{
		for (j = 0; j < d1; j++)
		{
			for (i = 0; i < d1; i++)
			{
				q2[i + d1*(j + d1*k)] = SubtractQuantumNumbers(AddQuantumNumbers(qA2[k], qd1[j]), qd1[i]);
			}
		}
	}

	// temporary version of A1 until final transposition
	tensor_t A1t;

	// actually perform splitting
	trunc_info_t ti = SplitMatrix(&Ar, q0, q2, svd_distr, params, A0, &A1t, qbond);
	assert(A0->ndim == 2 && A0->dim[0] == d0 * d0 * A->dim[2]);
	assert(A1t.ndim == 2 && A1t.dim[1] == d1 * d1 * A->dim[3]);
	assert(A0->dim[1] == A1t.dim[0]);

	// quantum numbers of matrix representation and 'Ar' no longer needed
	MKL_free(q2);
	MKL_free(q0);
	DeleteTensor(&Ar);

	// reshape (and transpose) A0 and A1 to restore original physical dimensions
	// A0
	{
		const size_t dim[4] = { d0, d0, A->dim[2], A0->dim[1] };
		ReshapeTensor(4, dim, A0);
	}
	// A1
	{
		const size_t dim[4] = { A1t.dim[0], d1, d1, A->dim[3] };
		ReshapeTensor(4, dim, &A1t);

		const int perm[4] = { 2, 0, 1, 3 };
		TransposeTensor(perm, &A1t, A1);

		DeleteTensor(&A1t);
	}

	return ti;
}



//________________________________________________________________________________________________________________________
///
/// \brief Compress virtual bonds between tensors A0 and A1; qd0, qd1 are the physical quantum numbers of the two sites
///
///
///              |                   |                         |                   |
///          ____|____           ____|____                 ____|____           ____|____
///         /    d0   \         /    d1   \               /    d0   \         /    d1   \
///         |         |         |         |               |         |         |         |
///      ---|D0 A0  D1|---   ---|D1 A1  D2|---   -->   ---|D0 A0' D1'---   ---|D1'A1' D2|---
///         |         |         |         |               |         |         |         |
///         \____d0___/         \____d1___/               \____d0___/         \____d1___/
///              |                   |                         |                   |
///              |                   |                         |                   |
///
trunc_info_t CompressMPOTensors(tensor_t *restrict A0, tensor_t *restrict A1,
	const qnumber_t *restrict qA0, const qnumber_t *restrict qA1, const qnumber_t *restrict qA2,
	const qnumber_t *restrict qd0, const qnumber_t *restrict qd1,
	const svd_distr_t svd_distr, const bond_op_params_t *restrict params,
	qnumber_t *restrict *qA1compr)
{
	assert(A0->ndim == 4);
	assert(A1->ndim == 4);

	const size_t d0 = A0->dim[0];
	const size_t d1 = A1->dim[0];
	// only same ingoing and outgoing physical dimensions supported yet
	assert(d0 == A0->dim[1]);
	assert(d1 == A1->dim[1]);

	const size_t D0 = A0->dim[2];
	const size_t D2 = A1->dim[3];

	// compute quantum numbers of matrix representation
	qnumber_t *q0 = (qnumber_t *)MKL_malloc(d0 * d0 * D0 * sizeof(qnumber_t), MEM_DATA_ALIGN);
	qnumber_t *q2 = (qnumber_t *)MKL_malloc(d1 * d1 * D2 * sizeof(qnumber_t), MEM_DATA_ALIGN);
	size_t i, j, k;
	// q0
	for (k = 0; k < D0; k++)
	{
		for (j = 0; j < d0; j++)
		{
			for (i = 0; i < d0; i++)
			{
				q0[i + d0*(j + d0*k)] = SubtractQuantumNumbers(AddQuantumNumbers(qd0[i], qA0[k]), qd0[j]);
			}
		}
	}
	// q2
	for (k = 0; k < D2; k++)
	{
		for (j = 0; j < d1; j++)
		{
			for (i = 0; i < d1; i++)
			{
				q2[i + d1*(j + d1*k)] = SubtractQuantumNumbers(AddQuantumNumbers(qA2[k], qd1[j]), qd1[i]);
			}
		}
	}

	tensor_t A1t;

	// reshape (and transpose) A0 and A1 into matrices
	// A0
	{
		const size_t dim[2] = { d0 * d0 * D0, A0->dim[3] };
		ReshapeTensor(2, dim, A0);
	}
	// A1
	{
		const int perm[4] = { 1, 2, 0, 3 };
		TransposeTensor(perm, A1, &A1t);
		DeleteTensor(A1);

		const size_t dim[2] = { A1t.dim[0], d1 * d1 * D2 };
		ReshapeTensor(2, dim, &A1t);
	}

	trunc_info_t ti = CompressVirtualBonds(A0, &A1t, q0, qA1, q2, svd_distr, params, qA1compr);

	// reshape (and transpose) A0 and A1 back to restore original physical dimensions
	// A0
	{
		const size_t dim[4] = { d0, d0, D0, A0->dim[1] };
		ReshapeTensor(4, dim, A0);
	}
	// A1
	{
		const size_t dim[4] = { A1t.dim[0], d1, d1, D2 };
		ReshapeTensor(4, dim, &A1t);

		const int perm[4] = { 2, 0, 1, 3 };
		TransposeTensor(perm, &A1t, A1);
	}

	DeleteTensor(&A1t);
	MKL_free(q2);
	MKL_free(q0);

	return ti;
}


//________________________________________________________________________________________________________________________
///
/// \brief Compress all virtual bonds of a MPO
///
void CompressMPO(mpo_t *restrict mpo, const sweep_dir_t direction, const bond_op_params_t *restrict params, trunc_info_t *restrict ti)
{
	// TODO: only need to "compress" single tensors for MPO in canonical form

	int i;

	if (direction == SWEEP_LEFT_TO_RIGHT)
	{
		for (i = 0; i < mpo->L - 1; i++)
		{
			// bond quantum numbers after compression
			qnumber_t *qcD1;
			ti[i] = CompressMPOTensors(&mpo->A[i], &mpo->A[i+1], mpo->qD[i], mpo->qD[i+1], mpo->qD[i+2], mpo->qd[0], mpo->qd[1], SVD_DISTR_RIGHT, params, &qcD1);
			MKL_free(mpo->qD[i+1]);
			mpo->qD[i+1] = qcD1;
		}
	}
	else if (direction == SWEEP_RIGHT_TO_LEFT)
	{
		for (i = mpo->L - 2; i >= 0; i--)
		{
			// bond quantum numbers after compression
			qnumber_t *qcD1;
			ti[i] = CompressMPOTensors(&mpo->A[i], &mpo->A[i+1], mpo->qD[i], mpo->qD[i+1], mpo->qD[i+2], mpo->qd[0], mpo->qd[1], SVD_DISTR_LEFT, params, &qcD1);
			MKL_free(mpo->qD[i+1]);
			mpo->qD[i+1] = qcD1;
		}
	}
	else
	{
		// invalid direction
		assert(false);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Form all combinations (outer product) of quantum numbers
///
static void CombineQuantumNumbers(const size_t m, const size_t n, const qnumber_t *restrict q0, const qnumber_t *restrict q1, qnumber_t *restrict qC)
{
	size_t j;
	for (j = 0; j < n; j++)
	{
		size_t i;
		for (i = 0; i < m; i++)
		{
			qC[i + m*j] = AddQuantumNumbers(q0[i], q1[j]);
		}
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Composition of local MPO tensors 'A' and 'B' along physical dimension
///
void ComposeMPOTensors(const tensor_t *restrict A, const tensor_t *restrict B, tensor_t *restrict ret)
{
	assert(A->ndim == 4);
	assert(B->ndim == 4);

	tensor_t t;

	// multiply physical dimensions
	{
		const int perm[4] = { 0, 3, 1, 2 };
		tensor_t s;
		TransposeTensor(perm, A, &s);
		MultiplyTensor(&s, B, 1, &t);
		DeleteTensor(&s);
	}

	// reorder dimensions and combine virtual bonds
	{
		assert(t.ndim == 6);

		const int perm[6] = { 0, 2, 4, 1, 3, 5 };
		TransposeTensor(perm, &t, ret);
		DeleteTensor(&t);

		const size_t dim[4] = { ret->dim[0], ret->dim[1], ret->dim[2]*ret->dim[3], ret->dim[4]*ret->dim[5] };
		ReshapeTensor(4, dim, ret);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Composition of MPOs 'X' and 'Y' along physical dimension
///
void MPOComposition(const mpo_t *restrict X, const mpo_t *restrict Y, mpo_t *restrict ret)
{
	// dimensions must be compatible
	assert(X->L == Y->L);
	assert(X->d[1] == Y->d[0]);

	const int L = X->L;

	ret->L = L;
	ret->d[0] = X->d[0];
	ret->d[1] = Y->d[1];

	// physical quantum numbers
	ret->qd[0] = (qnumber_t *)MKL_malloc(ret->d[0] * sizeof(qnumber_t), MEM_DATA_ALIGN);
	ret->qd[1] = (qnumber_t *)MKL_malloc(ret->d[1] * sizeof(qnumber_t), MEM_DATA_ALIGN);
	memcpy(ret->qd[0], X->qd[0], X->d[0]*sizeof(qnumber_t));
	memcpy(ret->qd[1], Y->qd[1], Y->d[1]*sizeof(qnumber_t));

	ret->A = (tensor_t *)MKL_calloc(L, sizeof(tensor_t), MEM_DATA_ALIGN);

	ret->qD = (qnumber_t **)MKL_malloc((L + 1) * sizeof(qnumber_t *), MEM_DATA_ALIGN);

	int i;
	for (i = 0; i < L; i++)
	{
		ComposeMPOTensors(&X->A[i], &Y->A[i], &ret->A[i]);

		// virtual bond quantum numbers
		const size_t D = ret->A[i].dim[2];
		assert(D == X->A[i].dim[2] * Y->A[i].dim[2]);
		ret->qD[i] = (qnumber_t *)MKL_malloc(D * sizeof(qnumber_t), MEM_DATA_ALIGN);
		CombineQuantumNumbers(X->A[i].dim[2], Y->A[i].dim[2], X->qD[i], Y->qD[i], ret->qD[i]);
	}
	// rightmost virtual bond quantum numbers
	{
		const size_t D = ret->A[L-1].dim[3];
		assert(D == X->A[L-1].dim[3] * Y->A[L-1].dim[3]);
		ret->qD[L] = (qnumber_t *)MKL_malloc(D * sizeof(qnumber_t), MEM_DATA_ALIGN);
		CombineQuantumNumbers(X->A[L-1].dim[3], Y->A[L-1].dim[3], X->qD[L], Y->qD[L], ret->qD[L]);
	}
}
