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

	const int L = 5;

	const size_t d0 = 4;
	const size_t d1 = 5;

	// load physical quantum numbers from disk
	qnumber_t *qd0 = (qnumber_t *)MKL_malloc(d0 * sizeof(qnumber_t), MEM_DATA_ALIGN);
	qnumber_t *qd1 = (qnumber_t *)MKL_malloc(d1 * sizeof(qnumber_t), MEM_DATA_ALIGN);
	{
		status = ReadData("../test/mpo_test_qd0.dat", qd0, sizeof(qnumber_t), d0); if (status < 0) { return status; }
		status = ReadData("../test/mpo_test_qd1.dat", qd1, sizeof(qnumber_t), d1); if (status < 0) { return status; }
	}

	// allocate 'X', 'Y' and 'Z' MPOs
	mpo_t X;
	{
		const size_t d[] = { d0, d1 };
		const size_t D[] = { 1, 5, 9, 7, 4, 1 };
		AllocateMPO(L, d, D, &X);

		memcpy(X.qd[0], qd0, d0*sizeof(qnumber_t));
		memcpy(X.qd[1], qd1, d1*sizeof(qnumber_t));
	}
	mpo_t Y;
	{
		const size_t d[] = { d1, d0 };
		const size_t D[] = { 1, 10, 6, 8, 7, 1 };
		AllocateMPO(L, d, D, &Y);

		memcpy(Y.qd[0], qd1, d1*sizeof(qnumber_t));
		memcpy(Y.qd[1], qd0, d0*sizeof(qnumber_t));
	}
	mpo_t Z;
	{
		const size_t d[] = { d0, d0 };
		const size_t D[] = { 1, 5, 6, 7, 8, 1 };
		AllocateMPO(L, d, D, &Z);

		memcpy(Z.qd[0], qd0, d0*sizeof(qnumber_t));
		memcpy(Z.qd[1], qd0, d0*sizeof(qnumber_t));
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

	// load virtual bond quantum numbers from disk
	for (i = 0; i < L + 1; i++)
	{
		// virtual bond dimension
		const size_t DX = MPOBondDim(&X, i);
		const size_t DY = MPOBondDim(&Y, i);
		const size_t DZ = MPOBondDim(&Z, i);

		char filename[1024];
		sprintf(filename, "../test/mpo_test_qA0_%i.dat", i);
		status = ReadData(filename, X.qD[i], sizeof(qnumber_t), DX); if (status < 0) { return status; }
		sprintf(filename, "../test/mpo_test_qA1_%i.dat", i);
		status = ReadData(filename, Y.qD[i], sizeof(qnumber_t), DY); if (status < 0) { return status; }
		sprintf(filename, "../test/mpo_test_qB%i.dat", i);
		status = ReadData(filename, Z.qD[i], sizeof(qnumber_t), DZ); if (status < 0) { return status; }

		if (i > 0)
		{
			err = fmax(err, BlockStructureError(&X.A[i-1], (const qnumber_t *restrict *)X.qd, X.qD[i-1], X.qD[i]));
			err = fmax(err, BlockStructureError(&Y.A[i-1], (const qnumber_t *restrict *)Y.qd, Y.qD[i-1], Y.qD[i]));
			err = fmax(err, BlockStructureError(&Z.A[i-1], (const qnumber_t *restrict *)Z.qd, Z.qD[i-1], Z.qD[i]));
		}
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

		tensor_t Am_ref;
		{
			const size_t dim_ref[2] = { 1024, 3125 };
			AllocateTensor(2, dim_ref, &Am_ref);

			// non-zero entries of reference tensor
			const size_t nnz = 9412;
			MKL_Complex16 *val = (MKL_Complex16 *)MKL_malloc(nnz*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
			uint64_t      *ind =      (uint64_t *)MKL_malloc(nnz*sizeof(uint64_t),      MEM_DATA_ALIGN);
			status = ReadData("../test/mpo_test_A_merged_val.dat", val, sizeof(MKL_Complex16), nnz); if (status < 0) { return status; }
			status = ReadData("../test/mpo_test_A_merged_ind.dat", ind, sizeof(uint64_t),      nnz); if (status < 0) { return status; }
			size_t j;
			for (j = 0; j < nnz; j++)
			{
				Am_ref.data[ind[j]] = val[j];
			}
			MKL_free(ind);
			MKL_free(val);
		}

		// check dimensions
		if (Am.ndim != 2 || Am.dim[0] != Am_ref.dim[0] || Am.dim[1] != Am_ref.dim[1])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(2*NumTensorElements(&Am_ref), (double *)Am.data, (double *)Am_ref.data));
		}

		DeleteTensor(&Am_ref);
		DeleteTensor(&Am);
	}

	// reduction step required for trace of tensor product
	{
		size_t dim[2];

		tensor_t R;
		dim[0] = 8;
		dim[1] = 7;
		AllocateTensor(2, dim, &R);
		status = ReadData("../test/mpo_test_R0.dat", R.data, sizeof(MKL_Complex16), NumTensorElements(&R));
		if (status < 0) { return status; }

		MPOTraceProductTensorReduce(&X.A[2], &Y.A[2], &R);

		// reference tensor
		tensor_t R_ref;
		dim[0] = 6;
		dim[1] = 9;
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
		const MKL_Complex16 tr_ref = { -0.06181116171457786, 0.41652782215072304 };

		// relative error
		err = fmax(err, ComplexAbs(ComplexSubtract(tr, tr_ref)) / ComplexAbs(tr_ref));
	}

	// trace of tensor product
	{
		MKL_Complex16 tr = MPOTraceProduct(&X, &Y);

		// reference value
		const MKL_Complex16 tr_ref = { 0.0034089965364192724, 0.0010843561394613549 };

		// relative error
		err = fmax(err, ComplexAbs(ComplexSubtract(tr, tr_ref)) / ComplexAbs(tr_ref));
	}

	// Frobenius norm
	{
		double nF = MPOFrobeniusNorm(&X);

		// reference value
		const double nF_ref = 1.3400324621941806;

		// relative error
		err = fmax(err, fabs(nF - nF_ref) / nF_ref);
	}

	// trace of tensor quad-product
	{
		mpo_t F[4];
		const size_t d[5] = { 3, 6, 4, 2, 3 };
		const size_t D[4][7] = {
			{ 1, 5, 6, 4, 7, 1 },
			{ 1, 6, 2, 7, 5, 1 },
			{ 1, 5, 6, 7, 3, 1 },
			{ 1, 5, 7, 1, 3, 1 }
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
		const MKL_Complex16 tr_ref = { -0.18256141240166204, -0.03934545059094635 };

		// relative error
		err = fmax(err, ComplexAbs(ComplexSubtract(tr, tr_ref)) / ComplexAbs(tr_ref));

		// clean up
		for (j = 0; j < 4; j++)
		{
			DeleteMPO(&F[j]);
		}
	}

	// add two MPOs
	{
		mpo_t Yh;
		ConjugateTransposeMPO(&Y, &Yh);

		for (i = 0; i < L; i++)
		{
			err = fmax(err, BlockStructureError(&Yh.A[i], (const qnumber_t *restrict *)Yh.qd, Yh.qD[i], Yh.qD[i+1]));
		}

		// perform addition using MPO representation
		mpo_t XYh;
		MPOAdd(&X, &Yh, &XYh);

		for (i = 0; i < L; i++)
		{
			err = fmax(err, BlockStructureError(&XYh.A[i], (const qnumber_t *restrict *)XYh.qd, XYh.qD[i], XYh.qD[i+1]));
		}

		// representation on full Hilbert space, for comparison with reference
		tensor_t XYhm;
		MergeMPOFull(&XYh, &XYhm);

		// load reference data from disk
		tensor_t XYhm_ref;
		{
			const size_t dim_ref[2] = { 1024, 3125 };
			AllocateTensor(2, dim_ref, &XYhm_ref);

			// non-zero entries of reference tensor
			const size_t nnz = 75233;
			MKL_Complex16 *val = (MKL_Complex16 *)MKL_malloc(nnz*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
			uint64_t      *ind =      (uint64_t *)MKL_malloc(nnz*sizeof(uint64_t),      MEM_DATA_ALIGN);
			status = ReadData("../test/mpo_test_Asum_merged_val.dat", val, sizeof(MKL_Complex16), nnz); if (status < 0) { return status; }
			status = ReadData("../test/mpo_test_Asum_merged_ind.dat", ind, sizeof(uint64_t),      nnz); if (status < 0) { return status; }
			size_t j;
			for (j = 0; j < nnz; j++)
			{
				XYhm_ref.data[ind[j]] = val[j];
			}
			MKL_free(ind);
			MKL_free(val);
		}

		// check dimensions
		if (XYhm.ndim != 2 || XYhm.dim[0] != XYhm_ref.dim[0] || XYhm.dim[1] != XYhm_ref.dim[1])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise error
			err = fmax(err, UniformDistance(2*NumTensorElements(&XYhm_ref), (double *)XYhm.data, (double *)XYhm_ref.data));
		}

		DeleteTensor(&XYhm_ref);
		DeleteTensor(&XYhm);
		DeleteMPO(&XYh);
		DeleteMPO(&Yh);
	}

	// split a MPO tensor
	{
		tensor_t G2;
		{
			const size_t dim[4] = { d0 * d1, d0 * d1, 13, 11 };
			AllocateTensor(4, dim, &G2);
			status = ReadData("../test/mpo_test_G2.dat", G2.data, sizeof(MKL_Complex16), NumTensorElements(&G2));
			if (status < 0) { return status; }
		}

		// load virtual quantum numbers from disk
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

		MKL_free(qG0);
		MKL_free(qG2);
		DeleteTensor(&G2);
	}

	// compress virtual bonds
	{
		tensor_t K0, K1;
		{
			const size_t dimK0[4] = { d0, d0, 5, 14 };
			AllocateTensor(4, dimK0, &K0);
			status = ReadData("../test/mpo_test_K0.dat", K0.data, sizeof(MKL_Complex16), NumTensorElements(&K0));
			if (status < 0) { return status; }

			const size_t dimK1[4] = { d1, d1, 14, 7 };
			AllocateTensor(4, dimK1, &K1);
			status = ReadData("../test/mpo_test_K1.dat", K1.data, sizeof(MKL_Complex16), NumTensorElements(&K1));
			if (status < 0) { return status; }
		}

		// load virtual quantum numbers from disk
		qnumber_t *qK0 = (qnumber_t *)MKL_malloc(K0.dim[2] * sizeof(qnumber_t), MEM_DATA_ALIGN);
		qnumber_t *qK1 = (qnumber_t *)MKL_malloc(K0.dim[3] * sizeof(qnumber_t), MEM_DATA_ALIGN);
		qnumber_t *qK2 = (qnumber_t *)MKL_malloc(K1.dim[3] * sizeof(qnumber_t), MEM_DATA_ALIGN);
		status = ReadData("../test/mpo_test_qK0.dat", qK0, sizeof(qnumber_t), K0.dim[2]); if (status < 0) { return status; }
		status = ReadData("../test/mpo_test_qK1.dat", qK1, sizeof(qnumber_t), K0.dim[3]); if (status < 0) { return status; }
		status = ReadData("../test/mpo_test_qK2.dat", qK2, sizeof(qnumber_t), K1.dim[3]); if (status < 0) { return status; }

		// bond quantum numbers after compression
		qnumber_t *qcK1;
		trunc_info_t ti = CompressMPOTensors(&K0, &K1, qK0, qK1, qK2, qd0, qd1, SVD_DISTR_SQRT, 0.02, INT32_MAX, false, &qcK1);
		MKL_free(qK1);

		// block structure error
		const qnumber_t *qd0_pair[2] = { qd0, qd0 }; 
		const qnumber_t *qd1_pair[2] = { qd1, qd1 }; 
		err = fmax(err, BlockStructureError(&K0, qd0_pair, qK0, qcK1));
		err = fmax(err, BlockStructureError(&K1, qd1_pair, qcK1, qK2));

		// check bond quantum numbers
		const size_t D_ref = 10;
		qnumber_t *qcK1_ref = (qnumber_t *)MKL_malloc(D_ref * sizeof(qnumber_t), MEM_DATA_ALIGN);
		status = ReadData("../test/mpo_test_qcK1.dat", qcK1_ref, sizeof(qnumber_t), D_ref); if (status < 0) { return status; }
		if (K0.dim[3] != D_ref)
		{
			err = fmax(err, 1);
		}
		else
		{
			size_t j;
			for (j = 0; j < D_ref; j++) {
				err = fmax(err, (double)abs(qcK1[j] - qcK1_ref[j]));
			}
		}
		MKL_free(qcK1_ref);

		// norm and von Neumann entropy of singular values
		{
			const double nsigma_ref  = 22.963758071744884;
			const double entropy_ref = 2.093919636764969;

			err = fmax(err, fabs(ti.nsigma  -  nsigma_ref) / nsigma_ref);
			err = fmax(err, fabs(ti.entropy - entropy_ref) / entropy_ref);
		}

		// merge the two compressed tensors, for comparison with reference
		tensor_t K2mrg;
		MergeMPOTensorPair(&K0, &K1, &K2mrg);

		// check dimensions
		if (K2mrg.ndim != 4 || K2mrg.dim[0] != d0*d1 || K2mrg.dim[1] != d0*d1 || K2mrg.dim[2] != K0.dim[2] || K2mrg.dim[3] != K1.dim[3])
		{
			err = fmax(err, 1);
		}
		else
		{
			// reference (truncated approximation)
			tensor_t K2mrg_ref;
			{
				AllocateTensor(4, K2mrg.dim, &K2mrg_ref);
				status = ReadData("../test/mpo_test_cK2.dat", K2mrg_ref.data, sizeof(MKL_Complex16), NumTensorElements(&K2mrg_ref));
				if (status < 0) { return status; }
			}

			// largest entrywise error
			err = fmax(err, UniformDistance(2*NumTensorElements(&K2mrg_ref), (double *)K2mrg.data, (double *)K2mrg_ref.data));

			DeleteTensor(&K2mrg_ref);
		}
		DeleteTensor(&K2mrg);

		// clean up
		MKL_free(qK2);
		MKL_free(qcK1);
		MKL_free(qK0);
		DeleteTensor(&K1);
		DeleteTensor(&K0);
	}

	// compose MPO tensor pairs
	{
		tensor_t K0, K1;
		{
			const size_t dimK0[4] = { d0, d0, 5, 14 };
			AllocateTensor(4, dimK0, &K0);
			status = ReadData("../test/mpo_test_K0.dat", K0.data, sizeof(MKL_Complex16), NumTensorElements(&K0));
			if (status < 0) { return status; }

			const size_t dimK1[4] = { d1, d1, 14, 7 };
			AllocateTensor(4, dimK1, &K1);
			status = ReadData("../test/mpo_test_K1.dat", K1.data, sizeof(MKL_Complex16), NumTensorElements(&K1));
			if (status < 0) { return status; }
		}

		tensor_t M0, M1;
		{
			const size_t dimM0[4] = { d0, d0, 6, 10 };
			AllocateTensor(4, dimM0, &M0);
			status = ReadData("../test/mpo_test_M0.dat", M0.data, sizeof(MKL_Complex16), NumTensorElements(&M0));
			if (status < 0) { return status; }

			const size_t dimM1[4] = { d1, d1, 10, 6 };
			AllocateTensor(4, dimM1, &M1);
			status = ReadData("../test/mpo_test_M1.dat", M1.data, sizeof(MKL_Complex16), NumTensorElements(&M1));
			if (status < 0) { return status; }
		}

		// load virtual quantum numbers from disk
		qnumber_t *qK0 = (qnumber_t *)MKL_malloc(K0.dim[2] * sizeof(qnumber_t), MEM_DATA_ALIGN);
		qnumber_t *qK1 = (qnumber_t *)MKL_malloc(K0.dim[3] * sizeof(qnumber_t), MEM_DATA_ALIGN);
		qnumber_t *qK2 = (qnumber_t *)MKL_malloc(K1.dim[3] * sizeof(qnumber_t), MEM_DATA_ALIGN);
		qnumber_t *qM0 = (qnumber_t *)MKL_malloc(M0.dim[2] * sizeof(qnumber_t), MEM_DATA_ALIGN);
		qnumber_t *qM1 = (qnumber_t *)MKL_malloc(M0.dim[3] * sizeof(qnumber_t), MEM_DATA_ALIGN);
		qnumber_t *qM2 = (qnumber_t *)MKL_malloc(M1.dim[3] * sizeof(qnumber_t), MEM_DATA_ALIGN);
		status = ReadData("../test/mpo_test_qK0.dat", qK0, sizeof(qnumber_t), K0.dim[2]); if (status < 0) { return status; }
		status = ReadData("../test/mpo_test_qK1.dat", qK1, sizeof(qnumber_t), K0.dim[3]); if (status < 0) { return status; }
		status = ReadData("../test/mpo_test_qK2.dat", qK2, sizeof(qnumber_t), K1.dim[3]); if (status < 0) { return status; }
		status = ReadData("../test/mpo_test_qM0.dat", qM0, sizeof(qnumber_t), M0.dim[2]); if (status < 0) { return status; }
		status = ReadData("../test/mpo_test_qM1.dat", qM1, sizeof(qnumber_t), M0.dim[3]); if (status < 0) { return status; }
		status = ReadData("../test/mpo_test_qM2.dat", qM2, sizeof(qnumber_t), M1.dim[3]); if (status < 0) { return status; }

		// compose tensor pairs
		tensor_t P0, P1;
		qnumber_t *qP0;
		qnumber_t *qP1;
		qnumber_t *qP2;
		trunc_info_t ti = ComposeMPOTensorPairs(&K0, &K1, qK0, qK1, qK2, &M0, &M1, qM0, qM1, qM2, qd0, qd1, SVD_DISTR_SQRT, 0.05, INT32_MAX, false, &P0, &P1, &qP0, &qP1, &qP2);

		// block structure error
		const qnumber_t *qd0_pair[2] = { qd0, qd0 }; 
		const qnumber_t *qd1_pair[2] = { qd1, qd1 }; 
		err = fmax(err, BlockStructureError(&P0, qd0_pair, qP0, qP1));
		err = fmax(err, BlockStructureError(&P1, qd1_pair, qP1, qP2));

		// check virtual bond quantum numbers

		// load reference quantum numbers from disk
		const size_t D0_ref = 30;
		const size_t D1_ref = 57;
		const size_t D2_ref = 42;
		qnumber_t *qP0_ref = (qnumber_t *)MKL_malloc(D0_ref * sizeof(qnumber_t), MEM_DATA_ALIGN);
		qnumber_t *qP1_ref = (qnumber_t *)MKL_malloc(D1_ref * sizeof(qnumber_t), MEM_DATA_ALIGN);
		qnumber_t *qP2_ref = (qnumber_t *)MKL_malloc(D2_ref * sizeof(qnumber_t), MEM_DATA_ALIGN);
		status = ReadData("../test/mpo_test_qP0.dat", qP0_ref, sizeof(qnumber_t), D0_ref); if (status < 0) { return status; }
		status = ReadData("../test/mpo_test_qP1.dat", qP1_ref, sizeof(qnumber_t), D1_ref); if (status < 0) { return status; }
		status = ReadData("../test/mpo_test_qP2.dat", qP2_ref, sizeof(qnumber_t), D2_ref); if (status < 0) { return status; }

		if (P0.dim[2] != D0_ref || P0.dim[3] != D1_ref || P1.dim[3] != D2_ref)
		{
			err = fmax(err, 1);
		}
		else
		{
			size_t j;
			for (j = 0; j < D0_ref; j++) { err = fmax(err, (double)abs(qP0[j] - qP0_ref[j])); }
			for (j = 0; j < D1_ref; j++) { err = fmax(err, (double)abs(qP1[j] - qP1_ref[j])); }
			for (j = 0; j < D2_ref; j++) { err = fmax(err, (double)abs(qP2[j] - qP2_ref[j])); }
		}
		MKL_free(qP2_ref);
		MKL_free(qP1_ref);
		MKL_free(qP0_ref);

		// norm and von Neumann entropy of singular values
		{
			const double nsigma_ref  = 29.932926894252983;
			const double entropy_ref = 3.6956519290156757;

			err = fmax(err, fabs(ti.nsigma  -  nsigma_ref) / nsigma_ref);
			err = fmax(err, fabs(ti.entropy - entropy_ref) / entropy_ref);
		}

		// merge the two tensors, for comparison with reference
		tensor_t P2mrg;
		MergeMPOTensorPair(&P0, &P1, &P2mrg);

		// check dimensions
		if (P2mrg.ndim != 4 || P2mrg.dim[0] != d0*d1 || P2mrg.dim[1] != d0*d1 || P2mrg.dim[2] != D0_ref || P2mrg.dim[3] != D2_ref)
		{
			err = fmax(err, 1);
		}
		else
		{
			// first few entries of reference tensor
			const int n = 16384;
			MKL_Complex16 *P2mrg_ref = (MKL_Complex16 *)MKL_malloc(n*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
			status = ReadData("../test/mpo_test_P2.dat", P2mrg_ref, sizeof(MKL_Complex16), n);
			if (status < 0) { return status; }

			// largest entrywise error
			err = fmax(err, UniformDistance(2*n, (double *)P2mrg.data, (double *)P2mrg_ref));

			MKL_free(P2mrg_ref);
		}
		DeleteTensor(&P2mrg);

		// clean up
		MKL_free(qP2);
		MKL_free(qP1);
		MKL_free(qP0);
		MKL_free(qM2);
		MKL_free(qM1);
		MKL_free(qM0);
		MKL_free(qK2);
		MKL_free(qK1);
		MKL_free(qK0);
		DeleteTensor(&P1);
		DeleteTensor(&P0);
		DeleteTensor(&M1);
		DeleteTensor(&M0);
		DeleteTensor(&K1);
		DeleteTensor(&K0);
	}

	// composition of MPOs
	{
		mpo_t ZX;
		MPOComposition(&Z, &X, &ZX);

		// allocate and load reference tensors from disk
		mpo_t ZX_ref;
		const size_t d[] = { d0, d1 };
		const size_t D[] = { 1, 25, 54, 49, 32, 1 };
		AllocateMPO(L, d, D, &ZX_ref);
		for (i = 0; i < L; i++)
		{
			char filename[1024];
			sprintf(filename, "../test/mpo_test_BA0_%i.dat", i);
			status = ReadData(filename, ZX_ref.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&ZX_ref.A[i]));
			if (status < 0) { return status; }
		}

		memcpy(ZX_ref.qd[0], qd0, d0*sizeof(qnumber_t));
		memcpy(ZX_ref.qd[1], qd1, d1*sizeof(qnumber_t));

		// load virtual bond quantum numbers from disk
		for (i = 0; i < L + 1; i++)
		{
			char filename[1024];
			sprintf(filename, "../test/mpo_test_qBA0_%i.dat", i);
			status = ReadData(filename, ZX_ref.qD[i], sizeof(qnumber_t), D[i]);
			if (status < 0) { return status; }

			if (i > 0)
			{
				err = fmax(err, BlockStructureError(&ZX_ref.A[i-1], (const qnumber_t *restrict *)ZX_ref.qd, ZX_ref.qD[i-1], ZX_ref.qD[i]));
			}
		}

		// compare matrix entries
		for (i = 0; i < L; i++)
		{
			if (ZX.A[i].dim[0] != ZX_ref.A[i].dim[0] || ZX.A[i].dim[1] != ZX_ref.A[i].dim[1] || ZX.A[i].dim[2] != ZX_ref.A[i].dim[2] || ZX.A[i].dim[3] != ZX_ref.A[i].dim[3])
			{
				err = fmax(err, 1);
			}
			else
			{
				// largest entrywise error
				err = fmax(err, UniformDistance(2*NumTensorElements(&ZX_ref.A[i]), (double *)ZX.A[i].data, (double *)ZX_ref.A[i].data));
			}
		}

		// check virtual bond quantum numbers
		for (i = 0; i < L + 1; i++)
		{
			const size_t D = MPOBondDim(&ZX_ref, i);
			size_t j;
			for (j = 0; j < D; j++) {
				err = fmax(err, (double)abs(ZX.qD[i][j] - ZX_ref.qD[i][j]));
			}
		}

		DeleteMPO(&ZX_ref);
		DeleteMPO(&ZX);
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
	MKL_free(qd0);
	MKL_free(qd1);

	return (err < 2e-14 ? 0 : 1);
}
