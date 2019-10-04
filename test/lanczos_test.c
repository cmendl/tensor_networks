#include "lanczos.h"
#include "util.h"
#include <stdint.h>
#include <stdio.h>


static void DenseMatrixVectorMult(const size_t n, const void *restrict data, const double complex *restrict v, double complex *restrict ret)
{
	const double complex *A = (double complex *)data;

	// perform a conventional matrix-vector multiplication
	const double complex one  = 1;
	const double complex zero = 0;
	cblas_zgemv(CblasColMajor, CblasNoTrans, n, n, &one, A, n, v, 1, &zero, ret, 1);
}


int LanczosTest()
{
	// "large" matrix dimension
	const size_t n = 256;

	// number of iterations
	const int maxiter = 24;

	printf("Testing Lanczos iteration for matrix size %zu and %i iterations...\n", n, maxiter);

	// load 'A' matrix from disk
	double complex *A = (double complex *)algn_malloc(n*n * sizeof(double complex));
	int status;
	status = ReadData("../test/lanczos_test_A.dat", A, sizeof(double complex), n*n);
	if (status < 0) { return status; }

	// load starting vector from disk
	double complex *v_start = (double complex *)algn_malloc(n * sizeof(double complex));
	status = ReadData("../test/lanczos_test_v_start.dat", v_start, sizeof(double complex), n);
	if (status < 0) { return status; }

	// perform Lanczos iteration
	double lambda_min;
	double complex *v_min = (double complex *)algn_malloc(n * sizeof(double complex));
	LanczosIteration(n, DenseMatrixVectorMult, A, v_start, maxiter, &lambda_min, v_min);

	// load reference data from disk
	double lambda_min_ref;
	double complex *v_min_ref = algn_malloc(n * sizeof(double complex));
	status = ReadData("../test/lanczos_test_lambda_min.dat", &lambda_min_ref, sizeof(double),         1);  if (status < 0) { return status; }
	status = ReadData("../test/lanczos_test_v_min.dat",       v_min_ref,      sizeof(double complex), n);  if (status < 0) { return status; }

	// largest entrywise error
	double err = 0;
	err = fmax(err, fabs(lambda_min - lambda_min_ref));
	err = fmax(err, UniformDistance(n, v_min, v_min_ref));

	printf("Largest error: %g\n", err);

	// clean up
	algn_free(v_min_ref);
	algn_free(v_min);
	algn_free(v_start);
	algn_free(A);

	return (err < 2e-14 ? 0 : 1);
}
