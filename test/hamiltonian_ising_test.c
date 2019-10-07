#include "hamiltonian_ising.h"
#include "util.h"
#include <math.h>
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
	double **h = (double **)algn_malloc((L - 1)*sizeof(double *));
	ConstructLocalIsingOperators(L, J, hext, gext, h);

	// compare with reference
	for (i = 0; i < L - 1; i++)
	{
		// load reference two-site Hamiltonian operators from disk
		double *h_ref_i = (double *)algn_malloc(4*4*sizeof(double));
		char filename[1024];
		sprintf(filename, "../test/hamiltonian_ising_test_h%i.dat", i);
		status = ReadData(filename, h_ref_i, sizeof(double), 4*4);
		if (status < 0) { return status; }

		// largest entrywise error
		int j;
		for (j = 0; j < 4*4; j++)
		{
			err = fmax(err, fabs(h[i][j] - h_ref_i[j]));
		}

		algn_free(h_ref_i);
	}

	// construct matrix product operator representation
	mpo_t mpoH;
	ConstructIsingMPO(L, J, hext, gext, &mpoH);

	// compare with reference
	for (i = 0; i < L; i++)
	{
		const size_t num = NumTensorElements(&mpoH.A[i]);

		// load reference 'W' tensor from disk
		double complex *W_ref_i = (double complex *)algn_malloc(num * sizeof(double complex));
		char filename[1024];
		sprintf(filename, "../test/hamiltonian_ising_test_W%i.dat", i);
		status = ReadData(filename, W_ref_i, sizeof(double complex), num);
		if (status < 0) { return status; }

		// largest entrywise error
		err = fmax(err, UniformDistance(num, mpoH.A[i].data, W_ref_i));

		algn_free(W_ref_i);
	}

	printf("Largest error: %g\n", err);

	// clean up
	DeleteMPO(&mpoH);
	DeleteLocalIsingOperators(L, h);
	algn_free(h);

	return (err < 1e-15 ? 0 : 1);
}
