/// \file util.c
/// \brief Utility functions

#include "util.h"
#include "dupio.h"
#include <mkl.h>
#include <memory.h>
#include <stdlib.h>
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
double UniformDistance(const size_t n, const double *restrict x, const double *restrict y)
{
	double d = 0;
	size_t i;
	for (i = 0; i < n; i++)
	{
		d = fmax(d, fabs(x[i] - y[i]));
	}

	return d;
}


//________________________________________________________________________________________________________________________
///
/// \brief Compute the matrix exponential exp(-t A) with 'A' real symmetric and 't' real or complex
///
int MatrixExp(const size_t n, const MKL_Complex16 t, const double *restrict A, MKL_Complex16 *restrict ret)
{
	__assume_aligned(A, MEM_DATA_ALIGN);

	// eigenvalues
	double *w = MKL_malloc(n * sizeof(double), MEM_DATA_ALIGN);

	// copy 'A' matrix (will be overwritten by eigenvectors)
	double *U = MKL_malloc(n*n * sizeof(double), MEM_DATA_ALIGN);
	__assume_aligned(U, MEM_DATA_ALIGN);
	memcpy(U, A, n*n * sizeof(double));

	int info = LAPACKE_dsyev(LAPACK_COL_MAJOR, 'V', 'U', (lapack_int)n, U, (lapack_int)n, w);
	if (info > 0) {
		duprintf("Call of LAPACK function 'dsyev' failed, error code: %i.\n", info);
		return info;
	}

	// apply exponential to eigenvalues
	MKL_Complex16 *exp_tw = MKL_malloc(n * sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	size_t i;
	for (i = 0; i < n; i++)
	{
		const double exp_retw = exp(-t.real*w[i]);
		exp_tw[i].real = exp_retw * cos(-t.imag*w[i]);
		exp_tw[i].imag = exp_retw * sin(-t.imag*w[i]);
	}

	// expand 'U' to a complex matrix
	MKL_Complex16 *Ucplx = MKL_calloc(n*n, sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	__assume_aligned(Ucplx, MEM_DATA_ALIGN);
	for (i = 0; i < n*n; i++)
	{
		Ucplx[i].real = U[i];
	}

	// compute U * diag(exp(-t lambda_i))
	MKL_Complex16 *UexpD = MKL_malloc(n*n * sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	__assume_aligned(UexpD, MEM_DATA_ALIGN);
	memcpy(UexpD, Ucplx, n*n * sizeof(MKL_Complex16));
	for (i = 0; i < n; i++)
	{
		cblas_zscal((MKL_INT)n, &exp_tw[i], &UexpD[i*n], 1);
	}

	// compute U * diag(exp(-t lambda_i)) * U^H
	const MKL_Complex16 one  = { 1, 0 };
	const MKL_Complex16 zero = { 0, 0 };
	cblas_zgemm(CblasColMajor, CblasNoTrans, CblasTrans, (MKL_INT)n, (MKL_INT)n, (MKL_INT)n, &one, UexpD, (MKL_INT)n, Ucplx, (MKL_INT)n, &zero, ret, (MKL_INT)n);

	// clean up
	MKL_free(UexpD);
	MKL_free(Ucplx);
	MKL_free(exp_tw);
	MKL_free(U);
	MKL_free(w);

	return 0;
}


//________________________________________________________________________________________________________________________
///
/// \brief Copy a real to a complex matrix, setting imaginary entries to zero
///
void CopyRealToComplexMatrix(const size_t m, const size_t n, const double *restrict A, const size_t lda, MKL_Complex16 *restrict B, const size_t ldb)
{
	size_t i, j;

	for (j = 0; j < n; j++)
	{
		for (i = 0; i < m; i++)
		{
			B[i + j*ldb].real = A[i + j*lda];
			B[i + j*ldb].imag = 0;
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
/// \brief Get current time ticks
///
unsigned long long GetTimeTicks()
{
	#ifdef _WIN32

	LARGE_INTEGER t;
	QueryPerformanceCounter(&t);
	return (unsigned long long)(t.QuadPart);

	#else

	struct timespec t;
	clock_gettime(CLOCK_MONOTONIC, &t);
	return (unsigned long long)(1000000000ULL * t.tv_sec + t.tv_nsec);

	#endif
}


//________________________________________________________________________________________________________________________
///
/// \brief Get timer resolution
///
unsigned long long GetTimeResolution()
{
	#ifdef _WIN32

	LARGE_INTEGER freq;
	QueryPerformanceFrequency(&freq);
	return (unsigned long long)(freq.QuadPart);

	#else

	// clock_gettime() has nanosecond resolution
	return (unsigned long long)1000000000ULL;

	#endif
}
