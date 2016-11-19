/// \file complex.h
/// \brief Utility functions for complex numbers

#ifndef COMPLEX_H
#define COMPLEX_H

#include <mkl_types.h>
#include <math.h>
#include "util.h"


//________________________________________________________________________________________________________________________
///
/// \brief Real part
///
static inline double ComplexReal(const MKL_Complex16 z)
{
	return z.real;
}


//________________________________________________________________________________________________________________________
///
/// \brief Imaginary part
///
static inline double ComplexImag(const MKL_Complex16 z)
{
	return z.imag;
}


//________________________________________________________________________________________________________________________
///
/// \brief Add two complex numbers
///
static inline MKL_Complex16 ComplexAdd(const MKL_Complex16 z1, const MKL_Complex16 z2)
{
	MKL_Complex16 w;
	w.real = z1.real + z2.real;
	w.imag = z1.imag + z2.imag;

	return w;
}


//________________________________________________________________________________________________________________________
///
/// \brief Subtract two complex numbers
///
static inline MKL_Complex16 ComplexSubtract(const MKL_Complex16 z1, const MKL_Complex16 z2)
{
	MKL_Complex16 w;
	w.real = z1.real - z2.real;
	w.imag = z1.imag - z2.imag;

	return w;
}


//________________________________________________________________________________________________________________________
///
/// \brief Scale a complex number by a real number
///
static inline MKL_Complex16 ComplexScale(const double s, const MKL_Complex16 z)
{
	MKL_Complex16 w;
	w.real = s * z.real;
	w.imag = s * z.imag;

	return w;
}


//________________________________________________________________________________________________________________________
///
/// \brief Multiply two complex numbers
///
static inline MKL_Complex16 ComplexMultiply(const MKL_Complex16 z1, const MKL_Complex16 z2)
{
	MKL_Complex16 w;
	w.real = z1.real*z2.real - z1.imag*z2.imag;
	w.imag = z1.real*z2.imag + z1.imag*z2.real;

	return w;
}


//________________________________________________________________________________________________________________________
///
/// \brief Absolute value of a complex number
///
static inline double ComplexAbs(const MKL_Complex16 z)
{
	const double x = fabs(z.real);
	const double y = fabs(z.imag);

	if (x < y)
	{
		return y*sqrt(1 + square(x/y));
	}
	else    // y <= x
	{
		if (x != 0)
		{
			return x*sqrt(1 + square(y/x));
		}
		else
		{
			return 0;
		}
	}
}



#endif
