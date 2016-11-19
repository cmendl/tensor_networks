/// \file minimization.h
/// \brief Energy minimization and ground state computation

#ifndef MINIMIZATION_H
#define MINIMIZATION_H

#include "mps.h"
#include "mpo.h"


void MinimizeLocalEnergy(const tensor_t *restrict L, const tensor_t *restrict R, const tensor_t *restrict W, const tensor_t *restrict M_start, double *restrict en_min, tensor_t *restrict M_opt);

void CalculateGroundState(const mpo_t *restrict H, const int maxiter, const double tol, double *restrict en_min, mps_t *restrict psi);



#endif
