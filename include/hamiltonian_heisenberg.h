/// \file hamiltonian_heisenberg.h
/// \brief Construct local Heisenberg Hamiltonian operator terms

#ifndef HAMILTONIAN_HEISENBERG_H
#define HAMILTONIAN_HEISENBERG_H

#include "mpo.h"


void ConstructLocalHeisenbergOperators(const int L, const double Jx, const double Jy, const double Jz, const double hext, double **h);

void DeleteLocalHeisenbergOperators(const int L, double **h);


void ConstructHeisenbergMPO(const int L, const double J, const double Jz, const double hext, mpo_t *H);


void ConstructLocalHeisenbergSpin1Operators(const int L, const double Jx, const double Jy, const double Jz, const double hext, double **h);

void DeleteLocalHeisenbergSpin1Operators(const int L, double **h);


void ConstructHeisenbergSpin1MPO(const int L, const double J, const double Jz, const double hext, mpo_t *H);



#endif
