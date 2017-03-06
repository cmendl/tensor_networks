/// \file sim_params.h
/// \brief Header file for parsing parameter text file containing simulation parameters

#ifndef SIM_PARAMS_H
#define SIM_PARAMS_H

#include <stdlib.h>
#include <stdbool.h>


//________________________________________________________________________________________________________________________
///
/// \brief Simulation parameters
///
typedef struct
{
	// dimensions
	int L;                  //!< number of lattice sites, i.e., length of chain
	size_t d;               //!< physical dimension of each site

	// Hubbard Hamiltonian parameters
	double t;               //!< kinetic hopping parameter
	double U;               //!< interaction strength
	double mu;              //!< chemical potential

	// Heisenberg Hamiltonian parameters
	double Jx;              //!< Jx coupling constant
	double Jy;              //!< Jy coupling constant
	double Jz;              //!< Jz coupling constant
	double hext;            //!< external field

	// (additional) Ising Hamiltonian parameters
	double J;               //!< J coupling constant
	double gext;            //!< transverse field strength in x-direction

	double beta;            //!< inverse temperature
	double dbeta;           //!< imaginary-time step for computing exp(-beta H/2)

	double tmax;            //!< largest simulation time
	double dt;              //!< time step for time evolution

	// matrix product operator approximation parameters
	double tol;             //!< tolerance
	size_t maxD;            //!< maximum virtual bond dimension

	bool save_tensors;      //!< whether to save final tensor data to disk
}
sim_params_t;


int ParseParameterFile(const char *filename, sim_params_t *params);



#endif
