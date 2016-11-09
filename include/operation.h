/// \file operation.h
/// \brief Operations between matrix product states and operators

#ifndef OPERATION_H
#define OPERATION_H

#include "mps.h"
#include "mpo.h"


MKL_Complex16 OperatorAverage(const mps_t *restrict state, const mpo_t *restrict op);


void ApplyLocalHamiltonian(const tensor_t *restrict L, const tensor_t *restrict R, const tensor_t *restrict W, const tensor_t *restrict M, tensor_t *restrict HM);



#endif
