/// \file hamiltonian_ising.c
/// \brief Construct local Ising Hamiltonian operator terms

#include "hamiltonian_ising.h"
#include "util.h"
#include <memory.h>
#include <assert.h>


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

		h[0] = algn_malloc(4*4 * sizeof(double));
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
			h[0] = algn_malloc(4*4 * sizeof(double));
			memcpy(h[0], hL,  4*4 * sizeof(double));
		}

		// intermediate sites
		int i;
		for (i = 1; i < L - 2; i++)
		{
			h[i] = algn_malloc(4*4 * sizeof(double));
			memcpy(h[i], hI, 4*4 * sizeof(double));
		}

		// rightmost two sites
		{
			h[L-2] = algn_malloc(4*4 * sizeof(double));
			memcpy(h[L-2], hR,  4*4 * sizeof(double));
		}
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Delete local Ising Hamiltonian operators (free memory)
///
void DeleteLocalIsingOperators(const int L, double **h)
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
/// \brief Contruct matrix product operator representation of Ising Hamiltonian
///
void ConstructIsingMPO(const int L, const double J, const double hext, const double gext, mpo_t *H)
{
	int i;

	assert(L >= 2);

	// allocate matrix product operator
	{
		// virtual bond dimensions
		size_t *D = (size_t *)algn_malloc((L + 1)*sizeof(size_t));
		D[0] = 1;
		for (i = 1; i < L; i++) {
			D[i] = 3;
		}
		D[L] = 1;

		const size_t dim[2] = { 2, 2 };
		AllocateMPO(L, dim, D, H);
		algn_free(D);
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
