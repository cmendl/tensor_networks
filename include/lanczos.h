/// \file lanczos.h
/// \brief Implementation of the Lanczos algorithm

#ifndef LANCZOS_H
#define LANCZOS_H

#include <stdlib.h>
#include <mkl_types.h>


typedef void mat_vect_prod_t(const size_t n, const void *restrict data, const MKL_Complex16 *restrict v, MKL_Complex16 *restrict ret);


void LanczosIteration(const size_t n, mat_vect_prod_t Afunc, const void *restrict Adata, MKL_Complex16 *restrict v_start, const int maxiter, double *restrict lambda_min, MKL_Complex16 *restrict v_min);



#endif
