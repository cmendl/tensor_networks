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
static double MPOBlockStructureError(const tensor_t *A, const qnumber_t *restrict qd[2], const qnumber_t *restrict qD0, const qnumber_t *restrict qD1)
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
		sprintf(filename, "../test/mpo_test_A%i.dat", i);
		status = ReadData(filename, X.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&X.A[i]));
		if (status < 0) { return status; }
	}
	for (i = 0; i < L; i++)
	{
		char filename[1024];
		sprintf(filename, "../test/mpo_test_B%i.dat", i);
		status = ReadData(filename, Y.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&Y.A[i]));
		if (status < 0) { return status; }
	}
	for (i = 0; i < L; i++)
	{
		char filename[1024];
		sprintf(filename, "../test/mpo_test_C%i.dat", i);
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
		sprintf(filename, "../test/mpo_test_qA%i.dat", i);
		status = ReadData(filename, X.qD[i], sizeof(qnumber_t), DX); if (status < 0) { return status; }
		sprintf(filename, "../test/mpo_test_qB%i.dat", i);
		status = ReadData(filename, Y.qD[i], sizeof(qnumber_t), DY); if (status < 0) { return status; }
		sprintf(filename, "../test/mpo_test_qC%i.dat", i);
		status = ReadData(filename, Z.qD[i], sizeof(qnumber_t), DZ); if (status < 0) { return status; }

		if (i > 0)
		{
			err = fmax(err, MPOBlockStructureError(&X.A[i-1], (const qnumber_t *restrict *)X.qd, X.qD[i-1], X.qD[i]));
			err = fmax(err, MPOBlockStructureError(&Y.A[i-1], (const qnumber_t *restrict *)Y.qd, Y.qD[i-1], Y.qD[i]));
			err = fmax(err, MPOBlockStructureError(&Z.A[i-1], (const qnumber_t *restrict *)Z.qd, Z.qD[i-1], Z.qD[i]));
		}
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

	// trace
	{
		MKL_Complex16 tr = MPOTrace(&Z);

		// reference value
		const MKL_Complex16 tr_ref = { -0.3918459574696666, -2.4900774855912697 };

		// relative error
		err = fmax(err, ComplexAbs(ComplexSubtract(tr, tr_ref)) / ComplexAbs(tr_ref));
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
			err = fmax(err, MPOBlockStructureError(&Yh.A[i], (const qnumber_t *restrict *)Yh.qd, Yh.qD[i], Yh.qD[i+1]));
		}

		// perform addition using MPO representation
		mpo_t XYh;
		MPOAdd(&X, &Yh, &XYh);

		for (i = 0; i < L; i++)
		{
			err = fmax(err, MPOBlockStructureError(&XYh.A[i], (const qnumber_t *restrict *)XYh.qd, XYh.qD[i], XYh.qD[i+1]));
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
			status = ReadData("../test/mpo_test_ABsum_merged_val.dat", val, sizeof(MKL_Complex16), nnz); if (status < 0) { return status; }
			status = ReadData("../test/mpo_test_ABsum_merged_ind.dat", ind, sizeof(uint64_t),      nnz); if (status < 0) { return status; }
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
			bond_op_params_t params;
			params.tol  = 0;
			params.maxD = INT32_MAX;
			params.renormalize = false;
			trunc_info_t ti = SplitMPOTensor(&G2, qG0, qG2, d0, d1, qd0, qd1, SVD_DISTR_SQRT, &params, &G0, &G1, &qG1);

			// block structure error
			const qnumber_t *qd0_pair[2] = { qd0, qd0 }; 
			const qnumber_t *qd1_pair[2] = { qd1, qd1 }; 
			err = fmax(err, MPOBlockStructureError(&G0, qd0_pair, qG0, qG1));
			err = fmax(err, MPOBlockStructureError(&G1, qd1_pair, qG1, qG2));

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
			bond_op_params_t params;
			params.tol  = 0.1;
			params.maxD = INT32_MAX;
			params.renormalize = false;
			trunc_info_t ti = SplitMPOTensor(&G2, qG0, qG2, d0, d1, qd0, qd1, SVD_DISTR_SQRT, &params, &G0, &G1, &qG1);

			// block structure error
			const qnumber_t *qd0_pair[2] = { qd0, qd0 }; 
			const qnumber_t *qd1_pair[2] = { qd1, qd1 }; 
			err = fmax(err, MPOBlockStructureError(&G0, qd0_pair, qG0, qG1));
			err = fmax(err, MPOBlockStructureError(&G1, qd1_pair, qG1, qG2));

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
		bond_op_params_t params;
		params.tol  = 0.02;
		params.maxD = INT32_MAX;
		params.renormalize = false;
		trunc_info_t ti = CompressMPOTensors(&K0, &K1, qK0, qK1, qK2, qd0, qd1, SVD_DISTR_SQRT, &params, &qcK1);
		MKL_free(qK1);

		// block structure error
		const qnumber_t *qd0_pair[2] = { qd0, qd0 }; 
		const qnumber_t *qd1_pair[2] = { qd1, qd1 }; 
		err = fmax(err, MPOBlockStructureError(&K0, qd0_pair, qK0, qcK1));
		err = fmax(err, MPOBlockStructureError(&K1, qd1_pair, qcK1, qK2));

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

	// compress a MPO
	{
		sweep_dir_t direction;
		for (direction = SWEEP_LEFT_TO_RIGHT; direction <= SWEEP_RIGHT_TO_LEFT; direction++)
		{
			mpo_t Zmod;
			CopyMPO(&Z, &Zmod);

			// load modified 'Z' tensor data from disk
			{
				status = ReadData("../test/mpo_test_C2_mod.dat", Zmod.A[2].data, sizeof(MKL_Complex16), NumTensorElements(&Zmod.A[2]));
				if (status < 0) { return status; }
			}

			// merge MPO, as reference
			tensor_t Am_ref;
			MergeMPOFull(&Zmod, &Am_ref);

			// modified 'Z' tensor is redundant, such that lossless compression should be possible
			trunc_info_t *ti = (trunc_info_t *)MKL_malloc((L - 1) * sizeof(trunc_info_t), MEM_DATA_ALIGN);
			bond_op_params_t params;
			params.tol  = 0;
			params.maxD = INT32_MAX;
			params.renormalize = false;
			CompressMPO(&Zmod, direction, &params, ti);

			// merge compressed MPO
			tensor_t Am;
			MergeMPOFull(&Zmod, &Am);

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

			DeleteTensor(&Am);
			MKL_free(ti);
			DeleteTensor(&Am_ref);
			DeleteMPO(&Zmod);
		}
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
			sprintf(filename, "../test/mpo_test_CA%i.dat", i);
			status = ReadData(filename, ZX_ref.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&ZX_ref.A[i]));
			if (status < 0) { return status; }
		}

		memcpy(ZX_ref.qd[0], qd0, d0*sizeof(qnumber_t));
		memcpy(ZX_ref.qd[1], qd1, d1*sizeof(qnumber_t));

		// load virtual bond quantum numbers from disk
		for (i = 0; i < L + 1; i++)
		{
			char filename[1024];
			sprintf(filename, "../test/mpo_test_qCA%i.dat", i);
			status = ReadData(filename, ZX_ref.qD[i], sizeof(qnumber_t), D[i]);
			if (status < 0) { return status; }

			if (i > 0)
			{
				err = fmax(err, MPOBlockStructureError(&ZX_ref.A[i-1], (const qnumber_t *restrict *)ZX_ref.qd, ZX_ref.qD[i-1], ZX_ref.qD[i]));
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

	// construct MPO representation of a sum of operator chains
	{
		const size_t d = 4;
		const int nopc = 10;

		// physical quantum numbers
		const qnumber_t qd[4] = { 1, 0, -2, 0 };

		// load operator chains from disk
		opchain_t *opchains = (opchain_t *)MKL_calloc(nopc, sizeof(opchain_t), MEM_DATA_ALIGN);
		{
			int *length = (int *)MKL_malloc(nopc * sizeof(int), MEM_DATA_ALIGN);
			int *start  = (int *)MKL_malloc(nopc * sizeof(int), MEM_DATA_ALIGN);
			status = ReadData("../test/mpo_test_opc_length.dat", length, sizeof(int), nopc);    if (status < 0) { return status; }
			status = ReadData("../test/mpo_test_opc_start.dat",  start,  sizeof(int), nopc);    if (status < 0) { return status; }

			int j;
			for (j = 0; j < nopc; j++)
			{
				AllocateOpchain(d, length[j], start[j], &opchains[j]);

				int k;
				for (k = 0; k < length[j]; k++)
				{
					char filename[1024];
					sprintf(filename, "../test/mpo_test_opc%i_%i.dat", j, k);
					status = ReadData(filename, opchains[j].op[k].data, sizeof(MKL_Complex16), NumTensorElements(&opchains[j].op[k]));
					if (status < 0) { return status; }
				}

				char filename[1024];
				sprintf(filename, "../test/mpo_test_opc%i_qD.dat", j);
				status = ReadData(filename, opchains[j].qD, sizeof(qnumber_t), opchains[j].n - 1);
				if (status < 0) { return status; }
			}

			MKL_free(start);
			MKL_free(length);
		}

		// construct MPO representation
		mpo_t W;
		MPOFromOpChains(L, d, nopc, opchains, &W);
		memcpy(W.qd[0], qd, d*sizeof(qnumber_t));
		memcpy(W.qd[1], qd, d*sizeof(qnumber_t));

		// load reference MPO from disk
		mpo_t W_ref;
		{
			const size_t d2[] = { d, d };
			const size_t D[]  = { 1, 4, 4, 6, 5, 1 };
			AllocateMPO(L, d2, D, &W_ref);

			for (i = 0; i < L; i++)
			{
				char filename[1024];
				sprintf(filename, "../test/mpo_test_W%i.dat", i);
				status = ReadData(filename, W_ref.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&W_ref.A[i]));
				if (status < 0) { return status; }
			}

			for (i = 0; i < L + 1; i++)
			{
				char filename[1024];
				sprintf(filename, "../test/mpo_test_qW%i.dat", i);
				status = ReadData(filename, W_ref.qD[i], sizeof(qnumber_t), D[i]);
				if (status < 0) { return status; }
			}
		}

		for (i = 0; i < L; i++)
		{
			err = fmax(err, MPOBlockStructureError(&W.A[i], (const qnumber_t *restrict *)W.qd, W.qD[i], W.qD[i+1]));
		}

		// compare matrix entries
		for (i = 0; i < L; i++)
		{
			if (W.A[i].dim[0] != W_ref.A[i].dim[0] || W.A[i].dim[1] != W_ref.A[i].dim[1] || W.A[i].dim[2] != W_ref.A[i].dim[2] || W.A[i].dim[3] != W_ref.A[i].dim[3])
			{
				err = fmax(err, 1);
			}
			else
			{
				// largest entrywise error
				err = fmax(err, UniformDistance(2*NumTensorElements(&W_ref.A[i]), (double *)W.A[i].data, (double *)W_ref.A[i].data));
			}
		}
		// check virtual bond quantum numbers
		for (i = 0; i < L + 1; i++)
		{
			const size_t D = MPOBondDim(&W_ref, i);
			size_t j;
			for (j = 0; j < D; j++) {
				err = fmax(err, (double)abs(W.qD[i][j] - W_ref.qD[i][j]));
			}
		}

		// clean up
		DeleteMPO(&W_ref);
		DeleteMPO(&W);
		int j;
		for (j = 0; j < nopc; j++)
		{
			DeleteOpchain(&opchains[j]);
		}
		MKL_free(opchains);
	}

	printf("Largest error: %g\n", err);

	// clean up
	DeleteMPO(&Z);
	DeleteMPO(&Y);
	DeleteMPO(&X);
	MKL_free(qd0);
	MKL_free(qd1);

	return (err < 2e-14 ? 0 : 1);
}
