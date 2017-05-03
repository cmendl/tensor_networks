/// \file qnumber.h
/// \brief Quantum numbers and corresponding utility functions

#ifndef QNUMBER_H
#define QNUMBER_H

#include <stdlib.h>
#include <stdbool.h>


//________________________________________________________________________________________________________________________
///
/// \brief Quantum number type; would be a vector for several simultaneously conserved quantum numbers
///
/// For half-integer quantum numbers like spins, we store the physical quantum number times 2 to avoid rounding issues
///
typedef int qnumber_t;


//________________________________________________________________________________________________________________________
///
/// \brief Add two quantum numbers
///
inline qnumber_t AddQuantumNumbers(const qnumber_t q0, const qnumber_t q1)
{
	return q0 + q1;
}


//________________________________________________________________________________________________________________________
///
/// \brief Subtract two quantum numbers
///
inline qnumber_t SubtractQuantumNumbers(const qnumber_t q0, const qnumber_t q1)
{
	return q0 - q1;
}


//________________________________________________________________________________________________________________________
///
/// \brief Flip the sign of a quantum number
///
inline qnumber_t NegateQuantumNumber(const qnumber_t q)
{
	return -q;
}


//________________________________________________________________________________________________________________________
//


bool IntersectQuantumNumbers(const qnumber_t *restrict q0, const size_t n0, const qnumber_t *restrict q1, const size_t n1, qnumber_t *restrict *qis, size_t *nis);



#endif
