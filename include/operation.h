/// \file operation.h
/// \brief Operations between matrix product states and operators

#ifndef OPERATION_H
#define OPERATION_H

#include "mps.h"
#include "mpo.h"


double complex OperatorAverage(const mps_t *restrict state, const mpo_t *restrict op);


void ComputeLeftOperatorBlocks(const mps_t *restrict psi, const mpo_t *restrict op, tensor_t *restrict BL);

void ComputeRightOperatorBlocks(const mps_t *restrict psi, const mpo_t *restrict op, tensor_t *restrict BR);


void ApplyLocalHamiltonian(const tensor_t *restrict L, const tensor_t *restrict R, const tensor_t *restrict W, const tensor_t *restrict M, tensor_t *restrict HM);



#endif
