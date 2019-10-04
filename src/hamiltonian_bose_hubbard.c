/// \file hamiltonian_bose_hubbard.c
/// \brief Construct local Bose-Hubbard Hamiltonian operator terms

#include "hamiltonian_bose_hubbard.h"
#include "util.h"
#include <memory.h>
#include <assert.h>


//________________________________________________________________________________________________________________________
///
/// \brief Fill the bosonic creation operator matrix elements with maximal occupancy M = d - 1;
/// 'bd' must point to a d x d matrix
///
static void BoseCreationOperator(const size_t d, double *bd)
{
	memset(bd, 0, d*d * sizeof(double));

	size_t i;
	for (i = 0; i < d - 1; i++)
	{
		bd[(i+1) + i*d] = sqrt(1.0 + i);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Fill the bosonic annihilation operator matrix elements with maximal occupancy M = d - 1;
/// 'b' must point to a d x d matrix
///
static void BoseAnnihilationOperator(const size_t d, double *b)
{
	memset(b, 0, d*d * sizeof(double));

	size_t i;
	for (i = 0; i < d - 1; i++)
	{
		b[i + (i+1)*d] = sqrt(1.0 + i);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Fill the bosonic number operator matrix elements with maximal occupancy M = d - 1;
/// 'bn' must point to a d x d matrix
///
static void BoseNumberOperator(const size_t d, double *bn)
{
	memset(bn, 0, d*d * sizeof(double));

	size_t i;
	for (i = 0; i < d; i++)
	{
		bn[i + i*d] = (double)i;
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Fill the bosonic interaction operator 'n (n-1)' matrix elements with maximal occupancy M = d - 1;
/// 'bi' must point to a d x d matrix
///
static void BoseInteractionOperator(const size_t d, double *bi)
{
	memset(bi, 0, d*d * sizeof(double));

	size_t i;
	for (i = 0; i < d; i++)
	{
		bi[i + i*d] = (double)(i * (i - 1));
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Construct local Bose-Hubbard Hamiltonian operators
///
void ConstructLocalBoseHubbardOperators(const int L, const size_t M, const double t, const double U, const double mu, double **h)
{
	assert(L > 1);      // need at least 2 sites

	int i;

	const size_t d = M + 1;
	const size_t d2 = d*d;

	double *id = algn_malloc(d2 * sizeof(double));
	double *b  = algn_malloc(d2 * sizeof(double));
	double *bd = algn_malloc(d2 * sizeof(double));
	double *bn = algn_malloc(d2 * sizeof(double));
	RealIdentityMatrix(d, id);
	BoseAnnihilationOperator(d, b);
	BoseCreationOperator(d, bd);
	BoseNumberOperator(d, bn);

	// construct kinetic term -t (b^dagger b + b b^dagger)
	double *tkin = algn_calloc(d2*d2, sizeof(double));
	KroneckerProductRealSquare((MKL_INT)d, bd, b,  tkin);
	KroneckerProductRealSquare((MKL_INT)d, b,  bd, tkin);
	cblas_dscal((MKL_INT)(d2*d2), -t, tkin, 1);     // scale by -t

	// construct single-site term U/2 n (n - 1) - mu n
	double *hs = algn_malloc(d2 * sizeof(double));
	BoseInteractionOperator(d, hs);
	cblas_dscal((MKL_INT)d2, 0.5*U, hs, 1);
	cblas_daxpy((MKL_INT)d2, -mu, bn, 1, hs, 1);

	// Kronecker products of hs with identity matrix
	double *hs_id = algn_calloc(d2*d2, sizeof(double));
	double *id_hs = algn_calloc(d2*d2, sizeof(double));
	KroneckerProductRealSquare((MKL_INT)d, hs, id, hs_id);
	KroneckerProductRealSquare((MKL_INT)d, id, hs, id_hs);

	for (i = 0; i < L - 1; i++)
	{
		h[i] = algn_malloc(d2*d2 * sizeof(double));
		memcpy(h[i], tkin, d2*d2 * sizeof(double));
	}

	if (L == 2)
	{
		cblas_daxpy((MKL_INT)(d2*d2), 1.0, hs_id, 1, h[0], 1);
		cblas_daxpy((MKL_INT)(d2*d2), 1.0, id_hs, 1, h[0], 1);
	}
	else
	{
		// case i == 0
		{
			cblas_daxpy((MKL_INT)(d2*d2), 1.0, hs_id, 1, h[0], 1);
			cblas_daxpy((MKL_INT)(d2*d2), 0.5, id_hs, 1, h[0], 1);
		}

		// intermediate sites
		for (i = 1; i < L - 2; i++)
		{
			cblas_daxpy((MKL_INT)(d2*d2), 0.5, hs_id, 1, h[i], 1);
			cblas_daxpy((MKL_INT)(d2*d2), 0.5, id_hs, 1, h[i], 1);
		}

		// case i == L - 2
		{
			cblas_daxpy((MKL_INT)(d2*d2), 0.5, hs_id, 1, h[L-2], 1);
			cblas_daxpy((MKL_INT)(d2*d2), 1.0, id_hs, 1, h[L-2], 1);
		}
	}

	// clean up
	algn_free(id_hs);
	algn_free(hs_id);
	algn_free(hs);
	algn_free(tkin);
	algn_free(bn);
	algn_free(bd);
	algn_free(b);
	algn_free(id);
}


//________________________________________________________________________________________________________________________
///
/// \brief Delete local Bose-Hubbard Hamiltonian operators (free memory)
///
void DeleteLocalBoseHubbardOperators(const int L, double **h)
{
	int i;
	for (i = 0; i < L - 1; i++)
	{
		algn_free(h[i]);
		h[i] = NULL;
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Construct the local Bose-Hubbard energy operator
///
void ConstructLocalBoseHubbardEnergyOperator(const size_t M, const double t, const double U, double *h)
{
	const size_t d = M + 1;
	const size_t d2 = d*d;

	double *id = algn_malloc(d2 * sizeof(double));
	double *b  = algn_malloc(d2 * sizeof(double));
	double *bd = algn_malloc(d2 * sizeof(double));
	RealIdentityMatrix(d, id);
	BoseAnnihilationOperator(d, b);
	BoseCreationOperator(d, bd);

	// construct kinetic term -t (b^dagger b + b b^dagger)
	double *tkin = algn_calloc(d2*d2, sizeof(double));
	KroneckerProductRealSquare((MKL_INT)d, bd, b,  tkin);
	KroneckerProductRealSquare((MKL_INT)d, b,  bd, tkin);
	cblas_dscal((MKL_INT)(d2*d2), -t, tkin, 1);     // scale by -t

	// construct single-site term U/2 n (n - 1)
	double *hs = algn_malloc(d2 * sizeof(double));
	BoseInteractionOperator(d, hs);
	cblas_dscal((MKL_INT)d2, 0.5*U, hs, 1);

	// Kronecker products of hs with identity matrix
	double *hs_id = algn_calloc(d2*d2, sizeof(double));
	double *id_hs = algn_calloc(d2*d2, sizeof(double));
	KroneckerProductRealSquare((MKL_INT)d, hs, id, hs_id);
	KroneckerProductRealSquare((MKL_INT)d, id, hs, id_hs);

	// assemble local energy operator
	memcpy(h, tkin, d2*d2 * sizeof(double));
	cblas_daxpy((MKL_INT)(d2*d2), 0.5, hs_id, 1, h, 1);
	cblas_daxpy((MKL_INT)(d2*d2), 0.5, id_hs, 1, h, 1);

	// clean up
	algn_free(id_hs);
	algn_free(hs_id);
	algn_free(hs);
	algn_free(tkin);
	algn_free(bd);
	algn_free(b);
	algn_free(id);
}


//________________________________________________________________________________________________________________________
///
/// \brief Contruct matrix product operator representation of Bose-Hubbard Hamiltonian
///
void ConstructBoseHubbardMPO(const int L, const size_t M, const double t, const double U, const double mu, mpo_t *H)
{
	int i;
	const size_t d = M + 1;
	const size_t d2 = d*d;

	assert(L >= 2);

	// allocate matrix product operator
	{
		// virtual bond dimensions
		size_t *D = (size_t *)algn_malloc((L + 1)*sizeof(size_t));
		D[0] = 1;
		for (i = 1; i < L; i++) {
			D[i] = 4;
		}
		D[L] = 1;

		const size_t dim[2] = { d, d };
		AllocateMPO(L, dim, D, H);
		algn_free(D);

		// set quantum numbers

		// physical quantum numbers (occupation numbers)
		qnumber_t *qd = (qnumber_t *)algn_malloc(d * sizeof(qnumber_t));
		size_t j;
		for (j = 0; j < d; j++)
		{
			qd[j] = j;
		}
		memcpy(H->qd[0], qd, d*sizeof(qnumber_t));
		memcpy(H->qd[1], qd, d*sizeof(qnumber_t));
		algn_free(qd);

		// virtual bond quantum numbers
		const qnumber_t qD[] = { 0, 1, -1, 0 };
		for (i = 1; i < L; i++)
		{
			memcpy(H->qD[i], qD, 4*sizeof(qnumber_t));
		}
	}

	// identity and basic bosonic operators
	double *id = algn_malloc(d2 * sizeof(double));
	double *b  = algn_malloc(d2 * sizeof(double));
	double *bd = algn_malloc(d2 * sizeof(double));
	double *bn = algn_malloc(d2 * sizeof(double));
	RealIdentityMatrix(d, id);
	BoseAnnihilationOperator(d, b);
	BoseCreationOperator(d, bd);
	BoseNumberOperator(d, bn);

	// construct -t b_j and -t b^dagger_j operators
	double *tb  = algn_malloc(d2 * sizeof(double));
	double *tbd = algn_malloc(d2 * sizeof(double));
	memcpy(tb,  b,  d2 * sizeof(double));
	memcpy(tbd, bd, d2 * sizeof(double));
	cblas_dscal((MKL_INT)d2, -t, tb,  1);
	cblas_dscal((MKL_INT)d2, -t, tbd, 1);

	// construct single-site term U/2 n (n - 1) - mu n
	double *hs = algn_malloc(d2 * sizeof(double));
	BoseInteractionOperator(d, hs);
	cblas_dscal((MKL_INT)d2, 0.5*U, hs, 1);
	cblas_daxpy((MKL_INT)d2, -mu, bn, 1, hs, 1);

	// construct first 'W' tensor
	{
		CopyRealToComplexMatrix(d, d, hs,  d, &H->A[0].data[   0], d);
		CopyRealToComplexMatrix(d, d, tbd, d, &H->A[0].data[  d2], d);
		CopyRealToComplexMatrix(d, d, tb,  d, &H->A[0].data[2*d2], d);
		CopyRealToComplexMatrix(d, d, id,  d, &H->A[0].data[3*d2], d);
	}

	// construct intermediate 'W' tensors
	for (i = 1; i < L - 1; i++)
	{
		// first column block
		CopyRealToComplexMatrix(d, d, id,  d, &H->A[i].data[    0], d); // (0,0) block
		CopyRealToComplexMatrix(d, d, b,   d, &H->A[i].data[   d2], d); // (1,0) block
		CopyRealToComplexMatrix(d, d, bd,  d, &H->A[i].data[ 2*d2], d); // (2,0) block
		CopyRealToComplexMatrix(d, d, hs,  d, &H->A[i].data[ 3*d2], d); // (3,0) block

		// last row block
		CopyRealToComplexMatrix(d, d, tbd, d, &H->A[i].data[ 7*d2], d); // (3,1) block
		CopyRealToComplexMatrix(d, d, tb,  d, &H->A[i].data[11*d2], d); // (3,2) block
		CopyRealToComplexMatrix(d, d, id,  d, &H->A[i].data[15*d2], d); // (3,3) block

		// remaining blocks are zero
	}

	// construct last 'W' tensor
	{
		CopyRealToComplexMatrix(d, d, id,  d, &H->A[L-1].data[   0], d);
		CopyRealToComplexMatrix(d, d, b,   d, &H->A[L-1].data[  d2], d);
		CopyRealToComplexMatrix(d, d, bd,  d, &H->A[L-1].data[2*d2], d);
		CopyRealToComplexMatrix(d, d, hs,  d, &H->A[L-1].data[3*d2], d);
	}

	// clean up
	algn_free(hs);
	algn_free(tbd);
	algn_free(tb);
	algn_free(bn);
	algn_free(bd);
	algn_free(b);
	algn_free(id);
}
