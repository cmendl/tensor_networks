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
	tensor_t *A;    //!< tensors associated with sites, with dimensions D_i x d x D_{i+1}; array of length L
	size_t d;       //!< physical dimension of each site
	int L;          //!< lattice size
}
mps_t;


void AllocateMPS(const int L, const size_t d, const size_t *D, mps_t *restrict mps);

void DeleteMPS(mps_t *restrict mps);


//________________________________________________________________________________________________________________________
//


double CalculateMPSNorm(const mps_t *restrict mps);


void CalculateMPSContraction(const mps_t *restrict mps, tensor_t *restrict cntrL, tensor_t *restrict cntrR);


MKL_Complex16 MPSAverageOneSiteOp(const mps_t *restrict mps, const tensor_t *restrict cntrL, const tensor_t *restrict cntrR, const tensor_t *restrict op);

MKL_Complex16 MPSAverageTwoSiteOp(const mps_t *restrict mps, const tensor_t *restrict cntrL, const tensor_t *restrict cntrR, const tensor_t *restrict op1, const tensor_t *restrict op2);


//________________________________________________________________________________________________________________________
//


double MinimizeMPSEnergy(const int num_op_tensors, const tensor_t *restrict h, const double prec, mps_t *restrict mps);



#endif
