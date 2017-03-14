/// \file qnumber.c
/// \brief Quantum numbers and corresponding utility functions

#include "qnumber.h"
#include <stdint.h>
#include <stdbool.h>
#include <mkl.h>
#include <assert.h>


//________________________________________________________________________________________________________________________
///
/// \brief Find intersection of (possibly unsorted) quantum numbers in arrays 'q0' and 'q1';
/// resulting array 'qis' will contain every common quantum number only once
///
/// For efficiency, integer range of quantum numbers should not be too large
///
void IntersectQuantumNumbers(const qnumber_t *restrict q0, const size_t n0, const qnumber_t *restrict q1, const size_t n1, qnumber_t *restrict *qis, size_t *nis)
{
	if (n0 == 0 || n1 == 0)
	{
		(*qis) = NULL;
		(*nis) = 0;
		return;
	}

	size_t i;

	// find range of quantum numbers
	qnumber_t q_min = q0[0];
	qnumber_t q_max = q0[0];
	for (i = 0; i < n0; i++)
	{
		if (q_min > q0[i])
		{
			q_min = q0[i];
		}

		if (q_max < q0[i])
		{
			q_max = q0[i];
		}
	}
	for (i = 0; i < n1; i++)
	{
		if (q_min > q1[i])
		{
			q_min = q1[i];
		}

		if (q_max < q1[i])
		{
			q_max = q1[i];
		}
	}
	assert(q_min <= q_max);

	// allocate temporary map, with first or second bit set to 1 if corresponding quantum number is in 'q0' or 'q1', respectively
	uint8_t *map = (uint8_t *)MKL_calloc(q_max - q_min + 1, sizeof(uint8_t), MEM_DATA_ALIGN);

	for (i = 0; i < n0; i++)
	{
		map[q0[i] - q_min] = 0x1;
	}
	for (i = 0; i < n1; i++)
	{
		map[q1[i] - q_min] |= 0x2;
	}

	// count number of common quantum numbers
	(*nis) = 0;
	qnumber_t j;
	for (j = 0; j < q_max - q_min + 1; j++)
	{
		if (map[j] == 0x3) {
			(*nis)++;
		}
	}

	// collect common quantum numbers
	(*qis) = (qnumber_t *)MKL_malloc((*nis) * sizeof(qnumber_t), MEM_DATA_ALIGN);
	size_t n = 0;
	for (j = 0; j < q_max - q_min + 1; j++)
	{
		if (map[j] == 0x3)
		{
			(*qis)[n] = q_min + j;
			n++;
		}
	}
	assert(n == (*nis));

	// clean up
	MKL_free(map);
}
