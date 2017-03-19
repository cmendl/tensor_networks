#include "mps.h"
#include "complex.h"
#include <mkl.h>
#include <stdlib.h>
#include <memory.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>


//________________________________________________________________________________________________________________________
///
/// \brief Check whether solely entries corresponding to matching quantum numbers are non-zero
///
static double BlockStructureError(const tensor_t *A, const qnumber_t *restrict qd, const qnumber_t *restrict qD0, const qnumber_t *restrict qD1)
{
	assert(A->ndim == 3);

	double err = 0;

	size_t i, j, k;
	for (k = 0; k < A->dim[2]; k++)
	{
		for (j = 0; j < A->dim[1]; j++)
		{
			for (i = 0; i < A->dim[0]; i++)
			{
				if (qd[i] + qD0[j] != qD1[k])
				{
					err += ComplexAbs(A->data[i + A->dim[0]*(j + A->dim[1]*k)]);
				}
			}
		}
	}

	return err;
}


int MPSTest()
{
	int i;

	// maximum error
	double err = 0;

	printf("Testing MPS operations...\n");

	const int L = 6;
	const size_t d = 4;

	// allocate MPS state
	mps_t mps;
	const size_t D[] = { 1, 2, 9, 6, 5, 3, 1 };
	AllocateMPS(L, d, D, &mps);

	// load MPS tensors from disk
	for (i = 0; i < mps.L; i++)
	{
		char filename[1024];
		sprintf(filename, "../test/mps_test_A%i.dat", i);
		int status = ReadData(filename, mps.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&mps.A[i]));
		if (status < 0) { return status; }
	}

	// norm
	{
		const double n = CalculateMPSNorm(&mps);

		// reference value
		const double n_ref = 0.8110767739639566;

		// maximum error
		err = fmax(err, fabs(n - n_ref));
	}

	// unitary left projection at site 1
	{
		tensor_t B1, B2;
		CopyTensor(&mps.A[1], &B1);
		CopyTensor(&mps.A[2], &B2);

		MPSUnitaryLeftProjection(&B1, &B2);

		// load reference data from disk
		tensor_t B1_ref;
		{
			const size_t dim[3] = { d, 2, 8 };
			AllocateTensor(3, dim, &B1_ref);
			int status = ReadData("../test/mps_test_B1.dat", B1_ref.data, sizeof(MKL_Complex16), NumTensorElements(&B1_ref));
			if (status < 0) { return status; }
		}
		tensor_t B2_ref;
		{
			const size_t dim[3] = { d, 8, 6 };
			AllocateTensor(3, dim, &B2_ref);
			int status = ReadData("../test/mps_test_B2.dat", B2_ref.data, sizeof(MKL_Complex16), NumTensorElements(&B2_ref));
			if (status < 0) { return status; }
		}

		// check dimensions
		if (B1.ndim != 3 || B1.dim[0] != B1_ref.dim[0] || B1.dim[1] != B1_ref.dim[1] || B1.dim[2] != B1_ref.dim[2])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(2*NumTensorElements(&B1_ref), (double *)B1.data, (double *)B1_ref.data));
		}

		// check dimensions
		if (B2.ndim != 3 || B2.dim[0] != B2_ref.dim[0] || B2.dim[1] != B2_ref.dim[1] || B2.dim[2] != B2_ref.dim[2])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(2*NumTensorElements(&B2_ref), (double *)B2.data, (double *)B2_ref.data));
		}

		DeleteTensor(&B2_ref);
		DeleteTensor(&B1_ref);
		DeleteTensor(&B2);
		DeleteTensor(&B1);
	}

	// unitary left projection at site 2
	{
		tensor_t C2, C3;
		CopyTensor(&mps.A[2], &C2);
		CopyTensor(&mps.A[3], &C3);

		MPSUnitaryLeftProjection(&C2, &C3);

		// load reference data from disk
		tensor_t C2_ref;
		{
			const size_t dim[3] = { d, 9, 6 };
			AllocateTensor(3, dim, &C2_ref);
			int status = ReadData("../test/mps_test_C2.dat", C2_ref.data, sizeof(MKL_Complex16), NumTensorElements(&C2_ref));
			if (status < 0) { return status; }
		}
		tensor_t C3_ref;
		{
			const size_t dim[3] = { d, 6, 5 };
			AllocateTensor(3, dim, &C3_ref);
			int status = ReadData("../test/mps_test_C3.dat", C3_ref.data, sizeof(MKL_Complex16), NumTensorElements(&C3_ref));
			if (status < 0) { return status; }
		}

		// check dimensions
		if (C2.ndim != 3 || C2.dim[0] != C2_ref.dim[0] || C2.dim[1] != C2_ref.dim[1] || C2.dim[2] != C2_ref.dim[2])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(2*NumTensorElements(&C2_ref), (double *)C2.data, (double *)C2_ref.data));
		}

		// check dimensions
		if (C3.ndim != 3 || C3.dim[0] != C3_ref.dim[0] || C3.dim[1] != C3_ref.dim[1] || C3.dim[2] != C3_ref.dim[2])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(2*NumTensorElements(&C3_ref), (double *)C3.data, (double *)C3_ref.data));
		}

		DeleteTensor(&C3_ref);
		DeleteTensor(&C2_ref);
		DeleteTensor(&C3);
		DeleteTensor(&C2);
	}

	// unitary right projection at site 4
	{
		tensor_t D3, D4;
		CopyTensor(&mps.A[3], &D3);
		CopyTensor(&mps.A[4], &D4);

		MPSUnitaryRightProjection(&D4, &D3);

		// load reference data from disk
		tensor_t D3_ref;
		{
			const size_t dim[3] = { d, 6, 5 };
			AllocateTensor(3, dim, &D3_ref);
			int status = ReadData("../test/mps_test_D3.dat", D3_ref.data, sizeof(MKL_Complex16), NumTensorElements(&D3_ref));
			if (status < 0) { return status; }
		}
		tensor_t D4_ref;
		{
			const size_t dim[3] = { d, 5, 3 };
			AllocateTensor(3, dim, &D4_ref);
			int status = ReadData("../test/mps_test_D4.dat", D4_ref.data, sizeof(MKL_Complex16), NumTensorElements(&D4_ref));
			if (status < 0) { return status; }
		}

		// check dimensions
		if (D3.ndim != 3 || D3.dim[0] != D3_ref.dim[0] || D3.dim[1] != D3_ref.dim[1] || D3.dim[2] != D3_ref.dim[2])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(2*NumTensorElements(&D3_ref), (double *)D3.data, (double *)D3_ref.data));
		}

		// check dimensions
		if (D4.ndim != 3 || D4.dim[0] != D4_ref.dim[0] || D4.dim[1] != D4_ref.dim[1] || D4.dim[2] != D4_ref.dim[2])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(2*NumTensorElements(&D4_ref), (double *)D4.data, (double *)D4_ref.data));
		}

		DeleteTensor(&D4_ref);
		DeleteTensor(&D3_ref);
		DeleteTensor(&D4);
		DeleteTensor(&D3);
	}

	// left and right contraction step
	{
		tensor_t BL, BR;
		{
			const size_t dimL[2] = { D[3], D[3] };
			const size_t dimR[2] = { D[4], D[4] };
			AllocateTensor(2, dimL, &BL);
			AllocateTensor(2, dimR, &BR);
			int status;
			status = ReadData("../test/mps_test_BLcontr0.dat", BL.data, sizeof(MKL_Complex16), NumTensorElements(&BL)); if (status < 0) { return status; }
			status = ReadData("../test/mps_test_BRcontr0.dat", BR.data, sizeof(MKL_Complex16), NumTensorElements(&BR)); if (status < 0) { return status; }
		}

		tensor_t BLnext, BRnext;
		ContractionStepLeft (&mps.A[3], &BL, &BLnext);
		ContractionStepRight(&mps.A[3], &BR, &BRnext);

		// compare with reference
		tensor_t BLref, BRref;
		{
			const size_t dimL[2] = { D[4], D[4] };
			const size_t dimR[2] = { D[3], D[3] };
			AllocateTensor(2, dimL, &BLref);
			AllocateTensor(2, dimR, &BRref);
			int status;
			status = ReadData("../test/mps_test_BLcontr1.dat", BLref.data, sizeof(MKL_Complex16), NumTensorElements(&BLref)); if (status < 0) { return status; }
			status = ReadData("../test/mps_test_BRcontr1.dat", BRref.data, sizeof(MKL_Complex16), NumTensorElements(&BRref)); if (status < 0) { return status; }
		}

		// check dimensions
		if (BLnext.ndim != 2 || BLnext.dim[0] != BLref.dim[0] || BLnext.dim[1] != BLref.dim[1])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(2*NumTensorElements(&BLref), (double *)BLnext.data, (double *)BLref.data));
		}

		// check dimensions
		if (BRnext.ndim != 2 || BRnext.dim[0] != BRref.dim[0] || BRnext.dim[1] != BRref.dim[1])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(2*NumTensorElements(&BRref), (double *)BRnext.data, (double *)BRref.data));
		}

		DeleteTensor(&BRref);
		DeleteTensor(&BLref);
		DeleteTensor(&BRnext);
		DeleteTensor(&BLnext);
		DeleteTensor(&BR);
		DeleteTensor(&BL);
	}

	// left and right contraction step with a matrix product operator sandwiched in between
	{
		tensor_t W;
		{
			const size_t dim[4] = { d, d, 7, 13 };
			AllocateTensor(4, dim, &W);
			int status = ReadData("../test/mps_test_W.dat", W.data, sizeof(MKL_Complex16), NumTensorElements(&W));
			if (status < 0) { return status; }
		}

		tensor_t BL, BR;
		{
			const size_t dimL[3] = { D[3],  7, D[3] };
			const size_t dimR[3] = { D[4], 13, D[4] };
			AllocateTensor(3, dimL, &BL);
			AllocateTensor(3, dimR, &BR);
			int status;
			status = ReadData("../test/mps_test_BLopcontr0.dat", BL.data, sizeof(MKL_Complex16), NumTensorElements(&BL)); if (status < 0) { return status; }
			status = ReadData("../test/mps_test_BRopcontr0.dat", BR.data, sizeof(MKL_Complex16), NumTensorElements(&BR)); if (status < 0) { return status; }
		}

		tensor_t BLnext, BRnext;
		ContractionOperatorStepLeft (&mps.A[3], &W, &BL, &BLnext);
		ContractionOperatorStepRight(&mps.A[3], &W, &BR, &BRnext);

		// compare with reference
		tensor_t BLref, BRref;
		{
			const size_t dimL[3] = { D[4], 13, D[4] };
			const size_t dimR[3] = { D[3],  7, D[3] };
			AllocateTensor(3, dimL, &BLref);
			AllocateTensor(3, dimR, &BRref);
			int status;
			status = ReadData("../test/mps_test_BLopcontr1.dat", BLref.data, sizeof(MKL_Complex16), NumTensorElements(&BLref)); if (status < 0) { return status; }
			status = ReadData("../test/mps_test_BRopcontr1.dat", BRref.data, sizeof(MKL_Complex16), NumTensorElements(&BRref)); if (status < 0) { return status; }
		}

		// check dimensions
		if (BLnext.ndim != 3 || BLnext.dim[0] != BLref.dim[0] || BLnext.dim[1] != BLref.dim[1] || BLnext.dim[2] != BLref.dim[2])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(2*NumTensorElements(&BLref), (double *)BLnext.data, (double *)BLref.data));
		}

		// check dimensions
		if (BRnext.ndim != 3 || BRnext.dim[0] != BRref.dim[0] || BRnext.dim[1] != BRref.dim[1] || BRnext.dim[2] != BRref.dim[2])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(2*NumTensorElements(&BRref), (double *)BRnext.data, (double *)BRref.data));
		}

		DeleteTensor(&BRref);
		DeleteTensor(&BLref);
		DeleteTensor(&BRnext);
		DeleteTensor(&BLnext);
		DeleteTensor(&BR);
		DeleteTensor(&BL);
		DeleteTensor(&W);
	}

	// split a MPS tensor
	{
		const size_t d0 = 4;
		const size_t d1 = 5;

		int status;

		tensor_t E2;
		{
			const size_t dim[3] = { d0 * d1, 13, 11 };
			AllocateTensor(3, dim, &E2);
			status = ReadData("../test/mps_test_E2.dat", E2.data, sizeof(MKL_Complex16), NumTensorElements(&E2));
			if (status < 0) { return status; }
		}

		// load quantum numbers from disk
		// physical
		qnumber_t *qd0 = (qnumber_t *)MKL_malloc(d0 * sizeof(qnumber_t), MEM_DATA_ALIGN);
		qnumber_t *qd1 = (qnumber_t *)MKL_malloc(d1 * sizeof(qnumber_t), MEM_DATA_ALIGN);
		status = ReadData("../test/mps_test_qd0.dat", qd0, sizeof(qnumber_t), d0); if (status < 0) { return status; }
		status = ReadData("../test/mps_test_qd1.dat", qd1, sizeof(qnumber_t), d1); if (status < 0) { return status; }
		// virtual
		qnumber_t *qE0 = (qnumber_t *)MKL_malloc(E2.dim[1] * sizeof(qnumber_t), MEM_DATA_ALIGN);
		qnumber_t *qE2 = (qnumber_t *)MKL_malloc(E2.dim[2] * sizeof(qnumber_t), MEM_DATA_ALIGN);
		status = ReadData("../test/mps_test_qE0.dat", qE0, sizeof(qnumber_t), E2.dim[1]); if (status < 0) { return status; }
		status = ReadData("../test/mps_test_qE2.dat", qE2, sizeof(qnumber_t), E2.dim[2]); if (status < 0) { return status; }

		// without truncation
		{
			// split E2 into two tensors
			tensor_t E0, E1;
			qnumber_t *qE1;
			trunc_info_t ti = SplitMPSTensor(&E2, qE0, qE2, d0, d1, qd0, qd1, SVD_DISTR_SQRT, 0.0, INT32_MAX, false, &E0, &E1, &qE1);

			// block structure error
			err = fmax(err, BlockStructureError(&E0, qd0, qE0, qE1));
			err = fmax(err, BlockStructureError(&E1, qd1, qE1, qE2));

			// check bond quantum numbers
			const size_t D_ref = 37;
			qnumber_t *qE1_ref = (qnumber_t *)MKL_malloc(D_ref * sizeof(qnumber_t), MEM_DATA_ALIGN);
			status = ReadData("../test/mps_test_qE1.dat", qE1_ref, sizeof(qnumber_t), D_ref); if (status < 0) { return status; }
			if (E0.dim[2] != D_ref)
			{
				err = fmax(err, 1);
			}
			else
			{
				size_t j;
				for (j = 0; j < D_ref; j++) {
					err = fmax(err, (double)abs(qE1[j] - qE1_ref[j]));
				}
			}
			MKL_free(qE1_ref);
			MKL_free(qE1);

			// norm and von Neumann entropy of singular values
			{
				const double nsigma_ref  = 2.8435216389588707;
				const double entropy_ref = 3.2565623957019234;

				err = fmax(err, fabs(ti.nsigma  -  nsigma_ref));
				err = fmax(err, fabs(ti.entropy - entropy_ref));
			}

			// merge the two tensors again and compare with original tensor
			tensor_t E2mrg;
			MergeMPSTensorPair(&E0, &E1, &E2mrg);

			// check dimensions
			if (E2mrg.ndim != 3 || E2mrg.dim[0] != E2.dim[0] || E2mrg.dim[1] != E2.dim[1] || E2mrg.dim[2] != E2.dim[2])
			{
				err = fmax(err, 1);
			}
			else
			{
				// largest entrywise error
				err = fmax(err, UniformDistance(2*NumTensorElements(&E2), (double *)E2mrg.data, (double *)E2.data));
			}
			DeleteTensor(&E2mrg);

			DeleteTensor(&E1);
			DeleteTensor(&E0);
		}

		// with truncation
		{
			// split E2 into two tensors again, but now using a tolerance cut-off for the bond dimension
			tensor_t E0, E1;
			qnumber_t *qE1;
			trunc_info_t ti = SplitMPSTensor(&E2, qE0, qE2, d0, d1, qd0, qd1, SVD_DISTR_SQRT, 0.08, INT32_MAX, false, &E0, &E1, &qE1);

			// block structure error
			err = fmax(err, BlockStructureError(&E0, qd0, qE0, qE1));
			err = fmax(err, BlockStructureError(&E1, qd1, qE1, qE2));

			// check bond quantum numbers
			const size_t D_ref = 25;
			qnumber_t *qE1_ref = (qnumber_t *)MKL_malloc(D_ref * sizeof(qnumber_t), MEM_DATA_ALIGN);
			status = ReadData("../test/mps_test_qE1_red.dat", qE1_ref, sizeof(qnumber_t), D_ref); if (status < 0) { return status; }
			if (E0.dim[2] != D_ref)
			{
				err = fmax(err, 1);
			}
			else
			{
				size_t j;
				for (j = 0; j < D_ref; j++) {
					err = fmax(err, (double)abs(qE1[j] - qE1_ref[j]));
				}
			}
			MKL_free(qE1_ref);
			MKL_free(qE1);

			// norm and von Neumann entropy of singular values
			{
				const double nsigma_ref  = 2.7363043112988086;
				const double entropy_ref = 3.053396693408922;

				err = fmax(err, fabs(ti.nsigma  -  nsigma_ref));
				err = fmax(err, fabs(ti.entropy - entropy_ref));
			}

			// merge the two tensors
			tensor_t E2mrg;
			MergeMPSTensorPair(&E0, &E1, &E2mrg);

			// check dimensions
			if (E2mrg.ndim != 3 || E2mrg.dim[0] != E2.dim[0] || E2mrg.dim[1] != E2.dim[1] || E2mrg.dim[2] != E2.dim[2])
			{
				err = fmax(err, 1);
			}
			else
			{
				// reference (truncated approximation)
				tensor_t E2mrg_ref;
				{
					const size_t dim[3] = { E2.dim[0], E2.dim[1], E2.dim[2] };
					AllocateTensor(3, dim, &E2mrg_ref);
					int status;
					status = ReadData("../test/mps_test_E2_red.dat", E2mrg_ref.data, sizeof(MKL_Complex16), NumTensorElements(&E2mrg_ref));
					if (status < 0) { return status; }
				}

				// largest entrywise error
				err = fmax(err, UniformDistance(2*NumTensorElements(&E2mrg_ref), (double *)E2mrg.data, (double *)E2mrg_ref.data));

				DeleteTensor(&E2mrg_ref);
			}
			DeleteTensor(&E2mrg);

			DeleteTensor(&E1);
			DeleteTensor(&E0);
		}

		MKL_free(qd0);
		MKL_free(qd1);
		MKL_free(qE0);
		MKL_free(qE2);
		DeleteTensor(&E2);
	}

	printf("Largest error: %g\n", err);

	// clean up
	DeleteMPS(&mps);

	return (err < 2e-14 ? 0 : 1);
}
