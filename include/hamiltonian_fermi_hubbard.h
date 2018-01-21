/// \file hamiltonian_fermi_hubbard.h
/// \brief Construct local Fermi-Hubbard Hamiltonian operator terms

#ifndef HAMILTONIAN_FERMI_HUBBARD_H
#define HAMILTONIAN_FERMI_HUBBARD_H

#include "mpo.h"


void ConstructLocalFermiHubbardOperators(const int L, const double t, const double U, const double mu, double **h);

void DeleteLocalFermiHubbardOperators(const int L, double **h);


void ConstructFermiHubbardMPO(const int L, const double t, const double U, const double mu, mpo_t *H);



#endif
