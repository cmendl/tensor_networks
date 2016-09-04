#include "mps.h"
#include "complex.h"
#include <mkl.h>
#include <stdlib.h>
#include <memory.h>
#include <math.h>
#include <stdio.h>


int MPSTest()
{
	int i;

	// maximum error
	double err = 0;

	printf("Testing MPS operations...\n");

	// allocate MPS state
	mps_t mps;
	const size_t D[] = { 1, 5, 5, 5, 5, 5, 5, 1 };
	AllocateMPS(7, 2, D, &mps);

	// load MPS matrices from disk
	for (i = 0; i < mps.L; i++)
	{
		char filename[1024];
		sprintf(filename, "../test/mps_test_A%i.dat", i);
		tensor_t t;	// temporary tensor
		const size_t dim[3] = { mps.A[i].dim[0], mps.A[i].dim[2], mps.A[i].dim[1] };
		AllocateTensor(3, dim, &t);
		int status = ReadData(filename, t.data, sizeof(MKL_Complex16), NumTensorElements(&t));
		if (status < 0) { return status; }

		// interchange second and third dimension
		// TODO: inplace transpose
		const int perm[3] = { 0, 2, 1 };
		tensor_t A;
		TransposeTensor(perm, &t, &A);
		DeleteTensor(&t);

		assert(A.ndim == 3 && mps.A[i].ndim == 3);
		assert(A.dim[0] == mps.A[i].dim[0]);
		assert(A.dim[1] == mps.A[i].dim[1]);
		assert(A.dim[2] == mps.A[i].dim[2]);
		memcpy(mps.A[i].data, A.data, NumTensorElements(&A)*sizeof(MKL_Complex16));
		DeleteTensor(&A);
	}

	// left and right partial contractions
	tensor_t *cntrL = MKL_calloc(mps.L, sizeof(tensor_t), MEM_DATA_ALIGN);
	tensor_t *cntrR = MKL_calloc(mps.L, sizeof(tensor_t), MEM_DATA_ALIGN);
	CalculateMPSContraction(&mps, cntrL, cntrR);

	// norm
	{
		// reference value
		const double n_ref = 0.9872785797299465;

		const double n = CalculateMPSNorm(&mps);

		// maximum error
		err = fmax(err, fabs(n - n_ref));

		// alternative computation using partial contractions
		for (i = 0; i < mps.L - 1; i++)
		{
			tensor_t t;
			MultiplyTensor(&cntrL[i], &cntrR[i + 1], &t);
			const double nc = TensorTrace(&t).real;

			// maximum error
			err = fmax(err, fabs(nc - n_ref));

			DeleteTensor(&t);
		}
	}

	// one-site operator average
	{
		tensor_t op;
		const size_t dim[2] = { 2, 2 };
		AllocateTensor(2, dim, &op);
		int status = ReadData("../test/mps_test_op.dat", op.data, sizeof(MKL_Complex16), NumTensorElements(&op));
		if (status < 0) { return status; }

		const MKL_Complex16 avr = MPSAverageOneSiteOp(&mps, cntrL, cntrR, &op);

		// reference value
		const MKL_Complex16 avr_ref = { 3.5064467501058125, 6.2666073957732165 };

		// maximum error
		err = fmax(err, ComplexAbs(ComplexSubtract(avr, avr_ref)));

		// clean up
		DeleteTensor(&op);
	}

	// two-site operator average
	{
		tensor_t op1, op2;
		const size_t dim[2] = { 2, 2 };
		AllocateTensor(2, dim, &op1);
		AllocateTensor(2, dim, &op2);
		int status;
		status = ReadData("../test/mps_test_op1.dat", op1.data, sizeof(MKL_Complex16), NumTensorElements(&op1)); if (status < 0) { return status; }
		status = ReadData("../test/mps_test_op2.dat", op2.data, sizeof(MKL_Complex16), NumTensorElements(&op2)); if (status < 0) { return status; }

		const MKL_Complex16 avr = MPSAverageTwoSiteOp(&mps, cntrL, cntrR, &op1, &op2);

		// reference value
		const MKL_Complex16 avr_ref = { 1.4404951113888615, -0.6011221276170966 };

		// maximum error
		err = fmax(err, ComplexAbs(ComplexSubtract(avr, avr_ref)));

		// clean up
		DeleteTensor(&op2);
		DeleteTensor(&op1);
	}

	printf("Largest error: %g\n", err);

	// clean up
	for (i = 0; i < mps.L; i++)
	{
		DeleteTensor(&cntrL[i]);
		DeleteTensor(&cntrR[i]);
	}
	MKL_free(cntrR);
	MKL_free(cntrL);
	DeleteMPS(&mps);

	return (err < 2e-15 ? 0 : 1);
}
