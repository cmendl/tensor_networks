#include "minimization.h"
#include "hamiltonian.h"
#include "operation.h"
#include <mkl.h>
#include <stdio.h>


int MinimizationTest()
{
	// lattice chain length
	const int L = 10;

	// maximum number of sweeps (both right and left)
	const int maxiter = 4;

	// construct matrix product operator representation of Heisenberg Hamiltonian
	const double J    =  4.0/5;
	const double Jz   =  8.0/3;
	const double hext = -2.0/7;
	mpo_t mpoH;
	ConstructHeisenbergMPO(L, J, Jz, hext, &mpoH);

	// reference ground state energy
	const double E0ref = -6.667640181059419;

	// initial MPS psi
	mps_t psi0;
	{
		size_t *Dlist = (size_t *)MKL_malloc((L+1) * sizeof(size_t), MEM_DATA_ALIGN);
		Dlist[0] = 1;
		int i;
		for (i = 1; i < L; i++)
		{
			Dlist[i] = 32;
		}
		Dlist[L] = 1;

		AllocateMPS(L, 2, Dlist, &psi0);
		MKL_free(Dlist);

		// quasi-random entries
		int c = 1;
		for (i = 0; i < L; i++)
		{
			const size_t n = NumTensorElements(&psi0.A[i]);
			size_t j;
			for (j = 0; j < n; j++)
			{
				psi0.A[i].data[j].real = 0.2*((double)c/3083 - 0.5);	c = (c + 181) % 3083;
				psi0.A[i].data[j].imag = 0.2*((double)c/3083 - 0.5);	c = (c + 181) % 3083;
			}
		}
	}

	printf("Computing the ground state for the Heisenberg model on a chain of length %i...\n", L);

	double err = 0;

	// single-site local optimization
	{
		printf("Using single-site local optimization...\n");

		mps_t psi;
		CopyMPS(&psi0, &psi);

		// smallest energy value after each sweep
		double *en_min = (double *)MKL_malloc(maxiter * sizeof(double), MEM_DATA_ALIGN);

		CalculateGroundStateLocalSinglesite(&mpoH, maxiter, en_min, &psi);
		const double E0 = en_min[maxiter-1];

		printf("optimized ground state energy: %g, distance to reference value: %g\n", E0, E0 - E0ref);
		err = fmax(err, fabs(E0 - E0ref));

		// display virtual bond dimensions
		printf("virtual bond dimensions:\n");
		int i;
		for (i = 0; i < L; i++)
		{
			assert(psi.A[i].ndim == 3);
			printf("%zu ", psi.A[i].dim[1]);
		}
		printf("%zu\n", psi.A[L-1].dim[2]);

		// norm (should be 1)
		const double nrm = CalculateMPSNorm(&psi);
		err = fmax(err, fabs(nrm - 1));

		// explicitly compute Hamiltonian average, to compare with optimized energy
		const MKL_Complex16 avrE = OperatorAverage(&psi, &mpoH);
		err = fmax(err, fabs(avrE.real - E0) + fabs(avrE.imag));

		MKL_free(en_min);
		DeleteMPS(&psi);
	}

	// two-site local optimization
	{
		// tolerance
		const double tol = 1e-15;

		// largest virtual bond dimension
		const size_t maxD = 64;

		printf("Using two-site local optimization with tolerance %g...\n", tol);

		mps_t psi;
		CopyMPS(&psi0, &psi);

		// smallest energy value after each sweep
		double *en_min = (double *)MKL_malloc(maxiter * sizeof(double), MEM_DATA_ALIGN);

		// entropy associated with each virtual bond
		double *entropy = (double *)MKL_malloc((L-1) * sizeof(double), MEM_DATA_ALIGN);

		CalculateGroundStateLocalTwosite(&mpoH, maxiter, tol, maxD, entropy, en_min, &psi);
		const double E0 = en_min[maxiter-1];

		printf("optimized ground state energy: %g, distance to reference value: %g\n", E0, E0 - E0ref);
		err = fmax(err, fabs(E0 - E0ref));

		// display virtual bond dimensions
		printf("virtual bond dimensions:\n");
		int i;
		for (i = 0; i < L; i++)
		{
			assert(psi.A[i].ndim == 3);
			printf("%zu ", psi.A[i].dim[1]);
		}
		printf("%zu\n", psi.A[L-1].dim[2]);

		// display von Neumann entanglement entropy
		printf("von Neumann entanglement entropy:\n");
		for (i = 0; i < L-1; i++)
		{
			printf("%g ", entropy[i]);
		}
		printf("\n");

		// norm (should be 1)
		const double nrm = CalculateMPSNorm(&psi);
		err = fmax(err, fabs(nrm - 1));

		// explicitly compute Hamiltonian average, to compare with optimized energy
		const MKL_Complex16 avrE = OperatorAverage(&psi, &mpoH);
		err = fmax(err, fabs(avrE.real - E0) + fabs(avrE.imag));

		MKL_free(entropy);
		MKL_free(en_min);
		DeleteMPS(&psi);
	}

	// clean up
	DeleteMPS(&psi0);
	DeleteMPO(&mpoH);

	return (err < 4e-14 ? 0 : 1);
}
