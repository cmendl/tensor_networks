/// \file dynamics.h
/// \brief Time evolution (real and imaginary) of matrix product operators

#ifndef DYNAMICS_H
#define DYNAMICS_H

#include "mpo.h"


//________________________________________________________________________________________________________________________
///
/// \brief Precomputed data for a simulation time step
///
typedef struct
{
	tensor_t *exp_h;        //!< matrix exponentials of local two-site Hamiltonian terms, array of size (L - 1)*n
	MKL_Complex16 dt;       //!< time step (allowed to be complex in general)
	int L;                  //!< lattice size
	int m;                  //!< number of exponential versions (for example for different fractions of the time step)
}
dynamics_data_t;


void AllocateDynamicsData(const int L, const int m, const MKL_Complex16 dt, dynamics_data_t *dyn);

void DeleteDynamicsData(dynamics_data_t *dyn);


//________________________________________________________________________________________________________________________
//


void ComputeDynamicsDataStrang(const int L, const MKL_Complex16 dt, const size_t d2, const double **h, dynamics_data_t *restrict dyn);


void EvolveMPOStrang(const dynamics_data_t *restrict dyn, const int nsteps, const double tol, const size_t maxD, const bool normalize, mpo_t *restrict mpo, double *restrict tol_eff);

void EvolveLiouvilleMPOStrang(const dynamics_data_t *restrict dyn, const int nsteps, const double tol, const size_t maxD, const bool normalize, mpo_t *restrict mpo, double *restrict tol_eff);


//________________________________________________________________________________________________________________________
//


void ComputeDynamicsDataPRK(const int L, const MKL_Complex16 dt, const size_t d2, const double **h, dynamics_data_t *restrict dyn);


void EvolveMPOPRK(const dynamics_data_t *restrict dyn, const int nsteps, const bool forward, const double tol, const size_t maxD, mpo_t *restrict mpo, double *restrict tol_eff);

void EvolveLiouvilleMPOPRK(const dynamics_data_t *restrict dyn, const int nsteps, const bool forward, const double tol, const size_t maxD, mpo_t *restrict mpo, double *restrict tol_eff);


//________________________________________________________________________________________________________________________
//


void ComputeDynamicsDataSRKNb6(const int L, const MKL_Complex16 dt, const size_t d2, const double **h, dynamics_data_t *restrict dyn);


void EvolveMPOSRKNb6(const dynamics_data_t *restrict dyn, const int nsteps, const bool forward, const double tol, const size_t maxD, mpo_t *restrict mpo, double *restrict tol_eff);

void EvolveLiouvilleMPOSRKNb6(const dynamics_data_t *restrict dyn, const int nsteps, const bool forward, const double tol, const size_t maxD, mpo_t *restrict mpo, double *restrict tol_eff);



#endif
