#include "peps.h"
#include "complex.h"
#include <mkl.h>
#include <math.h>
#include <stdlib.h>
#include <stdio.h>


int PEPSTest2()
{
	const int L = 4;
	const size_t d = 5;
	const size_t D = 3;

	printf("PEPS scalar product test...\n");

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

	// construct matrix product state at the top
	tensor_t mps_top;
	ConstructPEPS2DMatrixProductStateOp(&psi, 0, &mps_top);
	#ifdef _DEBUG
	for (i = 0; i < mps_top.ndim; i++) {
		printf("mps_top.dim[%i] == %zu, mps_top.dnames[%i] == %s\n", i, mps_top.dim[i], i, mps_top.dnames[i].cstr);
	}
	#endif
	// interpret as a vector
	const size_t nelem = NumTensorElements(&mps_top);
	ReshapeTensor(1, &nelem, &mps_top);

	// construct matrix product state at the bottom	
	tensor_t mps_bottom;
	ConstructPEPS2DMatrixProductStateOp(&psi, L-1, &mps_bottom);
	#ifdef _DEBUG
	for (i = 0; i < mps_bottom.ndim; i++) {
		printf("mps_bottom.dim[%i] == %zu, mps_bottom.dnames[%i] == %s\n", i, mps_bottom.dim[i], i, mps_bottom.dnames[i].cstr);
	}
	#endif
	// interpret as a vector
	assert(nelem == NumTensorElements(&mps_bottom));
	ReshapeTensor(1, &nelem, &mps_bottom);

	// construct matrix product operators and multiply by MPS
	tensor_t *u = (tensor_t *)MKL_malloc((L-1) * sizeof(tensor_t), MEM_DATA_ALIGN);     // accumulate products
	CopyTensor(&mps_top, &u[0]);        // initial state is 'mps_top'
	for (y = 1; y < L-1; y++)
	{
		printf("y: %i\n", y);

		tensor_t mpo;
		ConstructPEPS2DMatrixProductStateOp(&psi, y, &mpo);

		// interpret as a matrix
		const size_t n = IntProduct(mpo.dim, mpo.ndim/2);
		const size_t dim[2] = { n, n };
		ReshapeTensor(2, dim, &mpo);

		// multiply states
		MultiplyTensor(&mpo, &u[y-1], 1, &u[y]);

		// clean up
		DeleteTensor(&mpo);
	}

	// final scalar product
	tensor_t scalar_prod;
	MultiplyTensor(&u[L-2], &mps_bottom, 1, &scalar_prod);
	assert(scalar_prod.ndim == 0);

	printf("scalar_prod.data[0]: (%g, %g)\n", scalar_prod.data[0].real, scalar_prod.data[0].imag);

	// compare with reference
	MKL_Complex16 sp_ref = { 28078.256738974185, 0 };
	double err = ComplexAbs(ComplexSubtract(scalar_prod.data[0], sp_ref)) / ComplexAbs(sp_ref);
	printf("Relative error: %g\n", err);

	// clean up
	DeleteTensor(&scalar_prod);
	for (y = 0; y < L-1; y++)
	{
		DeleteTensor(&u[y]);
	}
	MKL_free(u);
	DeleteTensor(&mps_bottom);
	DeleteTensor(&mps_top);
	DeletePEPS2D(&psi);

	return (err < 6e-15 ? 0 : 1);
}
