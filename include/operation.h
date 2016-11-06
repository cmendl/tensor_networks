/// \file operation.h
/// \brief Operation between matrix product states and operators

#ifndef OPERATION_H
#define OPERATION_H

#include "mps.h"
#include "mpo.h"


MKL_Complex16 OperatorAverage(const mps_t *restrict state, const mpo_t *restrict op);



#endif
