/// \file mps.h
/// \brief Matrix product state (MPS)

#ifndef MPS_H
#define MPS_H

#include "tensor.h"


//________________________________________________________________________________________________________________________
///
/// \brief Matrix product state (MPS) in one dimension
///
typedef struct
{
	tensor_t *A;    //!< tensors associated with sites, with dimensions d x D_i x D_{i+1}; array of length L
	size_t d;       //!< physical dimension of each site
	int L;          //!< lattice size
}
mps_t;


void AllocateMPS(const int L, const size_t d, const size_t *D, mps_t *restrict mps);

void DeleteMPS(mps_t *restrict mps);


//________________________________________________________________________________________________________________________
//


void MPSUnitaryLeftProjection(tensor_t *restrict A, tensor_t *restrict Anext);

void MPSUnitaryRightProjection(tensor_t *restrict A, tensor_t *restrict Aprev);


//________________________________________________________________________________________________________________________
//


void ContractionStepLeft(const tensor_t *restrict A, const tensor_t *restrict L, tensor_t *restrict Lnext);

void ContractionOperatorStepLeft(const tensor_t *restrict A, const tensor_t *restrict W, const tensor_t *restrict L, tensor_t *restrict Lnext);


void ContractionStepRight(const tensor_t *restrict A, const tensor_t *restrict R, tensor_t *restrict Rnext);

void ContractionOperatorStepRight(const tensor_t *restrict A, const tensor_t *restrict W, const tensor_t *restrict R, tensor_t *restrict Rnext);


//________________________________________________________________________________________________________________________
//


double CalculateMPSNorm(const mps_t *restrict mps);



#endif
