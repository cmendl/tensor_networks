#include "mps.h"
#include <stdlib.h>
#include <memory.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>


//________________________________________________________________________________________________________________________
///
/// \brief Check whether solely entries corresponding to matching quantum numbers are non-zero
///
static double MPSBlockStructureError(const tensor_t *A, const qnumber_t *restrict qd, const qnumber_t *restrict qD0, const qnumber_t *restrict qD1)
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
					err += cabs(A->data[i + A->dim[0]*(j + A->dim[1]*k)]);
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
		int status = ReadData(filename, mps.A[i].data, sizeof(double complex), NumTensorElements(&mps.A[i]));
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
			int status = ReadData("../test/mps_test_B1.dat", B1_ref.data, sizeof(double complex), NumTensorElements(&B1_ref));
			if (status < 0) { return status; }
		}
		tensor_t B2_ref;
		{
			const size_t dim[3] = { d, 8, 6 };
			AllocateTensor(3, dim, &B2_ref);
			int status = ReadData("../test/mps_test_B2.dat", B2_ref.data, sizeof(double complex), NumTensorElements(&B2_ref));
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
			err = fmax(err, UniformDistance(NumTensorElements(&B1_ref), B1.data, B1_ref.data));
		}

		// check dimensions
		if (B2.ndim != 3 || B2.dim[0] != B2_ref.dim[0] || B2.dim[1] != B2_ref.dim[1] || B2.dim[2] != B2_ref.dim[2])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(NumTensorElements(&B2_ref), B2.data, B2_ref.data));
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
			int status = ReadData("../test/mps_test_C2.dat", C2_ref.data, sizeof(double complex), NumTensorElements(&C2_ref));
			if (status < 0) { return status; }
		}
		tensor_t C3_ref;
		{
			const size_t dim[3] = { d, 6, 5 };
			AllocateTensor(3, dim, &C3_ref);
			int status = ReadData("../test/mps_test_C3.dat", C3_ref.data, sizeof(double complex), NumTensorElements(&C3_ref));
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
			err = fmax(err, UniformDistance(NumTensorElements(&C2_ref), C2.data, C2_ref.data));
		}

		// check dimensions
		if (C3.ndim != 3 || C3.dim[0] != C3_ref.dim[0] || C3.dim[1] != C3_ref.dim[1] || C3.dim[2] != C3_ref.dim[2])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(NumTensorElements(&C3_ref), C3.data, C3_ref.data));
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
			int status = ReadData("../test/mps_test_D3.dat", D3_ref.data, sizeof(double complex), NumTensorElements(&D3_ref));
			if (status < 0) { return status; }
		}
		tensor_t D4_ref;
		{
			const size_t dim[3] = { d, 5, 3 };
			AllocateTensor(3, dim, &D4_ref);
			int status = ReadData("../test/mps_test_D4.dat", D4_ref.data, sizeof(double complex), NumTensorElements(&D4_ref));
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
			err = fmax(err, UniformDistance(NumTensorElements(&D3_ref), D3.data, D3_ref.data));
		}

		// check dimensions
		if (D4.ndim != 3 || D4.dim[0] != D4_ref.dim[0] || D4.dim[1] != D4_ref.dim[1] || D4.dim[2] != D4_ref.dim[2])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(NumTensorElements(&D4_ref), D4.data, D4_ref.data));
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
			status = ReadData("../test/mps_test_BLcontr0.dat", BL.data, sizeof(double complex), NumTensorElements(&BL)); if (status < 0) { return status; }
			status = ReadData("../test/mps_test_BRcontr0.dat", BR.data, sizeof(double complex), NumTensorElements(&BR)); if (status < 0) { return status; }
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
			status = ReadData("../test/mps_test_BLcontr1.dat", BLref.data, sizeof(double complex), NumTensorElements(&BLref)); if (status < 0) { return status; }
			status = ReadData("../test/mps_test_BRcontr1.dat", BRref.data, sizeof(double complex), NumTensorElements(&BRref)); if (status < 0) { return status; }
		}

		// check dimensions
		if (BLnext.ndim != 2 || BLnext.dim[0] != BLref.dim[0] || BLnext.dim[1] != BLref.dim[1])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(NumTensorElements(&BLref), BLnext.data, BLref.data));
		}

		// check dimensions
		if (BRnext.ndim != 2 || BRnext.dim[0] != BRref.dim[0] || BRnext.dim[1] != BRref.dim[1])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(NumTensorElements(&BRref), BRnext.data, BRref.data));
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
			int status = ReadData("../test/mps_test_W.dat", W.data, sizeof(double complex), NumTensorElements(&W));
			if (status < 0) { return status; }
		}

		tensor_t BL, BR;
		{
			const size_t dimL[3] = { D[3],  7, D[3] };
			const size_t dimR[3] = { D[4], 13, D[4] };
			AllocateTensor(3, dimL, &BL);
			AllocateTensor(3, dimR, &BR);
			int status;
			status = ReadData("../test/mps_test_BLopcontr0.dat", BL.data, sizeof(double complex), NumTensorElements(&BL)); if (status < 0) { return status; }
			status = ReadData("../test/mps_test_BRopcontr0.dat", BR.data, sizeof(double complex), NumTensorElements(&BR)); if (status < 0) { return status; }
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
			status = ReadData("../test/mps_test_BLopcontr1.dat", BLref.data, sizeof(double complex), NumTensorElements(&BLref)); if (status < 0) { return status; }
			status = ReadData("../test/mps_test_BRopcontr1.dat", BRref.data, sizeof(double complex), NumTensorElements(&BRref)); if (status < 0) { return status; }
		}

		// check dimensions
		if (BLnext.ndim != 3 || BLnext.dim[0] != BLref.dim[0] || BLnext.dim[1] != BLref.dim[1] || BLnext.dim[2] != BLref.dim[2])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(NumTensorElements(&BLref), BLnext.data, BLref.data));
		}

		// check dimensions
		if (BRnext.ndim != 3 || BRnext.dim[0] != BRref.dim[0] || BRnext.dim[1] != BRref.dim[1] || BRnext.dim[2] != BRref.dim[2])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(NumTensorElements(&BRref), BRnext.data, BRref.data));
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

		tensor_t G2;
		{
			const size_t dim[3] = { d0 * d1, 13, 11 };
			AllocateTensor(3, dim, &G2);
			status = ReadData("../test/mps_test_G2.dat", G2.data, sizeof(double complex), NumTensorElements(&G2));
			if (status < 0) { return status; }
		}

		// load quantum numbers from disk
		// physical
		qnumber_t *qd0 = (qnumber_t *)algn_malloc(d0 * sizeof(qnumber_t));
		qnumber_t *qd1 = (qnumber_t *)algn_malloc(d1 * sizeof(qnumber_t));
		status = ReadData("../test/mps_test_qd0.dat", qd0, sizeof(qnumber_t), d0); if (status < 0) { return status; }
		status = ReadData("../test/mps_test_qd1.dat", qd1, sizeof(qnumber_t), d1); if (status < 0) { return status; }
		// virtual
		qnumber_t *qG0 = (qnumber_t *)algn_malloc(G2.dim[1] * sizeof(qnumber_t));
		qnumber_t *qG2 = (qnumber_t *)algn_malloc(G2.dim[2] * sizeof(qnumber_t));
		status = ReadData("../test/mps_test_qG0.dat", qG0, sizeof(qnumber_t), G2.dim[1]); if (status < 0) { return status; }
		status = ReadData("../test/mps_test_qG2.dat", qG2, sizeof(qnumber_t), G2.dim[2]); if (status < 0) { return status; }

		// without truncation
		{
			// split G2 into two tensors
			tensor_t G0, G1;
			qnumber_t *qG1;
			bond_op_params_t params;
			params.tol  = 0;
			params.maxD = INT32_MAX;
			params.renormalize = false;
			trunc_info_t ti = SplitMPSTensor(&G2, qG0, qG2, d0, d1, qd0, qd1, SVD_DISTR_SQRT, &params, &G0, &G1, &qG1);

			// block structure error
			err = fmax(err, MPSBlockStructureError(&G0, qd0, qG0, qG1));
			err = fmax(err, MPSBlockStructureError(&G1, qd1, qG1, qG2));

			// check bond quantum numbers
			const size_t D_ref = 37;
			qnumber_t *qG1_ref = (qnumber_t *)algn_malloc(D_ref * sizeof(qnumber_t));
			status = ReadData("../test/mps_test_qG1.dat", qG1_ref, sizeof(qnumber_t), D_ref); if (status < 0) { return status; }
			if (G0.dim[2] != D_ref)
			{
				err = fmax(err, 1);
			}
			else
			{
				size_t j;
				for (j = 0; j < D_ref; j++) {
					if (qG1[j] != qG1_ref[j]) {
						err = fmax(err, 1);
					}
				}
			}
			algn_free(qG1_ref);
			algn_free(qG1);

			// norm and von Neumann entropy of singular values
			{
				const double nsigma_ref  = 2.8435216389588707;
				const double entropy_ref = 3.2565623957019234;

				err = fmax(err, fabs(ti.nsigma  -  nsigma_ref) / nsigma_ref);
				err = fmax(err, fabs(ti.entropy - entropy_ref) / entropy_ref);
			}

			// merge the two tensors again and compare with original tensor
			tensor_t G2mrg;
			MergeMPSTensorPair(&G0, &G1, &G2mrg);

			// check dimensions
			if (G2mrg.ndim != 3 || G2mrg.dim[0] != G2.dim[0] || G2mrg.dim[1] != G2.dim[1] || G2mrg.dim[2] != G2.dim[2])
			{
				err = fmax(err, 1);
			}
			else
			{
				// largest entrywise error
				err = fmax(err, UniformDistance(NumTensorElements(&G2), G2mrg.data, G2.data));
			}
			DeleteTensor(&G2mrg);

			DeleteTensor(&G1);
			DeleteTensor(&G0);
		}

		// with truncation
		{
			// split G2 into two tensors again, but now using a tolerance cut-off for the bond dimension
			tensor_t G0, G1;
			qnumber_t *qG1;
			bond_op_params_t params;
			params.tol  = 0.08;
			params.maxD = INT32_MAX;
			params.renormalize = false;
			trunc_info_t ti = SplitMPSTensor(&G2, qG0, qG2, d0, d1, qd0, qd1, SVD_DISTR_SQRT, &params, &G0, &G1, &qG1);

			// block structure error
			err = fmax(err, MPSBlockStructureError(&G0, qd0, qG0, qG1));
			err = fmax(err, MPSBlockStructureError(&G1, qd1, qG1, qG2));

			// check bond quantum numbers
			const size_t D_ref = 25;
			qnumber_t *qG1_ref = (qnumber_t *)algn_malloc(D_ref * sizeof(qnumber_t));
			status = ReadData("../test/mps_test_qG1_red.dat", qG1_ref, sizeof(qnumber_t), D_ref); if (status < 0) { return status; }
			if (G0.dim[2] != D_ref)
			{
				err = fmax(err, 1);
			}
			else
			{
				size_t j;
				for (j = 0; j < D_ref; j++) {
					if (qG1[j] != qG1_ref[j]) {
						err = fmax(err, 1);
					}
				}
			}
			algn_free(qG1_ref);
			algn_free(qG1);

			// norm and von Neumann entropy of singular values
			{
				const double nsigma_ref  = 2.7363043112988086;
				const double entropy_ref = 3.053396693408922;

				err = fmax(err, fabs(ti.nsigma  -  nsigma_ref) / nsigma_ref);
				err = fmax(err, fabs(ti.entropy - entropy_ref) / entropy_ref);
			}

			// merge the two tensors
			tensor_t G2mrg;
			MergeMPSTensorPair(&G0, &G1, &G2mrg);

			// check dimensions
			if (G2mrg.ndim != 3 || G2mrg.dim[0] != G2.dim[0] || G2mrg.dim[1] != G2.dim[1] || G2mrg.dim[2] != G2.dim[2])
			{
				err = fmax(err, 1);
			}
			else
			{
				// reference (truncated approximation)
				tensor_t G2mrg_ref;
				{
					AllocateTensor(3, G2.dim, &G2mrg_ref);
					int status;
					status = ReadData("../test/mps_test_G2_red.dat", G2mrg_ref.data, sizeof(double complex), NumTensorElements(&G2mrg_ref));
					if (status < 0) { return status; }
				}

				// largest entrywise error
				err = fmax(err, UniformDistance(NumTensorElements(&G2mrg_ref), G2mrg.data, G2mrg_ref.data));

				DeleteTensor(&G2mrg_ref);
			}
			DeleteTensor(&G2mrg);

			DeleteTensor(&G1);
			DeleteTensor(&G0);
		}

		algn_free(qd0);
		algn_free(qd1);
		algn_free(qG0);
		algn_free(qG2);
		DeleteTensor(&G2);
	}

	// compress virtual bonds
	{
		const size_t d0 = 4;
		const size_t d1 = 5;

		int status;

		tensor_t K0, K1;
		{
			const size_t dimK0[3] = { d0, 5, 14 };
			AllocateTensor(3, dimK0, &K0);
			status = ReadData("../test/mps_test_K0.dat", K0.data, sizeof(double complex), NumTensorElements(&K0));
			if (status < 0) { return status; }

			const size_t dimK1[3] = { d1, 14, 7 };
			AllocateTensor(3, dimK1, &K1);
			status = ReadData("../test/mps_test_K1.dat", K1.data, sizeof(double complex), NumTensorElements(&K1));
			if (status < 0) { return status; }
		}

		// load quantum numbers from disk
		// physical
		qnumber_t *qd0 = (qnumber_t *)algn_malloc(d0 * sizeof(qnumber_t));
		qnumber_t *qd1 = (qnumber_t *)algn_malloc(d1 * sizeof(qnumber_t));
		status = ReadData("../test/mps_test_qd0.dat", qd0, sizeof(qnumber_t), d0); if (status < 0) { return status; }
		status = ReadData("../test/mps_test_qd1.dat", qd1, sizeof(qnumber_t), d1); if (status < 0) { return status; }
		// virtual
		qnumber_t *qK0 = (qnumber_t *)algn_malloc(K0.dim[1] * sizeof(qnumber_t));
		qnumber_t *qK1 = (qnumber_t *)algn_malloc(K0.dim[2] * sizeof(qnumber_t));
		qnumber_t *qK2 = (qnumber_t *)algn_malloc(K1.dim[2] * sizeof(qnumber_t));
		status = ReadData("../test/mps_test_qK0.dat", qK0, sizeof(qnumber_t), K0.dim[1]); if (status < 0) { return status; }
		status = ReadData("../test/mps_test_qK1.dat", qK1, sizeof(qnumber_t), K0.dim[2]); if (status < 0) { return status; }
		status = ReadData("../test/mps_test_qK2.dat", qK2, sizeof(qnumber_t), K1.dim[2]); if (status < 0) { return status; }

		// bond quantum numbers after compression
		qnumber_t *qcK1;
		bond_op_params_t params;
		params.tol  = 0.02;
		params.maxD = INT32_MAX;
		params.renormalize = false;
		trunc_info_t ti = CompressMPSTensors(&K0, &K1, qK0, qK1, qK2, qd0, qd1, SVD_DISTR_SQRT, &params, &qcK1);
		algn_free(qK1);

		// block structure error
		err = fmax(err, MPSBlockStructureError(&K0, qd0, qK0, qcK1));
		err = fmax(err, MPSBlockStructureError(&K1, qd1, qcK1, qK2));

		// check bond quantum numbers
		const size_t D_ref = 6;
		qnumber_t *qcK1_ref = (qnumber_t *)algn_malloc(D_ref * sizeof(qnumber_t));
		status = ReadData("../test/mps_test_qcK1.dat", qcK1_ref, sizeof(qnumber_t), D_ref); if (status < 0) { return status; }
		if (K0.dim[2] != D_ref)
		{
			err = fmax(err, 1);
		}
		else
		{
			size_t j;
			for (j = 0; j < D_ref; j++) {
				if (qcK1[j] != qcK1_ref[j]) {
					err = fmax(err, 1);
				}
			}
		}
		algn_free(qcK1_ref);

		// norm and von Neumann entropy of singular values
		{
			const double nsigma_ref  = 6.379699613950133;
			const double entropy_ref = 1.151638327568761;

			err = fmax(err, fabs(ti.nsigma  -  nsigma_ref) / nsigma_ref);
			err = fmax(err, fabs(ti.entropy - entropy_ref) / entropy_ref);
		}

		// merge the two compressed tensors, for comparison with reference
		tensor_t K2mrg;
		MergeMPSTensorPair(&K0, &K1, &K2mrg);

		// check dimensions
		if (K2mrg.ndim != 3 || K2mrg.dim[0] != d0*d1 || K2mrg.dim[1] != K0.dim[1] || K2mrg.dim[2] != K1.dim[2])
		{
			err = fmax(err, 1);
		}
		else
		{
			// reference (truncated approximation)
			tensor_t K2mrg_ref;
			{
				AllocateTensor(3, K2mrg.dim, &K2mrg_ref);
				int status;
				status = ReadData("../test/mps_test_cK2.dat", K2mrg_ref.data, sizeof(double complex), NumTensorElements(&K2mrg_ref));
				if (status < 0) { return status; }
			}

			// largest entrywise error
			err = fmax(err, UniformDistance(NumTensorElements(&K2mrg_ref), K2mrg.data, K2mrg_ref.data));

			DeleteTensor(&K2mrg_ref);
		}
		DeleteTensor(&K2mrg);

		// clean up
		algn_free(qK2);
		algn_free(qcK1);
		algn_free(qK0);
		algn_free(qd1);
		algn_free(qd0);
		DeleteTensor(&K1);
		DeleteTensor(&K0);
	}

	printf("Largest error: %g\n", err);

	// clean up
	DeleteMPS(&mps);

	return (err < 2e-14 ? 0 : 1);
}
