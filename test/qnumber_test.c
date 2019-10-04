#include "qnumber.h"
#include "util.h"
#include <stdio.h>


int QuantumNumberTest()
{
	int status;

	// accumulated error
	int err = 0;

	printf("Testing quantum number utility functions, for one U(1) symmetry...\n");

	// load quantum numbers from disk
	const size_t n0 = 12;
	const size_t n1 = 10;
	qnumber_t *q0 = (qnumber_t *)algn_malloc(n0 * sizeof(qnumber_t));
	qnumber_t *q1 = (qnumber_t *)algn_malloc(n1 * sizeof(qnumber_t));
	status = ReadData("../test/qnumber_test_q0.dat", q0, sizeof(qnumber_t), n0); if (status < 0) { return status; }
	status = ReadData("../test/qnumber_test_q1.dat", q1, sizeof(qnumber_t), n1); if (status < 0) { return status; }

	// find intersection of quantum numbers
	{
		qnumber_t *qis;
		size_t nis;
		IntersectQuantumNumbers(q0, n0, q1, n1, &qis, &nis);

		// load reference data from disk
		const size_t nis_ref = 4;
		qnumber_t *qis_ref = (qnumber_t *)algn_malloc(nis_ref * sizeof(qnumber_t));
		status = ReadData("../test/qnumber_test_qis.dat", qis_ref, sizeof(qnumber_t), nis_ref);
		if (status < 0) { return status; }

		if (nis != nis_ref)
		{
			err = 1;
		}
		else
		{
			size_t j;
			for (j = 0; j < nis; j++) {
				if (qis[j] != qis_ref[j]) {
					err = 1;
				}
			}
		}

		// clean up
		algn_free(qis_ref);
		algn_free(qis);
	}

	printf("Error: %i\n", err);

	// clean up
	algn_free(q1);
	algn_free(q0);

	return (err == 0 ? 0 : 1);
}
