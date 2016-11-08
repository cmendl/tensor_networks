#include "lanczos.h"
#include "complex.h"
#include <mkl.h>
#include <stdint.h>
#include <stdio.h>


static void DenseMatrixVectorMult(const size_t n, const void *restrict data, const MKL_Complex16 *restrict v, MKL_Complex16 *restrict ret)
{
	const MKL_Complex16 *A = (MKL_Complex16 *)data;

	// perform a conventional matrix-vector multiplication
	const MKL_Complex16 one  = { 1, 0 };
	const MKL_Complex16 zero = { 0, 0 };
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
	MKL_Complex16 *A = (MKL_Complex16 *)MKL_malloc(n*n * sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	int status;
	status = ReadData("../test/lanczos_test_A.dat", A, sizeof(MKL_Complex16), n*n);
	if (status < 0) { return status; }

	// load starting vector from disk
	MKL_Complex16 *v_start = (MKL_Complex16 *)MKL_malloc(n * sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	status = ReadData("../test/lanczos_test_v_start.dat", v_start, sizeof(MKL_Complex16), n);
	if (status < 0) { return status; }

	// perform Lanczos iteration
	double lambda_min;
	MKL_Complex16 *v_min = (MKL_Complex16 *)MKL_malloc(n * sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	LanczosIteration(n, DenseMatrixVectorMult, A, v_start, maxiter, &lambda_min, v_min);

	// load reference data from disk
	double lambda_min_ref;
	MKL_Complex16 *v_min_ref = MKL_malloc(n * sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	status = ReadData("../test/lanczos_test_lambda_min.dat", &lambda_min_ref, sizeof(double),        1);  if (status < 0) { return status; }
	status = ReadData("../test/lanczos_test_v_min.dat",       v_min_ref,      sizeof(MKL_Complex16), n);  if (status < 0) { return status; }

	// largest entrywise error
	double err = 0;
	err = fmax(err, fabs(lambda_min - lambda_min_ref));
	err = fmax(err, UniformDistance(2*n, (double *)v_min, (double *)v_min_ref));

	printf("Largest error: %g\n", err);

	// clean up
	MKL_free(v_min_ref);
	MKL_free(v_min);
	MKL_free(v_start);
	MKL_free(A);

	return (err < 2e-15 ? 0 : 1);
}
