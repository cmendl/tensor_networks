/// \file lanczos.c
/// \brief Implementation of the Lanczos algorithm

#include "lanczos.h"
#include "dupio.h"
#include <mkl.h>
#include <memory.h>


//________________________________________________________________________________________________________________________
///
/// \brief Perform a Lanczos iteration to approximate the lowest eigenvalue and corresponding eigenvector
///
void LanczosIteration(const size_t n, mat_vect_prod_t Afunc, const void *restrict Adata, MKL_Complex16 *restrict v_start, const int maxiter, double *restrict lambda_min, MKL_Complex16 *restrict v_min)
{
	double *alpha = (double *)MKL_calloc(maxiter, sizeof(double), MEM_DATA_ALIGN);
	double *beta  = (double *)MKL_calloc(maxiter, sizeof(double), MEM_DATA_ALIGN);

	// logical index shifted by one vector in 'V'
	MKL_Complex16 *V = (MKL_Complex16 *)MKL_malloc(n*(maxiter+1) * sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	MKL_Complex16 *w = (MKL_Complex16 *)MKL_malloc(n             * sizeof(MKL_Complex16), MEM_DATA_ALIGN);

	// set first "v" vector to zero and second "v" vector to starting vector
	memset(V, 0, n*sizeof(MKL_Complex16));
	memcpy(&V[n], v_start, n*sizeof(MKL_Complex16));

	int j;
	for (j = 0; j < maxiter - 1; j++)
	{
		// w' = A v_j
		Afunc(n, Adata, &V[(j+1)*n], w);

		// alpha_j = <w', v_j>
		MKL_Complex16 t;
		cblas_zdotc_sub(n, w, 1, &V[(j+1)*n], 1, &t);
		alpha[j] = t.real;  // should be real if matrix is Hermitian

		// w = w' - alpha_j v_j - beta_j v_{j-1}
		size_t i;
		for (i = 0; i < n; i++)
		{
			w[i].real -= alpha[j]*V[i + (j+1)*n].real + beta[j]*V[i + j*n].real;
			w[i].imag -= alpha[j]*V[i + (j+1)*n].imag + beta[j]*V[i + j*n].imag;
		}

		// beta_{j+1} = ||w||
		beta[j+1] = cblas_dznrm2(n, w, 1);

		// v_{j+1} = w / beta[j+1]
		const double inv_beta = 1 / beta[j+1];
		for (i = 0; i < n; i++)
		{
			V[i + (j+2)*n].real = inv_beta * w[i].real;
			V[i + (j+2)*n].imag = inv_beta * w[i].imag;
		}
	}

	// complete final iteration
	{
		// w' = A v_j
		Afunc(n, Adata, &V[(j+1)*n], w);

		// alpha_j = <w', v_j>
		MKL_Complex16 t;
		cblas_zdotc_sub(n, w, 1, &V[(j+1)*n], 1, &t);
		alpha[j] = t.real;  // should be real if matrix is Hermitian
	}

	// postprocessing to obtain approximate eigenvalues and -vectors

	double *U = (double *)MKL_malloc(maxiter*maxiter * sizeof(double), MEM_DATA_ALIGN);
	lapack_int info = LAPACKE_dsteqr(LAPACK_COL_MAJOR, 'I', maxiter, alpha, beta + 1, U, n);
	if (info != 0) {
		duprintf("Call of LAPACK function 'dsteqr()' in 'LanczosIteration()' failed, return value: %i\n", info);
		exit(-1);
	}

	(*lambda_min) = alpha[0];

	// embed smallest 'U' eigenvector into a complex vector
	MKL_Complex16 *u0 = (MKL_Complex16 *)MKL_malloc(maxiter * sizeof(MKL_Complex16), MEM_DATA_ALIGN);
	for (j = 0; j < maxiter; j++)
	{
		u0[j].real = U[j];
		u0[j].imag = 0;
	}

	// Ritz eigenvector corresponding to smallest eigenvalue
	const MKL_Complex16 one  = { 1, 0 };
	const MKL_Complex16 zero = { 0, 0 };
	cblas_zgemv(CblasColMajor, CblasNoTrans, n, maxiter, &one, &V[n], n, u0, 1, &zero, v_min, 1);

	// clean up
	MKL_free(u0);
	MKL_free(U);
	MKL_free(w);
	MKL_free(V);
	MKL_free(beta);
	MKL_free(alpha);
}
