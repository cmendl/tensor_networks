/// \file hamiltonian.c
/// \brief Construct local Hamiltonian operator terms

#include "hamiltonian.h"
#include <mkl.h>
#include <math.h>
#include <memory.h>
#include <assert.h>


//________________________________________________________________________________________________________________________
///
/// \brief Construct local Heisenberg Hamiltonian operators
///
void ConstructLocalHeisenbergOperators(const int L, const double Jx, const double Jy, const double Jz, const double hext, double **h)
{
	assert(L > 1);      // need at least 2 sites

	if (L == 2)
	{
		const double hL2[4*4] = {
			Jz/4 - hext,      0,                0,                Jx/4 - Jy/4,
			0,               -Jz/4,             Jx/4 + Jy/4,      0,
			0,                Jx/4 + Jy/4,     -Jz/4,             0,
			Jx/4 - Jy/4,      0,                0,                Jz/4 + hext
		};

		h[0] = MKL_malloc(4*4 * sizeof(double), MEM_DATA_ALIGN);
		memcpy(h[0], hL2, 4*4 * sizeof(double));
	}
	else    // general case L > 2
	{
		const double hL[4*4] = {
			Jz/4 - 3*hext/4,  0,                0,                Jx/4 - Jy/4,
			0,               -Jz/4 + hext/4,    Jx/4 + Jy/4,      0,
			0,                Jx/4 + Jy/4,     -Jz/4 - hext/4,    0,
			Jx/4 - Jy/4,      0,                0,                Jz/4 + 3*hext/4
		};
		const double hI[4*4] = {
			Jz/4 - hext/2,    0,                0,                Jx/4 - Jy/4,
			0,               -Jz/4,             Jx/4 + Jy/4,      0,
			0,                Jx/4 + Jy/4,     -Jz/4,             0,
			Jx/4 - Jy/4,      0,                0,                Jz/4 + hext/2
		};
		const double hR[4*4] = {
			Jz/4 - 3*hext/4,  0,                0,                Jx/4 - Jy/4,
			0,               -Jz/4 - hext/4,    Jx/4 + Jy/4,      0,
			0,                Jx/4 + Jy/4,     -Jz/4 + hext/4,    0,
			Jx/4 - Jy/4,      0,                0,                Jz/4 + 3*hext/4
		};

		// leftmost two sites
		{
			h[0] = MKL_malloc(4*4 * sizeof(double), MEM_DATA_ALIGN);
			memcpy(h[0], hL,  4*4 * sizeof(double));
		}

		// intermediate sites
		int i;
		for (i = 1; i < L - 2; i++)
		{
			h[i] = MKL_malloc(4*4 * sizeof(double), MEM_DATA_ALIGN);
			memcpy(h[i], hI, 4*4 * sizeof(double));
		}

		// rightmost two sites
		{
			h[L-2] = MKL_malloc(4*4 * sizeof(double), MEM_DATA_ALIGN);
			memcpy(h[L-2], hR,  4*4 * sizeof(double));
		}
	}
}


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
/// \brief Set the matrix elements in 'id' to the identity matrix; 'id' must point to a d x d matrix
///
static void RealIdentityMatrix(const size_t d, double *id)
{
	memset(id, 0, d*d * sizeof(double));

	size_t i;
	for (i = 0; i < d; i++)
	{
		id[i + i*d] = 1;
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Compute the Kronecker product of two real square matrices of dimension d x d, and add to 'ret' (d^2 x d^2 matrix)
///
static void KroneckerProductRealSquare(const MKL_INT d, const double *restrict A, const double *restrict B, double *restrict ret)
{
	assert(d > 0);
	const MKL_INT d2 = d*d;

	MKL_INT i, j;
	for (j = 0; j < d; j++)
	{
		for (i = 0; i < d; i++)
		{
			cblas_dger(CblasColMajor, d, d, 1.0, &A[d*i], 1, &B[d*j], 1, &ret[(i + j*d)*d2], d);
		}
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

	double *id = MKL_malloc(d2 * sizeof(double), MEM_DATA_ALIGN);
	double *b  = MKL_malloc(d2 * sizeof(double), MEM_DATA_ALIGN);
	double *bd = MKL_malloc(d2 * sizeof(double), MEM_DATA_ALIGN);
	double *bn = MKL_malloc(d2 * sizeof(double), MEM_DATA_ALIGN);
	RealIdentityMatrix(d, id);
	BoseAnnihilationOperator(d, b);
	BoseCreationOperator(d, bd);
	BoseNumberOperator(d, bn);

	// construct kinetic term -t (b^dagger b + b b^dagger)
	double *tkin = MKL_calloc(d2*d2, sizeof(double), MEM_DATA_ALIGN);
	KroneckerProductRealSquare((MKL_INT)d, bd, b,  tkin);
	KroneckerProductRealSquare((MKL_INT)d, b,  bd, tkin);
	cblas_dscal((MKL_INT)(d2*d2), -t, tkin, 1);     // scale by -t

	// construct single-site term U/2 n (n - 1) - mu n
	double *hs = MKL_malloc(d2 * sizeof(double), MEM_DATA_ALIGN);
	BoseInteractionOperator(d, hs);
	cblas_dscal((MKL_INT)d2, 0.5*U, hs, 1);
	cblas_daxpy((MKL_INT)d2, -mu, bn, 1, hs, 1);

	// Kronecker products of hs with identity matrix
	double *hs_id = MKL_calloc(d2*d2, sizeof(double), MEM_DATA_ALIGN);
	double *id_hs = MKL_calloc(d2*d2, sizeof(double), MEM_DATA_ALIGN);
	KroneckerProductRealSquare((MKL_INT)d, hs, id, hs_id);
	KroneckerProductRealSquare((MKL_INT)d, id, hs, id_hs);

	for (i = 0; i < L - 1; i++)
	{
		h[i] = MKL_malloc(d2*d2 * sizeof(double), MEM_DATA_ALIGN);
		memcpy(h[i], tkin, d2*d2 * sizeof(double));
	}

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
	if (L > 2)
	{
		cblas_daxpy((MKL_INT)(d2*d2), 0.5, hs_id, 1, h[L-2], 1);
		cblas_daxpy((MKL_INT)(d2*d2), 1.0, id_hs, 1, h[L-2], 1);
	}

	// clean up
	MKL_free(id_hs);
	MKL_free(hs_id);
	MKL_free(hs);
	MKL_free(tkin);
	MKL_free(bn);
	MKL_free(bd);
	MKL_free(b);
	MKL_free(id);
}


//________________________________________________________________________________________________________________________
///
/// \brief Delete local Hamiltonian operators (free memory)
///
void DeleteLocalHamiltonianOperators(const int L, double **h)
{
	int i;
	for (i = 0; i < L - 1; i++)
	{
		MKL_free(h[i]);
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

	double *id = MKL_malloc(d2 * sizeof(double), MEM_DATA_ALIGN);
	double *b  = MKL_malloc(d2 * sizeof(double), MEM_DATA_ALIGN);
	double *bd = MKL_malloc(d2 * sizeof(double), MEM_DATA_ALIGN);
	RealIdentityMatrix(d, id);
	BoseAnnihilationOperator(d, b);
	BoseCreationOperator(d, bd);

	// construct kinetic term -t (b^dagger b + b b^dagger)
	double *tkin = MKL_calloc(d2*d2, sizeof(double), MEM_DATA_ALIGN);
	KroneckerProductRealSquare((MKL_INT)d, bd, b,  tkin);
	KroneckerProductRealSquare((MKL_INT)d, b,  bd, tkin);
	cblas_dscal((MKL_INT)(d2*d2), -t, tkin, 1);     // scale by -t

	// construct single-site term U/2 n (n - 1)
	double *hs = MKL_malloc(d2 * sizeof(double), MEM_DATA_ALIGN);
	BoseInteractionOperator(d, hs);
	cblas_dscal((MKL_INT)d2, 0.5*U, hs, 1);

	// Kronecker products of hs with identity matrix
	double *hs_id = MKL_calloc(d2*d2, sizeof(double), MEM_DATA_ALIGN);
	double *id_hs = MKL_calloc(d2*d2, sizeof(double), MEM_DATA_ALIGN);
	KroneckerProductRealSquare((MKL_INT)d, hs, id, hs_id);
	KroneckerProductRealSquare((MKL_INT)d, id, hs, id_hs);

	// assemble local energy operator
	memcpy(h, tkin, d2*d2 * sizeof(double));
	cblas_daxpy((MKL_INT)(d2*d2), 0.5, hs_id, 1, h, 1);
	cblas_daxpy((MKL_INT)(d2*d2), 0.5, id_hs, 1, h, 1);

	// clean up
	MKL_free(id_hs);
	MKL_free(hs_id);
	MKL_free(hs);
	MKL_free(tkin);
	MKL_free(bd);
	MKL_free(b);
	MKL_free(id);
}


//________________________________________________________________________________________________________________________
///
/// \brief Contruct matrix product operator representation of Heisenberg Hamiltonian (special case Jx == Jy)
///
void ConstructHeisenbergMPO(const int L, const double J, const double Jz, const double hext, mpo_t *H)
{
	int i;

	assert(L >= 2);

	// allocate matrix product operator
	{
		// virtual bond dimensions
		size_t *D = (size_t *)MKL_malloc((L + 1)*sizeof(size_t), MEM_DATA_ALIGN);
		D[0] = 1;
		for (i = 1; i < L; i++) {
			D[i] = 5;
		}
		D[L] = 1;

		const size_t dim[2] = { 2, 2 };
		AllocateMPO(L, dim, D, H);
		MKL_free(D);
	}

	// identity and basic spin operators (column major ordering)
	double  id[4] = { 1,   0,   0,   1   };
	double Sup[4] = { 0,   0,   1,   0   };
	double Sdn[4] = { 0,   1,   0,   0   };
	double  Sz[4] = { 0.5, 0,   0,  -0.5 };
	double negh_Sz[4];  memcpy(negh_Sz, Sz,  4*sizeof(double)); cblas_dscal(4, -hext, negh_Sz, 1);  //    -h Sz
	double J05_Sup[4];  memcpy(J05_Sup, Sup, 4*sizeof(double)); cblas_dscal(4, 0.5*J, J05_Sup, 1);  // 0.5*J Sup
	double J05_Sdn[4];  memcpy(J05_Sdn, Sdn, 4*sizeof(double)); cblas_dscal(4, 0.5*J, J05_Sdn, 1);  // 0.5*J Sdn
	double   Jz_Sz[4];  memcpy(  Jz_Sz,  Sz, 4*sizeof(double)); cblas_dscal(4,    Jz,   Jz_Sz, 1);  //    Jz Sz

	// construct first 'W' tensor
	{
		CopyRealToComplexMatrix(2, 2, negh_Sz, 2, &H->A[0].data[   0], 2);
		CopyRealToComplexMatrix(2, 2, J05_Sdn, 2, &H->A[0].data[   4], 2);
		CopyRealToComplexMatrix(2, 2, J05_Sup, 2, &H->A[0].data[ 2*4], 2);
		CopyRealToComplexMatrix(2, 2, Jz_Sz,   2, &H->A[0].data[ 3*4], 2);
		CopyRealToComplexMatrix(2, 2, id,      2, &H->A[0].data[ 4*4], 2);
	}

	// construct intermediate 'W' tensors
	for (i = 1; i < L - 1; i++)
	{
		// first column block
		CopyRealToComplexMatrix(2, 2, id,      2, &H->A[i].data[   0], 2);  // (0,0) block
		CopyRealToComplexMatrix(2, 2, Sup,     2, &H->A[i].data[   4], 2);  // (1,0) block
		CopyRealToComplexMatrix(2, 2, Sdn,     2, &H->A[i].data[ 2*4], 2);  // (2,0) block
		CopyRealToComplexMatrix(2, 2, Sz,      2, &H->A[i].data[ 3*4], 2);  // (3,0) block
		CopyRealToComplexMatrix(2, 2, negh_Sz, 2, &H->A[i].data[ 4*4], 2);  // (4,0) block

		// last row block
		CopyRealToComplexMatrix(2, 2, J05_Sdn, 2, &H->A[i].data[ 9*4], 2);  // (4,1) block
		CopyRealToComplexMatrix(2, 2, J05_Sup, 2, &H->A[i].data[14*4], 2);  // (4,2) block
		CopyRealToComplexMatrix(2, 2, Jz_Sz,   2, &H->A[i].data[19*4], 2);  // (4,3) block
		CopyRealToComplexMatrix(2, 2, id,      2, &H->A[i].data[24*4], 2);  // (4,4) block

		// remaining blocks are zero
	}

	// construct last 'W' tensor
	{
		CopyRealToComplexMatrix(2, 2, id,      2, &H->A[L-1].data[  0], 2);
		CopyRealToComplexMatrix(2, 2, Sup,     2, &H->A[L-1].data[  4], 2);
		CopyRealToComplexMatrix(2, 2, Sdn,     2, &H->A[L-1].data[2*4], 2);
		CopyRealToComplexMatrix(2, 2, Sz,      2, &H->A[L-1].data[3*4], 2);
		CopyRealToComplexMatrix(2, 2, negh_Sz, 2, &H->A[L-1].data[4*4], 2);
	}
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
		size_t *D = (size_t *)MKL_malloc((L + 1)*sizeof(size_t), MEM_DATA_ALIGN);
		D[0] = 1;
		for (i = 1; i < L; i++) {
			D[i] = 4;
		}
		D[L] = 1;

		const size_t dim[2] = { d, d };
		AllocateMPO(L, dim, D, H);
		MKL_free(D);
	}

	// identity and basic bosonic operators
	double *id = MKL_malloc(d2 * sizeof(double), MEM_DATA_ALIGN);
	double *b  = MKL_malloc(d2 * sizeof(double), MEM_DATA_ALIGN);
	double *bd = MKL_malloc(d2 * sizeof(double), MEM_DATA_ALIGN);
	double *bn = MKL_malloc(d2 * sizeof(double), MEM_DATA_ALIGN);
	RealIdentityMatrix(d, id);
	BoseAnnihilationOperator(d, b);
	BoseCreationOperator(d, bd);
	BoseNumberOperator(d, bn);

	// construct -t b_j and -t b^dagger_j operators
	double *tb  = MKL_malloc(d2 * sizeof(double), MEM_DATA_ALIGN);
	double *tbd = MKL_malloc(d2 * sizeof(double), MEM_DATA_ALIGN);
	memcpy(tb,  b,  d2 * sizeof(double));
	memcpy(tbd, bd, d2 * sizeof(double));
	cblas_dscal((MKL_INT)d2, -t, tb,  1);
	cblas_dscal((MKL_INT)d2, -t, tbd, 1);

	// construct single-site term U/2 n (n - 1) - mu n
	double *hs = MKL_malloc(d2 * sizeof(double), MEM_DATA_ALIGN);
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
	MKL_free(hs);
	MKL_free(tbd);
	MKL_free(tb);
	MKL_free(bn);
	MKL_free(bd);
	MKL_free(b);
	MKL_free(id);
}
