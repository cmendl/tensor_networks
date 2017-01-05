#include "minimization.h"
#include "hamiltonian.h"
#include "complex.h"
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

	// reference ground state vector
	tensor_t psi_ref;
	{
		const size_t len = 0x1 << L;
		AllocateTensor(1, &len, &psi_ref);
		int status = ReadData("../test/minimization_test_psi.dat", psi_ref.data, sizeof(MKL_Complex16), len);
		if (status < 0) { return status; }
	}

	printf("Computing ground state wavefunction and energy for the Heisenberg model on a chain of length %i...\n", L);

	double err = 0;
	double err_psi = 0;

	int t;
	for (t = 0; t < 2; t++)
	{
		mps_t psi;
		double E0;

		if (t == 0)
		{
			// single-site local optimization

			printf("Using single-site local optimization...\n");

			CopyMPS(&psi0, &psi);

			// smallest energy value after each sweep
			double *en_min = (double *)MKL_malloc(maxiter * sizeof(double), MEM_DATA_ALIGN);

			CalculateGroundStateLocalSinglesite(&mpoH, maxiter, en_min, &psi);
			E0 = en_min[maxiter-1];

			MKL_free(en_min);
		}
		else if (t == 1)
		{
			// two-site local optimization

			// tolerance
			const double tol = 1e-15;

			// largest virtual bond dimension
			const size_t maxD = 64;

			printf("Using two-site local optimization with tolerance %g...\n", tol);

			CopyMPS(&psi0, &psi);

			// smallest energy value after each sweep
			double *en_min = (double *)MKL_malloc(maxiter * sizeof(double), MEM_DATA_ALIGN);

			// entropy associated with each virtual bond
			double *entropy = (double *)MKL_malloc((L-1) * sizeof(double), MEM_DATA_ALIGN);

			CalculateGroundStateLocalTwosite(&mpoH, maxiter, tol, maxD, entropy, en_min, &psi);
			E0 = en_min[maxiter-1];

			// display von Neumann entanglement entropy
			printf("von Neumann entanglement entropy:\n");
			int i;
			for (i = 0; i < L-1; i++)
			{
				printf("%g ", entropy[i]);
			}
			printf("\n");

			MKL_free(entropy);
			MKL_free(en_min);
		}

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

		// compare with reference wavefunction
		tensor_t psi_full;
		MergeMPSFull(&psi, &psi_full);
		// scale by phase factor (entries can be choosen real-valued)
		{
			MKL_Complex16 z = { 0 };
			// select largest entry
			double a_max = 0;
			size_t j_max = 0;
			size_t j;
			for (j = 0; j < psi_full.dim[0]; j++)
			{
				double a = ComplexAbs(psi_full.data[j]);
				if (a > a_max)
				{
					a_max = a;
					j_max = j;
					z = psi_full.data[j];
				}
			}
			// normalize
			z = ComplexScale(1.0 / ComplexAbs(z), z);
			// complex conjugate (inverse phase shift)
			z.imag = -z.imag;
			// actually scale by phase factor
			cblas_zscal(psi_full.dim[0], &z, psi_full.data, 1);
			// flip (arbitrary) sign to match reference wavefunction
			if (psi_full.data[j_max].real * psi_ref.data[j_max].real < 0)
			{
				cblas_dscal(2*psi_full.dim[0], -1, (double *)psi_full.data, 1);
			}
		}
		if (psi_full.ndim != 1 || psi_full.dim[0] != psi_ref.dim[0])
		{
			err_psi = fmax(err_psi, 1);
		}
		else
		{
			// largest entrywise error
			err_psi = fmax(err_psi, UniformDistance(2*NumTensorElements(&psi_ref), (double *)psi_full.data, (double *)psi_ref.data));
		}

		// norm computed via vector representation (should be 1)
		double nrm = Norm(2*NumTensorElements(&psi_full), (double *)psi_full.data);
		err = fmax(err, fabs(nrm - 1));

		// norm computed via MPS representation (should be 1)
		nrm = CalculateMPSNorm(&psi);
		err = fmax(err, fabs(nrm - 1));

		// explicitly compute Hamiltonian average, to compare with optimized energy
		const MKL_Complex16 avrE = OperatorAverage(&psi, &mpoH);
		err = fmax(err, fabs(avrE.real - E0) + fabs(avrE.imag));

		DeleteTensor(&psi_full);
		DeleteMPS(&psi);
	}

	// clean up
	DeleteTensor(&psi_ref);
	DeleteMPS(&psi0);
	DeleteMPO(&mpoH);

	return (err < 4e-14 && err_psi < 5e-8 ? 0 : 1);
}
