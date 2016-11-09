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
}


//________________________________________________________________________________________________________________________
///
/// \brief Delete a matrix product operator (free memory)
///
void DeleteMPO(mpo_t *mpo)
{
	int i;
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
}


//________________________________________________________________________________________________________________________
///
/// \brief Merge two neighboring MPO tensors
///
void MPOMergeTensors(const tensor_t *restrict A0, const tensor_t *restrict A1, tensor_t *restrict A)
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
void MPOMergeFull(const mpo_t *restrict mpo, tensor_t *restrict A)
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
			MPOMergeTensors(&mpo->A[0], &mpo->A[1], s);
		}
		int i;
		for (i = 2; i < mpo->L; i++)
		{
			MPOMergeTensors(s, &mpo->A[i], t);
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
		const int perm[4] = { 1, 0, 2, 3 };	// transpose physical dimensions
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
/// \brief Local MPO update by single-site operator 'opT' from the top
///
void ApplySingleSiteTopOperator(tensor_t *restrict A, const tensor_t *restrict opT)
{
	assert(A->ndim == 4);

	tensor_t t;
	MoveTensorData(A, &t);
	// result of multiplication again stored in 'A'
	MultiplyTensor(opT, &t, 1, A);
	DeleteTensor(&t);
}


//________________________________________________________________________________________________________________________
///
/// \brief Local MPO update by single-site operator 'opB' from the bottom
///
void ApplySingleSiteBottomOperator(tensor_t *restrict A, const tensor_t *restrict opB)
{
	assert(A->ndim == 4);

	tensor_t s, t;

	// transpose incoming physical dimension to the back
	const int perm0[4] = { 0, 3, 1, 2 };
	TransposeTensor(perm0, A, &s);
	DeleteTensor(A);

	// apply operator
	MultiplyTensor(&s, opB, 1, &t);
	DeleteTensor(&s);

	// restore ordering of dimensions
	const int perm1[4] = { 0, 2, 3, 1 };
	TransposeTensor(perm1, &t, A);
	DeleteTensor(&t);
}


//________________________________________________________________________________________________________________________
///
/// \brief Local MPO update by two-site operator 'opT' from the top and 'opB' from the bottom
///
/// \return effective tolerance (truncation weight), can be larger than 'tol' if bond dimension is truncated by 'maxD'
///
trunc_info_t ApplyTwoSiteOperator(tensor_t *restrict A0, tensor_t *restrict A1, const tensor_t *restrict opT, const tensor_t *restrict opB, const svd_distr_t svd_distr, const double tol, const size_t maxD)
{
	assert(tol  > 0);
	assert(maxD > 0);
	assert(A0->ndim == 4);
	assert(A1->ndim == 4);

	trunc_info_t ti;
	ti.tol_eff = tol;

	tensor_t s, t;

	// combine A0 and A1 by contracting the shared bond
	{
		const int perm[4] = { 1, 2, 0, 3 };
		TransposeTensor(perm, A1, &t);
		MultiplyTensor(A0, &t, 1, &s);
		DeleteTensor(&t);
		// input tensors will be re-populated later
		DeleteTensor(A0);
		DeleteTensor(A1);
	}

	// store dimensions of combined A0 and A1
	assert(s.ndim == 6);
	const size_t dim[6] = { s.dim[0], s.dim[1], s.dim[2], s.dim[3], s.dim[4], s.dim[5] };

	// apply operator opT to leading physical dimensions and opB to trailing physical dimensions
	if (!(opT == NULL && opB == NULL))
	{
		// bring outgoing physical dimensions to the front and incoming physical dimensions to the back
		const int perm0[6] = { 0, 4, 2, 1, 5, 3 };
		TransposeTensor(perm0, &s, &t);
		DeleteTensor(&s);

		assert(t.ndim == 6);
		const size_t dim0[4] = { t.dim[0]*t.dim[1], t.dim[2], t.dim[3], t.dim[4]*t.dim[5] };
		ReshapeTensor(4, dim0, &t);
		MultiplyTensor(opT, &t, 1, &s);
		DeleteTensor(&t);
		MultiplyTensor(&s, opB, 1, &t);
		DeleteTensor(&s);
		const size_t dim1[6] = { dim[0], dim[3], dim[2], dim[5], dim[1], dim[4] };
		ReshapeTensor(6, dim1, &t);

		// revert reordering of physical dimensions
		const int perm1[6] = { 0, 3, 2, 5, 1, 4 };
		TransposeTensor(perm1, &t, A0);
		DeleteTensor(&t);
	}
	else
	{
		// shortcut to skip application of operators
		MoveTensorData(&s, A0);
	}

	// use SVD to separate the two sites again
	{
		// overwrite 'A0' by the 'U' matrix
		const size_t m = dim[0]*dim[1]*dim[2];
		const size_t n = dim[3]*dim[4]*dim[5];
		size_t k = (m <= n ? m : n);    // min(m, n)
		const size_t dim_mn[2] = { m, n };
		ReshapeTensor(2, dim_mn, A0);
		double *sigma = MKL_malloc(k * sizeof(double), MEM_DATA_ALIGN);
		double *superb = MKL_malloc((k - 1) * sizeof(double), MEM_DATA_ALIGN);
		const size_t dim_kn[2] = { k, n };
		AllocateTensor(2, dim_kn, &s);
		int info = LAPACKE_zgesvd(LAPACK_COL_MAJOR, 'O', 'S', (lapack_int)m, (lapack_int)n, A0->data, (lapack_int)m, sigma, NULL, (lapack_int)m, s.data, (lapack_int)k, superb);
		if (info != 0) {
			duprintf("Call of LAPACK function 'zgesvd()' in 'ApplyTwoSiteOperator()' failed, return value: %i\n", info);
			exit(-1);
		}

		// truncate small singular values
		double sigma_sq_sum = 0;
		size_t i;
		for (i = k; i > 0; i--) {
			sigma_sq_sum += square(sigma[i - 1]);
		}
		double sigma_sq_acc = 0;
		for (i = k; i > 0; i--) {
			sigma_sq_acc += square(sigma[i - 1]);
			if (sigma_sq_acc / sigma_sq_sum > tol) {
				break;
			}
		}
		if (i > maxD)
		{
			//duprintf("warning: cutting number of singular values from %zu to %zu in 'ApplyTwoSiteOperator()\n", i, maxD);
			//duprintf("    total number of singular values: %zu\n", k);
			//duprintf("    tolerance: %g\n", tol);
			//duprintf("    largest overall singular value:   %g\n", sigma[0]);
			//duprintf("    smallest retained singular value: %g\n", sigma[maxD - 1]);
			//duprintf("    largest cut singular value:       %g\n", sigma[maxD]);
			//duprintf("    smallest cut singular value:      %g\n", sigma[i - 1]);

			// determine effective tolerance
			sigma_sq_acc = 0;
			for (i = k; i > maxD; i--)
			{
				sigma_sq_acc += square(sigma[i - 1]);
			}
			ti.tol_eff = sigma_sq_acc / sigma_sq_sum;

			assert(i == maxD);
		}
		else if (i < 1)
		{
			i = 1;
		}
		// new truncated bond dimension
		k = i;

		// record norm of retained singular values
		ti.nsigma = Norm(k, sigma);

		// adjust dimension corresponding to truncated bond and distribute singular values
		A0->dim[1] = k;
		const int perm2[2] = { 1, 0 };
		TransposeTensor(perm2, &s, &t);
		DeleteTensor(&s);
		t.dim[1] = k;
		if (svd_distr == SVD_DISTR_LEFT)
		{
			// distribute singular values to 'U' matrices from SVD
			for (i = 0; i < k; i++)
			{
				cblas_dscal((MKL_INT)(2*m), sigma[i], (double *)&A0->data[m*i], 1);
			}
		}
		else if (svd_distr == SVD_DISTR_RIGHT)
		{
			// distribute singular values to the 'V' matrices from SVD
			for (i = 0; i < k; i++)
			{
				cblas_dscal((MKL_INT)(2*n), sigma[i], (double *)&t.data[n*i], 1);
			}
		}
		else if (svd_distr == SVD_DISTR_SQRT)
		{
			// distribute square root of singular values to both 'U' and 'V' matrices from SVD
			for (i = 0; i < k; i++)
			{
				const double sqrt_sigma = sqrt(sigma[i]);
				cblas_dscal((MKL_INT)(2*m), sqrt_sigma, (double *)&A0->data[m*i], 1);
				cblas_dscal((MKL_INT)(2*n), sqrt_sigma, (double *)  &t.data[n*i], 1);
			}
		}
		else
		{
			// invalid option
			assert(false);
		}
		// undo transposition
		TransposeTensor(perm2, &t, &s);
		DeleteTensor(&t);
		MKL_free(superb);
		MKL_free(sigma);

		// restore original dimensions (except that shared bond dimension might have changed)
		const size_t dim0[4] = { dim[0], dim[1], dim[2], k };
		ReshapeTensor(4, dim0, A0);
		const size_t dim1[4] = { k, dim[3], dim[4], dim[5] };
		ReshapeTensor(4, dim1, &s);
		// reorder virtual bond dimension
		const int perm4[4] = { 2, 0, 1, 3 };
		TransposeTensor(perm4, &s, A1);
		DeleteTensor(&s);
	}

	return ti;
}


//________________________________________________________________________________________________________________________
///
/// \brief Local MPO update by two-site operator 'opT' from the top
///
trunc_info_t ApplyTwoSiteTopOperator(tensor_t *restrict A0, tensor_t *restrict A1, const tensor_t *restrict opT, const svd_distr_t svd_distr, const double tol, const size_t maxD)
{
	assert(A0->ndim == 4);
	assert(A1->ndim == 4);

	// set 'opB' to the identity
	tensor_t opB;
	const size_t d2 = A0->dim[1]*A1->dim[1];
	const size_t dim[2] = { d2, d2 };
	AllocateTensor(2, dim, &opB);
	IdentityTensor(&opB);

	trunc_info_t ti = ApplyTwoSiteOperator(A0, A1, opT, &opB, svd_distr, tol, maxD);
	
	DeleteTensor(&opB);

	return ti;
}


//________________________________________________________________________________________________________________________
///
/// \brief Local MPO update by two-site operator 'opB' from the bottom
///
trunc_info_t ApplyTwoSiteBottomOperator(tensor_t *restrict A0, tensor_t *restrict A1, const tensor_t *restrict opB, const svd_distr_t svd_distr, const double tol, const size_t maxD)
{
	assert(A0->ndim == 4);
	assert(A1->ndim == 4);

	// set 'opT' to the identity
	tensor_t opT;
	const size_t d2 = A0->dim[0]*A1->dim[0];
	const size_t dim[2] = { d2, d2 };
	AllocateTensor(2, dim, &opT);
	IdentityTensor(&opT);

	trunc_info_t ti = ApplyTwoSiteOperator(A0, A1, &opT, opB, svd_distr, tol, maxD);

	DeleteTensor(&opT);

	return ti;
}


//________________________________________________________________________________________________________________________
///
/// \brief Orthonormalize neighboring tensors and truncate bond dimensions using tolerance 'tol'
///
trunc_info_t OrthonormalizeTensorPair(tensor_t *restrict A0, tensor_t *restrict A1, const svd_distr_t svd_distr, const double tol, const size_t maxD)
{
	assert(A0->ndim == 4);
	assert(A1->ndim == 4);

	trunc_info_t ti = ApplyTwoSiteOperator(A0, A1, NULL, NULL, svd_distr, tol, maxD);

	return ti;
}


//________________________________________________________________________________________________________________________
///
/// \brief Orthonormalize the tensors in a MPO
///
trunc_info_t OrthonormalizeMPO(const double tol, const size_t maxD, mpo_t *restrict mpo)
{
	int i;

	// TODO: record largest effective tolerance instead?
	trunc_info_t ti;

	// sweep from left to right
	for (i = 0; i < mpo->L - 1; i++)
	{
		ti = OrthonormalizeTensorPair(&mpo->A[i], &mpo->A[i+1], SVD_DISTR_RIGHT, tol, maxD);
	}

	// sweep from right to left
	for (i = mpo->L - 2; i >= 0; i--)
	{
		ti = OrthonormalizeTensorPair(&mpo->A[i], &mpo->A[i+1], SVD_DISTR_LEFT, tol, maxD);
	}

	// truncation information from last tensor pair orthonormalization
	return ti;
}
