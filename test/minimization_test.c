#include "minimization.h"
#include "hamiltonian.h"
#include "operation.h"
#include <mkl.h>
#include <stdio.h>


int MinimizationTest()
{
	// lattice chain length
	const int L = 10;

	// largest virtual bond dimension
	const size_t D = 64;

	// maximum number of sweeps (both right and left)
	const int maxiter = 4;

	// tolerance (not used here)
	const double tol = 0;

	// construct matrix product operator representation of Heisenberg Hamiltonian
	const double J    =  4.0/5;
	const double Jz   =  8.0/3;
	const double hext = -2.0/7;
	mpo_t mpoH;
	ConstructHeisenbergMPO(L, J, Jz, hext, &mpoH);

	// smallest energy value after each sweep
	double *en_min = (double *)MKL_malloc(maxiter * sizeof(double), MEM_DATA_ALIGN);

	// initial MPS psi
	mps_t psi;
	{
		size_t *Dlist = (size_t *)MKL_malloc((L+1) * sizeof(size_t), MEM_DATA_ALIGN);
		Dlist[0] = 1;
		int i;
		for (i = 1; i < L; i++)
		{
			Dlist[i] = D;
		}
		Dlist[L] = 1;

		AllocateMPS(L, 2, Dlist, &psi);
		MKL_free(Dlist);

		// quasi-random entries
		int c = 1;
		for (i = 0; i < L; i++)
		{
			const size_t n = NumTensorElements(&psi.A[i]);
			size_t j;
			for (j = 0; j < n; j++)
			{
				psi.A[i].data[j].real = 0.2*((double)c/3083 - 0.5);	c = (c + 181) % 3083;
				psi.A[i].data[j].imag = 0.2*((double)c/3083 - 0.5);	c = (c + 181) % 3083;
			}
		}
	}

	printf("Computing the ground state for the Heisenberg model on a chain of length %i...\n", L);

	CalculateGroundState(&mpoH, maxiter, tol, en_min, &psi);
	const double E0 = en_min[maxiter-1];

	// reference energy
	const double E0ref = -6.667640181059419;

	printf("Optimized ground state energy: %g, distance to reference value: %g\n", E0, E0 - E0ref);
	double err = fabs(E0 - E0ref);

	// norm (should be 1)
	const double nrm = CalculateMPSNorm(&psi);
	err = fmax(err, fabs(nrm - 1));

	// explicitly compute Hamiltonian average, to compare with optimized energy
	const MKL_Complex16 avrE = OperatorAverage(&psi, &mpoH);
	err = fmax(err, fabs(avrE.real - E0) + fabs(avrE.imag));

	// clean up
	DeleteMPS(&psi);
	MKL_free(en_min);
	DeleteMPO(&mpoH);

	return (err < 4e-14 ? 0 : 1);
}
