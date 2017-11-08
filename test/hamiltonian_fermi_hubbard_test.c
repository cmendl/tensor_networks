#include "hamiltonian.h"
#include "complex.h"
#include "util.h"
#include <mkl.h>
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
						err += ComplexAbs(A->data[i + A->dim[0]*(j + A->dim[1]*(k + A->dim[2]*l))]);
					}
				}
			}
		}
	}

	return err;
}


//________________________________________________________________________________________________________________________
//


int HamiltonianFermiHubbardTest()
{
	int i;
	int status;

	// maximum error
	double err = 0;

	printf("Testing Fermi-Hubbard Hamiltonian construction...\n");

	// number of lattice sites
	const int L = 5;
	// Hamiltonian parameters
	const double t  = 1.2;
	const double U  = 2.7;
	const double mu = 0.3;

	// construct two-site Fermi-Hubbard Hamiltonian operators
	double **h = (double **)MKL_malloc((L - 1)*sizeof(double *), MEM_DATA_ALIGN);
	ConstructLocalFermiHubbardOperators(L, t, U, mu, h);

	// compare with reference
	for (i = 0; i < L - 1; i++)
	{
		// load reference two-site Hamiltonian operators from disk
		double *h_ref_i = (double *)MKL_malloc(16*16*sizeof(double), MEM_DATA_ALIGN);
		char filename[1024];
		sprintf(filename, "../test/hamiltonian_fermi_hubbard_test_h%i.dat", i);
		status = ReadData(filename, h_ref_i, sizeof(double), 16*16);
		if (status < 0) { return status; }

		// largest entrywise error
		err = fmax(err, UniformDistance(16*16, h[i], h_ref_i));

		MKL_free(h_ref_i);
	}

	// construct matrix product operator representation
	mpo_t mpoH;
	ConstructFermiHubbardMPO(L, t, U, mu, &mpoH);

	// compare with reference
	for (i = 0; i < L; i++)
	{
		const size_t num = NumTensorElements(&mpoH.A[i]);

		// load reference 'W' tensor from disk
		MKL_Complex16 *W_ref_i = (MKL_Complex16 *)MKL_malloc(num * sizeof(MKL_Complex16), MEM_DATA_ALIGN);
		char filename[1024];
		sprintf(filename, "../test/hamiltonian_fermi_hubbard_test_W%i.dat", i);
		status = ReadData(filename, W_ref_i, sizeof(MKL_Complex16), num);
		if (status < 0) { return status; }

		// largest entrywise error
		err = fmax(err, UniformDistance(2*num, (double *)mpoH.A[i].data, (double *)W_ref_i));

		MKL_free(W_ref_i);
	}

	// test block structure
	for (i = 0; i < L; i++)
	{
		err = fmax(err, MPOBlockStructureError(&mpoH.A[i], (const qnumber_t *restrict *)mpoH.qd, mpoH.qD[i], mpoH.qD[i+1]));
	}

	printf("Largest error: %g\n", err);

	// clean up
	DeleteMPO(&mpoH);
	DeleteLocalHamiltonianOperators(L, h);
	MKL_free(h);

	// large required tolerance presumably due to interaction term U/2 n (n - 1)
	return (err < 2e-15 ? 0 : 1);
}
