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

	double *id = MKL_malloc(d*d * sizeof(double), MEM_DATA_ALIGN);
	double *b  = MKL_malloc(d*d * sizeof(double), MEM_DATA_ALIGN);
	double *bd = MKL_malloc(d*d * sizeof(double), MEM_DATA_ALIGN);
	double *bn = MKL_malloc(d*d * sizeof(double), MEM_DATA_ALIGN);
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
	double *hs = MKL_malloc(d*d * sizeof(double), MEM_DATA_ALIGN);
	BoseInteractionOperator(d, hs);
	cblas_dscal((MKL_INT)(d*d), 0.5*U, hs, 1);
	cblas_daxpy((MKL_INT)(d*d), -mu, bn, 1, hs, 1);

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
