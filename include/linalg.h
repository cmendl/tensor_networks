/// \file linalg.h
/// \brief Wrapper for including CBLAS and LAPACKE

#ifndef LINALG_H
#define LINALG_H

#define LAPACK_DISABLE_NAN_CHECK 

#ifdef USE_MKL

#include <mkl_cblas.h>
#include <mkl_lapacke.h>

#else

// generic include
#include <cblas.h>
#include <lapacke.h>

#endif


#endif
