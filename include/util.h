/// \file util.h
/// \brief Utility functions

#ifndef UTIL_H
#define UTIL_H

#include <stdlib.h>
#include <math.h>
#include <mkl_types.h>
#include <stdbool.h>
#include <assert.h>


//________________________________________________________________________________________________________________________
///
/// \brief square function x -> x^2
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


double UniformDistance(const size_t n, const double *restrict x, const double *restrict y);


//________________________________________________________________________________________________________________________
//


int MatrixExp(const size_t n, const MKL_Complex16 t, const double *restrict A, MKL_Complex16 *restrict ret);


//________________________________________________________________________________________________________________________
//


void RealIdentityMatrix(const size_t d, double *id);


void KroneckerProductRealSquare(const MKL_INT d, const double *restrict A, const double *restrict B, double *restrict ret);


//________________________________________________________________________________________________________________________
//


void CopyRealToComplexMatrix(const size_t m, const size_t n, const double *restrict A, const size_t lda, MKL_Complex16 *restrict B, const size_t ldb);


//________________________________________________________________________________________________________________________
//


int ReadData(const char *filename, void *data, const size_t size, const size_t n);

int WriteData(const char *filename, const void *data, const size_t size, const size_t n, const bool append);


//________________________________________________________________________________________________________________________
//


unsigned long long GetTimeTicks();

unsigned long long GetTimeResolution();



#endif
