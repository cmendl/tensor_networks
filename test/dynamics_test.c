#include "dynamics.h"
#include "complex.h"
#include <stdint.h>
#include <memory.h>
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


int DynamicsTest()
{
	int i;
	int status;

	// maximum error
	double err = 0;

	printf("Testing dynamical simulation...\n");

	const int L = 5;                // number of lattice sites
	const size_t d = 4;             // physical dimension
	const int nsteps = 7;           // number of steps

	bond_op_params_t params;
	params.tol  = 1e-5;             // tolerance
	params.maxD = INT32_MAX;        // maximum virtual bond dimension (effectively set to infinity)
	params.renormalize = false;     // whether to renormalize singular values

	// fictitious physical quantum numbers
	const qnumber_t qd[] = { 1, 0, -2, 1 };

	// load two-site Hamiltonian operators from disk
	double **h = (double **)algn_malloc((L - 1)*sizeof(double *));
	for (i = 0; i < L - 1; i++)
	{
		h[i] = (double *)algn_malloc(d*d*d*d*sizeof(double));

		char filename[1024];
		sprintf(filename, "../test/dynamics_test_h%i.dat", i);
		status = ReadData(filename, h[i], sizeof(double), d*d*d*d);
		if (status < 0) { return status; }
	}

	// allocate and load initial MPO
	mpo_t X;
	{
		const size_t dim[2] = { d, d };
		const size_t D[7]   = { 1, 5, 6, 4, 7, 1 };
		AllocateMPO(L, dim, D, &X);

		memcpy(X.qd[0], qd, sizeof(qd));
		memcpy(X.qd[1], qd, sizeof(qd));

		// load MPO tensors from disk
		for (i = 0; i < L; i++)
		{
			char filename[1024];
			sprintf(filename, "../test/dynamics_test_A%i.dat", i);
			status = ReadData(filename, X.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&X.A[i]));
			if (status < 0) { return status; }
		}

		// load virtual bond quantum numbers from disk
		for (i = 0; i < L + 1; i++)
		{
			char filename[1024];
			sprintf(filename, "../test/dynamics_test_qA%i.dat", i);
			status = ReadData(filename, X.qD[i], sizeof(qnumber_t), D[i]); if (status < 0) { return status; }

			if (i > 0)
			{
				err = fmax(err, MPOBlockStructureError(&X.A[i-1], (const qnumber_t *restrict *)X.qd, X.qD[i-1], X.qD[i]));
			}
		}
	}

	// evolution using Strang splitting
	{
		// time step
		const MKL_Complex16 dt = { 0.2, 0.125 };

		// compute evolution dynamics data required for Strang splitting evolution
		dynamics_data_t dyn;
		ComputeDynamicsDataStrang(L, dt, d*d, (const double **)h, &dyn);

		// effective tolerance (truncation weight)
		double *tol_eff = (double *)algn_calloc(nsteps*(L - 1), sizeof(double));

		mpo_t Y;
		CopyMPO(&X, &Y);
		EvolveMPOStrang(&dyn, nsteps, &params, false, &Y, tol_eff);

		// merge tensors to compare with reference
		tensor_t Am;
		MergeMPOFull(&Y, &Am);

		// reference tensor
		tensor_t Am_ref;
		{
			const size_t dim_ref[2] = { 1024, 1024 };
			AllocateTensor(2, dim_ref, &Am_ref);

			// non-zero entries of reference tensor
			const size_t nnz = 108532;
			MKL_Complex16 *val = (MKL_Complex16 *)algn_malloc(nnz*sizeof(MKL_Complex16));
			uint64_t      *ind =      (uint64_t *)algn_malloc(nnz*sizeof(uint64_t));
			status = ReadData("../test/dynamics_test_A_strang5i8_m_val.dat", val, sizeof(MKL_Complex16), nnz); if (status < 0) { return status; }
			status = ReadData("../test/dynamics_test_A_strang5i8_m_ind.dat", ind, sizeof(uint64_t),      nnz); if (status < 0) { return status; }
			size_t j;
			for (j = 0; j < nnz; j++)
			{
				Am_ref.data[ind[j]] = val[j];
			}
			algn_free(ind);
			algn_free(val);
		}

		// check dimensions
		if (Am.ndim != 2 || Am.dim[0] != Am_ref.dim[0] || Am.dim[1] != Am_ref.dim[1])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise relative error
			double max_abs = 0;
			size_t j;
			for (j = 0; j < NumTensorElements(&Am_ref); j++) {
				max_abs = fmax(max_abs, fabs(Am_ref.data[j].real));
				max_abs = fmax(max_abs, fabs(Am_ref.data[j].imag));
			}
			err = fmax(err, UniformDistance(2*NumTensorElements(&Am_ref), (double *)Am.data, (double *)Am_ref.data) / max_abs);
		}

		DeleteTensor(&Am_ref);
		DeleteTensor(&Am);
		DeleteMPO(&Y);
		algn_free(tol_eff);
		DeleteDynamicsData(&dyn);
	}

	// Liouville evolution using Strang splitting
	{
		// time step
		const MKL_Complex16 dt = { 1.0/6, 1.0/7 };

		// compute evolution dynamics data required for Strang splitting evolution
		dynamics_data_t dyn;
		ComputeDynamicsDataStrang(L, dt, d*d, (const double **)h, &dyn);

		// effective tolerance (truncation weight)
		double *tol_eff = (double *)algn_calloc(nsteps*(L - 1), sizeof(double));

		mpo_t Y;
		CopyMPO(&X, &Y);
		EvolveLiouvilleMPOStrang(&dyn, nsteps, &params, false, &Y, tol_eff);

		// merge tensors to compare with reference
		tensor_t Am;
		MergeMPOFull(&Y, &Am);

		// reference tensor
		tensor_t Am_ref;
		{
			const size_t dim_ref[2] = { 1024, 1024 };
			AllocateTensor(2, dim_ref, &Am_ref);

			// non-zero entries of reference tensor
			const size_t nnz = 108532;
			MKL_Complex16 *val = (MKL_Complex16 *)algn_malloc(nnz*sizeof(MKL_Complex16));
			uint64_t      *ind =      (uint64_t *)algn_malloc(nnz*sizeof(uint64_t));
			status = ReadData("../test/dynamics_test_A_Lstrang6i7_m_val.dat", val, sizeof(MKL_Complex16), nnz); if (status < 0) { return status; }
			status = ReadData("../test/dynamics_test_A_Lstrang6i7_m_ind.dat", ind, sizeof(uint64_t),      nnz); if (status < 0) { return status; }
			size_t j;
			for (j = 0; j < nnz; j++)
			{
				Am_ref.data[ind[j]] = val[j];
			}
			algn_free(ind);
			algn_free(val);
		}

		// check dimensions
		if (Am.ndim != 2 || Am.dim[0] != Am_ref.dim[0] || Am.dim[1] != Am_ref.dim[1])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise relative error
			double max_abs = 0;
			size_t j;
			for (j = 0; j < NumTensorElements(&Am_ref); j++) {
				max_abs = fmax(max_abs, fabs(Am_ref.data[j].real));
				max_abs = fmax(max_abs, fabs(Am_ref.data[j].imag));
			}
			err = fmax(err, UniformDistance(2*NumTensorElements(&Am_ref), (double *)Am.data, (double *)Am_ref.data) / max_abs);
		}

		DeleteTensor(&Am_ref);
		DeleteTensor(&Am);
		DeleteMPO(&Y);
		algn_free(tol_eff);
		DeleteDynamicsData(&dyn);
	}

	/* skip test since currently Mathematica implementation differs
	// evolution using PRK splitting
	{
		// time step
		const MKL_Complex16 dt = { 1.0/11, 1.0/9 };

		// compute evolution dynamics data required for PRK splitting evolution
		dynamics_data_t dyn;
		ComputeDynamicsDataPRK(L, dt, d*d, (const double **)h, &dyn);

		// effective tolerance (truncation weight)
		double *tol_eff = (double *)algn_calloc(nsteps*(L - 1), sizeof(double));

		mpo_t Y;
		CopyMPO(&X, &Y);
		EvolveMPOPRK(&dyn, nsteps, true, &params, &Y, tol_eff);

		// merge tensors to compare with reference
		tensor_t Am;
		MergeMPOFull(&Y, &Am);

		// reference tensor
		tensor_t Am_ref;
		{
			const size_t dim_ref[2] = { 1024, 1024 };
			AllocateTensor(2, dim_ref, &Am_ref);

			// non-zero entries of reference tensor
			const size_t nnz = 108532;
			MKL_Complex16 *val = (MKL_Complex16 *)algn_malloc(nnz*sizeof(MKL_Complex16));
			uint64_t      *ind =      (uint64_t *)algn_malloc(nnz*sizeof(uint64_t));
			status = ReadData("../test/dynamics_test_A_prk11i9_m_val.dat", val, sizeof(MKL_Complex16), nnz); if (status < 0) { return status; }
			status = ReadData("../test/dynamics_test_A_prk11i9_m_ind.dat", ind, sizeof(uint64_t),      nnz); if (status < 0) { return status; }
			size_t j;
			for (j = 0; j < nnz; j++)
			{
				Am_ref.data[ind[j]] = val[j];
			}
			algn_free(ind);
			algn_free(val);
		}

		// check dimensions
		if (Am.ndim != 2 || Am.dim[0] != Am_ref.dim[0] || Am.dim[1] != Am_ref.dim[1])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise relative error
			double max_abs = 0;
			size_t j;
			for (j = 0; j < NumTensorElements(&Am_ref); j++) {
				max_abs = fmax(max_abs, fabs(Am_ref.data[j].real));
				max_abs = fmax(max_abs, fabs(Am_ref.data[j].imag));
			}
			err = fmax(err, UniformDistance(2*NumTensorElements(&Am_ref), (double *)Am.data, (double *)Am_ref.data) / max_abs);
		}

		DeleteTensor(&Am_ref);
		DeleteTensor(&Am);
		DeleteMPO(&Y);
		algn_free(tol_eff);
		DeleteDynamicsData(&dyn);
	}

	// Liouville evolution using PRK splitting
	{
		// time step
		const MKL_Complex16 dt = { -1.0/3, 1.0/5 };

		// compute evolution dynamics data required for PRK splitting evolution
		dynamics_data_t dyn;
		ComputeDynamicsDataPRK(L, dt, d*d, (const double **)h, &dyn);

		// effective tolerance (truncation weight)
		double *tol_eff = (double *)algn_calloc(nsteps*(L - 1), sizeof(double));

		mpo_t Y;
		CopyMPO(&X, &Y);
		EvolveLiouvilleMPOPRK(&dyn, nsteps, true, &params, &Y, tol_eff);

		// merge tensors to compare with reference
		tensor_t Am;
		MergeMPOFull(&Y, &Am);

		// reference tensor
		tensor_t Am_ref;
		{
			const size_t dim_ref[2] = { 1024, 1024 };
			AllocateTensor(2, dim_ref, &Am_ref);

			// non-zero entries of reference tensor
			const size_t nnz = 109036;
			MKL_Complex16 *val = (MKL_Complex16 *)algn_malloc(nnz*sizeof(MKL_Complex16));
			uint64_t      *ind =      (uint64_t *)algn_malloc(nnz*sizeof(uint64_t));
			status = ReadData("../test/dynamics_test_A_Lprk3i5_m_val.dat", val, sizeof(MKL_Complex16), nnz); if (status < 0) { return status; }
			status = ReadData("../test/dynamics_test_A_Lprk3i5_m_ind.dat", ind, sizeof(uint64_t),      nnz); if (status < 0) { return status; }
			size_t j;
			for (j = 0; j < nnz; j++)
			{
				Am_ref.data[ind[j]] = val[j];
			}
			algn_free(ind);
			algn_free(val);
		}

		// check dimensions
		if (Am.ndim != 2 || Am.dim[0] != Am_ref.dim[0] || Am.dim[1] != Am_ref.dim[1])
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise relative error
			double max_abs = 0;
			size_t j;
			for (j = 0; j < NumTensorElements(&Am_ref); j++) {
				max_abs = fmax(max_abs, fabs(Am_ref.data[j].real));
				max_abs = fmax(max_abs, fabs(Am_ref.data[j].imag));
			}
			err = fmax(err, UniformDistance(2*NumTensorElements(&Am_ref), (double *)Am.data, (double *)Am_ref.data) / max_abs);
		}

		DeleteTensor(&Am_ref);
		DeleteTensor(&Am);
		DeleteMPO(&Y);
		algn_free(tol_eff);
		DeleteDynamicsData(&dyn);
	}*/

	printf("Largest error: %g\n", err);

	// clean up
	DeleteMPO(&X);
	for (i = 0; i < L - 1; i++)
	{
		algn_free(h[i]);
	}
	algn_free(h);

	return (err < 5e-13 ? 0 : 1);
}
