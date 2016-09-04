/// \file peps.c
/// \brief Projected entangled-pair state (PEPS) in two dimensions

#include "peps.h"
#include <mkl.h>
#include <stdlib.h>
#ifdef _DEBUG
#include <stdio.h>
#endif


//________________________________________________________________________________________________________________________
///
/// \brief Allocate memory for a projected entangled pair state (PEPS)
///
void AllocatePEPS2D(const int L, const size_t d, const size_t D, peps2D_t *psi)
{
	psi->L = L;
	psi->d = d;
	psi->D = D;

	assert(L > 1);

	int x, y;

	psi->A = (tensor_t *)MKL_calloc(L*L, sizeof(tensor_t), MEM_DATA_ALIGN);

	// ordering of virtual indices is left, right, up, down (omitting directions for border states)
	const size_t dim[5] = { d, D, D, D, D };
	for (y = 0; y < L; y++)
	{
		for (x = 0; x < L; x++)
		{
			int ndim = 5;
			// reduce number of levels for border and corner sites
			if (x == 0 || x == L - 1) { ndim--; }
			if (y == 0 || y == L - 1) { ndim--; }
			AllocateTensor(ndim, dim, &psi->A[x + L*y]);
			#ifdef _DEBUG
			tensor_t *A = &psi->A[x + L*y];
			sprintf(A->dnames[0].cstr, "A: physical level, dimension: %zu, coords: (%i,%i)", A->dim[0], x, y);
			int i = 1;
			if (x > 0)      { sprintf(A->dnames[i].cstr, "A: virtual level 'left',  dimension: %zu, coords: (%i,%i)", A->dim[i], x, y); i++; }
			if (x < L - 1)  { sprintf(A->dnames[i].cstr, "A: virtual level 'right', dimension: %zu, coords: (%i,%i)", A->dim[i], x, y); i++; }
			if (y > 0)      { sprintf(A->dnames[i].cstr, "A: virtual level 'up',    dimension: %zu, coords: (%i,%i)", A->dim[i], x, y); i++; }
			if (y < L - 1)  { sprintf(A->dnames[i].cstr, "A: virtual level 'down',  dimension: %zu, coords: (%i,%i)", A->dim[i], x, y); i++; }
			#endif
		}
	}
}


//________________________________________________________________________________________________________________________
///
/// \brief Delete a PEPS (free memory)
///
void DeletePEPS2D(peps2D_t *psi)
{
	int x, y;

	for (y = 0; y < psi->L; y++)
	{
		for (x = 0; x < psi->L; x++)
		{
			DeleteTensor(&psi->A[x + psi->L*y]);
		}
	}

	MKL_free(psi->A);

	psi->D = 0;
	psi->d = 0;
	psi->L = 0;
}


//________________________________________________________________________________________________________________________
///
/// \brief Construct the product A^* A after appropriate re-ordering
///
void ConstructETensor(const tensor_t *restrict A, tensor_t *restrict E)
{
	// conjugate
	tensor_t cA;
	CopyTensor(A, &cA);
	ConjugateTensor(&cA);

	// transpose: shuffle physical level 'd' to the end for multiplication
	tensor_t ctA;
	const int permA[5] = { cA.ndim - 1, 0, 1, 2, 3 };   // trailing entries might be ignored depending on cA.ndim
	TransposeTensor(permA, &cA, &ctA);

	// construct E tensor with dimension D^8 (except for border sites)
	tensor_t tE;
	MultiplyTensor(&ctA, A, &tE);

	// rearrange levels to form pairs (l,l'), ..., (d,d')
	assert(tE.ndim <= 8);
	int perm[8];    // trailing entries might be ignored, depending on 'tE.ndim'
	int i;
	for (i = 0; i < tE.ndim/2; i++) {
		perm[i]             = 2*i;
		perm[i + tE.ndim/2] = 2*i + 1;
	}
	TransposeTensor(perm, &tE, E);

	// group level pairs ~l = (l,l'), ...
	const size_t Dsq = A->dim[2]*A->dim[2];
	const size_t dim[4] = { Dsq, Dsq, Dsq, Dsq };   // trailing entries might be ignored depending on A->ndim
	ReshapeTensor(A->ndim - 1, dim, E);

	// clean up
	DeleteTensor(&tE);
	DeleteTensor(&ctA);
	DeleteTensor(&cA);
}


//________________________________________________________________________________________________________________________
///
/// \brief Construct the Matrix Product State (MPS) or Operator (MPO) corresponding to column 'y'
///
void ConstructPEPS2DMatrixProductStateOp(const peps2D_t *psi, const int y, tensor_t *mp)
{
	int x;

	// construct E_j tensors
	tensor_t *E = (tensor_t *)MKL_malloc(psi->L * sizeof(tensor_t), MEM_DATA_ALIGN);
	for (x = 0; x < psi->L; x++)
	{
		ConstructETensor(&psi->A[x + y*psi->L], &E[x]);

		// assign names
		#ifdef _DEBUG
		int j = 0;
		if (x > 0)          { sprintf(E[x].dnames[j].cstr, "E: virtual level 'left',  dimension: %zu, coords: (%i,%i)", E[x].dim[j], x, y); j++; }
		if (x < psi->L - 1) { sprintf(E[x].dnames[j].cstr, "E: virtual level 'right', dimension: %zu, coords: (%i,%i)", E[x].dim[j], x, y); j++; }
		if (y > 0)          { sprintf(E[x].dnames[j].cstr, "E: virtual level 'up',    dimension: %zu, coords: (%i,%i)", E[x].dim[j], x, y); j++; }
		if (y < psi->L - 1) { sprintf(E[x].dnames[j].cstr, "E: virtual level 'down',  dimension: %zu, coords: (%i,%i)", E[x].dim[j], x, y); j++; }
		#endif
	}

	// form MPS or MPO by accumulating products of E_j's with one another;
	// ordering of virtual indices is left, right, up, down (omitting directions for border states)
	tensor_t *Eprod = (tensor_t *)MKL_malloc(psi->L * sizeof(tensor_t), MEM_DATA_ALIGN);
	if (E[0].ndim == 2)     // MPS
	{
		assert(y == 0 || y == psi->L-1);    // column must be at the border

		// leftmost state
		{
			// shift "right" level to the right, i.e., rearrange levels to ordering (~u, ~r) or (~d, ~r) for multiplication;
			// "left" direction is missing in border state;
			assert(E[0].ndim == 2);
			const int perm[2] = { 1, 0 };
			TransposeTensor(perm, &E[0], &Eprod[0]);
		}
		for (x = 1; x < psi->L - 1; x++)
		{
			// rearrange levels to ordering (~l, ~u, ~r) or (~l, ~d, ~r) for multiplication
			assert(E[x].ndim == 3);
			tensor_t tE;
			const int perm[3] = { 0, 2, 1 };
			TransposeTensor(perm, &E[x], &tE);

			// perform multiplication
			MultiplyTensor(&Eprod[x-1], &tE, &Eprod[x]);

			// clean up
			DeleteTensor(&tE);
		}
		// last E_j does not have "right" level
		{
			// perform multiplication
			MultiplyTensor(&Eprod[psi->L-2], &E[psi->L-1], &Eprod[psi->L-1]);
		}

		// last product is the MPS
		CopyTensor(&Eprod[psi->L-1], mp);
	}
	else	// MPO
	{
		assert(y > 0 && y < psi->L-1);  // column must be in the inner region

		// leftmost state
		{
			// shift "right" level to the right, i.e., rearrange levels to ordering ~u, ~d, ~r for multiplication;
			// "left" direction is missing in border state;
			assert(E[0].ndim == 3);
			const int perm[3] = { 2, 0, 1 };
			TransposeTensor(perm, &E[0], &Eprod[0]);
		}
		for (x = 1; x < psi->L - 1; x++)
		{
			// rearrange levels to ordering ~l, ~u, ~d, ~r for multiplication
			assert(E[x].ndim == 4);
			tensor_t tE;
			const int perm[4] = { 0, 3, 1, 2 };
			TransposeTensor(perm, &E[x], &tE);

			// perform multiplication
			MultiplyTensor(&Eprod[x-1], &tE, &Eprod[x]);

			// clean up
			DeleteTensor(&tE);
		}
		// last E_j does not have "right" level
		{
			// perform multiplication
			MultiplyTensor(&Eprod[psi->L-2], &E[psi->L-1], &Eprod[psi->L-1]);
		}

		// rearrange levels to ordering (u_1, ..., u_L, d_1, ..., d_L)
		int *permM = (int *)MKL_malloc(2*psi->L * sizeof(int), MEM_DATA_ALIGN);
		for (x = 0; x < psi->L; x++) {
			permM[2*x  ] = x;
			permM[2*x+1] = psi->L + x;
		}
		TransposeTensor(permM, &Eprod[psi->L-1], mp);
		MKL_free(permM);
	}

	// clean up
	for (x = 0; x < psi->L; x++)
	{
		DeleteTensor(&Eprod[x]);
		DeleteTensor(&E[x]);
	}
	MKL_free(Eprod);
	MKL_free(E);
}
