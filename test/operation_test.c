#include "operation.h"
#include "complex.h"
#include <stdint.h>
#include <stdio.h>


int OperationTest()
{
	int i;
	int status;

	// maximum error
	double err = 0;

	printf("Testing simultaneous MPO and MPS operations...\n");

	const int L = 6;
	const size_t d = 3;

	// allocate matrix product state and load MPS tensors from disk
	mps_t psi;
	{
		const size_t D[] = { 1, 7, 6, 4, 5, 8, 1 };
		AllocateMPS(L, d, D, &psi);

		for (i = 0; i < L; i++)
		{
			char filename[1024];
			sprintf(filename, "../test/operation_test_A%i.dat", i);
			status = ReadData(filename, psi.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&psi.A[i]));
			if (status < 0) { return status; }
		}
	}

	// allocate matrix product operator and load MPO tensors from disk
	mpo_t op;
	{
		const size_t dim[] = { d, d };
		const size_t D[]   = { 1, 5, 6, 4, 7, 4, 1 };
		AllocateMPO(L, dim, D, &op);

		for (i = 0; i < L; i++)
		{
			char filename[1024];
			sprintf(filename, "../test/operation_test_W%i.dat", i);
			status = ReadData(filename, op.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&op.A[i]));
			if (status < 0) { return status; }
		}
	}

	// calculate average (expectation value)
	{
		const MKL_Complex16 avr = OperatorAverage(&psi, &op);

		// reference value
		const MKL_Complex16 avr_ref = { 0.13951174201351324, 0.418058504881752 };

		// largest entrywise error
		err = fmax(err, ComplexAbs(ComplexSubtract(avr, avr_ref)));
	}

	// apply local Hamiltonian operator
	{
		tensor_t BL, BR;
		const size_t dimL[3] = { 5, 7, 6 };
		const size_t dimR[3] = { 8, 4, 9 };
		AllocateTensor(3, dimL, &BL);
		AllocateTensor(3, dimR, &BR);
		status = ReadData("../test/operation_test_BL.dat", BL.data, sizeof(MKL_Complex16), NumTensorElements(&BL)); if (status < 0) { return status; }
		status = ReadData("../test/operation_test_BR.dat", BR.data, sizeof(MKL_Complex16), NumTensorElements(&BR)); if (status < 0) { return status; }

		tensor_t HM;
		ApplyLocalHamiltonian(&BL, &BR, &op.A[4], &psi.A[4], &HM);

		// compare with reference
		tensor_t HM_ref;
		{
			const size_t dim[3] =  { d, 6, 9 };
			AllocateTensor(3, dim, &HM_ref);
			status = ReadData("../test/operation_test_HM.dat", HM_ref.data, sizeof(MKL_Complex16), NumTensorElements(&HM_ref));
			if (status < 0) { return status; }
		}
		// largest entrywise error
		err = fmax(err, UniformDistance(2*NumTensorElements(&HM), (double *)HM.data, (double *)HM_ref.data));

		DeleteTensor(&HM_ref);
		DeleteTensor(&BR);
		DeleteTensor(&BL);
	}

	printf("Largest error: %g\n", err);

	// clean up
	DeleteMPO(&op);
	DeleteMPS(&psi);

	return (err < 2e-15 ? 0 : 1);
}
