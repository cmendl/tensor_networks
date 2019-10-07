# source files
SRCFILES = src/bond_ops.c src/dupio.c src/lanczos.c src/tensor.c src/qnumber.c src/util.c src/peps.c src/sim_params.c src/mps.c src/mpo.c src/operation.c src/minimization.c src/dynamics.c src/hamiltonian_ising.c src/hamiltonian_heisenberg.c src/hamiltonian_bose_hubbard.c src/hamiltonian_fermi_hubbard.c src/profiler.c
# test files
TSTFILES = test/matrix_exp_test.c test/tensor_test.c test/lanczos_test.c test/qnumber_test.c test/qnumber_test2.c test/bond_ops_test.c test/mps_test.c test/mpo_test.c test/operation_test.c test/hamiltonian_heisenberg_test.c test/hamiltonian_ising_test.c test/hamiltonian_bose_hubbard_test.c test/hamiltonian_fermi_hubbard_test.c test/minimization_test.c test/dynamics_test.c test/peps_test.c test/peps_test2.c


# This configuration uses gcc with generic CBLAS and LAPACKE libraries, and enables OpenMP parallelization.
CC = gcc
# compiler options
CCOPTS = -Wall -O2 -Iinclude -fopenmp -DNDEBUG -DMEM_DATA_ALIGN=64 -D"__assume_aligned(p,a)" -DGIT_COMMIT=\"$(shell git describe --always)\" -DPROFILER_ENABLE
# set these with appropriate libraries for your system
LIBRARIES = -lm -lblas -llapacke

## The following configuration selects the Intel compiler with MKL, and enables OpenMP parallelization.
#CC = icc
## compiler options
#CCOPTS = -Wall -O2 -restrict -Iinclude -qopenmp -DNDEBUG -DMEM_DATA_ALIGN=64 -DGIT_COMMIT=\"$(shell git describe --always)\" -DPROFILER_ENABLE -DUSE_MKL -Dlapack_complex_double="double _Complex" -mkl:sequential
## set these with appropriate libraries for your system
#LIBRARIES = -mkl:sequential -lrt


all: proj_heisenberg proj_heisenberg_XXZ_current proj_bose_hubbard proj_bose_hubbard_rho proj_bose_hubbard_time proj_bose_hubbard_otoc proj_fermi_hubbard_rho proj_fermi_hubbard_time_current proj_ising_otoc proj_ising_otoc_comm proj_test

proj_heisenberg: ${SRCFILES} src/main_heisenberg.c
	${CC} ${CCOPTS} -o bin/sim_heisenberg $? ${LIBRARIES}

proj_heisenberg_XXZ_current: ${SRCFILES} src/main_heisenberg_XXZ_current.c
	${CC} ${CCOPTS} -o bin/sim_heisenberg_XXZ_current $? ${LIBRARIES}

proj_bose_hubbard: ${SRCFILES} src/main_bose_hubbard.c
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard $? ${LIBRARIES}

proj_bose_hubbard_rho: ${SRCFILES} src/main_bose_hubbard_rho.c
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard_rho $? ${LIBRARIES}

proj_bose_hubbard_time: ${SRCFILES} src/main_bose_hubbard_time.c
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard_time $? ${LIBRARIES}

proj_bose_hubbard_otoc: ${SRCFILES} src/main_bose_hubbard_otoc.c
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard_otoc $? ${LIBRARIES}

proj_fermi_hubbard_rho: ${SRCFILES} src/main_fermi_hubbard_rho.c
	${CC} ${CCOPTS} -o bin/sim_fermi_hubbard_rho $? ${LIBRARIES}

proj_fermi_hubbard_time_current: ${SRCFILES} src/main_fermi_hubbard_time_current.c
	${CC} ${CCOPTS} -o bin/sim_fermi_hubbard_time_current $? ${LIBRARIES}

proj_ising_otoc: ${SRCFILES} src/main_ising_otoc.c
	${CC} ${CCOPTS} -o bin/sim_ising_otoc $? ${LIBRARIES}

proj_ising_otoc_comm:${SRCFILES} src/main_ising_otoc_comm.c
	${CC} ${CCOPTS} -o bin/sim_ising_otoc_comm $? ${LIBRARIES}

proj_test: ${SRCFILES} ${TSTFILES} test/run_tests.c
	${CC} ${CCOPTS} -o test/run_tests $? ${LIBRARIES}
