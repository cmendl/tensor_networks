/// \file mps.c
/// \brief Matrix product state (MPS) 

#include "mps.h"
#include "dupio.h"
#include <mkl.h>
#include <stdlib.h>
#include <memory.h>
#include <stdio.h>


//________________________________________________________________________________________________________________________
///
/// \brief Allocate memory for a matrix product state (MPS) with open boundary conditions
///
void AllocateMPS(const int L, const size_t d, const size_t *D, mps_t *restrict mps)
{
	mps->L = L;
	mps->d = d;

	assert(L >= 1);

	mps->A = (tensor_t *)MKL_calloc(L, sizeof(tensor_t), MEM_DATA_ALIGN);

	int i;
	for (i = 0; i < L; i++)
	{
		const size_t dim[3] = { D[i], d, D[i+1] };
		AllocateTensor(3, dim, &mps->A[i]);
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Delete a matrix product state (free memory)
///
void DeleteMPS(mps_t *restrict mps)
{
	int i;
	for (i = 0; i < mps->L; i++)
	{
		DeleteTensor(&mps->A[i]);
	}
	MKL_free(mps->A);

	mps->d = 0;
	mps->L = 0;
}


//________________________________________________________________________________________________________________________
///
/// \brief Contraction step from right to left
///
static void ContractionStepRight(const tensor_t *restrict A, tensor_t *restrict t)
{
	tensor_t r;

	// multiply by A matrix (upper row)
	MultiplyTensor(A, t, &r);
	// initial values stored in 't' no longer required
	DeleteTensor(t);

	// multiply by conjugated and transposed A matrix (lower row)
	// combine the last two dimensions of 'r' into one dimension
	const size_t r_dim[2] = { r.dim[0], r.dim[1] * r.dim[2] };
	ReshapeTensor(2, r_dim, &r);
	// move the first level of 'A' to the end and complex-conjugate the entries
	tensor_t Astar;
	const int Aperm[3] = { 2, 0, 1 };
	ConjugateTransposeTensor(Aperm, A, &Astar);
	// combine the first two levels of 'Astar' into one dimension
	const size_t Astar_dim[2] = { Astar.dim[0] * Astar.dim[1], Astar.dim[2] };
	ReshapeTensor(2, Astar_dim, &Astar);
	// perform multiplication
	MultiplyTensor(&r, &Astar, t);
	// tensor 'Astar' no longer required
	DeleteTensor(&Astar);

	DeleteTensor(&r);
}


//________________________________________________________________________________________________________________________
///
/// \brief Contraction step with an operator acting on the physical dimension from right to left
///
static void ContractionOperatorStepRight(const tensor_t *restrict A, const tensor_t *restrict op, tensor_t *restrict t)
{
	tensor_t r, s;

	// multiply by A matrix (upper row)
	MultiplyTensor(A, t, &s);
	// initial values stored in 't' no longer required
	DeleteTensor(t);

	// apply operator 'op'
	// flip the first two levels of 's', such that the physical dimension comes first
	const int r_perm[3] = { 1, 0, 2 };
	TransposeTensor(r_perm, &s, &r);
	DeleteTensor(&s);
	// perform multiplication
	MultiplyTensor(op, &r, &s);
	DeleteTensor(&r);
	// flip the first two levels back
	TransposeTensor(r_perm, &s, &r);
	DeleteTensor(&s);

	// multiply by conjugated and transposed A matrix (lower row)
	// combine the last two dimensions of 'r' into one dimension
	const size_t r_dim[2] = { r.dim[0], r.dim[1] * r.dim[2] };
	ReshapeTensor(2, r_dim, &r);
	// move the first level of 'A' to the end and complex-conjugate the entries
	tensor_t Astar;
	const int Aperm[3] = { 2, 0, 1 };
	ConjugateTransposeTensor(Aperm, A, &Astar);
	// combine the first two levels of 'Astar' into one dimension
	const size_t Astar_dim[2] = { Astar.dim[0] * Astar.dim[1], Astar.dim[2] };
	ReshapeTensor(2, Astar_dim, &Astar);
	// perform multiplication
	MultiplyTensor(&r, &Astar, t);
	// tensor 'Astar' no longer required
	DeleteTensor(&Astar);

	DeleteTensor(&r);
}


//________________________________________________________________________________________________________________________
///
/// \brief Contraction step from left to right
///
static void ContractionStepLeft(const tensor_t *restrict A, tensor_t *restrict t)
{
	tensor_t r;

	// multiply by A matrix (upper row)
	MultiplyTensor(t, A, &r);
	// initial values stored in 't' no longer required
	DeleteTensor(t);

	// multiply by conjugated and transposed A matrix (lower row)
	// combine the first two dimensions of 'r' into one dimension
	const size_t r_dim[2] = { r.dim[0] * r.dim[1], r.dim[2] };
	ReshapeTensor(2, r_dim, &r);
	// move the last level of 'A' to the front and complex-conjugate the entries
	tensor_t Astar;
	const int Aperm[3] = { 1, 2, 0 };
	ConjugateTransposeTensor(Aperm, A, &Astar);
	// combine the last two levels of 'Astar' into one dimension
	const size_t Astar_dim[2] = { Astar.dim[0], Astar.dim[1] * Astar.dim[2] };
	ReshapeTensor(2, Astar_dim, &Astar);
	// perform multiplication
	MultiplyTensor(&Astar, &r, t);
	// tensor 'Astar' no longer required
	DeleteTensor(&Astar);

	DeleteTensor(&r);
}


//________________________________________________________________________________________________________________________
///
/// \brief Contraction step with an operator acting on the physical dimension from left to right
///
static void ContractionOperatorStepLeft(const tensor_t *restrict A, const tensor_t *restrict op, tensor_t *restrict t)
{
	tensor_t r, s;

	// multiply by A matrix (upper row)
	MultiplyTensor(t, A, &s);
	// initial values stored in 't' no longer required
	DeleteTensor(t);

	// apply operator 'op'
	// flip the first two levels of 's', such that the physical dimension comes first
	const int r_perm[3] = { 1, 0, 2 };
	TransposeTensor(r_perm, &s, &r);
	DeleteTensor(&s);
	// perform multiplication
	MultiplyTensor(op, &r, &s);
	DeleteTensor(&r);
	// flip the first two levels back
	TransposeTensor(r_perm, &s, &r);
	DeleteTensor(&s);

	// multiply by conjugated and transposed A matrix (lower row)
	// combine the first two dimensions of 'r' into one dimension
	const size_t r_dim[2] = { r.dim[0] * r.dim[1], r.dim[2] };
	ReshapeTensor(2, r_dim, &r);
	// move the last level of 'A' to the front and complex-conjugate the entries
	tensor_t Astar;
	const int Aperm[3] = { 1, 2, 0 };
	ConjugateTransposeTensor(Aperm, A, &Astar);
	// combine the last two levels of 'Astar' into one dimension
	const size_t Astar_dim[2] = { Astar.dim[0], Astar.dim[1] * Astar.dim[2] };
	ReshapeTensor(2, Astar_dim, &Astar);
	// perform multiplication
	MultiplyTensor(&Astar, &r, t);
	// tensor 'Astar' no longer required
	DeleteTensor(&Astar);

	DeleteTensor(&r);
}


//________________________________________________________________________________________________________________________
///
/// \brief Calculate the norm of a matrix product state (contract with conjugated version of itself)
///
double CalculateMPSNorm(const mps_t *restrict mps)
{
	const int L = mps->L;

	tensor_t t;

	// initialize 't' by identity matrix
	assert(mps->A[L-1].ndim == 3);
	const size_t t_dim[2] = { mps->A[L-1].dim[2], mps->A[L-1].dim[2] };
	AllocateTensor(2, t_dim, &t);
	IdentityTensor(&t);

	int i;
	for (i = L-1; i >= 0; i--)
	{
		ContractionStepRight(&mps->A[i], &t);
	}

	// 't' should now be a 1x1 matrix
	assert(t.ndim == 2);
	assert(t.dim[0] == 1 && t.dim[1] == 1);

	// imaginary part should be zero up to numerical rounding errors
	const double norm = t.data[0].real;

	DeleteTensor(&t);

	return norm;
}


//________________________________________________________________________________________________________________________
///
/// \brief Calculate all partial contractions of a matrix product state from the left and right
///
void CalculateMPSContraction(const mps_t *restrict mps, tensor_t *restrict cntrL, tensor_t *restrict cntrR)
{
	int i;

	const int L = mps->L;
	tensor_t t;

	// contraction from right to left

	// initialize 't' by identity matrix
	assert(mps->A[L-1].ndim == 3);
	const size_t t_dim_R[2] = { mps->A[L-1].dim[2], mps->A[L-1].dim[2] };
	AllocateTensor(2, t_dim_R, &t);
	IdentityTensor(&t);

	for (i = L-1; i >= 0; i--)
	{
		ContractionStepRight(&mps->A[i], &t);

		// store current 't' tensor
		CopyTensor(&t, &cntrR[i]);
	}
	DeleteTensor(&t);

	// contraction from left to right

	// initialize 't' by identity matrix
	assert(mps->A[0].ndim == 3);
	const size_t t_dim_L[2] = { mps->A[0].dim[0], mps->A[0].dim[0] };
	AllocateTensor(2, t_dim_L, &t);
	IdentityTensor(&t);

	for (i = 0; i < L; i++)
	{
		ContractionStepLeft(&mps->A[i], &t);

		// store current 't' tensor
		CopyTensor(&t, &cntrL[i]);
	}
	DeleteTensor(&t);
}


//________________________________________________________________________________________________________________________
///
/// \brief Calculate all partial contractions of a matrix product state and a tensor product of single-site operators from the right
///
static void CalculateMPSOperatorChainContraction(const mps_t *restrict mps, const tensor_t *restrict op, tensor_t *restrict cntr)
{
	const int L = mps->L;
	tensor_t t;

	// initialize 't' by identity matrix
	assert(mps->A[L-1].ndim == 3);
	const size_t t_dim[2] = { mps->A[L-1].dim[2], mps->A[L-1].dim[2] };
	AllocateTensor(2, t_dim, &t);
	IdentityTensor(&t);
	// store identity tensor in last dummy entry
	CopyTensor(&t, &cntr[L]);

	int i;
	for (i = L-1; i >= 0; i--)
	{
		ContractionOperatorStepRight(&mps->A[i], &op[i], &t);

		// store current 't' tensor
		CopyTensor(&t, &cntr[i]);
	}
	DeleteTensor(&t);
}


//________________________________________________________________________________________________________________________
///
/// \brief Average with respect to single-site operator 'op'
///
MKL_Complex16 MPSAverageOneSiteOp(const mps_t *restrict mps, const tensor_t *restrict cntrL, const tensor_t *restrict cntrR, const tensor_t *restrict op)
{
	MKL_Complex16 avr = { 0 };

	int i;
	for (i = 0; i < mps->L; i++)
	{
		tensor_t t;
		if (i < mps->L-1)
		{
			CopyTensor(&cntrR[i + 1], &t);
		}
		else
		{
			// initialize 't' by 1x1 identity matrix
			const size_t t_dim[2] = { 1, 1 };
			AllocateTensor(2, t_dim, &t);
			IdentityTensor(&t);
		}

		// perform contraction at site 'i' with operator 'op'
		ContractionOperatorStepRight(&mps->A[i], op, &t);

		MKL_Complex16 avr_loc;
		if (i > 0)
		{
			// TODO: more efficient way to compute trace of matrix product
			tensor_t s;
			MultiplyTensor(&cntrL[i - 1], &t, &s);
			avr_loc = TensorTrace(&s);
			DeleteTensor(&s);
		}
		else
		{
			// 't' should now be a 1x1 matrix
			assert(t.ndim == 2);
			assert(t.dim[0] == 1 && t.dim[1] == 1);
			avr_loc = t.data[0];
		}

		// add average from site 'i'
		avr.real += avr_loc.real;
		avr.imag += avr_loc.imag;

		DeleteTensor(&t);
	}

	return avr;
}


//________________________________________________________________________________________________________________________
///
/// \brief Average with respect to two-site operator 'op1 otimes op2'
///
MKL_Complex16 MPSAverageTwoSiteOp(const mps_t *restrict mps, const tensor_t *restrict cntrL, const tensor_t *restrict cntrR, const tensor_t *restrict op1, const tensor_t *restrict op2)
{
	MKL_Complex16 avr = { 0 };

	int i;
	for (i = 0; i < mps->L-1; i++)
	{
		tensor_t t;
		if (i < mps->L - 2)
		{
			CopyTensor(&cntrR[i + 2], &t);
		}
		else
		{
			// initialize 't' by 1x1 identity matrix
			const size_t t_dim[2] = { 1, 1 };
			AllocateTensor(2, t_dim, &t);
			IdentityTensor(&t);
		}

		// perform contraction at site 'i + 1' with operator 'op2'
		ContractionOperatorStepRight(&mps->A[i + 1], op2, &t);

		// perform contraction at site 'i' with operator 'op1'
		ContractionOperatorStepRight(&mps->A[i], op1, &t);

		MKL_Complex16 avr_loc;
		if (i > 0)
		{
			// TODO: more efficient way to compute trace of matrix product
			tensor_t s;
			MultiplyTensor(&cntrL[i - 1], &t, &s);
			avr_loc = TensorTrace(&s);
			DeleteTensor(&s);
		}
		else
		{
			// 't' should now be a 1x1 matrix
			assert(t.ndim == 2);
			assert(t.dim[0] == 1 && t.dim[1] == 1);
			avr_loc = t.data[0];
		}

		// add average from sites 'i' and 'i + 1'
		avr.real += avr_loc.real;
		avr.imag += avr_loc.imag;

		DeleteTensor(&t);
	}

	return avr;
}


//________________________________________________________________________________________________________________________
///
/// \brief Minimize local site energy
///
static double MinimizeMPSOnsiteEnergy(const int num_op_tensors, const tensor_t *restrict h, const tensor_t *restrict Hleft, const tensor_t *restrict Hright, tensor_t *restrict A)
{
	int m;

	const size_t n = Hleft[0].dim[1] * h[0].dim[1] * Hright[0].dim[0];
	assert(     n == Hleft[0].dim[0] * h[0].dim[0] * Hright[0].dim[1]);

	// form Kronecker products of left and right contractions of Hamiltonian, and local tensor term
	tensor_t Heff;
	const size_t dimH[2] = { n, n };
	AllocateTensor(2, dimH, &Heff);
	for (m = 0; m < num_op_tensors; m++)
	{
		assert(Hleft[m].ndim == 2 && h[m].ndim == 2 && Hright[m].ndim == 2);

		tensor_t t, s;
		// transpose Hright[m] since local 'A' (interpreted as vector) is applied from the right to effective local Hamiltonian
		const int perm[2] = { 1, 0 };
		TransposeTensor(perm, &Hright[m], &t);
		// form Kronecker product
		TensorKroneckerProduct(&h[m], &t, &s);
		DeleteTensor(&t);
		TensorKroneckerProduct(&Hleft[m], &s, &t);
		DeleteTensor(&s);

		const MKL_Complex16 one = { 1, 0 };
		ScalarMultiplyAddTensor(one, &t, &Heff);
		DeleteTensor(&t);
	}

	double* E = MKL_malloc(n * sizeof(double), MEM_DATA_ALIGN);
	// entries of 'Heff' will be overwritten
	int info = LAPACKE_zheev(LAPACK_COL_MAJOR, 'V', 'L', (lapack_int)Heff.dim[0], Heff.data, (lapack_int)Heff.dim[0], E);
	if (info < 0) {
		duprintf("Call of LAPACK function 'zheev()' in 'MinimizeMPSOnsiteEnergy()' failed, return value: %i\n", info);
		exit(-1);
	}

	// lowest eigenvalue
	const double E0 = E[0];

	// set 'A' to the eigenvector corresponding to the lowest eigenvalue
	const size_t dimA[3] = { Hleft[0].dim[1], h[0].dim[1], Hright[0].dim[0] };
	AllocateTensor(3, dimA, A);
	assert(n == NumTensorElements(A));
	memcpy(A->data, Heff.data, n*sizeof(MKL_Complex16));

	// clean up
	MKL_free(E);
	DeleteTensor(&Heff);

	return E0;
}


//________________________________________________________________________________________________________________________
///
/// \brief Unitarily project local site tensor 'A' using a Singular Value Decomposition, overwriting A by the 'U' matrix
///
static void UnitaryMPSProjectionU(tensor_t *restrict A)
{
	int info;

	// combine first (leftwards) virtual dimension and physical dimension into one dimension
	const size_t m = A->dim[0] * A->dim[1];
	const size_t n = A->dim[2];
	const size_t k = (m <= n ? m : n);  // min(m, n)

	double *s = MKL_malloc(k * sizeof(double), MEM_DATA_ALIGN);
	double *superb = MKL_malloc((k - 1) * sizeof(double), MEM_DATA_ALIGN);
	MKL_Complex16 *vt = MKL_malloc(k*n * sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	// overwrite 'A' by the 'U' matrix
	info = LAPACKE_zgesvd(LAPACK_COL_MAJOR, 'O', 'S', (lapack_int)m, (lapack_int)n, A->data, (lapack_int)m, s, NULL, (lapack_int)m, vt, (lapack_int)k, superb);
	if (info != 0) {
		duprintf("Call of LAPACK function 'zgesvd()' in 'UnitaryMPSProjectionU()' failed, return value: %i\n", info);
		exit(-1);
	}

	if (m < n)
	{
		// reduce last dimension of 'A'
		A->dim[2] = m;
	}

	// clean up
	MKL_free(vt);
	MKL_free(superb);
	MKL_free(s);
}

//________________________________________________________________________________________________________________________
///
/// \brief Unitarily project local site tensor 'A' using a Singular Value Decomposition, overwriting A by the 'V^H' matrix
///
static void UnitaryMPSProjectionV(tensor_t *restrict A, tensor_t *restrict US)
{
	int info;
	size_t i, j;

	// combine physical dimension and last (rightwards) virtual dimension and into one dimension
	const size_t m = A->dim[0];
	const size_t n = A->dim[1] * A->dim[2];
	const size_t k = (m <= n ? m : n);  // min(m, n)

	double *s = MKL_malloc(k * sizeof(double), MEM_DATA_ALIGN);
	double *superb = MKL_malloc((k - 1) * sizeof(double), MEM_DATA_ALIGN);
	MKL_Complex16 *u = MKL_malloc(m*k * sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	// overwrite 'A' by the 'V^H' matrix
	info = LAPACKE_zgesvd(LAPACK_COL_MAJOR, 'S', 'O', (lapack_int)m, (lapack_int)n, A->data, (lapack_int)m, s, u, (lapack_int)m, NULL, (lapack_int)k, superb);
	if (info != 0) {
		duprintf("Call of LAPACK function 'zgesvd()' in 'UnitaryMPSProjectionV()' failed, return value: %i\n", info);
		exit(-1);
	}

	if (US != NULL)
	{
		// scale columns of 'U' by singular values, i.e., compute U * S
		for (i = 0; i < k; i++)
		{
			const MKL_Complex16 alpha = { s[i], 0, };
			cblas_zscal((MKL_INT)m, &alpha, &u[i*m], 1);
		}
		// store in output tensor 'US'
		const size_t dimUS[2] = { m, k };
		AllocateTensor(2, dimUS, US);
		memcpy(US->data, u, m*k * sizeof(MKL_Complex16));
	}

	if (n < m)
	{
		// reduce first dimension of 'A'
		for (j = 1; j < n; j++)     // start from second column
		{
			for (i = 0; i < n; i++)     // note upper limit 'n' instead of 'm'
			{
				A[i + n*j] = A[i + m*j];
			}
		}
		A->dim[0] = n;
	}

	// clean up
	MKL_free(u);
	MKL_free(superb);
	MKL_free(s);
}


//________________________________________________________________________________________________________________________
///
/// \brief Compute the standard deviation of the values in 'x' and divide by absolute mean value
///
static double NormalizedStandardDeviation(const double *x, const size_t n)
{
	size_t i;

	// mean value
	double mean = 0;
	for (i = 0; i < n; i++)
	{
		mean += x[i];
	}
	mean /= n;

	// standard deviation
	double std = 0;
	for (i = 0; i < n; i++)
	{
		std += square(x[i] - mean);
	}
	std = sqrt(std / (n - 1));

	return std / fabs(mean);
}


//________________________________________________________________________________________________________________________
///
/// \brief Minimize energy with respect to Hamiltonian H equal to the following sum of tensor products:
/// H = sum_{m=0}^{num_op_tensors-1} h[0+m*L] x h[1+m*L] x ... x h[L-1+m*L]
///
/// Matrix product state 'mps' must be initialized on input, will be overwritten by optimized state
///
double MinimizeMPSEnergy(const int num_op_tensors, const tensor_t *restrict h, const double prec, mps_t *restrict mps)
{
	int i, m, n;

	const int L = mps->L;

	// transpose 'h' (interpreted as 'L x num_op_tensors' matrix)
	tensor_t *hT = (tensor_t *)MKL_calloc(L*num_op_tensors, sizeof(tensor_t), MEM_DATA_ALIGN);
	for (m = 0; m < num_op_tensors; m++)
	{
		for (i = 0; i < L; i++)
		{
			CopyTensor(&h[i + m*L], &hT[m + i*num_op_tensors]);
		}
	}

	// partial contractions for each tensor product in Hamiltonian
	tensor_t *cntrH = (tensor_t *)MKL_calloc((L+1)*num_op_tensors, sizeof(tensor_t), MEM_DATA_ALIGN);
	for (m = 0; m < num_op_tensors; m++)
	{
		CalculateMPSOperatorChainContraction(mps, &h[m*L], &cntrH[m*(L+1)]);
		// set leftmost entry to 1x1 identity matrix (will be starting point for contractions from left to right
		assert(cntrH[m*(L+1)].ndim == 2);
		assert(cntrH[m*(L+1)].dim[0] == 1 && cntrH[m*(L+1)].dim[1] == 1);
		cntrH[m*(L+1)].data[0].real = 1;
		cntrH[m*(L+1)].data[0].imag = 0;
	}
	// transpose 'cntrH' (interpreted as '(L+1) x num_op_tensors' matrix)
	tensor_t *cntrHT = (tensor_t *)MKL_calloc((L+1)*num_op_tensors, sizeof(tensor_t), MEM_DATA_ALIGN);
	for (m = 0; m < num_op_tensors; m++)
	{
		for (i = 0; i < L+1; i++)
		{
			CopyTensor(&cntrH[i + m*(L+1)], &cntrHT[m + i*num_op_tensors]);
			DeleteTensor(&cntrH[i + m*(L+1)]);  // tensor no longer required
		}
	}
	MKL_free(cntrH);

	// list of minimal energies during sweeps, used to check for convergence
	double *Elist = (double *)MKL_malloc(2*(L-1) * sizeof(double), MEM_DATA_ALIGN);

	tensor_t US;
	{
		// allocate dummy tensor, such that DeleteTensor(...) below works
		size_t dim[2] = { 1, 1 };
		AllocateTensor(2, dim, &US);
	}

	const int nsweeps_max = 256;
	for (n = 0; n < nsweeps_max; n++)
	{
		// sweep from left to right
		for (i = 0; i < L-1; i++)
		{
			DeleteTensor(&mps->A[i]);
			Elist[i] = MinimizeMPSOnsiteEnergy(num_op_tensors, &hT[i*num_op_tensors], &cntrHT[i*num_op_tensors], &cntrHT[(i + 1)*num_op_tensors], &mps->A[i]);
			UnitaryMPSProjectionU(&mps->A[i]);

			// update partial contractions with Hamiltonian operator
			for (m = 0; m < num_op_tensors; m++)
			{
				DeleteTensor(&cntrHT[m + (i + 1)*num_op_tensors]);
				CopyTensor(&cntrHT[m + i*num_op_tensors], &cntrHT[m + (i + 1)*num_op_tensors]);
				ContractionOperatorStepLeft(&mps->A[i], &hT[m + i*num_op_tensors], &cntrHT[m + (i + 1)*num_op_tensors]);
			}
		}

		// clean up from previous sweep
		DeleteTensor(&US);

		// sweep from right to left
		for (i = L-1; i > 0; i--)
		{
			DeleteTensor(&mps->A[i]);
			Elist[2*(L-1) - i] = MinimizeMPSOnsiteEnergy(num_op_tensors, &hT[i*num_op_tensors], &cntrHT[i*num_op_tensors], &cntrHT[(i + 1)*num_op_tensors], &mps->A[i]);
			UnitaryMPSProjectionV(&mps->A[i], i == 1 ? &US : NULL);

			// update partial contractions with Hamiltonian operator
			for (m = 0; m < num_op_tensors; m++)
			{
				DeleteTensor(&cntrHT[m + i*num_op_tensors]);
				CopyTensor(&cntrHT[m + (i + 1)*num_op_tensors], &cntrHT[m + i*num_op_tensors]);
				ContractionOperatorStepRight(&mps->A[i], &hT[m + i*num_op_tensors], &cntrHT[m + i*num_op_tensors]);
			}
		}

		// check for convergence
		if (NormalizedStandardDeviation(Elist, 2*(L-1)) < prec)
		{
			break;
		}
	}

	// update mps->A[0] <- mps->A[0]*US
	tensor_t A0;
	MultiplyTensor(&mps->A[0], &US, &A0);
	DeleteTensor(&mps->A[0]);
	CopyTensor(&A0, &mps->A[0]);
	DeleteTensor(&A0);
	DeleteTensor(&US);

	if (n == nsweeps_max)
	{
		duprintf("Warning: maximum number of sweeps (%i) reached in MinimizeMPSEnergy()...\n", nsweeps_max);
	}

	// final energy obtained during sweeps
	const double E0 = Elist[2*(L-1) - 1];

	// clean up
	MKL_free(Elist);
	for (i = 0; i < L*num_op_tensors; i++)
	{
		DeleteTensor(&hT[i]);
	}
	for (i = 0; i < (L+1)*num_op_tensors; i++)
	{
		DeleteTensor(&cntrHT[i]);
	}
	MKL_free(cntrHT);
	MKL_free(hT);

	return E0;
}
