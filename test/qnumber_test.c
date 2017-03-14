#include "qnumber.h"
#include "util.h"
#include <mkl.h>
#include <stdio.h>


static inline int imax(const int x, const int y)
{
	return (y < x ? x : y);
}


int QuantumNumberTest()
{
	int status;

	// accumulated error
	int err = 0;

	printf("Testing quantum number utility functions...\n");

	// load quantum numbers from disk
	const size_t n0 = 12;
	const size_t n1 = 10;
	qnumber_t *q0 = (qnumber_t *)MKL_malloc(n0 * sizeof(qnumber_t), MEM_DATA_ALIGN);
	qnumber_t *q1 = (qnumber_t *)MKL_malloc(n1 * sizeof(qnumber_t), MEM_DATA_ALIGN);
	status = ReadData("../test/qnumber_test_q0.dat", q0, sizeof(qnumber_t), n0); if (status < 0) { return status; }
	status = ReadData("../test/qnumber_test_q1.dat", q1, sizeof(qnumber_t), n1); if (status < 0) { return status; }

	// find intersection of quantum numbers
	{
		qnumber_t *qis;
		size_t nis;
		IntersectQuantumNumbers(q0, n0, q1, n1, &qis, &nis);

		// load reference data from disk
		const size_t nis_ref = 4;
		qnumber_t *qis_ref = (qnumber_t *)MKL_malloc(nis_ref * sizeof(qnumber_t), MEM_DATA_ALIGN);
		status = ReadData("../test/qnumber_test_qis.dat", qis_ref, sizeof(qnumber_t), nis_ref);
		if (status < 0) { return status; }

		if (nis != nis_ref)
		{
			err = 1;
		}
		else
		{
			// largest entrywise error
			size_t j;
			for (j = 0; j < nis; j++) {
				err = imax(err, abs(qis[j] - qis_ref[j]));
			}
		}

		// clean up
		MKL_free(qis_ref);
		MKL_free(qis);
	}

	printf("Largest error: %i\n", err);

	// clean up
	MKL_free(q1);
	MKL_free(q0);

	return (err == 0 ? 0 : 1);
}
