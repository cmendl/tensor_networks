#include "mps.h"
#include "complex.h"
#include <mkl.h>
#include <stdlib.h>
#include <memory.h>
#include <math.h>
#include <stdio.h>


int MPSTest2()
{
	int i, m;

	const int L = 10;
	const size_t d = 2;
	const size_t D[] = { 1, 5, 5, 5, 5, 5, 5, 5, 4, 2, 1 };

	printf("Testing MPS energy minimization...\n");

	// allocate MPS state
	mps_t mps;
	AllocateMPS(L, d, D, &mps);
	// load initial entries from disk
	for (i = 0; i < L; i++)
	{
		tensor_t t;
		const size_t tdim[3] = { mps.A[i].dim[0], mps.A[i].dim[2], mps.A[i].dim[1] };
		AllocateTensor(3, tdim, &t);
		char path[1024];
		sprintf(path, "../test/mps_test2_A%i.dat", i);
		int status = ReadData(path, t.data, sizeof(MKL_Complex16), NumTensorElements(&t));
		if (status < 0) { return status; }
		tensor_t s;
		const int perm[3] = { 0, 2, 1 };
		TransposeTensor(perm, &t, &s);
		assert(s.dim[0] == mps.A[i].dim[0] && s.dim[1] == mps.A[i].dim[1] && s.dim[2] == mps.A[i].dim[2]);
		memcpy(mps.A[i].data, s.data, NumTensorElements(&s) * sizeof(MKL_Complex16));
		DeleteTensor(&s);
		DeleteTensor(&t);
	}

	// Pauli matrices
	tensor_t sigma_x, sigma_y, sigma_z;
	const size_t dimP[2] = { 2, 2 };
	AllocateTensor(2, dimP, &sigma_x);
	AllocateTensor(2, dimP, &sigma_y);
	AllocateTensor(2, dimP, &sigma_z);
	sigma_x.data[1].real = 1;	sigma_y.data[1].imag =  1;	sigma_z.data[0].real =  1;
	sigma_x.data[2].real = 1;	sigma_y.data[2].imag = -1;	sigma_z.data[3].real = -1;

	// set 'h' matrices according to Heisenberg model
	const int M = 3*(L-1);
	tensor_t *h = MKL_calloc(M * L, sizeof(tensor_t), MEM_DATA_ALIGN);
	for (m = 0; m < M; m++)
	{
		for (i = 0; i < L; i++)
		{
			const size_t hdim[2] = { d, d };
			AllocateTensor(2, hdim, &h[i + m*L]);
			// default value is identity matrix
			IdentityTensor(&h[i + m*L]);
		}
	}
	for (i = 0; i < L-1; i++)
	{
		memcpy(h[i   + (3*i  )*L].data, sigma_x.data, 4*sizeof(MKL_Complex16)); // sigma_x at site 'i'
		memcpy(h[i+1 + (3*i  )*L].data, sigma_x.data, 4*sizeof(MKL_Complex16)); // sigma_x at site 'i+1'

		memcpy(h[i   + (3*i+1)*L].data, sigma_y.data, 4*sizeof(MKL_Complex16)); // sigma_y at site 'i'
		memcpy(h[i+1 + (3*i+1)*L].data, sigma_y.data, 4*sizeof(MKL_Complex16)); // sigma_y at site 'i+1'

		memcpy(h[i   + (3*i+2)*L].data, sigma_z.data, 4*sizeof(MKL_Complex16)); // sigma_z at site 'i'
		memcpy(h[i+1 + (3*i+2)*L].data, sigma_z.data, 4*sizeof(MKL_Complex16)); // sigma_z at site 'i+1'
	}

	// perform energy minimization
	const double prec = 1e-5;
	const double E0 = MinimizeMPSEnergy(M, h, prec, &mps);

	// reference energy
	const double E0ref = -17.012936717281619;

	printf("Optimized ground state energy: %g, distance to reference value: %g\n", E0, E0 - E0ref);

	double err = fabs(E0 - E0ref);

	// left and right partial contractions
	tensor_t *cntrL = MKL_calloc(mps.L, sizeof(tensor_t), MEM_DATA_ALIGN);
	tensor_t *cntrR = MKL_calloc(mps.L, sizeof(tensor_t), MEM_DATA_ALIGN);
	CalculateMPSContraction(&mps, cntrL, cntrR);

	// explicitly compute Hamiltonian average, to compare with optimized energy
	MKL_Complex16 avrE = ComplexAdd(ComplexAdd(
		MPSAverageTwoSiteOp(&mps, cntrL, cntrR, &sigma_x, &sigma_x),
		MPSAverageTwoSiteOp(&mps, cntrL, cntrR, &sigma_y, &sigma_y)),
		MPSAverageTwoSiteOp(&mps, cntrL, cntrR, &sigma_z, &sigma_z));
	err = fmax(err, fabs(avrE.real - E0) + fabs(avrE.imag));

	printf("Largest error: %g\n", err);

	// clean up
	for (i = 0; i < mps.L; i++)
	{
		DeleteTensor(&cntrL[i]);
		DeleteTensor(&cntrR[i]);
	}
	MKL_free(cntrR);
	MKL_free(cntrL);
	for (i = 0; i < M * L; i++)
	{
		DeleteTensor(&h[i]);
	}
	MKL_free(h);
	DeleteTensor(&sigma_z);
	DeleteTensor(&sigma_y);
	DeleteTensor(&sigma_x);
	DeleteMPS(&mps);

	return (err < 4e-14 ? 0 : 1);
}
