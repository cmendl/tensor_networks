/// \file util.h
/// \brief Utility functions

#ifndef UTIL_H
#define UTIL_H

#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <complex.h>
#include <assert.h>


#ifdef USE_MKL

#include <mkl_service.h>

#define algn_malloc(size) MKL_malloc(size, MEM_DATA_ALIGN)

#define algn_free(ptr) MKL_free(ptr)

#define algn_calloc(num, size) MKL_calloc(num, size, MEM_DATA_ALIGN)

#else

#include <malloc.h>
#ifdef __GNUC__
#include <mm_malloc.h>
#endif
#include <string.h>

#define algn_malloc(size) _mm_malloc(size, MEM_DATA_ALIGN)

#define algn_free(ptr) _mm_free(ptr)

static inline void *algn_calloc(size_t num, size_t size)
{
	size_t blocksize = num * size;
	void *ptr = algn_malloc(blocksize);
	memset(ptr, 0, blocksize);
	return ptr;
}

#endif


//________________________________________________________________________________________________________________________
///
/// \brief Square function x -> x^2
///
static inline double square(const double x)
{
	return x*x;
}


//________________________________________________________________________________________________________________________
///
/// \brief Calculate the product of a list of integer numbers
///
inline size_t IntProduct(const size_t *x, const int n)
{
	assert(n >= 0); // n == 0 is still reasonable

	size_t prod = 1;
	int i;
	for (i = 0; i < n; i++)
	{
		prod *= x[i];
	}

	return prod;
}


//________________________________________________________________________________________________________________________
//


double Norm(const size_t n, const double *restrict x);


double UniformDistance(const size_t n, const double complex *restrict x, const double complex *restrict y);


//________________________________________________________________________________________________________________________
//


int MatrixExp(const size_t n, const double complex t, const double *restrict A, double complex *restrict ret);


//________________________________________________________________________________________________________________________
//


void RealIdentityMatrix(const size_t d, double *id);


void KroneckerProductRealSquare(const int d, const double *restrict A, const double *restrict B, double *restrict ret);


//________________________________________________________________________________________________________________________
//


void CopyRealToComplexMatrix(const size_t m, const size_t n, const double *restrict A, const size_t lda, double complex *restrict B, const size_t ldb);


//________________________________________________________________________________________________________________________
//


int ReadData(const char *filename, void *data, const size_t size, const size_t n);

int WriteData(const char *filename, const void *data, const size_t size, const size_t n, const bool append);


//________________________________________________________________________________________________________________________
//


int64_t GetTimeTicks();

int64_t GetTimeResolution();



#endif
