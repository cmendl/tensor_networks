/// \file qnumber.c
/// \brief Quantum numbers and corresponding utility functions

#include "qnumber.h"
#include <stdint.h>
#include <stdbool.h>
#include <mkl.h>
#include <assert.h>


//________________________________________________________________________________________________________________________
///
/// \brief Find intersection of quantum numbers in arrays 'q0' and 'q1'
///
/// \param q0 array of quantum numbers (need not be sorted)
/// \param n0 length of 'q0'
/// \param q1 array of quantum numbers (need not be sorted)
/// \param n1 length of 'q1'
/// \param qis will be filled with intersection of quantum numbers in 'q0' and 'q1', containing every common quantum number only once
/// \param nis will be set to the length of 'qis'
/// \return whether all quantum numbers in 'q0' and 'q1' agree
///
/// For efficiency, integer range of quantum numbers should not be too large
///
bool IntersectQuantumNumbers(const qnumber_t *restrict q0, const size_t n0, const qnumber_t *restrict q1, const size_t n1, qnumber_t *restrict *qis, size_t *nis)
{
	if (n0 == 0 || n1 == 0)
	{
		(*qis) = NULL;
		(*nis) = 0;
		return false;
	}

	size_t i;

	#if NQNUMBER == 1

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

	if (q_min == q_max)
	{
		// special case: only a single quantum number

		(*nis) = 1;
		(*qis) = (qnumber_t *)MKL_malloc(sizeof(qnumber_t), MEM_DATA_ALIGN);
		(*qis)[0] = q_min;

		return true;
	}

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

	// must be more than a single quantum number
	assert((*nis) > 1);

	return false;

	#elif NQNUMBER == 2

	// find range of quantum numbers
	qnumber_t q_min = q0[0];
	qnumber_t q_max = q0[0];
	for (i = 0; i < n0; i++)
	{
		if (q_min._0 > q0[i]._0)
		{
			q_min._0 = q0[i]._0;
		}
		if (q_min._1 > q0[i]._1)
		{
			q_min._1 = q0[i]._1;
		}

		if (q_max._0 < q0[i]._0)
		{
			q_max._0 = q0[i]._0;
		}
		if (q_max._1 < q0[i]._1)
		{
			q_max._1 = q0[i]._1;
		}
	}
	for (i = 0; i < n1; i++)
	{
		if (q_min._0 > q1[i]._0)
		{
			q_min._0 = q1[i]._0;
		}
		if (q_min._1 > q1[i]._1)
		{
			q_min._1 = q1[i]._1;
		}

		if (q_max._0 < q1[i]._0)
		{
			q_max._0 = q1[i]._0;
		}
		if (q_max._1 < q1[i]._1)
		{
			q_max._1 = q1[i]._1;
		}
	}
	assert(q_min._0 <= q_max._0);
	assert(q_min._1 <= q_max._1);

	if (q_min._0 == q_max._0 && q_min._1 == q_max._1)
	{
		// special case: only a single quantum number

		(*nis) = 1;
		(*qis) = (qnumber_t *)MKL_malloc(sizeof(qnumber_t), MEM_DATA_ALIGN);
		(*qis)[0] = q_min;

		return true;
	}

	// allocate temporary map, with first or second bit set to 1 if corresponding quantum number is in 'q0' or 'q1', respectively
	const int range0 = (q_max._0 - q_min._0 + 1);
	const int range1 = (q_max._1 - q_min._1 + 1);
	uint8_t *map = (uint8_t *)MKL_calloc(range0 * range1, sizeof(uint8_t), MEM_DATA_ALIGN);

	for (i = 0; i < n0; i++)
	{
		map[(q0[i]._0 - q_min._0) + range0*(q0[i]._1 - q_min._1)] = 0x1;
	}
	for (i = 0; i < n1; i++)
	{
		map[(q1[i]._0 - q_min._0) + range0*(q1[i]._1 - q_min._1)] |= 0x2;
	}

	// count number of common quantum numbers
	(*nis) = 0;
	int j;
	for (j = 0; j < range0 * range1; j++)
	{
		if (map[j] == 0x3) {
			(*nis)++;
		}
	}

	// collect common quantum numbers
	(*qis) = (qnumber_t *)MKL_malloc((*nis) * sizeof(qnumber_t), MEM_DATA_ALIGN);
	size_t n = 0;
	int k;
	for (k = 0; k < range1; k++)
	{
		for (j = 0; j < range0; j++)
		{
			if (map[j + range0*k] == 0x3)
			{
				(*qis)[n]._0 = q_min._0 + j;
				(*qis)[n]._1 = q_min._1 + k;
				n++;
			}
		}
	}
	assert(n == (*nis));

	// clean up
	MKL_free(map);

	// must be more than a single quantum number
	assert((*nis) > 1);

	return false;

	#endif
}
