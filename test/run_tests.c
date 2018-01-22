#include <mkl.h>
#include <stdbool.h>
#include <stdio.h>


typedef int (*test_function_t)();

// test function declarations
int QuantumNumberTest();
int QuantumNumberTest2();
int BondOperationsTest();
int MatrixExpTest();
int TensorTest();
int MPSTest();
int MPOTest();
int OperationTest();
int LanczosTest();
int HamiltonianHeisenbergTest();
int HamiltonianIsingTest();
int HamiltonianBoseHubbardTest();
int HamiltonianFermiHubbardTest();
int MinimizationTest();
int DynamicsTest();
int PEPSTest();
int PEPSTest2();


int main()
{
	test_function_t tests[] = { MatrixExpTest, TensorTest, LanczosTest,
		#if NQNUMBER == 1
		QuantumNumberTest, BondOperationsTest, MPSTest, MPOTest, OperationTest, HamiltonianHeisenbergTest, HamiltonianIsingTest, HamiltonianBoseHubbardTest, MinimizationTest, DynamicsTest,
		#elif NQNUMBER == 2
		QuantumNumberTest2, OperationTest, HamiltonianFermiHubbardTest,
		#endif
		PEPSTest, PEPSTest2
	};

	bool pass = true;

	size_t i;
	for (i = 0; i < sizeof(tests)/sizeof(tests[0]); i++)
	{
		int status = tests[i]();

		// print status message
		if (status < 0)
		{
			printf("Test crashed with internal problem!\n");
		}
		else if (status > 0)
		{
			printf("Test failed!\n");
		}
		else    // status == 0
		{
			printf("Test passed.\n");
		}

		printf("________________________________________________________________________________\n");

		if (status != 0) {
			pass = false;
		}
	}

	if (pass)
	{
		printf("All tests passed :-)\n");
	}
	else
	{
		printf("At least one test failed or crashed :-(\n");
	}

	MKL_Free_Buffers();

	int nbuffers;
	MKL_INT64 nbytes_alloc;
	nbytes_alloc = MKL_Mem_Stat(&nbuffers);
	if (nbytes_alloc > 0)
	{
		printf("\nMKL memory leak detected! MKL still uses %lld bytes in %d buffer(s).\n", nbytes_alloc, nbuffers);
	}
	else
	{
		printf("\nMKL memory leak check appears to be fine.\n");
	}

	return 0;
}
