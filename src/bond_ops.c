/// \file bond_ops.c
/// \brief Auxiliary data structures and functions concerning virtual bonds (taking quantum numbers into account)

#include "bond_ops.h"
#include "linalg.h"
#include "util.h"
#include "profiler.h"
#include "dupio.h"
#include <math.h>
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
/// \brief Compute the QR decomposition of a matrix 'A',
/// taking sparsity structure dictated by quantum numbers into account
///
void QRDecomposition(const tensor_t *restrict A, const qnumber_t *restrict q0, const qnumber_t *restrict q1, tensor_t *restrict Q, tensor_t *restrict R, qnumber_t *restrict *qinterm)
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
		// use dummy intermediate dimension 1 with all entries in 'R' set to zero

		const size_t dimQ[2] = { A->dim[0], 1 };
		const size_t dimR[2] = { 1, A->dim[1] };
		AllocateTensor(2, dimQ, Q);
		AllocateTensor(2, dimR, R);

		// single column of 'Q' should have norm 1
		Q->data[0] = 1;

		(*qinterm) = (qnumber_t *)algn_malloc(sizeof(qnumber_t));
		// ensure non-zero entry in 'Q' formally matches quantum numbers
		(*qinterm)[0] = q0[0];

		return;
	}

	// maximum intermediate dimension
	const size_t max_interm_dim = (A->dim[0] <= A->dim[1] ? A->dim[0] : A->dim[1]);

	// keep track of intermediate dimension
	size_t D = 0;

	// allocate 'Q' matrix (some of the columns might remain unused)
	{
		const size_t dimQ[2] = { A->dim[0], max_interm_dim };
		AllocateTensor(2, dimQ, Q);
	}

	// temporary 'R' matrix (some of the rows might remain unused)
	tensor_t Ri;
	{
		const size_t dimRi[2] = { max_interm_dim, A->dim[1] };
		AllocateTensor(2, dimRi, &Ri);
	}

	// corresponding quantum numbers (we might not use full length)
	(*qinterm) = algn_calloc(max_interm_dim, sizeof(qnumber_t));

	// for each shared quantum number...
	size_t i;
	#pragma omp parallel for schedule(dynamic)
	for (i = 0; i < nis; i++)
	{
		// indices of current quantum number
		size_t *i0 = (size_t *)algn_malloc(A->dim[0] * sizeof(size_t));
		size_t *i1 = (size_t *)algn_malloc(A->dim[1] * sizeof(size_t));

		StartProfilingBlock(&std_profiler, PROFILE_QR);

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

		// perform a QR decomposition
		size_t k = (m <= n ? m : n);    // min(m, n)
		double complex *tau = (double complex *)algn_malloc(k * sizeof(double complex));
		int info = LAPACKE_zgeqrf(LAPACK_COL_MAJOR, m, n, Asub.data, m, tau);
		if (info != 0) {
			duprintf("Call of LAPACK function 'zgeqrf()' in 'QRDecomposition()' failed, return value: %i\n", info);
			exit(-1);
		}

		size_t Dprev;
		#pragma omp atomic capture
		{
			Dprev = D;
			// update bond dimension
			D += k;
		}

		size_t l;

		// copy current 'R' matrix
		for (j = 0; j < n; j++)
		{
			const size_t l_max = (k-1 < j ? k-1 : j);
			for (l = 0; l <= l_max; l++)
			{
				Ri.data[(Dprev + l) + Ri.dim[0]*i1[j]] = Asub.data[l + m*j];
			}
		}

		// generate and copy current 'Q' matrix
		// 'Asub.data' is overwritten by 'Q' matrix
		info = LAPACKE_zungqr(LAPACK_COL_MAJOR, m, k, k, Asub.data, m, tau);
		for (l = 0; l < k; l++)
		{
			for (j = 0; j < m; j++)
			{
				Q->data[i0[j] + Q->dim[0]*(Dprev + l)] = Asub.data[j + m*l];
			}
		}

		// copy current quantum number
		for (l = 0; l < k; l++)
		{
			(*qinterm)[Dprev + l] = qis[i];
		}

		EndProfilingBlock(&std_profiler, PROFILE_QR);

		algn_free(tau);
		DeleteTensor(&Asub);
		algn_free(i1);
		algn_free(i0);
	}
	assert(D <= max_interm_dim);

	// truncate second dimension of 'Q' matrix
	Q->dim[1] = D;

	// allocate final 'R' matrix and copy entries
	{
		const size_t dimR[2] = { D, A->dim[1] };
		AllocateTensor(2, dimR, R);

		size_t j;
		for (j = 0; j < A->dim[1]; j++)
		{
			size_t l;
			for (l = 0; l < D; l++)
			{
				R->data[l + D*j] = Ri.data[l + Ri.dim[0]*j];
			}
		}
	}

	DeleteTensor(&Ri);
	algn_free(qis);
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
	val_idx_t *s_sort = (val_idx_t *)algn_malloc(n * sizeof(val_idx_t));
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
		algn_free(s_sort);

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
	double *accum = (double *)algn_malloc(n * sizeof(double));
	for (i = 0; i < n; i++)
	{
		accum[s_sort[i].i] = s_sort[i].v;
	}

	algn_free(s_sort);

	// indices of accumulated squares larger than tolerance
	// filter out singular values which are zero (almost) to machine precision
	const double tol_mzero = fmax(tol, 1e-28);
	(*indtr) = (size_t *)algn_malloc(n * sizeof(size_t));
	(*ntr) = 0;
	for (i = 0; i < n; i++)
	{
		if (accum[i] > tol_mzero)
		{
			(*indtr)[(*ntr)] = i;
			(*ntr)++;
		}
	}
	assert((*ntr) <= maxD);
	algn_free(accum);

	if ((*ntr) == 0)
	{
		// special case: all singular values truncated

		algn_free(*indtr);
		(*indtr) = NULL;

		ti.nsigma  = 0;
		ti.entropy = 0;
		return ti;
	}

	// record norm and von Neumann entropy of retained singular values
	double *retained = (double *)algn_malloc((*ntr) * sizeof(double));
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

	algn_free(retained);

	return ti;
}


//________________________________________________________________________________________________________________________
///
/// \brief Split a matrix 'A' by singular value decomposition
///
static trunc_info_t SplitMatrixBasic(const tensor_t *restrict A, const svd_distr_t svd_distr, const bond_op_params_t *restrict params, tensor_t *restrict A0, tensor_t *restrict A1)
{
	const size_t m = A->dim[0];
	const size_t n = A->dim[1];

	CopyTensor(A, A0);

	StartProfilingBlock(&std_profiler, PROFILE_SVD_BASIC);

	// overwrite 'A0' by the 'U' matrix
	size_t k = (m <= n ? m : n);    // min(m, n)
	double *sigma = algn_malloc(k * sizeof(double));
	double *superb = algn_malloc((k - 1) * sizeof(double));
	const size_t dim_kn[2] = { k, n };
	tensor_t Vt;
	AllocateTensor(2, dim_kn, &Vt);
	int info = LAPACKE_zgesvd(LAPACK_COL_MAJOR, 'O', 'S', (lapack_int)m, (lapack_int)n, A0->data, (lapack_int)m, sigma, NULL, (lapack_int)m, Vt.data, (lapack_int)k, superb);
	if (info != 0) {
		duprintf("Call of LAPACK function 'zgesvd()' in 'SplitMatrixBasic()' failed, return value: %i\n", info);
		exit(-1);
	}

	EndProfilingBlock(&std_profiler, PROFILE_SVD_BASIC);

	size_t i;

	// obtain indices of retained singular values
	trunc_info_t ti;
	{
		// 'k' gets overwritten by number of retained singular values
		size_t *indtr;
		ti = TruncatedBondIndices(k, sigma, params->tol, params->maxD, &indtr, &k);
		assert(k <= params->maxD);

		#ifdef _DEBUG
		// ensure that indices select first 'k' singular values
		for (i = 0; i < k; i++)
		{
			assert(indtr[i] == i);
		}
		#endif

		algn_free(indtr);
	}

	if (k == 0)
	{
		// use dummy bond dimension 1 with all entries set to zero

		const size_t dimA0[2] = { A->dim[0], 1 };
		const size_t dimA1[2] = { 1, A->dim[1] };
		AllocateTensor(2, dimA0, A0);
		AllocateTensor(2, dimA1, A1);

		// clean up
		DeleteTensor(&Vt);
		algn_free(superb);
		algn_free(sigma);

		return ti;
	}

	if (params->renormalize)
	{
		// norm of all singular values
		const double nsigma = Norm(Vt.dim[0], sigma);

		// rescale retained singular values
		assert(ti.nsigma > 0);
		const double scale = nsigma / ti.nsigma;
		for (i = 0; i < k; i++)
		{
			sigma[i] *= scale;
		}

		ti.nsigma = nsigma;
	}

	// adjust dimension corresponding to truncated bond and distribute singular values
	A0->dim[1] = k;
	const int perm2[2] = { 1, 0 };
	tensor_t V;
	TransposeTensor(perm2, &Vt, &V);
	DeleteTensor(&Vt);
	V.dim[1] = k;
	if (svd_distr == SVD_DISTR_LEFT)
	{
		// distribute singular values to 'U' matrices from SVD
		for (i = 0; i < k; i++)
		{
			cblas_dscal((int)(2*m), sigma[i], (double *)&A0->data[m*i], 1);
		}
	}
	else if (svd_distr == SVD_DISTR_RIGHT)
	{
		// distribute singular values to the 'V' matrices from SVD
		for (i = 0; i < k; i++)
		{
			cblas_dscal((int)(2*n), sigma[i], (double *)&V.data[n*i], 1);
		}
	}
	else if (svd_distr == SVD_DISTR_SQRT)
	{
		// distribute square root of singular values to both 'U' and 'V' matrices from SVD
		for (i = 0; i < k; i++)
		{
			const double sqrt_sigma = sqrt(sigma[i]);
			cblas_dscal((int)(2*m), sqrt_sigma, (double *)&A0->data[m*i], 1);
			cblas_dscal((int)(2*n), sqrt_sigma, (double *)  &V.data[n*i], 1);
		}
	}
	else
	{
		// invalid option
		assert(false);
	}
	algn_free(superb);
	algn_free(sigma);

	// transpose 'V' matrix and store result in 'A1'
	TransposeTensor(perm2, &V, A1);
	DeleteTensor(&V);

	return ti;
}


//________________________________________________________________________________________________________________________
///
/// \brief Split a matrix 'A' by singular value decompositions,
/// taking quantum numbers 'q0' and 'q1' of first and second dimension into account
///
trunc_info_t SplitMatrix(const tensor_t *restrict A, const qnumber_t *restrict q0, const qnumber_t *restrict q1, const svd_distr_t svd_distr, const bond_op_params_t *restrict params, tensor_t *restrict A0, tensor_t *restrict A1, qnumber_t *restrict *qbond)
{
	// must be a regular matrix
	assert(A->ndim == 2);

	// find common quantum numbers
	qnumber_t *qis;
	size_t nis;
	const bool single_qm = IntersectQuantumNumbers(q0, A->dim[0], q1, A->dim[1], &qis, &nis);

	if (nis == 0)
	{
		// special case: no common quantum numbers;
		// use dummy bond dimension 1 with all entries set to zero

		const size_t dimA0[2] = { A->dim[0], 1 };
		const size_t dimA1[2] = { 1, A->dim[1] };
		AllocateTensor(2, dimA0, A0);
		AllocateTensor(2, dimA1, A1);

		(*qbond) = (qnumber_t *)algn_calloc(1, sizeof(qnumber_t));

		trunc_info_t ti = { 0 };
		ti.tol_eff = params->tol;
		return ti;
	}

	if (single_qm)
	{
		// special case: just a single quantum number

		algn_free(qis);

		trunc_info_t ti = SplitMatrixBasic(A, svd_distr, params, A0, A1);
		assert(A0->dim[1] == A1->dim[0]);

		// fill bond quantum numbers with the single common quantum number
		(*qbond) = (qnumber_t *)algn_malloc(A0->dim[1] * sizeof(qnumber_t));
		size_t i;
		for (i = 0; i < A0->dim[1]; i++)
		{
			(*qbond)[i] = q0[0];
		}

		return ti;
	}

	StartProfilingBlock(&std_profiler, PROFILE_SPLIT_MATRIX);

	// maximum total number of singular values: min(A->dim[0], A->dim[1])
	const size_t max_bond_dim = (A->dim[0] <= A->dim[1] ? A->dim[0] : A->dim[1]);

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
	double    *S  = algn_malloc(max_bond_dim * sizeof(double));
	qnumber_t *qS = algn_malloc(max_bond_dim * sizeof(qnumber_t));

	// for each shared quantum number...
	size_t i;
	#pragma omp parallel for schedule(dynamic)
	for (i = 0; i < nis; i++)
	{
		size_t j;

		// indices of current quantum number
		size_t *i0 = (size_t *)algn_malloc(A->dim[0] * sizeof(size_t));
		size_t *i1 = (size_t *)algn_malloc(A->dim[1] * sizeof(size_t));

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

		StartProfilingBlock(&std_profiler, PROFILE_SVD_STANDARD);

		// perform a SVD to split the submatrix; overwrite 'Asub' by the 'U' matrix
		size_t k = (m <= n ? m : n);    // min(m, n)
		double *sigma = algn_malloc(k * sizeof(double));
		double *superb = algn_malloc((k - 1) * sizeof(double));
		tensor_t Vt;
		const size_t dim_kn[2] = { k, n };
		AllocateTensor(2, dim_kn, &Vt);
		int info = LAPACKE_zgesvd(LAPACK_COL_MAJOR, 'O', 'S', (lapack_int)m, (lapack_int)n, Asub.data, (lapack_int)m, sigma, NULL, (lapack_int)m, Vt.data, (lapack_int)k, superb);
		if (info != 0) {
			duprintf("Call of LAPACK function 'zgesvd()' in 'SplitMatrix()' failed, return value: %i\n", info);
			exit(-1);
		}

		EndProfilingBlock(&std_profiler, PROFILE_SVD_STANDARD);

		size_t Dprev;
		#pragma omp atomic capture
		{
			Dprev = D;
			// update bond dimension
			D += k;
		}

		assert(D <= max_bond_dim);

		// distribute entries of U to T0
		size_t l;
		for (l = 0; l < k; l++)
		{
			for (j = 0; j < m; j++)
			{
				T0.data[i0[j] + T0.dim[0]*(Dprev + l)] = Asub.data[j + m*l];
			}
		}
		// distribute entries of V^T to T1
		for (j = 0; j < n; j++)
		{
			for (l = 0; l < k; l++)
			{
				T1.data[(Dprev + l) + max_bond_dim*i1[j]] = Vt.data[l + k*j];
			}
		}

		// append singular values and copy current quantum number
		for (l = 0; l < k; l++)
		{
			 S[Dprev + l] = sigma[l];
			qS[Dprev + l] = qis[i];
		}

		DeleteTensor(&Vt);
		algn_free(superb);
		algn_free(sigma);
		DeleteTensor(&Asub);
		algn_free(i1);
		algn_free(i0);
	}

	algn_free(qis);

	// obtain truncated bond indices
	size_t *indtr;
	size_t Dtrunc;
	trunc_info_t ti = TruncatedBondIndices(D, S, params->tol, params->maxD, &indtr, &Dtrunc);
	assert(Dtrunc <= params->maxD);

	if (Dtrunc == 0)
	{
		// use dummy bond dimension 1 with all entries set to zero

		const size_t dimA0[2] = { A->dim[0], 1 };
		const size_t dimA1[2] = { 1, A->dim[1] };
		AllocateTensor(2, dimA0, A0);
		AllocateTensor(2, dimA1, A1);

		(*qbond) = (qnumber_t *)algn_calloc(1, sizeof(qnumber_t));

		// clean up
		algn_free(indtr);
		algn_free(qS);
		algn_free(S);
		DeleteTensor(&T1);
		DeleteTensor(&T0);

		EndProfilingBlock(&std_profiler, PROFILE_SPLIT_MATRIX);

		return ti;
	}

	if (params->renormalize)
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

		ti.nsigma = nsigma;
	}

	StartProfilingBlock(&std_profiler, PROFILE_SPLIT_REASSEMBLE);

	// extract truncated bond submatrices of T0 and T1 and store them in A0 and A1, respectively
	// set 'i0' and 'i1' to identity index sets
	size_t *i0 = (size_t *)algn_malloc(A->dim[0] * sizeof(size_t));
	size_t *i1 = (size_t *)algn_malloc(A->dim[1] * sizeof(size_t));
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
	algn_free(i1);
	algn_free(i0);

	// distribute singular values
	if (svd_distr == SVD_DISTR_LEFT)
	{
		// distribute singular values to A0 matrix
		for (i = 0; i < Dtrunc; i++)
		{
			cblas_dscal((int)(2*A0->dim[0]), S[indtr[i]], (double *)&A0->data[A0->dim[0]*i], 1);
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
				A1->data[i + Dtrunc*j] *= S[indtr[i]];
			}
		}
	}
	else if (svd_distr == SVD_DISTR_SQRT)
	{
		// distribute square root of singular values to both A0 and A1 matrices

		double *sqrt_sigma = (double *)algn_malloc(Dtrunc * sizeof(double));
		for (i = 0; i < Dtrunc; i++)
		{
			sqrt_sigma[i] = sqrt(S[indtr[i]]);
			cblas_dscal((int)(2*A0->dim[0]), sqrt_sigma[i], (double *)&A0->data[A0->dim[0]*i], 1);
		}

		size_t j;
		for (j = 0; j < A1->dim[1]; j++)
		{
			for (i = 0; i < Dtrunc; i++)
			{
				A1->data[i + Dtrunc*j] *= sqrt_sigma[i];
			}
		}

		algn_free(sqrt_sigma);
	}
	else
	{
		// invalid option
		assert(false);
	}

	// copy bond quantum numbers
	(*qbond) = (qnumber_t *)algn_malloc(Dtrunc * sizeof(qnumber_t));
	for (i = 0; i < Dtrunc; i++)
	{
		(*qbond)[i] = qS[indtr[i]];
	}

	EndProfilingBlock(&std_profiler, PROFILE_SPLIT_REASSEMBLE);

	// clean up
	algn_free(indtr);
	algn_free(qS);
	algn_free(S);
	DeleteTensor(&T1);
	DeleteTensor(&T0);

	EndProfilingBlock(&std_profiler, PROFILE_SPLIT_MATRIX);

	return ti;
}


//________________________________________________________________________________________________________________________
///
/// \brief "Compress" shared dimension in matrix product A0.A1, taking quantum numbers into account;
/// 'A0' and 'A1' matrices are overwritten
///
trunc_info_t CompressVirtualBonds(tensor_t *restrict A0, tensor_t *restrict A1,
	const qnumber_t *restrict q0, const qnumber_t *restrict q1, const qnumber_t *restrict q2,
	const svd_distr_t svd_distr, const bond_op_params_t *restrict params, qnumber_t *restrict *q1compr)
{
	assert(A0->ndim == 2);
	assert(A1->ndim == 2);
	assert(A0->dim[1] == A1->dim[0]);

	if (A0->dim[0] <= A0->dim[1] || A1->dim[1] <= A0->dim[1])
	{
		// if virtual bond dimension is large, simply form matrix product A0.A1 before splitting

		StartProfilingBlock(&std_profiler, PROFILE_COMPRESS_VIRTUAL_BONDS);

		tensor_t A;
		MultiplyTensor(A0, A1, 1, &A);
		DeleteTensor(A0);
		DeleteTensor(A1);

		trunc_info_t ti = SplitMatrix(&A, q0, q2, svd_distr, params, A0, A1, q1compr);

		DeleteTensor(&A);

		EndProfilingBlock(&std_profiler, PROFILE_COMPRESS_VIRTUAL_BONDS);

		return ti;
	}
	else
	{
		StartProfilingBlock(&std_profiler, PROFILE_COMPRESS_VIRTUAL_BONDS);

		const int perm[2] = { 1, 0 };

		// form QR decomposition of A0, to reduce SVD dimensions
		tensor_t Q0, R0;
		qnumber_t *qi0;
		{
			QRDecomposition(A0, q0, q1, &Q0, &R0, &qi0);
			DeleteTensor(A0);
		}

		// form QR decomposition of A1, to reduce SVD dimensions;
		// A1 = L1.Q1
		tensor_t Q1, L1;
		qnumber_t *qi1;
		{
			// A1^T
			tensor_t A1T;
			TransposeTensor(perm, A1, &A1T);
			DeleteTensor(A1);

			tensor_t QT1, RT1;
			QRDecomposition(&A1T, q2, q1, &QT1, &RT1, &qi1);
			DeleteTensor(&A1T);

			TransposeTensor(perm, &QT1, &Q1);
			DeleteTensor(&QT1);

			TransposeTensor(perm, &RT1, &L1);
			DeleteTensor(&RT1);
		}

		// R0.L1
		tensor_t RLprod;
		MultiplyTensor(&R0, &L1, 1, &RLprod);
		DeleteTensor(&R0);
		DeleteTensor(&L1);

		// split product of triangular matrices
		trunc_info_t ti = SplitMatrix(&RLprod, qi0, qi1, svd_distr, params, &R0, &L1, q1compr);
		DeleteTensor(&RLprod);

		// multiply by unitary Q matrices, to restore original matrices
		MultiplyTensor(&Q0, &R0, 1, A0);
		MultiplyTensor(&L1, &Q1, 1, A1);

		algn_free(qi0);
		algn_free(qi1);
		DeleteTensor(&Q0);
		DeleteTensor(&R0);
		DeleteTensor(&Q1);
		DeleteTensor(&L1);

		EndProfilingBlock(&std_profiler, PROFILE_COMPRESS_VIRTUAL_BONDS);

		return ti;
	}
}
