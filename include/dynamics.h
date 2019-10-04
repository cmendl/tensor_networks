/// \file dynamics.h
/// \brief Time evolution (real and imaginary) of matrix product operators

#ifndef DYNAMICS_H
#define DYNAMICS_H

#include "mpo.h"


//________________________________________________________________________________________________________________________
///
/// \brief Precomputed data for a simulation time step (using even-odd bond splitting)
///
typedef struct
{
	tensor_t *exp_h;        //!< matrix exponentials of local two-site Hamiltonian terms, array of size (L - 1)*n
	double complex dt;      //!< time step (can be complex in general)
	int L;                  //!< lattice size
	int m;                  //!< number of exponential versions (for example for different fractions of the time step)
}
dynamics_data_t;


void AllocateDynamicsData(const int L, const int m, const double complex dt, dynamics_data_t *dyn);

void DeleteDynamicsData(dynamics_data_t *dyn);


//________________________________________________________________________________________________________________________
//


void ComputeDynamicsDataStrang(const int L, const double complex dt, const size_t d2, const double **h, dynamics_data_t *restrict dyn);


void EvolveMPOStrang(const dynamics_data_t *restrict dyn, const int nsteps, const bond_op_params_t *restrict params, const bool normalize, mpo_t *restrict mpo, double *restrict tol_eff);

void EvolveLiouvilleMPOStrang(const dynamics_data_t *restrict dyn, const int nsteps, const bond_op_params_t *restrict params, const bool normalize, mpo_t *restrict mpo, double *restrict tol_eff);


//________________________________________________________________________________________________________________________
//


void ComputeDynamicsDataPRK(const int L, const double complex dt, const size_t d2, const double **h, dynamics_data_t *restrict dyn);


void EvolveMPOPRK(const dynamics_data_t *restrict dyn, const int nsteps, const bool forward, const bond_op_params_t *restrict params, mpo_t *restrict mpo, double *restrict tol_eff);

void EvolveLiouvilleMPOPRK(const dynamics_data_t *restrict dyn, const int nsteps, const bool forward, const bond_op_params_t *restrict params, mpo_t *restrict mpo, double *restrict tol_eff);



#endif
