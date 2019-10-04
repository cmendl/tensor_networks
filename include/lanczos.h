/// \file lanczos.h
/// \brief Implementation of the Lanczos algorithm

#ifndef LANCZOS_H
#define LANCZOS_H

#include <stdlib.h>
#include <complex.h>


typedef void op_func_t(const size_t n, const void *restrict data, const double complex *restrict v, double complex *restrict ret);


void LanczosIteration(const size_t n, op_func_t Afunc, const void *restrict Adata, double complex *restrict v_start, const int maxiter, double *restrict lambda_min, double complex *restrict v_min);



#endif
