#include "hamiltonian.h"
#include "util.h"
#include <mkl.h>
#include <stdio.h>


int HamiltonianBoseHubbardTest()
{
	int i;
	int status;

	// maximum error
	double err = 0;

	printf("Testing Bose-Hubbard Hamiltonian construction...\n");

	// dimensions
	const int L = 7;
	const size_t d = 5;     // M + 1, with 'M' the maximal occupancy per site
	// Hamiltonian parameters
	const double t  = 0.7;
	const double U  = 3.2;
	const double mu = 1.3;

	// construct two-site Bose-Hubbard Hamiltonian operators
	double **h = MKL_malloc((L - 1)*sizeof(double *), MEM_DATA_ALIGN);
	ConstructLocalBoseHubbardOperators(L, d - 1, t, U, mu, h);

	// compare with reference
	for (i = 0; i < L - 1; i++)
	{
		// load reference two-site Hamiltonian operators from disk
		double *h_ref_i = MKL_malloc(d*d*d*d*sizeof(double), MEM_DATA_ALIGN);
		char filename[1024];
		sprintf(filename, "../test/hamiltonian_bose_hubbard_test_h%i.dat", i);
		status = ReadData(filename, h_ref_i, sizeof(double), d*d*d*d);
		if (status < 0) { return status; }

		// largest entrywise error
		err = fmax(err, UniformDistance(d*d*d*d, h[i], h_ref_i));

		MKL_free(h_ref_i);
	}

	printf("Largest error: %g\n", err);

	// clean up
	DeleteLocalHamiltonianOperators(L, h);
	MKL_free(h);

	// large required tolerance presumably due to interaction term U/2 n (n - 1)
	return (err < 1e-14 ? 0 : 1);
}
