/// \file bond_info.c
/// \brief Auxiliary data structures and functions concerning virtual bonds

#include "bond_info.h"
#include <math.h>


//________________________________________________________________________________________________________________________
///
/// \brief Compute the von Neumann entropy of singular values 'lambda'
///
double VonNeumannEntropy(const size_t n, const double *restrict lambda)
{
	double S = 0;

	size_t i;
	for (i = 0; i < n; i++)
	{
		const double lsq = lambda[i]*lambda[i];
		S -= lsq * log(lsq);
	}

	return S;
}
