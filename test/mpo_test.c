#include "mpo.h"
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
static double BlockStructureError(const tensor_t *A, const qnumber_t *restrict qd[2], const qnumber_t *restrict qD0, const qnumber_t *restrict qD1)
{
	assert(A->ndim == 4);

	double err = 0;

	size_t i, j, k, l;
	for (l = 0; l < A->dim[3]; l++)
	{
		for (k = 0; k < A->dim[2]; k++)
		{
			for (j = 0; j < A->dim[1]; j++)
			{
				for (i = 0; i < A->dim[0]; i++)
				{
					if (qd[0][i] + qD0[k] != qd[1][j] + qD1[l])
					{
						err += ComplexAbs(A->data[i + A->dim[0]*(j + A->dim[1]*(k + A->dim[2]*l))]);
					}
				}
			}
		}
	}

	return err;
}


int MPOTest()
{
	int i;
	int status;

	// maximum error
	double err = 0;

	printf("Testing MPO operations...\n");

	const int L = 6;

	// allocate 'X', 'Y' and 'Z' MPOs
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
	mpo_t Z;
	{
		const size_t d[] = { 4, 4 };
		const size_t D[] = { 1, 5, 6, 3, 7, 4, 1 };
		AllocateMPO(L, d, D, &Z);
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
	for (i = 0; i < L; i++)
	{
		char filename[1024];
		sprintf(filename, "../test/mpo_test_B%i.dat", i);
		status = ReadData(filename, Z.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&Z.A[i]));
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
		MKL_Complex16 tr = MPOTrace(&Z);

		// reference value
		const MKL_Complex16 tr_ref = { -0.018380127839321195, 0.023927449138618842 };

		// relative error
		err = fmax(err, ComplexAbs(ComplexSubtract(tr, tr_ref)) / ComplexAbs(tr_ref));
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

	// split a MPO tensor
	{
		const size_t d0 = 4;
		const size_t d1 = 5;

		int status;

		tensor_t G2;
		{
			const size_t dim[4] = { d0 * d1, d0 * d1, 13, 11 };
			AllocateTensor(4, dim, &G2);
			status = ReadData("../test/mpo_test_G2.dat", G2.data, sizeof(MKL_Complex16), NumTensorElements(&G2));
			if (status < 0) { return status; }
		}

		// load quantum numbers from disk
		// physical
		qnumber_t *qd0 = (qnumber_t *)MKL_malloc(d0 * sizeof(qnumber_t), MEM_DATA_ALIGN);
		qnumber_t *qd1 = (qnumber_t *)MKL_malloc(d1 * sizeof(qnumber_t), MEM_DATA_ALIGN);
		status = ReadData("../test/mpo_test_qd0.dat", qd0, sizeof(qnumber_t), d0); if (status < 0) { return status; }
		status = ReadData("../test/mpo_test_qd1.dat", qd1, sizeof(qnumber_t), d1); if (status < 0) { return status; }
		// virtual
		qnumber_t *qG0 = (qnumber_t *)MKL_malloc(G2.dim[2] * sizeof(qnumber_t), MEM_DATA_ALIGN);
		qnumber_t *qG2 = (qnumber_t *)MKL_malloc(G2.dim[3] * sizeof(qnumber_t), MEM_DATA_ALIGN);
		status = ReadData("../test/mpo_test_qG0.dat", qG0, sizeof(qnumber_t), G2.dim[2]); if (status < 0) { return status; }
		status = ReadData("../test/mpo_test_qG2.dat", qG2, sizeof(qnumber_t), G2.dim[3]); if (status < 0) { return status; }

		// without truncation
		{
			// split G2 into two tensors
			tensor_t G0, G1;
			qnumber_t *qG1;
			trunc_info_t ti = SplitMPOTensor(&G2, qG0, qG2, d0, d1, qd0, qd1, SVD_DISTR_SQRT, 0.0, INT32_MAX, false, &G0, &G1, &qG1);

			// block structure error
			const qnumber_t *qd0_pair[2] = { qd0, qd0 }; 
			const qnumber_t *qd1_pair[2] = { qd1, qd1 }; 
			err = fmax(err, BlockStructureError(&G0, qd0_pair, qG0, qG1));
			err = fmax(err, BlockStructureError(&G1, qd1_pair, qG1, qG2));

			// check bond quantum numbers
			const size_t D_ref = 175;
			qnumber_t *qG1_ref = (qnumber_t *)MKL_malloc(D_ref * sizeof(qnumber_t), MEM_DATA_ALIGN);
			status = ReadData("../test/mpo_test_qG1.dat", qG1_ref, sizeof(qnumber_t), D_ref); if (status < 0) { return status; }
			if (G0.dim[3] != D_ref)
			{
				err = fmax(err, 1);
			}
			else
			{
				size_t j;
				for (j = 0; j < D_ref; j++) {
					err = fmax(err, (double)abs(qG1[j] - qG1_ref[j]));
				}
			}
			MKL_free(qG1_ref);
			MKL_free(qG1);

			// norm and von Neumann entropy of singular values
			{
				const double nsigma_ref  = 48.77942245012797;
				const double entropy_ref = 4.770317493788066;

				err = fmax(err, fabs(ti.nsigma  -  nsigma_ref) / nsigma_ref);
				err = fmax(err, fabs(ti.entropy - entropy_ref) / entropy_ref);
			}

			// merge the two tensors again and compare with original tensor
			tensor_t G2mrg;
			MergeMPOTensorPair(&G0, &G1, &G2mrg);

			// check dimensions
			if (G2mrg.ndim != 4 || G2mrg.dim[0] != G2.dim[0] || G2mrg.dim[1] != G2.dim[1] || G2mrg.dim[2] != G2.dim[2] || G2mrg.dim[3] != G2.dim[3])
			{
				err = fmax(err, 1);
			}
			else
			{
				// largest entrywise error
				err = fmax(err, UniformDistance(2*NumTensorElements(&G2), (double *)G2mrg.data, (double *)G2.data));
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
			trunc_info_t ti = SplitMPOTensor(&G2, qG0, qG2, d0, d1, qd0, qd1, SVD_DISTR_SQRT, 0.1, INT32_MAX, false, &G0, &G1, &qG1);

			// block structure error
			const qnumber_t *qd0_pair[2] = { qd0, qd0 }; 
			const qnumber_t *qd1_pair[2] = { qd1, qd1 }; 
			err = fmax(err, BlockStructureError(&G0, qd0_pair, qG0, qG1));
			err = fmax(err, BlockStructureError(&G1, qd1_pair, qG1, qG2));

			// check bond quantum numbers
			const size_t D_ref = 102;
			qnumber_t *qG1_ref = (qnumber_t *)MKL_malloc(D_ref * sizeof(qnumber_t), MEM_DATA_ALIGN);
			status = ReadData("../test/mpo_test_qG1_red.dat", qG1_ref, sizeof(qnumber_t), D_ref); if (status < 0) { return status; }
			if (G0.dim[3] != D_ref)
			{
				err = fmax(err, 1);
			}
			else
			{
				size_t j;
				for (j = 0; j < D_ref; j++) {
					err = fmax(err, (double)abs(qG1[j] - qG1_ref[j]));
				}
			}
			MKL_free(qG1_ref);
			MKL_free(qG1);

			// norm and von Neumann entropy of singular values
			{
				const double nsigma_ref  = 46.345164006872245;
				const double entropy_ref = 4.49445479211037;

				err = fmax(err, fabs(ti.nsigma  -  nsigma_ref) / nsigma_ref);
				err = fmax(err, fabs(ti.entropy - entropy_ref) / entropy_ref);
			}

			// merge the two tensors
			tensor_t G2mrg;
			MergeMPOTensorPair(&G0, &G1, &G2mrg);

			// check dimensions
			if (G2mrg.ndim != 4 || G2mrg.dim[0] != G2.dim[0] || G2mrg.dim[1] != G2.dim[1] || G2mrg.dim[2] != G2.dim[2] || G2mrg.dim[3] != G2.dim[3])
			{
				err = fmax(err, 1);
			}
			else
			{
				// reference (truncated approximation)
				tensor_t G2mrg_ref;
				{
					const size_t dim[4] = { G2.dim[0], G2.dim[1], G2.dim[2], G2.dim[3] };
					AllocateTensor(4, dim, &G2mrg_ref);
					int status;
					status = ReadData("../test/mpo_test_G2_red.dat", G2mrg_ref.data, sizeof(MKL_Complex16), NumTensorElements(&G2mrg_ref));
					if (status < 0) { return status; }
				}

				// largest entrywise error
				err = fmax(err, UniformDistance(2*NumTensorElements(&G2mrg_ref), (double *)G2mrg.data, (double *)G2mrg_ref.data));

				DeleteTensor(&G2mrg_ref);
			}
			DeleteTensor(&G2mrg);

			DeleteTensor(&G1);
			DeleteTensor(&G0);
		}

		MKL_free(qd0);
		MKL_free(qd1);
		MKL_free(qG0);
		MKL_free(qG2);
		DeleteTensor(&G2);
	}

	// composition of MPOs
	{
		mpo_t XZ;
		MPOComposition(&X, &Z, &XZ);

		// allocate and load reference tensors from disk
		mpo_t XZ_ref;
		const size_t d[] = { 3, 4 };
		const size_t D[] = { 1, 25, 36, 12, 49, 16, 1 };
		AllocateMPO(L, d, D, &XZ_ref);
		for (i = 0; i < L; i++)
		{
			char filename[1024];
			sprintf(filename, "../test/mpo_test_A0B_%i.dat", i);
			status = ReadData(filename, XZ_ref.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&XZ_ref.A[i]));
			if (status < 0) { return status; }
		}

		// compare
		for (i = 0; i < L; i++)
		{
			if (XZ.A[i].dim[0] != XZ_ref.A[i].dim[0] || XZ.A[i].dim[1] != XZ_ref.A[i].dim[1] || XZ.A[i].dim[2] != XZ_ref.A[i].dim[2] || XZ.A[i].dim[3] != XZ_ref.A[i].dim[3])
			{
				err = fmax(err, 1);
			}
			else
			{
				// largest entrywise error
				err = fmax(err, UniformDistance(2*NumTensorElements(&XZ_ref.A[i]), (double *)XZ.A[i].data, (double *)XZ_ref.A[i].data));
			}
		}

		DeleteMPO(&XZ_ref);
		DeleteMPO(&XZ);
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
	DeleteMPO(&Z);
	DeleteMPO(&Y);
	DeleteMPO(&X);

	return (err < 2e-14 ? 0 : 1);
}
