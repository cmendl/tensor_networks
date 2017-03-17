/// \file bond_ops.c
/// \brief Auxiliary data structures and functions concerning virtual bonds (taking quantum numbers into account)

#include "bond_ops.h"
#include "dupio.h"
#include <mkl.h>
#include <memory.h>


//________________________________________________________________________________________________________________________
///
/// \brief Compute the von Neumann entropy of singular values 'lambda'
///
double VonNeumannEntropy(const size_t n, const double *restrict lambda)
{
	double S = 0;

	size_t i;
	for (i = 0; i < n; i++)
	{
		const double lsq = lambda[i]*lambda[i];
		S -= lsq * log(lsq);
	}

	return S;
}


//________________________________________________________________________________________________________________________
///
/// \brief Temporary value-index type
///
typedef struct
{
	double v;   //!< value
	size_t i;   //!< index
}
val_idx_t;


//________________________________________________________________________________________________________________________
///
/// \brief Comparison function used by 'qsort'
///
static int CompareValue(const void *p1, const void *p2)
{
	const val_idx_t *x = (val_idx_t *)p1;
	const val_idx_t *y = (val_idx_t *)p2;

	if (x->v < y->v)
	{
		return -1;
	}
	else if (y->v < x->v)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Truncate singular values based on given tolerance 'tol' and length cut-off 'maxD';
/// singular values need not be sorted at input
///
trunc_info_t TruncatedBondIndices(const size_t n, const double *restrict sigma, const double tol, const size_t maxD, size_t *restrict *indtr, size_t *restrict ntr)
{
	assert(tol >= 0);

	size_t i;

	trunc_info_t ti;
	ti.tol_eff = tol;

	// distribute singular values into value-index pairs and sort them
	val_idx_t *s_sort = (val_idx_t *)MKL_malloc(n * sizeof(val_idx_t), MEM_DATA_ALIGN);
	for (i = 0; i < n; i++)
	{
		s_sort[i].v = sigma[i];
		s_sort[i].i = i;
	}
	qsort(s_sort, n, sizeof(val_idx_t), CompareValue);

	// square and normalize singular values (we sort them first and start with the smallest value to increase accuracy)
	double sqsum = 0;
	for (i = 0; i < n; i++)
	{
		s_sort[i].v = square(s_sort[i].v);
		sqsum += s_sort[i].v;
	}
	// special case: all singular values zero
	if (sqsum == 0)
	{
		(*indtr) = NULL;
		(*ntr)   = 0;

		ti.nsigma  = 0;
		ti.entropy = 0;
		return ti;
	}
	for (i = 0; i < n; i++)
	{
		s_sort[i].v /= sqsum;
	}

	// accumulate squares
	for (i = 1; i < n; i++)
	{
		s_sort[i].v += s_sort[i - 1].v;
	}

	if (maxD < n)
	{
		// effective tolerance: maximum of specified tolerance and accumulated squared singular values which we cut off
		ti.tol_eff = fmax(tol, s_sort[n - maxD - 1].v);

		// set accumulated squares which are cut-off by 'maxD' to zero
		for (i = 0; i < n - maxD; i++)
		{
			s_sort[i].v = 0;
		}
	}

	// restore original ordering of accumulated squares
	double *accum = (double *)MKL_malloc(n * sizeof(double), MEM_DATA_ALIGN);
	for (i = 0; i < n; i++)
	{
		accum[s_sort[i].i] = s_sort[i].v;
	}

	MKL_free(s_sort);

	// indices of accumulated squares larger than tolerance
	(*indtr) = (size_t *)MKL_malloc(n * sizeof(size_t), MEM_DATA_ALIGN);
	(*ntr) = 0;
	for (i = 0; i < n; i++)
	{
		if (accum[i] > tol)
		{
			(*indtr)[(*ntr)] = i;
			(*ntr)++;
		}
	}
	assert((*ntr) <= maxD);
	MKL_free(accum);

	if ((*ntr) == 0)
	{
		// special case: all singular values truncated

		MKL_free(*indtr);
		(*indtr) = NULL;

		ti.nsigma  = 0;
		ti.entropy = 0;
		return ti;
	}

	// record norm and von Neumann entropy of retained singular values
	double *retained = (double *)MKL_malloc((*ntr) * sizeof(double), MEM_DATA_ALIGN);
	for (i = 0; i < (*ntr); i++)
	{
		retained[i] = sigma[(*indtr)[i]];
	}
	ti.nsigma = Norm((*ntr), retained);

	// normalized retained singular values
	for (i = 0; i < (*ntr); i++)
	{
		retained[i] /= ti.nsigma;
	}

	ti.entropy = VonNeumannEntropy((*ntr), retained);

	MKL_free(retained);

	return ti;
}


//________________________________________________________________________________________________________________________
///
/// \brief Split a matrix 'A' by singular value decompositions,
/// taking quantum numbers 'q0' and 'q2' of first and second dimension into account
///
trunc_info_t SplitMatrix(const tensor_t *restrict A, const qnumber_t *restrict q0, const qnumber_t *restrict q1, const svd_distr_t svd_distr, const double tol, const size_t maxD, const bool renormalize, tensor_t *restrict A0, tensor_t *restrict A1, qnumber_t *restrict *qbond)
{
	// must be a regular matrix
	assert(A->ndim == 2);

	// find common quantum numbers
	qnumber_t *qis;
	size_t nis;
	IntersectQuantumNumbers(q0, A->dim[0], q1, A->dim[1], &qis, &nis);

	if (nis == 0)
	{
		// special case: no common quantum numbers;
		// use dummy bond dimension 1 with all entries set to zero

		const size_t dimA0[2] = { A->dim[0], 1 };
		const size_t dimA1[2] = { 1, A->dim[1] };
		AllocateTensor(2, dimA0, A0);
		AllocateTensor(2, dimA1, A1);

		(*qbond) = (qnumber_t *)MKL_calloc(1, sizeof(qnumber_t), MEM_DATA_ALIGN);

		trunc_info_t ti = { 0 };
		ti.tol_eff = tol;
		return ti;
	}

	// indices of current quantum number
	size_t *i0 = (size_t *)MKL_malloc(A->dim[0] * sizeof(size_t), MEM_DATA_ALIGN);
	size_t *i1 = (size_t *)MKL_malloc(A->dim[1] * sizeof(size_t), MEM_DATA_ALIGN);

	// maximum total number of singular values: min(A->dim[0], A->dim[1])
	const size_t max_bond_dim = (A->dim[1] < A->dim[0] ? A->dim[0] : A->dim[1]);

	// keep track of actual bond dimension
	size_t D = 0;

	// temporary tensors storing the SVDs of the submatrices
	tensor_t T0, T1;
	{
		const size_t dimT0[2] = { A->dim[0], max_bond_dim };
		AllocateTensor(2, dimT0, &T0);

		const size_t dimT1[2] = { max_bond_dim, A->dim[1] };
		AllocateTensor(2, dimT1, &T1);
	}
	// corresponding singular values and quantum numbers
	double    *S  = MKL_malloc(max_bond_dim * sizeof(double), MEM_DATA_ALIGN);
	qnumber_t *qS = MKL_malloc(max_bond_dim * sizeof(qnumber_t), MEM_DATA_ALIGN);

	// for each shared quantum number...
	size_t i;
	for (i = 0; i < nis; i++)
	{
		size_t j;

		// subindices of current quantum number qis[i]
		size_t m = 0;
		for (j = 0; j < A->dim[0]; j++)
		{
			if (q0[j] == qis[i])
			{
				i0[m] = j;
				m++;
			}
		}
		size_t n = 0;
		for (j = 0; j < A->dim[1]; j++)
		{
			if (q1[j] == qis[i])
			{
				i1[n] = j;
				n++;
			}
		}
		assert(m > 0 && n > 0);

		// extract submatrix
		tensor_t Asub;
		const size_t *restrict idx[2] = { i0, i1 };
		const size_t sdim[2] = { m, n };
		SubTensor(A, sdim, idx, &Asub);

		// perform a SVD to split the submatrix; overwrite 'Asub' by the 'U' matrix
		size_t k = (m <= n ? m : n);    // min(m, n)
		double *sigma = MKL_malloc(k * sizeof(double), MEM_DATA_ALIGN);
		double *superb = MKL_malloc((k - 1) * sizeof(double), MEM_DATA_ALIGN);
		tensor_t Vt;
		const size_t dim_kn[2] = { k, n };
		AllocateTensor(2, dim_kn, &Vt);
		int info = LAPACKE_zgesvd(LAPACK_COL_MAJOR, 'O', 'S', (lapack_int)m, (lapack_int)n, Asub.data, (lapack_int)m, sigma, NULL, (lapack_int)m, Vt.data, (lapack_int)k, superb);
		if (info != 0) {
			duprintf("Call of LAPACK function 'zgesvd()' in 'SplitMatrix()' failed, return value: %i\n", info);
			exit(-1);
		}

		assert(D + k <= max_bond_dim);

		// distribute entries of U to T0
		size_t l;
		for (l = 0; l < k; l++)
		{
			for (j = 0; j < m; j++)
			{
				T0.data[i0[j] + T0.dim[0]*(D + l)] = Asub.data[j + m*l];
			}
		}
		// distribute entries of V^T to T1
		for (j = 0; j < n; j++)
		{
			for (l = 0; l < k; l++)
			{
				T1.data[(D + l) + max_bond_dim*i1[j]] = Vt.data[l + k*j];
			}
		}

		// append singular values and copy current quantum number
		for (l = 0; l < k; l++)
		{
			 S[D + l] = sigma[l];
			qS[D + l] = qis[i];
		}

		// update bond dimension
		D += k;

		DeleteTensor(&Vt);
		MKL_free(superb);
		MKL_free(sigma);
		DeleteTensor(&Asub);
	}

	MKL_free(qis);

	// obtain truncated bond indices
	size_t *indtr;
	size_t Dtrunc;
	trunc_info_t ti = TruncatedBondIndices(D, S, tol, maxD, &indtr, &Dtrunc);
	assert(Dtrunc <= maxD);

	if (Dtrunc == 0)
	{
		// use dummy bond dimension 1 with all entries set to zero

		const size_t dimA0[2] = { A->dim[0], 1 };
		const size_t dimA1[2] = { 1, A->dim[1] };
		AllocateTensor(2, dimA0, A0);
		AllocateTensor(2, dimA1, A1);

		(*qbond) = (qnumber_t *)MKL_calloc(1, sizeof(qnumber_t), MEM_DATA_ALIGN);

		// clean up
		MKL_free(indtr);
		MKL_free(qS);
		MKL_free(S);
		DeleteTensor(&T1);
		DeleteTensor(&T0);
		MKL_free(i1);
		MKL_free(i0);

		return ti;
	}

	if (renormalize)
	{
		// norm of all singular values
		const double nsigma = Norm(D, S);

		// rescale retained singular values
		assert(ti.nsigma > 0);
		const double scale = nsigma / ti.nsigma;
		for (i = 0; i < Dtrunc; i++)
		{
			S[indtr[i]] *= scale;
		}
	}

	// extract truncated bond submatrices of T0 and T1 and store them in A0 and A1, respectively
	// set 'i0' and 'i1' to identity index sets
	for (i = 0; i < A->dim[0]; i++)
	{
		i0[i] = i;
	}
	for (i = 0; i < A->dim[1]; i++)
	{
		i1[i] = i;
	}
	// A0 = T0[:,indtr]
	{
		const size_t *restrict idx[2] = { i0, indtr };
		const size_t sdim[2] = { A->dim[0], Dtrunc };
		SubTensor(&T0, sdim, idx, A0);
	}
	// A1 = T1[indtr,:]
	{
		const size_t *restrict idx[2] = { indtr, i1 };
		const size_t sdim[2] = { Dtrunc, A->dim[1] };
		SubTensor(&T1, sdim, idx, A1);
	}

	// distribute singular values
	if (svd_distr == SVD_DISTR_LEFT)
	{
		// distribute singular values to A0 matrix
		for (i = 0; i < Dtrunc; i++)
		{
			cblas_dscal((MKL_INT)(2*A0->dim[0]), S[indtr[i]], (double *)&A0->data[A0->dim[0]*i], 1);
		}
	}
	else if (svd_distr == SVD_DISTR_RIGHT)
	{
		// distribute singular values to A1 matrix
		size_t j;
		for (j = 0; j < A1->dim[1]; j++)
		{
			for (i = 0; i < Dtrunc; i++)
			{
				A1->data[i + Dtrunc*j].real *= S[indtr[i]];
				A1->data[i + Dtrunc*j].imag *= S[indtr[i]];
			}
		}
	}
	else if (svd_distr == SVD_DISTR_SQRT)
	{
		// distribute square root of singular values to both A0 and A1 matrices

		double *sqrt_sigma = (double *)MKL_malloc(Dtrunc * sizeof(double), MEM_DATA_ALIGN);
		for (i = 0; i < Dtrunc; i++)
		{
			sqrt_sigma[i] = sqrt(S[indtr[i]]);
			cblas_dscal((MKL_INT)(2*A0->dim[0]), sqrt_sigma[i], (double *)&A0->data[A0->dim[0]*i], 1);
		}

		size_t j;
		for (j = 0; j < A1->dim[1]; j++)
		{
			for (i = 0; i < Dtrunc; i++)
			{
				A1->data[i + Dtrunc*j].real *= sqrt_sigma[i];
				A1->data[i + Dtrunc*j].imag *= sqrt_sigma[i];
			}
		}

		MKL_free(sqrt_sigma);
	}
	else
	{
		// invalid option
		assert(false);
	}

	// copy bond quantum numbers
	(*qbond) = (qnumber_t *)MKL_malloc(Dtrunc * sizeof(qnumber_t), MEM_DATA_ALIGN);
	for (i = 0; i < Dtrunc; i++)
	{
		(*qbond)[i] = qS[indtr[i]];
	}

	// clean up
	MKL_free(indtr);
	MKL_free(qS);
	MKL_free(S);
	DeleteTensor(&T1);
	DeleteTensor(&T0);
	MKL_free(i1);
	MKL_free(i0);

	return ti;
}
