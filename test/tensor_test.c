#include "tensor.h"
#include "complex.h"
#include <math.h>
#include <memory.h>
#include <stdio.h>


static double TensorDifference(const tensor_t *s, const tensor_t *t)
{
	double diff = 0;

	// compare number of levels
	diff = fmax(diff, (double)abs(s->ndim - t->ndim));
	if (diff > 0) { return diff; }

	// compare dimensions
	int i;
	for (i = 0; i < s->ndim; i++)
	{
		diff = fmax(diff, (double)abs((int)(s->dim[i] - t->dim[i])));
	}
	if (diff > 0) { return diff; }

	// compare entries
	const size_t nelem = NumTensorElements(s);
	size_t j;
	for (j = 0; j < nelem; j++)
	{
		diff = fmax(diff, ComplexAbs(ComplexSubtract(s->data[j], t->data[j])));
	}

	return diff;
}


int TensorTest()
{
	int status;

	// accumulated error
	double err = 0;

	printf("Testing operations on tensors...\n");

	// create tensor 't'
	tensor_t t;
	const size_t dim[4] = { 2, 3, 4, 5 };
	AllocateTensor(4, dim,  &t);

	// read values from disk
	status = ReadData("../test/tensor_test_t1.dat", t.data, sizeof(MKL_Complex16), NumTensorElements(&t));
	if (status < 0) { return status; }

	// test generalized transpose
	{
		const int perm[4] = { 1, 3, 2, 0 };

		tensor_t r;
		TransposeTensor(perm, &t, &r);

		// reference tensor for checking
		const size_t refdim[4] = { 5, 2, 4, 3 };
		tensor_t r_ref;
		AllocateTensor(4, refdim, &r_ref);
		status = ReadData("../test/tensor_test_t1T.dat", r_ref.data, sizeof(MKL_Complex16), NumTensorElements(&r_ref));
		if (status < 0) { return status; }

		// largest error
		err = fmax(err, TensorDifference(&r, &r_ref));

		// clean up
		DeleteTensor(&r_ref);
		DeleteTensor(&r);
	}

	// test general multiplication
	{
		// create another tensor 's'
		tensor_t s;
		const size_t sdim[4] = { 4, 5, 7, 6 };
		AllocateTensor(4, sdim, &s);
		status = ReadData("../test/tensor_test_t2.dat", s.data, sizeof(MKL_Complex16), NumTensorElements(&s));
		if (status < 0) { return status; }

		// multiply tensors and store result in 'r'
		tensor_t r;
		MultiplyTensor(&t, &s, 2, &r);

		// reference tensor for checking
		const size_t refdim[4] = { 2, 3, 7, 6 };
		tensor_t r_ref;
		AllocateTensor(4, refdim, &r_ref);
		status = ReadData("../test/tensor_test_t12prod.dat", r_ref.data, sizeof(MKL_Complex16), NumTensorElements(&r_ref));
		if (status < 0) { return status; }

		// largest error
		err = fmax(err, TensorDifference(&r, &r_ref));

		// clean up
		DeleteTensor(&r_ref);
		DeleteTensor(&r);
		DeleteTensor(&s);
	}

	// test matrix-vector multiplication
	{
		// create another tensor 's'
		tensor_t s;
		const size_t sdim[1] = { 5 };
		AllocateTensor(1, sdim, &s);
		status = ReadData("../test/tensor_test_t3.dat", s.data, sizeof(MKL_Complex16), NumTensorElements(&s));
		if (status < 0) { return status; }

		// multiply tensors and store result in 'r'
		tensor_t r;
		MultiplyTensor(&t, &s, 1, &r);

		// reference tensor for checking
		const size_t refdim[3] = { 2, 3, 4 };
		tensor_t r_ref;
		AllocateTensor(3, refdim, &r_ref);
		status = ReadData("../test/tensor_test_t13prod.dat", r_ref.data, sizeof(MKL_Complex16), NumTensorElements(&r_ref));
		if (status < 0) { return status; }

		// largest error
		err = fmax(err, TensorDifference(&r, &r_ref));

		// clean up
		DeleteTensor(&r_ref);
		DeleteTensor(&r);
		DeleteTensor(&s);
	}

	// test vector-matrix multiplication
	{
		// create another tensor 's'
		tensor_t s;
		const size_t sdim[1] = { 2 };
		AllocateTensor(1, sdim, &s);
		status = ReadData("../test/tensor_test_t4.dat", s.data, sizeof(MKL_Complex16), NumTensorElements(&s));
		if (status < 0) { return status; }

		// multiply tensors and store result in 'r'
		tensor_t r;
		MultiplyTensor(&s, &t, 1, &r);

		// reference tensor for checking
		const size_t refdim[3] = { 3, 4, 5 };
		tensor_t r_ref;
		AllocateTensor(3, refdim, &r_ref);
		status = ReadData("../test/tensor_test_t41prod.dat", r_ref.data, sizeof(MKL_Complex16), NumTensorElements(&r_ref));
		if (status < 0) { return status; }

		// largest error
		err = fmax(err, TensorDifference(&r, &r_ref));

		// clean up
		DeleteTensor(&r_ref);
		DeleteTensor(&r);
		DeleteTensor(&s);
	}

	// test vector-vector multiplication (i.e., inner product)
	{
		const size_t nelem = NumTensorElements(&t);

		// interpret as vector
		tensor_t t1;
		CopyTensor(&t, &t1);
		ReshapeTensor(1, &nelem, &t1);

		// create another tensor 's'
		tensor_t s;
		AllocateTensor(1, &nelem, &s);
		status = ReadData("../test/tensor_test_t5.dat", s.data, sizeof(MKL_Complex16), NumTensorElements(&s));
		if (status < 0) { return status; }

		// multiply tensors and store result in 'r'
		tensor_t r;
		MultiplyTensor(&t1, &s, 1, &r);

		// reference tensor for checking
		tensor_t r_ref;
		AllocateTensor(0, NULL, &r_ref);
		r_ref.data[0].real = -5.730605734864588;
		r_ref.data[0].imag =  2.495227138171611;

		// largest error
		err = fmax(err, TensorDifference(&r, &r_ref));

		// clean up
		DeleteTensor(&r_ref);
		DeleteTensor(&r);
		DeleteTensor(&s);
		DeleteTensor(&t1);
	}

	// test Kronecker product
	{
		// create another tensor 's'
		tensor_t s;
		const size_t sdim[4] = { 6, 5, 7, 2 };
		AllocateTensor(4, sdim, &s);
		status = ReadData("../test/tensor_test_t6.dat", s.data, sizeof(MKL_Complex16), NumTensorElements(&s));
		if (status < 0) { return status; }

		tensor_t r;
		TensorKroneckerProduct(&t, &s, &r);

		// load reference values from disk
		tensor_t r_ref;
		const size_t refdim[4] = { 12, 15, 28, 10 };
		AllocateTensor(4, refdim, &r_ref);
		status = ReadData("../test/tensor_test_t16prod.dat", r_ref.data, sizeof(MKL_Complex16), NumTensorElements(&r_ref));
		if (status < 0) { return status; }

		// largest error
		err = fmax(err, TensorDifference(&r, &r_ref));

		// clean up
		DeleteTensor(&r_ref);
		DeleteTensor(&r);
		DeleteTensor(&s);
	}

	// test tensor trace
	{
		// create another tensor 's'
		tensor_t s;
		const size_t sdim[3] = { 5, 5, 5 };
		AllocateTensor(3, sdim, &s);
		status = ReadData("../test/tensor_test_t7.dat", s.data, sizeof(MKL_Complex16), NumTensorElements(&s));
		if (status < 0) { return status; }

		MKL_Complex16 tr = TensorTrace(&s);

		// reference value for checking
		MKL_Complex16 tr_ref = { 0.10510088120116468, 1.05270644643872 };

		// largest error
		err = fmax(err, ComplexAbs(ComplexSubtract(tr, tr_ref)));

		// clean up
		DeleteTensor(&s);
	}

	printf("Largest error: %g\n", err);

	// clean up
	DeleteTensor(&t);

	return (err < 1e-14 ? 0 : 1);
}
