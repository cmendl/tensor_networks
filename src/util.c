/// \file util.c
/// \brief Utility functions

#include "util.h"
#include "linalg.h"
#include "dupio.h"
#include <math.h>
#include <memory.h>
#include <time.h>
#ifdef _WIN32
#include <windows.h>
#endif


//________________________________________________________________________________________________________________________
///
/// \brief Euclidean norm of a real vector
///
double Norm(const size_t n, const double *restrict x)
{
	size_t i;

	double maxElem = fabs(x[0]);
	for (i = 1; i < n; i++)
	{
		maxElem = fmax(maxElem, fabs(x[i]));
	}

	if (maxElem == 0) {
		return 0;
	}

	double r = 0;
	for (i = 0; i < n; i++)
	{
		r += square(x[i]/maxElem);
	}
	r = maxElem*sqrt(r);

	return r;
}


//________________________________________________________________________________________________________________________
///
/// \brief Uniform distance (infinity norm) between 'x' and 'y'
///
double UniformDistance(const size_t n, const double complex *restrict x, const double complex *restrict y)
{
	double d = 0;
	size_t i;
	for (i = 0; i < n; i++)
	{
		d = fmax(d, cabs(x[i] - y[i]));
	}

	return d;
}


//________________________________________________________________________________________________________________________
///
/// \brief Compute the matrix exponential exp(-t A) with 'A' real symmetric and 't' real or complex
///
int MatrixExp(const size_t n, const double complex t, const double *restrict A, double complex *restrict ret)
{
	assume_algned(A);

	// eigenvalues
	double *w = algn_malloc(n * sizeof(double));

	// copy 'A' matrix (will be overwritten by eigenvectors)
	double *U = algn_malloc(n*n * sizeof(double));
	assume_algned(U);
	memcpy(U, A, n*n * sizeof(double));

	int info = LAPACKE_dsyev(LAPACK_COL_MAJOR, 'V', 'U', (lapack_int)n, U, (lapack_int)n, w);
	if (info > 0) {
		duprintf("Call of LAPACK function 'dsyev' failed, error code: %i.\n", info);
		return info;
	}

	// apply exponential to eigenvalues
	double complex *exp_tw = algn_malloc(n * sizeof(double complex));
	size_t i;
	for (i = 0; i < n; i++)
	{
		exp_tw[i] = cexp(-t*w[i]);
	}

	// expand 'U' to a complex matrix
	double complex *Ucplx = algn_calloc(n*n, sizeof(double complex));
	assume_algned(Ucplx);
	for (i = 0; i < n*n; i++)
	{
		Ucplx[i] = U[i];
	}

	// compute U * diag(exp(-t lambda_i))
	double complex *UexpD = algn_malloc(n*n * sizeof(double complex));
	assume_algned(UexpD);
	memcpy(UexpD, Ucplx, n*n * sizeof(double complex));
	for (i = 0; i < n; i++)
	{
		cblas_zscal((int)n, &exp_tw[i], &UexpD[i*n], 1);
	}

	// compute U * diag(exp(-t lambda_i)) * U^H
	const double complex one  = 1;
	const double complex zero = 0;
	cblas_zgemm(CblasColMajor, CblasNoTrans, CblasTrans, (int)n, (int)n, (int)n, &one, UexpD, (int)n, Ucplx, (int)n, &zero, ret, (int)n);

	// clean up
	algn_free(UexpD);
	algn_free(Ucplx);
	algn_free(exp_tw);
	algn_free(U);
	algn_free(w);

	return 0;
}


//________________________________________________________________________________________________________________________
///
/// \brief Set the matrix elements in 'id' to the identity matrix; 'id' must point to a d x d matrix
///
void RealIdentityMatrix(const size_t d, double *id)
{
	memset(id, 0, d*d * sizeof(double));

	size_t i;
	for (i = 0; i < d; i++)
	{
		id[i + i*d] = 1;
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Compute the Kronecker product of two real square matrices of dimension d x d, and add to 'ret' (d^2 x d^2 matrix)
///
void KroneckerProductRealSquare(const int d, const double *restrict A, const double *restrict B, double *restrict ret)
{
	assert(d > 0);
	const int d2 = d*d;

	int i, j;
	for (j = 0; j < d; j++)
	{
		for (i = 0; i < d; i++)
		{
			cblas_dger(CblasColMajor, d, d, 1.0, &A[d*i], 1, &B[d*j], 1, &ret[(i + j*d)*d2], d);
		}
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Copy a real to a complex matrix, setting imaginary entries to zero
///
void CopyRealToComplexMatrix(const size_t m, const size_t n, const double *restrict A, const size_t lda, double complex *restrict B, const size_t ldb)
{
	size_t i, j;

	for (j = 0; j < n; j++)
	{
		for (i = 0; i < m; i++)
		{
			B[i + j*ldb] = A[i + j*lda];
		}
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Read 'n' items of size 'size' from file 'filename', expecting the file size to be exactly n*size
///
int ReadData(const char *filename, void *data, const size_t size, const size_t n)
{
	FILE *fd = fopen(filename, "rb");
	if (fd == NULL)
	{
		duprintf("'fopen()' failed during call of 'ReadData()'.\n");
		return -1;
	}

	// obtain the file size
	fseek(fd, 0, SEEK_END);
	long filesize = ftell(fd);
	rewind(fd);
	// duprintf("file size: %d\n", filesize);
	if ((size_t)filesize != n*size)
	{
		duprintf("'ReadData()' failed: expected file size does not match.\n");
		fclose(fd);
		return -2;
	}

	// copy the file into the data array
	if (fread(data, size, n, fd) != n)
	{
		duprintf("'fread()' failed during call of 'ReadData()'.\n");
		fclose(fd);
		return -3;
	}

	fclose(fd);

	return 0;
}


//________________________________________________________________________________________________________________________
///
/// \brief Write 'n' items of size 'size' to file 'filename'
///
int WriteData(const char *filename, const void *data, const size_t size, const size_t n, const bool append)
{
	const char *mode = append ? "ab" : "wb";

	FILE *fd = fopen(filename, mode);
	if (fd == NULL)
	{
		duprintf("'fopen()' failed during call of 'WriteData()'.\n");
		return -1;
	}

	// write data array to file
	if (fwrite(data, size, n, fd) != n)
	{
		duprintf("'fwrite()' failed during call of 'WriteData()'.\n");
		return -3;
	}

	fclose(fd);

	return 0;
}


//________________________________________________________________________________________________________________________
///
/// \brief Get current time tick
///
int64_t GetTimeTicks()
{
	#ifdef _WIN32

	LARGE_INTEGER t;
	QueryPerformanceCounter(&t);
	return (int64_t)(t.QuadPart);

	#else

	struct timespec t;
	clock_gettime(CLOCK_MONOTONIC, &t);
	return (int64_t)(1000000000ULL * t.tv_sec + t.tv_nsec);

	#endif
}


//________________________________________________________________________________________________________________________
///
/// \brief Get timer resolution
///
int64_t GetTimeResolution()
{
	#ifdef _WIN32

	LARGE_INTEGER freq;
	QueryPerformanceFrequency(&freq);
	return (int64_t)(freq.QuadPart);

	#else

	// clock_gettime() has nanosecond resolution
	return (int64_t)1000000000ULL;

	#endif
}
