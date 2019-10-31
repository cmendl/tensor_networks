#include "hamiltonian_heisenberg.h"
#include "util.h"
#include <math.h>
#include <stdio.h>


//________________________________________________________________________________________________________________________
///
/// \brief Check whether solely entries corresponding to matching quantum numbers are non-zero
///
static double MPOBlockStructureError(const tensor_t *A, const qnumber_t *restrict qd[2], const qnumber_t *restrict qD0, const qnumber_t *restrict qD1)
{
	assert(A->ndim == 4);

	double err = 0;

	size_t i, j, k, l;
	for (l = 0; l < A->dim[3]; l++)
	{
		for (k = 0; k < A->dim[2]; k++)
		{
			for (j = 0; j < A->dim[1]; j++)
			{
				for (i = 0; i < A->dim[0]; i++)
				{
					if (qd[0][i] + qD0[k] != qd[1][j] + qD1[l])
					{
						err += cabs(A->data[i + A->dim[0]*(j + A->dim[1]*(k + A->dim[2]*l))]);
					}
				}
			}
		}
	}

	return err;
}


//________________________________________________________________________________________________________________________
//


int HamiltonianHeisenbergSpin1Test()
{
	int i;
	int status;

	// maximum error
	double err = 0;

	printf("Testing spin-1 Heisenberg Hamiltonian construction...\n");

	// dimensions
	const int L = 6;
	// Hamiltonian parameters
	const double Jx   =  7.0/10;
	const double Jy   = -5.0/13;
	const double Jz   = 11.0/8;
	const double J    = 14.0/25;    // for special case (Jx == Jy)
	const double hext =  3.0/7;

	// construct two-site Heisenberg Hamiltonian operators
	double **h = (double **)algn_malloc((L - 1)*sizeof(double *));
	ConstructLocalHeisenbergSpin1Operators(L, Jx, Jy, Jz, hext, h);

	// compare with reference
	for (i = 0; i < L - 1; i++)
	{
		// load reference two-site Hamiltonian operators from disk
		double *h_ref_i = (double *)algn_malloc(9*9*sizeof(double));
		char filename[1024];
		sprintf(filename, "../test/hamiltonian_heisenberg_spin1_test_h%i.dat", i);
		status = ReadData(filename, h_ref_i, sizeof(double), 9*9);
		if (status < 0) { return status; }

		// largest entrywise error
		int j;
		for (j = 0; j < 9*9; j++)
		{
			err = fmax(err, fabs(h[i][j] - h_ref_i[j]));
		}

		algn_free(h_ref_i);
	}

	// construct matrix product operator representation
	mpo_t mpoH;
	ConstructHeisenbergSpin1MPO(L, J, Jz, hext, &mpoH);

	// compare with reference
	for (i = 0; i < L; i++)
	{
		const size_t num = NumTensorElements(&mpoH.A[i]);

		// load reference 'W' tensor from disk
		double complex *W_ref_i = (double complex *)algn_malloc(num * sizeof(double complex));
		char filename[1024];
		sprintf(filename, "../test/hamiltonian_heisenberg_spin1_test_W%i.dat", i);
		status = ReadData(filename, W_ref_i, sizeof(double complex), num);
		if (status < 0) { return status; }

		// largest entrywise error
		err = fmax(err, UniformDistance(num, mpoH.A[i].data, W_ref_i));

		algn_free(W_ref_i);
	}

	// test block structure
	for (i = 0; i < L; i++)
	{
		err = fmax(err, MPOBlockStructureError(&mpoH.A[i], (const qnumber_t *restrict *)mpoH.qd, mpoH.qD[i], mpoH.qD[i+1]));
	}

	printf("Largest error: %g\n", err);

	// clean up
	DeleteMPO(&mpoH);
	DeleteLocalHeisenbergSpin1Operators(L, h);
	algn_free(h);

	return (err < 1e-15 ? 0 : 1);
}
