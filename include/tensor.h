/// \file tensor.h
/// \brief Tensor structure, using column-major storage convention (first x, then y, z, ...)

#ifndef TENSOR_H
#define TENSOR_H

#include "util.h"
#include <mkl_types.h>
#include <assert.h>


#ifdef _DEBUG

/// \brief Simple string type
typedef struct
{
	char cstr[256];
}
string_t;

#endif


//________________________________________________________________________________________________________________________
///
/// \brief General tensor structure
///
typedef struct
{
	MKL_Complex16 *data;    //!< data entries, array of size dim[0] x ... x dim[ndim-1]
	size_t *dim;            //!< dimensions (width, height, ...)
	int ndim;               //!< number of dimensions
	#ifdef _DEBUG
	string_t *dnames;       //!< assign names to dimensions for identification
	#endif
}
tensor_t;


void AllocateTensor(const int ndim, const size_t *restrict dim, tensor_t *restrict t);

void DeleteTensor(tensor_t *restrict t);


void CopyTensor(const tensor_t *restrict src, tensor_t *restrict dst);


void MoveTensorData(tensor_t *restrict src, tensor_t *restrict dst);


void IdentityTensor(tensor_t *restrict t);


//________________________________________________________________________________________________________________________
///
/// \brief Calculate the number of elements of a tensor
///
inline size_t NumTensorElements(const tensor_t *restrict t)
{
	size_t nelem = IntProduct(t->dim, t->ndim);
	assert(nelem > 0);

	return nelem;
}


//________________________________________________________________________________________________________________________
//


void ReshapeTensor(const int ndim, const size_t *restrict dim, tensor_t *restrict t);

void ConjugateTensor(tensor_t *restrict t);

void TransposeTensor(const int *restrict perm, const tensor_t *restrict t, tensor_t *restrict r);

void ConjugateTransposeTensor(const int *restrict perm, const tensor_t *restrict t, tensor_t *restrict r);


//________________________________________________________________________________________________________________________
//


void SubTensor(const tensor_t *restrict t, const size_t *restrict sdim, const size_t *restrict *idx, tensor_t *restrict r);


//________________________________________________________________________________________________________________________
//


void ScaleTensor(const MKL_Complex16 alpha, tensor_t *restrict t);

void ScalarMultiplyAddTensor(const MKL_Complex16 alpha, const tensor_t *restrict s, tensor_t *restrict t);

void MultiplyTensor(const tensor_t *restrict s, const tensor_t *restrict t, const int ndim_mult, tensor_t *restrict r);

void TensorKroneckerProduct(const tensor_t *restrict s, const tensor_t *restrict t, tensor_t *restrict r);

MKL_Complex16 TensorTrace(const tensor_t *restrict t);



#endif
