#include "util.h"
#include "complex.h"
#include <mkl.h>
#include <stdio.h>


int MatrixExpTest()
{
	int status;
	const size_t n = 7;

	// accumulated error
	double err = 0;

	printf("Testing matrix exponential...\n");

	// load 'A' matrix from disk
	double *A = MKL_malloc(n*n * sizeof(double), MEM_DATA_ALIGN);
	status = ReadData("../test/matrix_exp_test_A.dat", A, sizeof(double), n*n);
	if (status < 0) { return status; }

	// allocate memory for matrix exponential
	MKL_Complex16 *expA = MKL_malloc(n*n * sizeof(MKL_Complex16), MEM_DATA_ALIGN);

	// real time step
	{
		const MKL_Complex16 t = { 1.0/7, 0 };

		status = MatrixExp(n, t, A, expA);
		if (status != 0) { return status; }

		// load reference data from disk
		MKL_Complex16 *expA_ref = MKL_malloc(n*n * sizeof(MKL_Complex16), MEM_DATA_ALIGN);
		status = ReadData("../test/matrix_exp_test_exp17A.dat", expA_ref, sizeof(MKL_Complex16), n*n);
		if (status < 0) { return status; }

		// largest entrywise error
		err = fmax(err, UniformDistance(2*n*n, (double *)expA, (double *)expA_ref));

		// clean up
		MKL_free(expA_ref);
	}

	// complex time step
	{
		const MKL_Complex16 t = { 0.3, 1.0/7 };

		status = MatrixExp(n, t, A, expA);
		if (status != 0) { return status; }

		// load reference data from disk
		MKL_Complex16 *expA_ref = MKL_malloc(n*n * sizeof(MKL_Complex16), MEM_DATA_ALIGN);
		status = ReadData("../test/matrix_exp_test_exp3i7A.dat", expA_ref, sizeof(MKL_Complex16), n*n);
		if (status < 0) { return status; }

		// largest entrywise error
		err = fmax(err, UniformDistance(2*n*n, (double *)expA, (double *)expA_ref));

		// clean up
		MKL_free(expA_ref);
	}

	printf("Largest error: %g\n", err);

	// clean up
	MKL_free(expA);
	MKL_free(A);

	return (err < 2e-15 ? 0 : 1);
}
