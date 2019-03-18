/// \file hamiltonian_fermi_hubbard.c
/// \brief Construct local Fermi-Hubbard Hamiltonian operator terms

#include "hamiltonian_fermi_hubbard.h"
#include "util.h"
#include <mkl.h>
#include <memory.h>
#include <assert.h>


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
/// \brief Delete local Fermi-Hubbard Hamiltonian operators (free memory)
///
void DeleteLocalFermiHubbardOperators(const int L, double **h)
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

		// physical quantum numbers (particle number and spin)
		const qnumber_t qd[4] = {
			( 0 << QNUMBER2_SHIFT) + 0, // |0>
			( 1 << QNUMBER2_SHIFT) + 1, // |up>
			( 1 << QNUMBER2_SHIFT) - 1, // |dn>
			( 2 << QNUMBER2_SHIFT) + 0, // |up,dn>
		};
		memcpy(H->qd[0], qd, 4*sizeof(qnumber_t));
		memcpy(H->qd[1], qd, 4*sizeof(qnumber_t));

		// virtual bond quantum numbers (particle number and spin)
		const qnumber_t qD[6] = {
			( 0 << QNUMBER2_SHIFT) + 0,
			( 1 << QNUMBER2_SHIFT) + 1,
			( 1 << QNUMBER2_SHIFT) - 1,
			(-1 << QNUMBER2_SHIFT) - 1,
			(-1 << QNUMBER2_SHIFT) + 1,
			( 0 << QNUMBER2_SHIFT) + 0,
		};
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
