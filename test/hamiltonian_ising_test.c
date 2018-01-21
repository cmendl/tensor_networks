#include "hamiltonian_ising.h"
#include "util.h"
#include <mkl.h>
#include <stdio.h>


int HamiltonianIsingTest()
{
	int i;
	int status;

	// maximum error
	double err = 0;

	printf("Testing Ising Hamiltonian construction...\n");

	// dimensions
	const int L = 7;
	// Hamiltonian parameters
	const double J    =  5.0/11;
	const double hext = -2.0/7;
	const double gext = 13.0/8;

	// construct two-site Ising Hamiltonian operators
	double **h = (double **)MKL_malloc((L - 1)*sizeof(double *), MEM_DATA_ALIGN);
	ConstructLocalIsingOperators(L, J, hext, gext, h);

	// compare with reference
	for (i = 0; i < L - 1; i++)
	{
		// load reference two-site Hamiltonian operators from disk
		double *h_ref_i = (double *)MKL_malloc(4*4*sizeof(double), MEM_DATA_ALIGN);
		char filename[1024];
		sprintf(filename, "../test/hamiltonian_ising_test_h%i.dat", i);
		status = ReadData(filename, h_ref_i, sizeof(double), 4*4);
		if (status < 0) { return status; }

		// largest entrywise error
		err = fmax(err, UniformDistance(4*4, h[i], h_ref_i));

		MKL_free(h_ref_i);
	}

	// construct matrix product operator representation
	mpo_t mpoH;
	ConstructIsingMPO(L, J, hext, gext, &mpoH);

	// compare with reference
	for (i = 0; i < L; i++)
	{
		const size_t num = NumTensorElements(&mpoH.A[i]);

		// load reference 'W' tensor from disk
		MKL_Complex16 *W_ref_i = (MKL_Complex16 *)MKL_malloc(num * sizeof(MKL_Complex16), MEM_DATA_ALIGN);
		char filename[1024];
		sprintf(filename, "../test/hamiltonian_ising_test_W%i.dat", i);
		status = ReadData(filename, W_ref_i, sizeof(MKL_Complex16), num);
		if (status < 0) { return status; }

		// largest entrywise error
		err = fmax(err, UniformDistance(2*num, (double *)mpoH.A[i].data, (double *)W_ref_i));

		MKL_free(W_ref_i);
	}

	printf("Largest error: %g\n", err);

	// clean up
	DeleteMPO(&mpoH);
	DeleteLocalIsingOperators(L, h);
	MKL_free(h);

	return (err < 1e-15 ? 0 : 1);
}
