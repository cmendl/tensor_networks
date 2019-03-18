/// \file qnumber.c
/// \brief Quantum numbers and corresponding utility functions

#include "qnumber.h"
#include <stdint.h>
#include <memory.h>
#include <mkl.h>
#include <assert.h>


//________________________________________________________________________________________________________________________
///
/// \brief Comparison function used by 'qsort'
///
static int CompareQuantumNumbers(const void *p1, const void *p2)
{
	const qnumber_t x = *(qnumber_t *)p1;
	const qnumber_t y = *(qnumber_t *)p2;

	if (x < y)
	{
		return -1;
	}
	else if (y < x)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}


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
/// \return whether 'q0' and 'q1' are filled with a single common quantum number
///
bool IntersectQuantumNumbers(const qnumber_t *restrict q0, const size_t n0, const qnumber_t *restrict q1, const size_t n1, qnumber_t *restrict *qis, size_t *nis)
{
	if (n0 == 0 || n1 == 0)
	{
		// fast return if at least one of the quantum number arrays is empty
		(*qis) = NULL;
		(*nis) = 0;
		return false;
	}

	if (n0 > n1)
	{
		// recursive call with swapped arrays (such that n0 <= n1)
		return IntersectQuantumNumbers(q1, n1, q0, n0, qis, nis);
	}

	assert(n0 <= n1);

	int i;

	// sort quantum numbers in q0 and remove duplicates
	// TODO: could use mergesort to remove duplicates directly
	qnumber_t *q0s = (qnumber_t *)MKL_malloc(n0 * sizeof(qnumber_t), MEM_DATA_ALIGN);
	memcpy(q0s, q0, n0 * sizeof(qnumber_t));
	qsort(q0s, n0, sizeof(qnumber_t), CompareQuantumNumbers);
	// remove duplicates in sorted array
	int iref = 0;
	for (i = 1; i < (int)n0; i++)
	{
		assert(q0s[iref] <= q0s[i]);
		if (q0s[iref] != q0s[i])
		{
			iref++;
			q0s[iref] = q0s[i]; // possibly redundant copy
		}
	}
	// number of unique quantum numbers in q0
	const int n0s = iref + 1;

	// return value
	bool ret = true;

	if (n0s > 1) {
		ret = false;
	}

	// mark elements of q1 in sorted array
	uint8_t *mark = (uint8_t *)MKL_calloc(n0s, sizeof(uint8_t), MEM_DATA_ALIGN);
	for (i = 0; i < (int)n1; i++)
	{
		if (q1[i] != q1[0]) {
			ret = false;
		}

		// binary search
		int left = 0;
		int right = n0s - 1;
		if (q1[i] < q0s[left] || q0s[right] < q1[i])
		{
			continue;
		}
		while (left <= right)
		{
			int m = (left + right) / 2;
			if (q0s[m] < q1[i])
			{
				left = m + 1;
			}
			else if (q1[i] < q0s[m])
			{
				right = m - 1;
			}
			else
			{
				// q0s[m] == q1[i]
				mark[m] = 1;
				break;
			}
		}
	}

	// count number of common quantum numbers
	(*nis) = 0;
	for (i = 0; i < n0s; i++)
	{
		if (mark[i] == 1) {
			(*nis)++;
		}
	}
	if ((*nis) != 1) {
		ret = false;
	}

	// collect common quantum numbers
	(*qis) = (qnumber_t *)MKL_malloc((*nis) * sizeof(qnumber_t), MEM_DATA_ALIGN);
	int j = 0;
	for (i = 0; i < n0s; i++)
	{
		if (mark[i] == 1)
		{
			(*qis)[j] = q0s[i];
			j++;
		}
	}
	assert(j == (*nis));

	// clean up
	MKL_free(mark);
	MKL_free(q0s);

	return ret;
}
