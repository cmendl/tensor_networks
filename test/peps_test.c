#include "peps.h"
#include "complex.h"
#include <math.h>
#include <stdlib.h>
#include <stdio.h>


int PEPSTest()
{
	const int L = 4;
	const size_t d = 5;
	const size_t D = 3;

	printf("Testing PEPS operations...\n");

	int i;
	int x, y;
	size_t j;

	// create state 'psi'
	peps2D_t psi;
	AllocatePEPS2D(L, d, D, &psi);
	for (y = 0; y < L; y++)
	{
		for (x = 0; x < L; x++)
		{
			const tensor_t *A = &psi.A[x + L*y];
			const size_t nelem = NumTensorElements(A);
			for (j = 0; j < nelem; j++) {
				A->data[j].real = ((j % 2) - 0.5 + 1.0 / sqrt(1 + x*x + y*y)) / 16;
				A->data[j].imag = (((j+1) % 5) - 2.5 + atan(x - y - 1)) / 16;
			}
		}
	}

	double err = 0;

	// compare A tensor construction
	{
		const tensor_t *A = &psi.A[0 + 1*L];

		tensor_t Aref;
		AllocateTensor(A->ndim, A->dim, &Aref);
		const size_t nelem = NumTensorElements(&Aref);
		// read from disk
		int hr = ReadData("../test/peps_test_A01_ref.dat", Aref.data, sizeof(double), 2*nelem);
		if (hr < 0) {
			return hr;
		}

		// maximum error
		double errA = 0;
		for (j = 0; j < nelem; j++) {
			errA = fmax(errA, ComplexAbs(ComplexSubtract(A->data[j], Aref.data[j])));
		}
		printf("'A' tensor construction error: %g\n", errA);

		// clean up
		DeleteTensor(&Aref);

		err = fmax(err, errA);
	}

	// test E tensor construction
	{
		tensor_t E;
		ConstructETensor(&psi.A[0 + 1*L], &E);

		tensor_t Eref;
		AllocateTensor(E.ndim, E.dim, &Eref);
		const size_t nelem = NumTensorElements(&Eref);
		// read from disk
		int hr = ReadData("../test/peps_test_E01_ref.dat", Eref.data, sizeof(double), 2*nelem);
		if (hr < 0) {
			return hr;
		}

		// maximum error
		double errE = 0;
		for (j = 0; j < nelem; j++) {
			errE = fmax(errE, ComplexAbs(ComplexSubtract(E.data[j], Eref.data[j])));
		}
		printf("'E' tensor construction error: %g\n", errE);

		// clean up
		DeleteTensor(&Eref);
		DeleteTensor(&E);

		err = fmax(err, errE);
	}

	// test matrix product state construction at the top
	{
		printf("\nMPS top:\n");

		tensor_t mps_top;
		ConstructPEPS2DMatrixProductStateOp(&psi, 0, &mps_top);
		#ifdef _DEBUG
		for (i = 0; i < mps_top.ndim; i++) {
			printf("mps_top.dim[%i] == %zu, mps_top.dnames[%i] == %s\n", i, mps_top.dim[i], i, mps_top.dnames[i].cstr);
		}
		#endif

		// example output
		printf("mps_top.data[0]: (%g, %g)\n", mps_top.data[0].real, mps_top.data[0].imag);
		printf("mps_top.data[1]: (%g, %g)\n", mps_top.data[1].real, mps_top.data[1].imag);

		tensor_t mpo_top_ref;
		AllocateTensor(mps_top.ndim, mps_top.dim, &mpo_top_ref);
		const size_t nelem = NumTensorElements(&mpo_top_ref);
		// read from disk
		int hr = ReadData("../test/peps_test_mpstop_ref.dat", mpo_top_ref.data, sizeof(double), 2*nelem);
		if (hr < 0) {
			return hr;
		}

		// maximum relative error
		double errT = 0;
		for (j = 0; j < nelem; j++) {
			errT = fmax(errT, ComplexAbs(ComplexSubtract(mps_top.data[j], mpo_top_ref.data[j])) / ComplexAbs(mpo_top_ref.data[j]));
		}
		printf("MPS top maximum relative error: %g\n", errT);

		// clean up
		DeleteTensor(&mpo_top_ref);
		DeleteTensor(&mps_top);

		err = fmax(err, errT);
	}

	// test matrix product state construction at the bottom
	{
		printf("\nMPS bottom:\n");

		tensor_t mps_bottom;
		ConstructPEPS2DMatrixProductStateOp(&psi, psi.L-1, &mps_bottom);
		#ifdef _DEBUG
		for (i = 0; i < mps_bottom.ndim; i++) {
			printf("mps_bottom.dim[%i] == %zu, mps_bottom.dnames[%i] == %s\n", i, mps_bottom.dim[i], i, mps_bottom.dnames[i].cstr);
		}
		#endif

		// example output
		printf("mps_bottom.data[0]: (%g, %g)\n", mps_bottom.data[0].real, mps_bottom.data[0].imag);
		printf("mps_bottom.data[1]: (%g, %g)\n", mps_bottom.data[1].real, mps_bottom.data[1].imag);

		tensor_t mpo_bottom_ref;
		AllocateTensor(mps_bottom.ndim, mps_bottom.dim, &mpo_bottom_ref);
		const size_t nelem = NumTensorElements(&mpo_bottom_ref);
		// read from disk
		int hr = ReadData("../test/peps_test_mpsbottom_ref.dat", mpo_bottom_ref.data, sizeof(double), 2*nelem);
		if (hr < 0) {
			return hr;
		}

		// maximum relative error
		double errB = 0;
		for (j = 0; j < nelem; j++) {
			errB = fmax(errB, ComplexAbs(ComplexSubtract(mps_bottom.data[j], mpo_bottom_ref.data[j])) / ComplexAbs(mpo_bottom_ref.data[j]));
		}
		printf("MPS bottom maximum relative error: %g\n", errB);

		// clean up
		DeleteTensor(&mpo_bottom_ref);
		DeleteTensor(&mps_bottom);

		err = fmax(err, errB);
	}

	// test matrix product operator construction
	{
		printf("\nMPO:\n");

		tensor_t mpo;
		ConstructPEPS2DMatrixProductStateOp(&psi, 1, &mpo);
		#ifdef _DEBUG
		for (i = 0; i < mpo.ndim; i++) {
			printf("mpo.dim[%i] == %zu, mpo.dnames[%i] == %s\n", i, mpo.dim[i], i, mpo.dnames[i].cstr);
		}
		#endif

		// example output
		printf("mpo.data[0]: (%g, %g)\n", mpo.data[0].real, mpo.data[0].imag);
		printf("mpo.data[1]: (%g, %g)\n", mpo.data[1].real, mpo.data[1].imag);

		tensor_t mpo_sub_ref;
		AllocateTensor(3, mpo.dim, &mpo_sub_ref);
		const size_t nelem = NumTensorElements(&mpo_sub_ref);
		// read from disk
		int hr = ReadData("../test/peps_test_mpo_ref.dat", mpo_sub_ref.data, sizeof(double), 2*nelem);
		if (hr < 0) {
			return hr;
		}

		// maximum relative error
		const size_t offset = mpo.dim[0]*mpo.dim[1]*mpo.dim[2]*(2 + mpo.dim[3]*(3 + mpo.dim[4]*(4 + mpo.dim[5]*(5 + mpo.dim[6]*6)))) ;
		double errO = 0;
		for (j = 0; j < nelem; j++) {
			errO = fmax(errO, ComplexAbs(ComplexSubtract(mpo.data[offset + j], mpo_sub_ref.data[j])) / ComplexAbs(mpo_sub_ref.data[j]));
		}
		printf("MPO maximum relative error: %g\n", errO);

		// clean up
		DeleteTensor(&mpo_sub_ref);
		DeleteTensor(&mpo);

		err = fmax(err, errO);
	}

	// clean up
	DeletePEPS2D(&psi);

	return (err < 1e-15 ? 0 : 1);
}
