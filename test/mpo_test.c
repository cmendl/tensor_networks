#include "mpo.h"
#include "complex.h"
#include <mkl.h>
#include <stdlib.h>
#include <memory.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>


int MPOTest()
{
	int i;
	int status;

	// maximum error
	double err = 0;

	printf("Testing MPO operations...\n");

	const int L = 6;

	// allocate 'X' and 'Y' MPOs
	mpo_t X;
	{
		const size_t d[] = { 3, 4 };
		const size_t D[] = { 1, 5, 6, 4, 7, 4, 1 };
		AllocateMPO(L, d, D, &X);
	}
	mpo_t Y;
	{
		const size_t d[] = { 4, 3 };
		const size_t D[] = { 1, 5, 6, 4, 7, 4, 1 };
		AllocateMPO(L, d, D, &Y);
	}

	// load MPO tensors from disk
	for (i = 0; i < L; i++)
	{
		char filename[1024];
		sprintf(filename, "../test/mpo_test_A0_%i.dat", i);
		status = ReadData(filename, X.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&X.A[i]));
		if (status < 0) { return status; }
	}
	for (i = 0; i < L; i++)
	{
		char filename[1024];
		sprintf(filename, "../test/mpo_test_A1_%i.dat", i);
		status = ReadData(filename, Y.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&Y.A[i]));
		if (status < 0) { return status; }
	}

	// allocate and load 'C' tensors
	tensor_t C0, C1;
	{
		const size_t dimC0[4] = { 3, 3, 6, 7 };
		const size_t dimC1[4] = { 4, 4, 7, 8 };
		AllocateTensor(4, dimC0, &C0);
		AllocateTensor(4, dimC1, &C1);
		status = ReadData("../test/mpo_test_C0.dat", C0.data, sizeof(MKL_Complex16), NumTensorElements(&C0)); if (status < 0) { return status; }
		status = ReadData("../test/mpo_test_C1.dat", C1.data, sizeof(MKL_Complex16), NumTensorElements(&C1)); if (status < 0) { return status; }
	}

	// merging of all tensors
	{
		tensor_t Am;
		MergeMPOFull(&X, &Am);

		// first few entries of reference tensor
		const int n = 1764;
		MKL_Complex16 *Am_ref = (MKL_Complex16 *)MKL_malloc(n*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
		status = ReadData("../test/mpo_test_A_merged.dat", Am_ref, sizeof(MKL_Complex16), n);
		if (status < 0) { return status; }

		// check dimensions
		if (Am.ndim != 2 || Am.dim[0] != 729 || Am.dim[1] != 4096)
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(2*n, (double *)Am.data, (double *)Am_ref));
		}

		MKL_free(Am_ref);
		DeleteTensor(&Am);
	}

	// reduction step required for trace of tensor product
	{
		size_t dim[2];

		tensor_t R;
		dim[0] = 4;
		dim[1] = 4;
		AllocateTensor(2, dim, &R);
		status = ReadData("../test/mpo_test_R0.dat", R.data, sizeof(MKL_Complex16), NumTensorElements(&R));
		if (status < 0) { return status; }

		MPOTraceProductTensorReduce(&X.A[2], &Y.A[2], &R);

		// reference tensor
		tensor_t R_ref;
		dim[0] = 6;
		dim[1] = 6;
		AllocateTensor(2, dim, &R_ref);
		status = ReadData("../test/mpo_test_R1.dat", R_ref.data, sizeof(MKL_Complex16), NumTensorElements(&R_ref));
		if (status < 0) { return status; }

		if (NumTensorElements(&R) != NumTensorElements(&R_ref))
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(2*NumTensorElements(&R), (double *)R.data, (double *)R_ref.data));
		}

		DeleteTensor(&R_ref);
		DeleteTensor(&R);
	}

	// trace
	{
		mpo_t B;
		const size_t d[] = { 4, 4 };
		const size_t D[] = { 1, 5, 6, 3, 7, 4, 1 };
		AllocateMPO(L, d, D, &B);

		// load MPO tensors from disk
		for (i = 0; i < L; i++)
		{
			char filename[1024];
			sprintf(filename, "../test/mpo_test_B%i.dat", i);
			status = ReadData(filename, B.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&B.A[i]));
			if (status < 0) { return status; }
		}

		MKL_Complex16 tr = MPOTrace(&B);

		// reference value
		const MKL_Complex16 tr_ref = { -0.018380127839321195, 0.023927449138618842 };

		// relative error
		err = fmax(err, ComplexAbs(ComplexSubtract(tr, tr_ref)) / ComplexAbs(tr_ref));

		DeleteMPO(&B);
	}

	// trace of tensor product
	{
		MKL_Complex16 tr = MPOTraceProduct(&X, &Y);

		// reference value
		const MKL_Complex16 tr_ref = { -0.002196494532973509, -0.0006521869447454243 };

		// relative error
		err = fmax(err, ComplexAbs(ComplexSubtract(tr, tr_ref)) / ComplexAbs(tr_ref));
	}

	// Frobenius norm
	{
		double nF = MPOFrobeniusNorm(&X);

		// reference value
		const double nF_ref = 1.891276051987931;

		// relative error
		err = fmax(err, fabs(nF - nF_ref) / nF_ref);
	}

	// trace of tensor quad-product
	{
		mpo_t F[4];
		const size_t d[5] = { 3, 5, 4, 2, 3 };
		const size_t D[4][7] = {
			{ 1, 5, 6, 4, 7, 4, 1 },
			{ 1, 6, 2, 7, 8, 5, 1 },
			{ 1, 5, 6, 7, 3, 4, 1 },
			{ 1, 5, 7, 3, 1, 4, 1 }
		};
		int j;
		for (j = 0; j < 4; j++)
		{
			AllocateMPO(L, &d[j], D[j], &F[j]);

			for (i = 0; i < L; i++)
			{
				char filename[1024];
				sprintf(filename, "../test/mpo_test_F%i_%i.dat", j, i);
				status = ReadData(filename, F[j].A[i].data, sizeof(MKL_Complex16), NumTensorElements(&F[j].A[i]));
				if (status < 0) { return status; }
			}
		}

		const MKL_Complex16 tr = MPOTraceQuadProduct(&F[0], &F[1], &F[2], &F[3]);

		// reference value
		const MKL_Complex16 tr_ref = { -0.23230111591311567, 0.04966814423773235 };

		// relative error
		err = fmax(err, ComplexAbs(ComplexSubtract(tr, tr_ref)) / ComplexAbs(tr_ref));

		// clean up
		for (j = 0; j < 4; j++)
		{
			DeleteMPO(&F[j]);
		}
	}

	// apply two-site operators
	{
		// allocate and load operators
		tensor_t opT, opB;
		const size_t dim_op[2] = { 12, 12 };
		AllocateTensor(2, dim_op, &opT);
		AllocateTensor(2, dim_op, &opB);
		status = ReadData("../test/mpo_test_opT.dat", opT.data, sizeof(MKL_Complex16), NumTensorElements(&opT)); if (status < 0) { return status; }
		status = ReadData("../test/mpo_test_opB.dat", opB.data, sizeof(MKL_Complex16), NumTensorElements(&opB)); if (status < 0) { return status; }

		const double tol = 0.1;    // use artificially high tolerance to truncate some singular values
		const size_t maxD = INT32_MAX;

		// load reference tensor from disk
		tensor_t Cref;
		const size_t dimCref[6] = { 3, 4, 6, 3, 4, 8 };
		AllocateTensor(6, dimCref, &Cref);
		status = ReadData("../test/mpo_test_Cref.dat", Cref.data, sizeof(MKL_Complex16), NumTensorElements(&Cref));
		if (status < 0) { return status; }

		// iterate over all distribution modes
		svd_distr_t m;
		for (m = (svd_distr_t)0; m < SVD_DISTR_NUM; m++)
		{
			tensor_t C0op, C1op;
			CopyTensor(&C0, &C0op);
			CopyTensor(&C1, &C1op);
			ApplyTwoSiteOperator(&C0op, &C1op, &opT, &opB, m, tol, maxD);

			// re-combine C0op and C1op by contracting the shared bond, to compare with reference ('U' and 'V' SVD matrices not unique)
			tensor_t C;
			{
				tensor_t t;
				const int perm[4] = { 1, 2, 0, 3 };
				TransposeTensor(perm, &C1op, &t);
				MultiplyTensor(&C0op, &t, 1, &C);
				DeleteTensor(&t);
			}

			if (NumTensorElements(&C) != NumTensorElements(&Cref))
			{
				err = fmax(err, 1);
			}
			else
			{
				// largest entrywise error
				err = fmax(err, UniformDistance(2*NumTensorElements(&C), (double *)C.data, (double *)Cref.data));
			}
			DeleteTensor(&C);
			DeleteTensor(&C1op);
			DeleteTensor(&C0op);
		}

		// clean up
		DeleteTensor(&Cref);
		DeleteTensor(&opB);
		DeleteTensor(&opT);
	}

	printf("Largest error: %g\n", err);

	// clean up
	DeleteTensor(&C1);
	DeleteTensor(&C0);
	DeleteMPO(&Y);
	DeleteMPO(&X);

	return (err < 4e-15 ? 0 : 1);
}
