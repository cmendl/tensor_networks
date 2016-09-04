#include "dynamics.h"
#include <mkl.h>
#include <stdint.h>
#include <stdio.h>


int DynamicsTest()
{
	int i;
	int status;

	// maximum error
	double err = 0;

	printf("Testing dynamical simulation...\n");

	const int L = 6;                    // number of lattice sites
	const size_t d = 3;                 // physical dimension
	const int nsteps = 7;               // number of steps
	const double tol = 1e-5;            // tolerance
	const size_t maxD = INT32_MAX;      // maximum virtual bond dimension (effectively set to infinity)

	// load two-site Hamiltonian operators from disk
	double **h = MKL_malloc((L - 1)*sizeof(double *), MEM_DATA_ALIGN);
	for (i = 0; i < L - 1; i++)
	{
		h[i] = MKL_malloc(d*d*d*d*sizeof(double), MEM_DATA_ALIGN);

		char filename[1024];
		sprintf(filename, "../test/dynamics_test_h%i.dat", i);
		status = ReadData(filename, h[i], sizeof(double), d*d*d*d);
		if (status < 0) { return status; }
	}

	// allocate and load initial MPO
	mpo_t X;
	const size_t dim[2] = { d, d };
	const size_t D[7]   = { 1, 5, 6, 4, 7, 4, 1 };
	AllocateMPO(6, dim, D, &X);

	// load MPO tensors from disk
	for (i = 0; i < L; i++)
	{
		char filename[1024];
		sprintf(filename, "../test/dynamics_test_A%i.dat", i);
		status = ReadData(filename, X.A[i].data, sizeof(MKL_Complex16), NumTensorElements(&X.A[i]));
		if (status < 0) { return status; }
	}

	// evolution using Strang splitting
	{
		// time step
		const MKL_Complex16 dt = { 0.2, 0.125 };

		// compute evolution dynamics data required for Strang splitting evolution
		dynamics_data_t dyn;
		ComputeDynamicsDataStrang(L, dt, d*d, (const double **)h, &dyn);

		// effective tolerance (truncation weight)
		double *tol_eff = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);

		mpo_t Y;
		CopyMPO(&X, &Y);
		EvolveMPOStrang(&dyn, nsteps, tol, maxD, false, &Y, tol_eff);

		// merge tensors to compare with reference
		tensor_t Am;
		MPOMergeFull(&Y, &Am);

		// first few entries of reference tensor
		const int n = 1764;
		MKL_Complex16 *Am_ref = MKL_malloc(n*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
		status = ReadData("../test/dynamics_test_A_strang5i8_m.dat", Am_ref, sizeof(MKL_Complex16), n);
		if (status < 0) { return status; }

		// check dimensions
		if (Am.ndim != 2 || Am.dim[0] != 729 || Am.dim[1] != 729)
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise relative error
			double max_abs = 0;
			for (i = 0; i < n; i++) {
				max_abs = fmax(max_abs, fabs(Am_ref[i].real));
				max_abs = fmax(max_abs, fabs(Am_ref[i].imag));
			}
			err = fmax(err, UniformDistance(2*n, (double *)Am.data, (double *)Am_ref) / max_abs);
		}

		MKL_free(Am_ref);
		DeleteTensor(&Am);
		DeleteMPO(&Y);
		MKL_free(tol_eff);
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
		double *tol_eff = (double *)MKL_calloc(nsteps*(L - 1), sizeof(double), MEM_DATA_ALIGN);

		mpo_t Y;
		CopyMPO(&X, &Y);
		EvolveLiouvilleMPOStrang(&dyn, nsteps, tol, maxD, false, &Y, tol_eff);

		// merge tensors to compare with reference
		tensor_t Am;
		MPOMergeFull(&Y, &Am);

		// first few entries of reference tensor
		const int n = 1764;
		MKL_Complex16 *Am_ref = MKL_malloc(n*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
		status = ReadData("../test/dynamics_test_A_Lstrang6i7_m.dat", Am_ref, sizeof(MKL_Complex16), n);
		if (status < 0) { return status; }

		// check dimensions
		if (Am.ndim != 2 || Am.dim[0] != 729 || Am.dim[1] != 729)
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise relative error
			double max_abs = 0;
			for (i = 0; i < n; i++) {
				max_abs = fmax(max_abs, fabs(Am_ref[i].real));
				max_abs = fmax(max_abs, fabs(Am_ref[i].imag));
			}
			err = fmax(err, UniformDistance(2*n, (double *)Am.data, (double *)Am_ref) / max_abs);
		}

		MKL_free(Am_ref);
		DeleteTensor(&Am);
		DeleteMPO(&Y);
		MKL_free(tol_eff);
		DeleteDynamicsData(&dyn);
	}

	/* skip test since currently Mathematica implementation differs
	// evolution using SRKNb6 splitting
	{
		// time step
		const MKL_Complex16 dt = { 1.0/11, 1.0/9 };

		// compute evolution dynamics data required for Strang splitting evolution
		dynamics_data_t dyn;
		ComputeDynamicsDataSRKNb6(L, dt, d*d, (const double **)h, &dyn);

		mpo_t Y;
		CopyMPO(&X, &Y);
		EvolveMPOSRKNb6(&dyn, nsteps, true, tol, maxD, &Y);

		// merge tensors to compare with reference
		tensor_t Am;
		MPOMergeFull(&Y, &Am);

		// first few entries of reference tensor
		const int n = 1764;
		MKL_Complex16 *Am_ref = MKL_malloc(n*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
		status = ReadData("../test/dynamics_test_A_srkn11i9_m.dat", Am_ref, sizeof(MKL_Complex16), n);
		if (status < 0) { return status; }

		// check dimensions
		if (Am.ndim != 2 || Am.dim[0] != 729 || Am.dim[1] != 729)
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise relative error
			double max_abs = 0;
			for (i = 0; i < n; i++) {
				max_abs = fmax(max_abs, fabs(Am_ref[i].real));
				max_abs = fmax(max_abs, fabs(Am_ref[i].imag));
			}
			err = fmax(err, UniformDistance(2*n, (double *)Am.data, (double *)Am_ref) / max_abs);
		}

		MKL_free(Am_ref);
		DeleteTensor(&Am);
		DeleteMPO(&Y);
		DeleteDynamicsData(&dyn);
	}

	// Liouville evolution using SRKNb6 splitting
	{
		// time step
		const MKL_Complex16 dt = { -1.0/3, 1.0/5 };

		// compute evolution dynamics data required for Strang splitting evolution
		dynamics_data_t dyn;
		ComputeDynamicsDataSRKNb6(L, dt, d*d, (const double **)h, &dyn);

		mpo_t Y;
		CopyMPO(&X, &Y);
		EvolveLiouvilleMPOSRKNb6(&dyn, nsteps, true, tol, maxD, &Y);

		// merge tensors to compare with reference
		tensor_t Am;
		MPOMergeFull(&Y, &Am);

		// first few entries of reference tensor
		const int n = 1764;
		MKL_Complex16 *Am_ref = MKL_malloc(n*sizeof(MKL_Complex16), MEM_DATA_ALIGN);
		status = ReadData("../test/dynamics_test_A_Lsrkn3i5_m.dat", Am_ref, sizeof(MKL_Complex16), n);
		if (status < 0) { return status; }

		// check dimensions
		if (Am.ndim != 2 || Am.dim[0] != 729 || Am.dim[1] != 729)
		{
			err = fmax(err, 1);
		}
		else
		{
			// largest entrywise relative error
			double max_abs = 0;
			for (i = 0; i < n; i++) {
				max_abs = fmax(max_abs, fabs(Am_ref[i].real));
				max_abs = fmax(max_abs, fabs(Am_ref[i].imag));
			}
			err = fmax(err, UniformDistance(2*n, (double *)Am.data, (double *)Am_ref) / max_abs);
		}

		MKL_free(Am_ref);
		DeleteTensor(&Am);
		DeleteMPO(&Y);
		DeleteDynamicsData(&dyn);
	}*/

	printf("Largest error: %g\n", err);

	// clean up
	DeleteMPO(&X);
	for (i = 0; i < L - 1; i++)
	{
		MKL_free(h[i]);
	}
	MKL_free(h);

	return (err < 2e-13 ? 0 : 1);
}
