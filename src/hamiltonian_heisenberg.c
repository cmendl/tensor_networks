/// \file hamiltonian_heisenberg.c
/// \brief Construct local Heisenberg Hamiltonian operator terms

#include "hamiltonian_heisenberg.h"
#include "linalg.h"
#include "util.h"
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

		h[0] = algn_malloc(4*4 * sizeof(double));
		memcpy(h[0], hL2,  4*4 * sizeof(double));
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
			h[0] = algn_malloc(4*4 * sizeof(double));
			memcpy(h[0], hL,   4*4 * sizeof(double));
		}

		// intermediate sites
		int i;
		for (i = 1; i < L - 2; i++)
		{
			h[i] = algn_malloc(4*4 * sizeof(double));
			memcpy(h[i], hI,   4*4 * sizeof(double));
		}

		// rightmost two sites
		{
			h[L-2] = algn_malloc(4*4 * sizeof(double));
			memcpy(h[L-2], hR,   4*4 * sizeof(double));
		}
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Delete local Heisenberg Hamiltonian operators (free memory)
///
void DeleteLocalHeisenbergOperators(const int L, double **h)
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
/// \brief Contruct matrix product operator representation of Heisenberg Hamiltonian (special case Jx == Jy)
///
void ConstructHeisenbergMPO(const int L, const double J, const double Jz, const double hext, mpo_t *H)
{
	int i;

	assert(L >= 2);

	// allocate matrix product operator
	{
		// virtual bond dimensions
		size_t *D = (size_t *)algn_malloc((L + 1)*sizeof(size_t));
		D[0] = 1;
		for (i = 1; i < L; i++) {
			D[i] = 5;
		}
		D[L] = 1;

		const size_t dim[2] = { 2, 2 };
		AllocateMPO(L, dim, D, H);
		algn_free(D);

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
/// \brief Construct local spin-1 Heisenberg Hamiltonian operators
///
void ConstructLocalHeisenbergSpin1Operators(const int L, const double Jx, const double Jy, const double Jz, const double hext, double **h)
{
	assert(L > 1);      // need at least 2 sites

	if (L == 2)
	{
		const double hL2[9*9] = {
			Jz - 2*hext,    0,              0,              0,              Jx/2 - Jy/2,    0,              0,              0,              0,
			0,             -hext,           0,              Jx/2 + Jy/2,    0,              Jx/2 - Jy/2,    0,              0,              0,
			0,              0,             -Jz,             0,              Jx/2 + Jy/2,    0,              0,              0,              0,
			0,              Jx/2 + Jy/2,    0,             -hext,           0,              0,              0,              Jx/2 - Jy/2,    0,
			Jx/2 - Jy/2,    0,              Jx/2 + Jy/2,    0,              0,              0,              Jx/2 + Jy/2,    0,              Jx/2 - Jy/2,
			0,              Jx/2 - Jy/2,    0,              0,              0,              hext,           0,              Jx/2 + Jy/2,    0,
			0,              0,              0,              0,              Jx/2 + Jy/2,    0,             -Jz,             0,              0,
			0,              0,              0,              Jx/2 - Jy/2,    0,              Jx/2 + Jy/2,    0,              hext,           0,
			0,              0,              0,              0,              Jx/2 - Jy/2,    0,              0,              0,              Jz + 2*hext
		};

		h[0] = algn_malloc(9*9 * sizeof(double));
		memcpy(h[0], hL2,  9*9 * sizeof(double));
	}
	else    // general case L > 2
	{
		const double hL[9*9] = {
			Jz - 3*hext/2,  0,              0,              0,              Jx/2 - Jy/2,    0,              0,              0,              0,
			0,             -hext/2,         0,              Jx/2 + Jy/2,    0,              Jx/2 - Jy/2,    0,              0,              0,
			0,              0,              hext/2 - Jz,    0,              Jx/2 + Jy/2,    0,              0,              0,              0,
			0,              Jx/2 + Jy/2,    0,             -hext,           0,              0,              0,              Jx/2 - Jy/2,    0,
			Jx/2 - Jy/2,    0,              Jx/2 + Jy/2,    0,              0,              0,              Jx/2 + Jy/2,    0,              Jx/2 - Jy/2,
			0,              Jx/2 - Jy/2,    0,              0,              0,              hext,           0,              Jx/2 + Jy/2,    0,
			0,              0,              0,              0,              Jx/2 + Jy/2,    0,             -Jz - hext/2,    0,              0,
			0,              0,              0,              Jx/2 - Jy/2,    0,              Jx/2 + Jy/2,    0,              hext/2,         0,
			0,              0,              0,              0,              Jx/2 - Jy/2,    0,              0,              0,              Jz + 3*hext/2
		};
		const double hI[9*9] = {
			Jz - hext,      0,              0,              0,              Jx/2 - Jy/2,    0,              0,              0,              0,
			0,             -hext/2,         0,              Jx/2 + Jy/2,    0,              Jx/2 - Jy/2,    0,              0,              0,
			0,              0,             -Jz,             0,              Jx/2 + Jy/2,    0,              0,              0,              0,
			0,              Jx/2 + Jy/2,    0,             -hext/2,         0,              0,              0,              Jx/2 - Jy/2,    0,
			Jx/2 - Jy/2,    0,              Jx/2 + Jy/2,    0,              0,              0,              Jx/2 + Jy/2,    0,              Jx/2 - Jy/2,
			0,              Jx/2 - Jy/2,    0,              0,              0,              hext/2,         0,              Jx/2 + Jy/2,    0,
			0,              0,              0,              0,              Jx/2 + Jy/2,    0,             -Jz,             0,              0,
			0,              0,              0,              Jx/2 - Jy/2,    0,              Jx/2 + Jy/2,    0,              hext/2,         0,
			0,              0,              0,              0,              Jx/2 - Jy/2,    0,              0,              0,              Jz + hext
		};
		const double hR[9*9] = {
			Jz - 3*hext/2,  0,              0,              0,              Jx/2 - Jy/2,    0,              0,              0,              0,
			0,             -hext,           0,              Jx/2 + Jy/2,    0,              Jx/2 - Jy/2,    0,              0,              0,
			0,              0,             -Jz - hext/2,    0,              Jx/2 + Jy/2,    0,              0,              0,              0,
			0,              Jx/2 + Jy/2,    0,             -hext/2,         0,              0,              0,              Jx/2 - Jy/2,    0,
			Jx/2 - Jy/2,    0,              Jx/2 + Jy/2,    0,              0,              0,              Jx/2 + Jy/2,    0,              Jx/2 - Jy/2,
			0,              Jx/2 - Jy/2,    0,              0,              0,              hext/2,         0,              Jx/2 + Jy/2,    0,
			0,              0,              0,              0,              Jx/2 + Jy/2,    0,              hext/2 - Jz,    0,              0,
			0,              0,              0,              Jx/2 - Jy/2,    0,              Jx/2 + Jy/2,    0,              hext,           0,
			0,              0,              0,              0,              Jx/2 - Jy/2,    0,              0,              0,              Jz + 3*hext/2
		};

		// leftmost two sites
		{
			h[0] = algn_malloc(9*9 * sizeof(double));
			memcpy(h[0], hL,   9*9 * sizeof(double));
		}

		// intermediate sites
		int i;
		for (i = 1; i < L - 2; i++)
		{
			h[i] = algn_malloc(9*9 * sizeof(double));
			memcpy(h[i], hI,   9*9 * sizeof(double));
		}

		// rightmost two sites
		{
			h[L-2] = algn_malloc(9*9 * sizeof(double));
			memcpy(h[L-2], hR,   9*9 * sizeof(double));
		}
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Delete local Heisenberg Hamiltonian operators (free memory)
///
void DeleteLocalHeisenbergSpin1Operators(const int L, double **h)
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
/// \brief Contruct matrix product operator representation of spin-1 Heisenberg Hamiltonian (special case Jx == Jy)
///
void ConstructHeisenbergSpin1MPO(const int L, const double J, const double Jz, const double hext, mpo_t *H)
{
	int i;

	assert(L >= 2);

	// allocate matrix product operator
	{
		// virtual bond dimensions
		size_t *D = (size_t *)algn_malloc((L + 1)*sizeof(size_t));
		D[0] = 1;
		for (i = 1; i < L; i++) {
			D[i] = 5;
		}
		D[L] = 1;

		const size_t dim[2] = { 3, 3 };
		AllocateMPO(L, dim, D, H);
		algn_free(D);

		// set quantum numbers

		// physical spin quantum numbers
		const qnumber_t qd[] = { 1, 0, -1 };
		memcpy(H->qd[0], qd, 3*sizeof(qnumber_t));
		memcpy(H->qd[1], qd, 3*sizeof(qnumber_t));

		// virtual bond quantum numbers
		const qnumber_t qD[] = { 0, -1, 1, 0, 0 };
		for (i = 1; i < L; i++)
		{
			memcpy(H->qD[i], qD, 5*sizeof(qnumber_t));
		}
	}

	// identity and basic spin operators (column major ordering)
	const double sq2 = sqrt(2.);
	double  id[9] = { 1,   0,   0,   0,   1,   0,   0,   0,   1 };
	double Sup[9] = { 0,   0,   0, sq2,   0,   0,   0, sq2,   0 };
	double Sdn[9] = { 0, sq2,   0,   0,   0, sq2,   0,   0,   0 };
	double  Sz[9] = { 1,   0,   0,   0,   0,   0,   0,   0,  -1 };
	double negh_Sz[9];  memcpy(negh_Sz, Sz,  9*sizeof(double)); cblas_dscal(9, -hext, negh_Sz, 1);  //    -h Sz
	double J05_Sup[9];  memcpy(J05_Sup, Sup, 9*sizeof(double)); cblas_dscal(9, 0.5*J, J05_Sup, 1);  // 0.5*J Sup
	double J05_Sdn[9];  memcpy(J05_Sdn, Sdn, 9*sizeof(double)); cblas_dscal(9, 0.5*J, J05_Sdn, 1);  // 0.5*J Sdn
	double   Jz_Sz[9];  memcpy(  Jz_Sz,  Sz, 9*sizeof(double)); cblas_dscal(9,    Jz,   Jz_Sz, 1);  //    Jz Sz

	// construct first 'W' tensor
	{
		CopyRealToComplexMatrix(3, 3, negh_Sz, 3, &H->A[0].data[   0], 3);
		CopyRealToComplexMatrix(3, 3, J05_Sdn, 3, &H->A[0].data[   9], 3);
		CopyRealToComplexMatrix(3, 3, J05_Sup, 3, &H->A[0].data[ 2*9], 3);
		CopyRealToComplexMatrix(3, 3, Jz_Sz,   3, &H->A[0].data[ 3*9], 3);
		CopyRealToComplexMatrix(3, 3, id,      3, &H->A[0].data[ 4*9], 3);
	}

	// construct intermediate 'W' tensors
	for (i = 1; i < L - 1; i++)
	{
		// first column block
		CopyRealToComplexMatrix(3, 3, id,      3, &H->A[i].data[   0], 3);  // (0,0) block
		CopyRealToComplexMatrix(3, 3, Sup,     3, &H->A[i].data[   9], 3);  // (1,0) block
		CopyRealToComplexMatrix(3, 3, Sdn,     3, &H->A[i].data[ 2*9], 3);  // (2,0) block
		CopyRealToComplexMatrix(3, 3, Sz,      3, &H->A[i].data[ 3*9], 3);  // (3,0) block
		CopyRealToComplexMatrix(3, 3, negh_Sz, 3, &H->A[i].data[ 4*9], 3);  // (4,0) block

		// last row block
		CopyRealToComplexMatrix(3, 3, J05_Sdn, 3, &H->A[i].data[ 9*9], 3);  // (4,1) block
		CopyRealToComplexMatrix(3, 3, J05_Sup, 3, &H->A[i].data[14*9], 3);  // (4,2) block
		CopyRealToComplexMatrix(3, 3, Jz_Sz,   3, &H->A[i].data[19*9], 3);  // (4,3) block
		CopyRealToComplexMatrix(3, 3, id,      3, &H->A[i].data[24*9], 3);  // (4,4) block

		// remaining blocks are zero
	}

	// construct last 'W' tensor
	{
		CopyRealToComplexMatrix(3, 3, id,      3, &H->A[L-1].data[  0], 3);
		CopyRealToComplexMatrix(3, 3, Sup,     3, &H->A[L-1].data[  9], 3);
		CopyRealToComplexMatrix(3, 3, Sdn,     3, &H->A[L-1].data[2*9], 3);
		CopyRealToComplexMatrix(3, 3, Sz,      3, &H->A[L-1].data[3*9], 3);
		CopyRealToComplexMatrix(3, 3, negh_Sz, 3, &H->A[L-1].data[4*9], 3);
	}
}
