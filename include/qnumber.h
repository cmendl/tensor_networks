/// \file qnumber.h
/// \brief Quantum numbers and corresponding utility functions

#ifndef QNUMBER_H
#define QNUMBER_H

#include <stdbool.h>


//________________________________________________________________________________________________________________________
///
/// \brief Quantum number type for exploiting U(1) symmetries (like particle number or spin conservation)
///
/// For half-integer quantum numbers like spins, we store the physical quantum number times 2 to avoid rounding issues
///
typedef int qnumber_t;


/// \brief Bit shift to encode another quantum number within the same integer
#define QNUMBER2_SHIFT (4*sizeof(qnumber_t))


//________________________________________________________________________________________________________________________
//


bool IntersectQuantumNumbers(const qnumber_t *restrict q0, const size_t n0, const qnumber_t *restrict q1, const size_t n1, qnumber_t *restrict *qis, size_t *nis);



#endif
