/// \file qnumber.h
/// \brief Quantum numbers and corresponding utility functions

#ifndef QNUMBER_H
#define QNUMBER_H

#include <stdlib.h>
#include <stdbool.h>


#if NQNUMBER == 1

//________________________________________________________________________________________________________________________
///
/// \brief Quantum number type for exploiting one U(1) symmetry (like particle number or spin conservation)
///
/// For half-integer quantum numbers like spins, we store the physical quantum number times 2 to avoid rounding issues
///
typedef int qnumber_t;

#elif NQNUMBER == 2
// two simultaneously conserved quantum numbers

//________________________________________________________________________________________________________________________
///
/// \brief Quantum number type for exploiting two U(1) symmetries (like particle number or spin conservation)
///
/// For half-integer quantum numbers like spins, we store the physical quantum number times 2 to avoid rounding issues
///
typedef struct
{
	int _0;
	int _1;
}
qnumber_t;

#endif


//________________________________________________________________________________________________________________________
///
/// \brief Check whether two quantum numbers are equal
///
inline bool EqualQuantumNumbers(const qnumber_t q0, const qnumber_t q1)
{
	#if NQNUMBER == 1

	return q0 == q1;

	#elif NQNUMBER == 2

	return (q0._0 == q1._0) && (q0._1 == q1._1);

	#endif
}


//________________________________________________________________________________________________________________________
///
/// \brief Add two quantum numbers
///
inline qnumber_t AddQuantumNumbers(const qnumber_t q0, const qnumber_t q1)
{
	#if NQNUMBER == 1

	return q0 + q1;

	#elif NQNUMBER == 2

	qnumber_t ret;
	ret._0 = q0._0 + q1._0;
	ret._1 = q0._1 + q1._1;

	return ret;

	#endif
}


//________________________________________________________________________________________________________________________
///
/// \brief Subtract two quantum numbers
///
inline qnumber_t SubtractQuantumNumbers(const qnumber_t q0, const qnumber_t q1)
{
	#if NQNUMBER == 1

	return q0 - q1;

	#elif NQNUMBER == 2

	qnumber_t ret;
	ret._0 = q0._0 - q1._0;
	ret._1 = q0._1 - q1._1;

	return ret;

	#endif
}


//________________________________________________________________________________________________________________________
///
/// \brief Flip the sign of a quantum number
///
inline qnumber_t NegateQuantumNumber(const qnumber_t q)
{
	#if NQNUMBER == 1

	return -q;

	#elif NQNUMBER == 2

	qnumber_t ret;
	ret._0 = -q._0;
	ret._1 = -q._1;

	return ret;

	#endif
}


//________________________________________________________________________________________________________________________
//


bool IntersectQuantumNumbers(const qnumber_t *restrict q0, const size_t n0, const qnumber_t *restrict q1, const size_t n1, qnumber_t *restrict *qis, size_t *nis);



#endif
