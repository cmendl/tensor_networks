#include "tensor.h"
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
		diff = fmax(diff, cabs(s->data[j] - t->data[j]));
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
	status = ReadData("../test/tensor_test_t1.dat", t.data, sizeof(double complex), NumTensorElements(&t));
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
		status = ReadData("../test/tensor_test_t1T.dat", r_ref.data, sizeof(double complex), NumTensorElements(&r_ref));
		if (status < 0) { return status; }

		// largest error
		err = fmax(err, TensorDifference(&r, &r_ref));

		// clean up
		DeleteTensor(&r_ref);
		DeleteTensor(&r);
	}

	// subtensor
	{
		const size_t sdim[4] = { 1, 2, 4, 3 };

		// indices along each dimension
		const size_t idx0[1] = { 1 };
		const size_t idx1[2] = { 0, 2 };
		const size_t idx2[4] = { 0, 1, 2, 3 };
		const size_t idx3[3] = { 1, 4, 4 }; // index 4 appears twice
		const size_t *idx[4] = { idx0, idx1, idx2, idx3 };

		tensor_t s;
		SubTensor(&t, sdim, idx, &s);

		// reference tensor for checking
		tensor_t s_ref;
		AllocateTensor(4, sdim, &s_ref);
		status = ReadData("../test/tensor_test_t1sub.dat", s_ref.data, sizeof(double complex), NumTensorElements(&s_ref));
		if (status < 0) { return status; }

		// largest error
		err = fmax(err, TensorDifference(&s, &s_ref));

		// clean up
		DeleteTensor(&s_ref);
		DeleteTensor(&s);
	}

	// general multiplication
	{
		// create another tensor 's'
		tensor_t s;
		const size_t sdim[4] = { 4, 5, 7, 6 };
		AllocateTensor(4, sdim, &s);
		status = ReadData("../test/tensor_test_t2.dat", s.data, sizeof(double complex), NumTensorElements(&s));
		if (status < 0) { return status; }

		// multiply tensors and store result in 'r'
		tensor_t r;
		MultiplyTensor(&t, &s, 2, &r);

		// reference tensor for checking
		const size_t refdim[4] = { 2, 3, 7, 6 };
		tensor_t r_ref;
		AllocateTensor(4, refdim, &r_ref);
		status = ReadData("../test/tensor_test_t12prod.dat", r_ref.data, sizeof(double complex), NumTensorElements(&r_ref));
		if (status < 0) { return status; }

		// largest error
		err = fmax(err, TensorDifference(&r, &r_ref));

		// clean up
		DeleteTensor(&r_ref);
		DeleteTensor(&r);
		DeleteTensor(&s);
	}

	// matrix-vector multiplication
	{
		// create another tensor 's'
		tensor_t s;
		const size_t sdim[1] = { 5 };
		AllocateTensor(1, sdim, &s);
		status = ReadData("../test/tensor_test_t3.dat", s.data, sizeof(double complex), NumTensorElements(&s));
		if (status < 0) { return status; }

		// multiply tensors and store result in 'r'
		tensor_t r;
		MultiplyTensor(&t, &s, 1, &r);

		// reference tensor for checking
		const size_t refdim[3] = { 2, 3, 4 };
		tensor_t r_ref;
		AllocateTensor(3, refdim, &r_ref);
		status = ReadData("../test/tensor_test_t13prod.dat", r_ref.data, sizeof(double complex), NumTensorElements(&r_ref));
		if (status < 0) { return status; }

		// largest error
		err = fmax(err, TensorDifference(&r, &r_ref));

		// clean up
		DeleteTensor(&r_ref);
		DeleteTensor(&r);
		DeleteTensor(&s);
	}

	// vector-matrix multiplication
	{
		// create another tensor 's'
		tensor_t s;
		const size_t sdim[1] = { 2 };
		AllocateTensor(1, sdim, &s);
		status = ReadData("../test/tensor_test_t4.dat", s.data, sizeof(double complex), NumTensorElements(&s));
		if (status < 0) { return status; }

		// multiply tensors and store result in 'r'
		tensor_t r;
		MultiplyTensor(&s, &t, 1, &r);

		// reference tensor for checking
		const size_t refdim[3] = { 3, 4, 5 };
		tensor_t r_ref;
		AllocateTensor(3, refdim, &r_ref);
		status = ReadData("../test/tensor_test_t41prod.dat", r_ref.data, sizeof(double complex), NumTensorElements(&r_ref));
		if (status < 0) { return status; }

		// largest error
		err = fmax(err, TensorDifference(&r, &r_ref));

		// clean up
		DeleteTensor(&r_ref);
		DeleteTensor(&r);
		DeleteTensor(&s);
	}

	// vector-vector multiplication (i.e., inner product)
	{
		const size_t nelem = NumTensorElements(&t);

		// interpret as vector
		tensor_t t1;
		CopyTensor(&t, &t1);
		ReshapeTensor(1, &nelem, &t1);

		// create another tensor 's'
		tensor_t s;
		AllocateTensor(1, &nelem, &s);
		status = ReadData("../test/tensor_test_t5.dat", s.data, sizeof(double complex), NumTensorElements(&s));
		if (status < 0) { return status; }

		// multiply tensors and store result in 'r'
		tensor_t r;
		MultiplyTensor(&t1, &s, 1, &r);

		// reference tensor for checking
		tensor_t r_ref;
		AllocateTensor(0, NULL, &r_ref);
		r_ref.data[0] = -5.730605734864588 + 2.495227138171611*_Complex_I;

		// largest error
		err = fmax(err, TensorDifference(&r, &r_ref));

		// clean up
		DeleteTensor(&r_ref);
		DeleteTensor(&r);
		DeleteTensor(&s);
		DeleteTensor(&t1);
	}

	// Kronecker product
	{
		// create another tensor 's'
		tensor_t s;
		const size_t sdim[4] = { 6, 5, 7, 2 };
		AllocateTensor(4, sdim, &s);
		status = ReadData("../test/tensor_test_t6.dat", s.data, sizeof(double complex), NumTensorElements(&s));
		if (status < 0) { return status; }

		tensor_t r;
		TensorKroneckerProduct(&t, &s, &r);

		// load reference values from disk
		tensor_t r_ref;
		const size_t refdim[4] = { 12, 15, 28, 10 };
		AllocateTensor(4, refdim, &r_ref);
		status = ReadData("../test/tensor_test_t16prod.dat", r_ref.data, sizeof(double complex), NumTensorElements(&r_ref));
		if (status < 0) { return status; }

		// largest error
		err = fmax(err, TensorDifference(&r, &r_ref));

		// clean up
		DeleteTensor(&r_ref);
		DeleteTensor(&r);
		DeleteTensor(&s);
	}

	// tensor trace
	{
		// create another tensor 's'
		tensor_t s;
		const size_t sdim[3] = { 5, 5, 5 };
		AllocateTensor(3, sdim, &s);
		status = ReadData("../test/tensor_test_t7.dat", s.data, sizeof(double complex), NumTensorElements(&s));
		if (status < 0) { return status; }

		double complex tr = TensorTrace(&s);

		// reference value for checking
		double complex tr_ref = 0.10510088120116468 + 1.05270644643872*_Complex_I;

		// largest error
		err = fmax(err, cabs(tr - tr_ref));

		// clean up
		DeleteTensor(&s);
	}

	printf("Largest error: %g\n", err);

	// clean up
	DeleteTensor(&t);

	return (err < 1e-14 ? 0 : 1);
}
