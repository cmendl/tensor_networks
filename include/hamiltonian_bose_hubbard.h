/// \file hamiltonian_bose_hubbard.h
/// \brief Construct local Bose-Hubbard Hamiltonian operator terms

#ifndef HAMILTONIAN_BOSE_HUBBARD_H
#define HAMILTONIAN_BOSE_HUBBARD_H

#include "mpo.h"


void ConstructLocalBoseHubbardOperators(const int L, const size_t M, const double t, const double U, const double mu, double **h);

void DeleteLocalBoseHubbardOperators(const int L, double **h);


void ConstructLocalBoseHubbardEnergyOperator(const size_t M, const double t, const double U, double *h);


void ConstructBoseHubbardMPO(const int L, const size_t M, const double t, const double U, const double mu, mpo_t *H);



#endif
