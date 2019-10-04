#include "util.h"
#include <stdio.h>


int MatrixExpTest()
{
	int status;
	const size_t n = 7;

	// accumulated error
	double err = 0;

	printf("Testing matrix exponential...\n");

	// load 'A' matrix from disk
	double *A = (double *)algn_malloc(n*n * sizeof(double));
	status = ReadData("../test/matrix_exp_test_A.dat", A, sizeof(double), n*n);
	if (status < 0) { return status; }

	// allocate memory for matrix exponential
	double complex *expA = (double complex *)algn_malloc(n*n * sizeof(double complex));

	// real time step
	{
		const double complex t = 1.0/7;

		status = MatrixExp(n, t, A, expA);
		if (status != 0) { return status; }

		// load reference data from disk
		double complex *expA_ref = (double complex *)algn_malloc(n*n * sizeof(double complex));
		status = ReadData("../test/matrix_exp_test_exp17A.dat", expA_ref, sizeof(double complex), n*n);
		if (status < 0) { return status; }

		// largest entrywise error
		err = fmax(err, UniformDistance(n*n, expA, expA_ref));

		// clean up
		algn_free(expA_ref);
	}

	// complex time step
	{
		const double complex t = 0.3 + 1.0/7*_Complex_I;

		status = MatrixExp(n, t, A, expA);
		if (status != 0) { return status; }

		// load reference data from disk
		double complex *expA_ref = (double complex *)algn_malloc(n*n * sizeof(double complex));
		status = ReadData("../test/matrix_exp_test_exp3i7A.dat", expA_ref, sizeof(double complex), n*n);
		if (status < 0) { return status; }

		// largest entrywise error
		err = fmax(err, UniformDistance(n*n, expA, expA_ref));

		// clean up
		algn_free(expA_ref);
	}

	printf("Largest error: %g\n", err);

	// clean up
	algn_free(expA);
	algn_free(A);

	return (err < 2e-15 ? 0 : 1);
}
