/// \file hamiltonian_ising.h
/// \brief Construct local Ising Hamiltonian operator terms

#ifndef HAMILTONIAN_ISING_H
#define HAMILTONIAN_ISING_H

#include "mpo.h"


void ConstructLocalIsingOperators(const int L, const double J, const double hext, const double gext, double **h);

void DeleteLocalIsingOperators(const int L, double **h);


void ConstructIsingMPO(const int L, const double J, const double hext, const double gext, mpo_t *H);



#endif
