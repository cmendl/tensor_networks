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
/// \brief Construct local operators for a Ising-type Hamiltonian with a longitudinal field
///
void ConstructLocalIsingOperators(const int L, const double J, const double hext, const double gext, double **h)
{
	assert(L > 1);      // need at least 2 sites

	if (L == 2)
	{
		const double hL2[4*4] = {
			J + 2*hext,       gext,             gext,             0,
			gext,            -J,                0,                gext,
			gext,             0,               -J,                gext,
			0,                gext,             gext,             J - 2*hext
		};

		h[0] = MKL_malloc(4*4 * sizeof(double), MEM_DATA_ALIGN);
		memcpy(h[0], hL2, 4*4 * sizeof(double));
	}
	else    // general case L > 2
	{
		const double hL[4*4] = {
			J + 3*hext/2,     gext,             gext/2,           0,
			gext,            -J - hext/2,       0,                gext/2,
			gext/2,           0,               -J + hext/2,       gext,
			0,                gext/2,           gext,             J - 3*hext/2
		};
		const double hI[4*4] = {
			J + hext,         gext/2,           gext/2,           0,
			gext/2,          -J,                0,                gext/2,
			gext/2,           0,               -J,                gext/2,
			0,                gext/2,           gext/2,           J - hext
		};
		const double hR[4*4] = {
			J + 3*hext/2,     gext/2,           gext,             0,
			gext/2,          -J + hext/2,       0,                gext,
			gext,             0,               -J - hext/2,       gext/2,
			0,                gext,             gext/2,           J - 3*hext/2
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
/// \brief Construct local Fermi-Hubbard Hamiltonian operators, using Jordan-Wigner transformation
///
/// Convention for local site basis is |0>, |up>, |dn>, |up,dn>
///
void ConstructLocalFermiHubbardOperators(const int L, const double t, const double U, const double mu, double **h)
{
	assert(L > 1);      // need at least 2 sites

	const double id[2*2] = { 1,  0,  0,  1 };   // 2 x 2 identity matrix
	const double ad[2*2] = { 0,  1,  0,  0 };   // creation operator
	const double a [2*2] = { 0,  0,  1,  0 };   // annihilation operator
	const double F [2*2] = { 1,  0,  0, -1 };   // Jordan-Wigner "F" operator (same as sigma_z)

	double adI[4*4] = { 0 };    KroneckerProductRealSquare(2, ad, id, adI);
	double a_I[4*4] = { 0 };    KroneckerProductRealSquare(2, a,  id, a_I);
	double Iad[4*4] = { 0 };    KroneckerProductRealSquare(2, id, ad, Iad);
	double I_a[4*4] = { 0 };    KroneckerProductRealSquare(2, id, a,  I_a);

	double adF[4*4] = { 0 };    KroneckerProductRealSquare(2, ad, F,  adF);
	double a_F[4*4] = { 0 };    KroneckerProductRealSquare(2, a,  F,  a_F);
	double Fad[4*4] = { 0 };    KroneckerProductRealSquare(2, F,  ad, Fad);
	double F_a[4*4] = { 0 };    KroneckerProductRealSquare(2, F,  a,  F_a);

	// construct kinetic term -t sum_{sigma = up,dn} (a^dagger_sigma F a_sigma + a_sigma F a^dagger_sigma)
	double tkin[16*16] = { 0 };
	KroneckerProductRealSquare(4, adF, a_I, tkin);
	KroneckerProductRealSquare(4, a_F, adI, tkin);
	KroneckerProductRealSquare(4, Iad, F_a, tkin);
	KroneckerProductRealSquare(4, I_a, Fad, tkin);
	cblas_dscal(16*16, -t, tkin, 1);    // scale by -t

	// construct single-site term U n_up n_dn - mu (n_up + n_dn)
	double hs[4*4] = { 0 };
	hs[1 + 4*1] =   -   mu;
	hs[2 + 4*2] =   -   mu;
	hs[3 + 4*3] = U - 2*mu;

	// Kronecker products of hs with identity matrix
	double id4[4*4];
	RealIdentityMatrix(4, id4);
	double hs_id[16*16] = { 0 };
	double id_hs[16*16] = { 0 };
	KroneckerProductRealSquare(4, hs, id4, hs_id);
	KroneckerProductRealSquare(4, id4, hs, id_hs);

	// assemble local operators

	int i;
	for (i = 0; i < L - 1; i++)
	{
		h[i] = MKL_malloc(16*16 * sizeof(double), MEM_DATA_ALIGN);
		memcpy(h[i], tkin, 16*16 * sizeof(double));
	}

	if (L == 2)
	{
		cblas_daxpy(16*16, 1.0, hs_id, 1, h[0], 1);
		cblas_daxpy(16*16, 1.0, id_hs, 1, h[0], 1);
	}
	else
	{
		// case i == 0
		{
			cblas_daxpy(16*16, 1.0, hs_id, 1, h[0], 1);
			cblas_daxpy(16*16, 0.5, id_hs, 1, h[0], 1);
		}

		// intermediate sites
		for (i = 1; i < L - 2; i++)
		{
			cblas_daxpy(16*16, 0.5, hs_id, 1, h[i], 1);
			cblas_daxpy(16*16, 0.5, id_hs, 1, h[i], 1);
		}

		// case i == L - 2
		{
			cblas_daxpy(16*16, 0.5, hs_id, 1, h[L-2], 1);
			cblas_daxpy(16*16, 1.0, id_hs, 1, h[L-2], 1);
		}
	}
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

		// set quantum numbers (scaled by 2 for integers)

		// physical spin quantum numbers
		const qnumber_t qd[] = { 1, -1 };
		memcpy(H->qd[0], qd, 2*sizeof(qnumber_t));
		memcpy(H->qd[1], qd, 2*sizeof(qnumber_t));

		// virtual bond quantum numbers
		const qnumber_t qD[] = { 0, -2, 2, 0, 0 };
		for (i = 1; i < L; i++)
		{
			memcpy(H->qD[i], qD, 5*sizeof(qnumber_t));
		}
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
/// \brief Contruct matrix product operator representation of Ising Hamiltonian
///
void ConstructIsingMPO(const int L, const double J, const double hext, const double gext, mpo_t *H)
{
	int i;

	assert(L >= 2);

	// allocate matrix product operator
	{
		// virtual bond dimensions
		size_t *D = (size_t *)MKL_malloc((L + 1)*sizeof(size_t), MEM_DATA_ALIGN);
		D[0] = 1;
		for (i = 1; i < L; i++) {
			D[i] = 3;
		}
		D[L] = 1;

		const size_t dim[2] = { 2, 2 };
		AllocateMPO(L, dim, D, H);
		MKL_free(D);
	}

	// identity and basic spin operators (column major ordering)
	double  id[4] = { 1,    0,    0,     1    };
	double  sz[4] = { 1,    0,    0,    -1    };
	double fld[4] = { hext, gext, gext, -hext };    // field term g sigma_x + h sigma_z
	double Jsz[4] = { J,    0,    0,    -J    };    // J sigma_z

	// construct first 'W' tensor
	{
		CopyRealToComplexMatrix(2, 2, fld, 2, &H->A[0].data[  0], 2);
		CopyRealToComplexMatrix(2, 2, Jsz, 2, &H->A[0].data[  4], 2);
		CopyRealToComplexMatrix(2, 2, id,  2, &H->A[0].data[2*4], 2);
	}

	// construct intermediate 'W' tensors
	for (i = 1; i < L - 1; i++)
	{
		// first column block
		CopyRealToComplexMatrix(2, 2, id,  2, &H->A[i].data[  0], 2);   // (0,0) block
		CopyRealToComplexMatrix(2, 2, sz,  2, &H->A[i].data[  4], 2);   // (1,0) block
		CopyRealToComplexMatrix(2, 2, fld, 2, &H->A[i].data[2*4], 2);   // (2,0) block

		// last row block
		CopyRealToComplexMatrix(2, 2, Jsz, 2, &H->A[i].data[5*4], 2);   // (2,1) block
		CopyRealToComplexMatrix(2, 2, id,  2, &H->A[i].data[8*4], 2);   // (2,2) block

		// remaining blocks are zero
	}

	// construct last 'W' tensor
	{
		CopyRealToComplexMatrix(2, 2, id,  2, &H->A[L-1].data[  0], 2);
		CopyRealToComplexMatrix(2, 2, sz,  2, &H->A[L-1].data[  4], 2);
		CopyRealToComplexMatrix(2, 2, fld, 2, &H->A[L-1].data[2*4], 2);
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

		// set quantum numbers

		// physical quantum numbers (occupation numbers)
		qnumber_t *qd = (qnumber_t *)MKL_malloc(d * sizeof(qnumber_t), MEM_DATA_ALIGN);
		size_t j;
		for (j = 0; j < d; j++)
		{
			qd[j] = j;
		}
		memcpy(H->qd[0], qd, d*sizeof(qnumber_t));
		memcpy(H->qd[1], qd, d*sizeof(qnumber_t));
		MKL_free(qd);

		// virtual bond quantum numbers
		const qnumber_t qD[] = { 0, 1, -1, 0 };
		for (i = 1; i < L; i++)
		{
			memcpy(H->qD[i], qD, 4*sizeof(qnumber_t));
		}
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


//________________________________________________________________________________________________________________________
///
/// \brief Contruct matrix product operator representation of Fermi-Hubbard Hamiltonian in one dimension with nearest neighbor hopping
///
void ConstructFermiHubbardMPO(const int L, const double t, const double U, const double mu, mpo_t *H)
{
	int i;

	assert(L >= 2);

	// allocate matrix product operator
	{
		// virtual bond dimensions
		size_t *D = (size_t *)MKL_malloc((L + 1)*sizeof(size_t), MEM_DATA_ALIGN);
		D[0] = 1;
		for (i = 1; i < L; i++) {
			D[i] = 6;
		}
		D[L] = 1;

		const size_t dim[2] = { 4, 4 };
		AllocateMPO(L, dim, D, H);
		MKL_free(D);

		// set quantum numbers

		// physical quantum numbers (occupation numbers)
		const qnumber_t qd[] = { 0, 1, 1, 2 };
		memcpy(H->qd[0], qd, 4*sizeof(qnumber_t));
		memcpy(H->qd[1], qd, 4*sizeof(qnumber_t));

		// virtual bond quantum numbers
		const qnumber_t qD[] = { 0, 1, 1, -1, -1, 0 };
		for (i = 1; i < L; i++)
		{
			memcpy(H->qD[i], qD, 6*sizeof(qnumber_t));
		}
	}

	const double id[2*2] = { 1,  0,  0,  1 };   // 2 x 2 identity matrix
	const double ad[2*2] = { 0,  1,  0,  0 };   // creation operator
	const double a [2*2] = { 0,  0,  1,  0 };   // annihilation operator
	const double F [2*2] = { 1,  0,  0, -1 };   // Jordan-Wigner "F" operator (same as sigma_z)

	double adI[4*4] = { 0 };    KroneckerProductRealSquare(2, ad, id, adI);
	double a_I[4*4] = { 0 };    KroneckerProductRealSquare(2, a,  id, a_I);
	double Iad[4*4] = { 0 };    KroneckerProductRealSquare(2, id, ad, Iad);
	double I_a[4*4] = { 0 };    KroneckerProductRealSquare(2, id, a,  I_a);

	double adF[4*4] = { 0 };    KroneckerProductRealSquare(2, ad, F,  adF);
	double a_F[4*4] = { 0 };    KroneckerProductRealSquare(2, a,  F,  a_F);
	double Fad[4*4] = { 0 };    KroneckerProductRealSquare(2, F,  ad, Fad);
	double F_a[4*4] = { 0 };    KroneckerProductRealSquare(2, F,  a,  F_a);

	// scale by -t
	double tadF[4*4];   memcpy(tadF, adF, 4*4 * sizeof(double));    cblas_dscal(4*4, -t, tadF, 1);
	double tIad[4*4];   memcpy(tIad, Iad, 4*4 * sizeof(double));    cblas_dscal(4*4, -t, tIad, 1);
	double ta_F[4*4];   memcpy(ta_F, a_F, 4*4 * sizeof(double));    cblas_dscal(4*4, -t, ta_F, 1);
	double tI_a[4*4];   memcpy(tI_a, I_a, 4*4 * sizeof(double));    cblas_dscal(4*4, -t, tI_a, 1);

	// construct single-site term U n_up n_dn - mu (n_up + n_dn)
	double hs[4*4] = { 0 };
	hs[1 + 4*1] =   -   mu;
	hs[2 + 4*2] =   -   mu;
	hs[3 + 4*3] = U - 2*mu;

	double id4[4*4];
	RealIdentityMatrix(4, id4);

	// construct first 'W' tensor (same as last row block in intermediate 'W' tensors)
	{
		CopyRealToComplexMatrix(4, 4, hs,   4, &H->A[0].data[   0], 4);
		CopyRealToComplexMatrix(4, 4, tadF, 4, &H->A[0].data[  16], 4);
		CopyRealToComplexMatrix(4, 4, tIad, 4, &H->A[0].data[2*16], 4);
		CopyRealToComplexMatrix(4, 4, ta_F, 4, &H->A[0].data[3*16], 4);
		CopyRealToComplexMatrix(4, 4, tI_a, 4, &H->A[0].data[4*16], 4);
		CopyRealToComplexMatrix(4, 4, id4,  4, &H->A[0].data[5*16], 4);
	}

	// construct intermediate 'W' tensors
	for (i = 1; i < L - 1; i++)
	{
		// first column block
		CopyRealToComplexMatrix(4, 4, id4,  4, &H->A[i].data[    0], 4);    // (0,0) block
		CopyRealToComplexMatrix(4, 4, a_I,  4, &H->A[i].data[   16], 4);    // (1,0) block
		CopyRealToComplexMatrix(4, 4, F_a,  4, &H->A[i].data[ 2*16], 4);    // (2,0) block
		CopyRealToComplexMatrix(4, 4, adI,  4, &H->A[i].data[ 3*16], 4);    // (3,0) block
		CopyRealToComplexMatrix(4, 4, Fad,  4, &H->A[i].data[ 4*16], 4);    // (4,0) block
		CopyRealToComplexMatrix(4, 4, hs,   4, &H->A[i].data[ 5*16], 4);    // (5,0) block

		// last row block
		CopyRealToComplexMatrix(4, 4, tadF, 4, &H->A[i].data[11*16], 4);    // (5,1) block
		CopyRealToComplexMatrix(4, 4, tIad, 4, &H->A[i].data[17*16], 4);    // (5,2) block
		CopyRealToComplexMatrix(4, 4, ta_F, 4, &H->A[i].data[23*16], 4);    // (5,3) block
		CopyRealToComplexMatrix(4, 4, tI_a, 4, &H->A[i].data[29*16], 4);    // (5,4) block
		CopyRealToComplexMatrix(4, 4, id4,  4, &H->A[i].data[35*16], 4);    // (5,5) block

		// remaining blocks are zero
	}

	// construct last 'W' tensor (same as first column block in intermediate 'W' tensors)
	{
		CopyRealToComplexMatrix(4, 4, id4,  4, &H->A[L-1].data[   0], 4);
		CopyRealToComplexMatrix(4, 4, a_I,  4, &H->A[L-1].data[  16], 4);
		CopyRealToComplexMatrix(4, 4, F_a,  4, &H->A[L-1].data[2*16], 4);
		CopyRealToComplexMatrix(4, 4, adI,  4, &H->A[L-1].data[3*16], 4);
		CopyRealToComplexMatrix(4, 4, Fad,  4, &H->A[L-1].data[4*16], 4);
		CopyRealToComplexMatrix(4, 4, hs,   4, &H->A[L-1].data[5*16], 4);
	}
}
