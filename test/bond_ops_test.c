#include "bond_ops.h"
#include "complex.h"
#include "util.h"
#include <stdio.h>


//________________________________________________________________________________________________________________________
///
/// \brief Check whether solely entries corresponding to matching quantum numbers are non-zero
///
static double MatrixBlockStructureError(const tensor_t *A, const qnumber_t *restrict q0, const qnumber_t *restrict q1)
{
	assert(A->ndim == 2);

	double err = 0;

	size_t i, j;
	for (j = 0; j < A->dim[1]; j++)
	{
		for (i = 0; i < A->dim[0]; i++)
		{
			if (q0[i] != q1[j])
			{
				err += ComplexAbs(A->data[i + A->dim[0]*j]);
			}
		}
	}

	return err;
}


int BondOperationsTest()
{
	int status;

	// accumulated error
	double err = 0;

	printf("Testing virtual bond operations...\n");

	// load 'A' matrix from disk
	tensor_t A;
	{
		const size_t dim[2] = { 15, 13 };
		AllocateTensor(2, dim,  &A);
		status = ReadData("../test/bond_ops_test_A.dat", A.data, sizeof(MKL_Complex16), NumTensorElements(&A));
		if (status < 0) { return status; }
	}

	// load quantum numbers from disk
	qnumber_t *q0 = (qnumber_t *)algn_malloc(A.dim[0] * sizeof(qnumber_t));
	qnumber_t *q1 = (qnumber_t *)algn_malloc(A.dim[1] * sizeof(qnumber_t));
	{
		status = ReadData("../test/bond_ops_test_q0.dat", q0, sizeof(qnumber_t), A.dim[0]); if (status < 0) { return status; }
		status = ReadData("../test/bond_ops_test_q1.dat", q1, sizeof(qnumber_t), A.dim[1]); if (status < 0) { return status; }
	}

	// truncated bond indices
	{
		// load singular values from disk
		const size_t n = 27;
		double *sigma = (double *)algn_malloc(n * sizeof(double));
		status = ReadData("../test/bond_ops_test_sigma.dat", sigma, sizeof(double), n);
		if (status < 0) { return status; }

		// load reference data from disk
		const size_t ntr_ref = 17;
		size_t *indtr_ref = (size_t *)algn_malloc(ntr_ref * sizeof(size_t));
		status = ReadData("../test/bond_ops_test_indtr.dat", indtr_ref, sizeof(size_t), ntr_ref); if (status < 0) { return status; }
		// norm and Neumann entropy of retained singular values
		double nsigma_ref;
		double entropy_ref;
		status = ReadData("../test/bond_ops_test_sigma_norm.dat",     &nsigma_ref, sizeof(double), 1); if (status < 0) { return status; }
		status = ReadData("../test/bond_ops_test_sigma_entropy.dat", &entropy_ref, sizeof(double), 1); if (status < 0) { return status; }

		// two versions: (i) truncation determined by tolerance, (ii) truncation determined by bond dimension cut-off
		const double tol[2]  = { 0.1, 0.05 };
		const size_t maxD[2] = { 128, 17   };

		int i;
		for (i = 0; i < 2; i++)
		{
			size_t *indtr;
			size_t ntr;
			trunc_info_t ti = TruncatedBondIndices(n, sigma, tol[i], maxD[i], &indtr, &ntr);

			if (ntr != ntr_ref)
			{
				err = fmax(err, (double)abs(ntr - ntr_ref));
			}
			else
			{
				// largest entrywise index error
				size_t j;
				for (j = 0; j < ntr; j++) {
					err = fmax(err, (double)abs(indtr[j] - indtr_ref[j]));
				}

				err = fmax(err, fabs(ti.nsigma  -  nsigma_ref));
				err = fmax(err, fabs(ti.entropy - entropy_ref));
			}

			if (indtr != NULL) {
				algn_free(indtr);
			}
		}

		// clean up
		algn_free(indtr_ref);
		algn_free(sigma);
	}

	// split a matrix
	{
		// load reference data from disk
		// bond quantum numbers
		const size_t D_ref = 7;
		qnumber_t *qbond_ref = (qnumber_t *)algn_malloc(D_ref * sizeof(qnumber_t));
		status = ReadData("../test/bond_ops_test_qbond.dat", qbond_ref, sizeof(qnumber_t), D_ref); if (status < 0) { return status; }
		// norm and Neumann entropy of retained singular values
		double nsigma_ref;
		double entropy_ref;
		status = ReadData("../test/bond_ops_test_S_norm.dat",     &nsigma_ref, sizeof(double), 1); if (status < 0) { return status; }
		status = ReadData("../test/bond_ops_test_S_entropy.dat", &entropy_ref, sizeof(double), 1); if (status < 0) { return status; }
		// truncated SVD approximation of 'A'
		tensor_t A01_ref;
		const size_t dim[2] = { 15, 13 };
		AllocateTensor(2, dim,  &A01_ref);
		status = ReadData("../test/bond_ops_test_A01.dat", A01_ref.data, sizeof(MKL_Complex16), NumTensorElements(&A01_ref));
		if (status < 0) { return status; }

		// probe all SVD distribution modes
		svd_distr_t svd_distr;
		for (svd_distr = (svd_distr_t)0; svd_distr < SVD_DISTR_NUM; svd_distr++)
		{
			tensor_t A0, A1;
			qnumber_t *qbond;

			bond_op_params_t params;
			params.tol  = 0.025;
			params.maxD = 256;
			params.renormalize = false;
			trunc_info_t ti = SplitMatrix(&A, q0, q1, svd_distr, &params, &A0, &A1, &qbond);

			if (A0.dim[0] != A.dim[0] || A0.dim[1] != D_ref || A1.dim[0] != D_ref || A1.dim[1] != A.dim[1])
			{
				// dimension error
				err = fmax(err, 1);
			}
			else
			{
				// largest entrywise bond quantum number error
				size_t j;
				for (j = 0; j < D_ref; j++) {
					if (qbond[j] != qbond_ref[j]) {
						err = fmax(err, 1);
					}
				}

				// compare product of A0 and A1 with reference (instead of A0 and A1 directly, since SVD is not unique)
				tensor_t A01;
				MultiplyTensor(&A0, &A1, 1, &A01);
				err = fmax(err, UniformDistance(2*NumTensorElements(&A01_ref), (double *)A01.data, (double *)A01_ref.data));
				DeleteTensor(&A01);
			}

			// block structure error
			err = fmax(err, MatrixBlockStructureError(&A0, q0, qbond));
			err = fmax(err, MatrixBlockStructureError(&A1, qbond, q1));

			// norm and Neumann entropy of retained singular values
			err = fmax(err, fabs(ti.nsigma  -  nsigma_ref));
			err = fmax(err, fabs(ti.entropy - entropy_ref));

			algn_free(qbond);
			DeleteTensor(&A1);
			DeleteTensor(&A0);
		}

		// clean up
		DeleteTensor(&A01_ref);
		algn_free(qbond_ref);
	}

	// QR decomposition
	{
		tensor_t Q, R;
		qnumber_t *qinterm;
		QRDecomposition(&A, q0, q1, &Q, &R, &qinterm);

		// block structure error
		err = fmax(err, MatrixBlockStructureError(&Q, q0, qinterm));
		err = fmax(err, MatrixBlockStructureError(&R, qinterm, q1));

		// recompute original matrix and compare
		tensor_t QR;
		MultiplyTensor(&Q, &R, 1, &QR);
		if (QR.dim[0] != A.dim[0] || QR.dim[1] != A.dim[1])
		{
			// dimension error
			err = fmax(err, 1);
		}
		else
		{
			err = fmax(err, UniformDistance(2*NumTensorElements(&A), (double *)QR.data, (double *)A.data));
		}
		DeleteTensor(&QR);

		// check whether 'Q' is unitary
		{
			tensor_t QH;
			const int perm[2] = { 1, 0 };
			ConjugateTransposeTensor(perm, &Q, &QH);

			tensor_t QHQ;
			MultiplyTensor(&QH, &Q, 1, &QHQ);
			DeleteTensor(&QH);

			tensor_t id;
			AllocateTensor(2, QHQ.dim, &id);
			IdentityTensor(&id);

			err = fmax(err, UniformDistance(2*NumTensorElements(&QHQ), (double *)QHQ.data, (double *)id.data));

			DeleteTensor(&id);
			DeleteTensor(&QHQ);
		}

		algn_free(qinterm);
		DeleteTensor(&R);
		DeleteTensor(&Q);
	}

	printf("Largest error: %g\n", err);

	// clean up
	algn_free(q1);
	algn_free(q0);
	DeleteTensor(&A);

	return (err < 5e-15 ? 0 : 1);
}
