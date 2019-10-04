/// \file lanczos.c
/// \brief Implementation of the Lanczos algorithm

#include "lanczos.h"
#include "util.h"
#include "dupio.h"
#include <memory.h>
#include <assert.h>


//________________________________________________________________________________________________________________________
///
/// \brief Perform a Lanczos iteration to approximate the lowest eigenvalue and corresponding eigenvector
///
void LanczosIteration(const size_t n, op_func_t Afunc, const void *restrict Adata, MKL_Complex16 *restrict v_start, const int maxiter, double *restrict lambda_min, MKL_Complex16 *restrict v_min)
{
	double *alpha = (double *)algn_calloc(maxiter, sizeof(double));
	double *beta  = (double *)algn_calloc(maxiter, sizeof(double));

	// logical index shifted by one vector in 'V'
	MKL_Complex16 *V = (MKL_Complex16 *)algn_malloc(n*(maxiter+1) * sizeof(MKL_Complex16));
	MKL_Complex16 *w = (MKL_Complex16 *)algn_malloc(n             * sizeof(MKL_Complex16));

	// set first "v" vector to zero and second "v" vector to starting vector
	memset(V, 0, n*sizeof(MKL_Complex16));
	memcpy(&V[n], v_start, n*sizeof(MKL_Complex16));
	// normalize starting vector
	{
		double nrm = Norm(2*n, (double *)&V[n]);
		assert(nrm > 0);
		cblas_dscal(2*n, 1/nrm, (double *)&V[n], 1);
	}

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
		assert(beta[j+1] > 0);
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

	double *U = (double *)algn_malloc(maxiter*maxiter * sizeof(double));
	lapack_int info = LAPACKE_dsteqr(LAPACK_COL_MAJOR, 'I', maxiter, alpha, beta + 1, U, maxiter);
	if (info != 0) {
		duprintf("Call of LAPACK function 'dsteqr()' in 'LanczosIteration()' failed, return value: %i\n", info);
		exit(-1);
	}

	(*lambda_min) = alpha[0];

	// embed smallest 'U' eigenvector into a complex vector
	MKL_Complex16 *u0 = (MKL_Complex16 *)algn_malloc(maxiter * sizeof(MKL_Complex16));
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
	algn_free(u0);
	algn_free(U);
	algn_free(w);
	algn_free(V);
	algn_free(beta);
	algn_free(alpha);
}
