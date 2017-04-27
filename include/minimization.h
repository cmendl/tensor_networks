/// \file minimization.h
/// \brief Energy minimization and ground state computation

#ifndef MINIMIZATION_H
#define MINIMIZATION_H

#include "mps.h"
#include "mpo.h"


void MinimizeLocalEnergy(const tensor_t *restrict L, const tensor_t *restrict R, const tensor_t *restrict W, const tensor_t *restrict M_start, double *restrict en_min, tensor_t *restrict M_opt);


//________________________________________________________________________________________________________________________
//


void CalculateGroundStateLocalSinglesite(const mpo_t *restrict H, const int maxiter, double *restrict en_min, mps_t *restrict psi);

void CalculateGroundStateLocalTwosite(const mpo_t *restrict H, const int maxiter, const bond_op_params_t *restrict bond_op_params, double *restrict entropy, double *restrict en_min, mps_t *restrict psi);



#endif
