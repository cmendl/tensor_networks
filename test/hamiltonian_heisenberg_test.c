#include "hamiltonian.h"
#include "util.h"
#include <mkl.h>
#include <stdio.h>


int HamiltonianHeisenbergTest()
{
	int i;
	int status;

	// maximum error
	double err = 0;

	printf("Testing Heisenberg Hamiltonian construction...\n");

	// dimensions
	const int L = 7;
	// Hamiltonian parameters
	const double Jx   =  5.0/11;
	const double Jy   =  7.0/10;
	const double Jz   = 13.0/8;
	const double hext =  2.0/7;

	// construct two-site Heisenberg Hamiltonian operators
	double **h = MKL_malloc((L - 1)*sizeof(double *), MEM_DATA_ALIGN);
	ConstructLocalHeisenbergOperators(L, Jx, Jy, Jz, hext, h);

	// compare with reference
	for (i = 0; i < L - 1; i++)
	{
		// load reference two-site Hamiltonian operators from disk
		double *h_ref_i = MKL_malloc(4*4*sizeof(double), MEM_DATA_ALIGN);
		char filename[1024];
		sprintf(filename, "../test/hamiltonian_heisenberg_test_h%i.dat", i);
		status = ReadData(filename, h_ref_i, sizeof(double), 4*4);
		if (status < 0) { return status; }

		// largest entrywise error
		err = fmax(err, UniformDistance(4*4, h[i], h_ref_i));

		MKL_free(h_ref_i);
	}

	printf("Largest error: %g\n", err);

	// clean up
	DeleteLocalHamiltonianOperators(L, h);
	MKL_free(h);

	return (err < 1e-15 ? 0 : 1);
}
