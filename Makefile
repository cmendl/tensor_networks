# common object files
OBJFILES = bond_ops.o dupio.o lanczos.o tensor.o qnumber.o util.o peps.o sim_params.o mps.o mpo.o operation.o minimization.o dynamics.o hamiltonian_ising.o hamiltonian_heisenberg.o hamiltonian_bose_hubbard.o hamiltonian_fermi_hubbard.o profiler.o

# object files for tests
TSTFILES = matrix_exp_test.o tensor_test.o lanczos_test.o qnumber_test.o qnumber_test2.o bond_ops_test.o mps_test.o mpo_test.o operation_test.o hamiltonian_heisenberg_test.o hamiltonian_ising_test.o hamiltonian_bose_hubbard_test.o hamiltonian_fermi_hubbard_test.o minimization_test.o dynamics_test.o peps_test.o peps_test2.o

# Intel compiler
CC = icc

# compiler options
CCOPTS = -std=c99 -Wall -O2 -restrict -Iinclude -qopenmp -DNDEBUG -DMEM_DATA_ALIGN=64 -DGIT_COMMIT=\"$(shell git describe --always)\" -DPROFILER_ENABLE -Dlapack_complex_double="double _Complex" -mkl:sequential

# set these with appropriate libraries for your system
LIBRARIES = -mkl:sequential -lrt


all: proj_heisenberg proj_heisenberg_XXZ_current proj_bose_hubbard proj_bose_hubbard_rho proj_bose_hubbard_time proj_bose_hubbard_otoc proj_fermi_hubbard_rho proj_fermi_hubbard_time_current proj_ising_otoc proj_ising_otoc_comm proj_test

proj_heisenberg: ${OBJFILES} main_heisenberg.o
	${CC} ${CCOPTS} -o bin/sim_heisenberg $? ${LIBRARIES}

proj_heisenberg_XXZ_current: ${OBJFILES} main_heisenberg_XXZ_current.o
	${CC} ${CCOPTS} -o bin/sim_heisenberg_XXZ_current $? ${LIBRARIES}

proj_bose_hubbard: ${OBJFILES} main_bose_hubbard.o
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard $? ${LIBRARIES}

proj_bose_hubbard_rho: ${OBJFILES} main_bose_hubbard_rho.o
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard_rho $? ${LIBRARIES}

proj_bose_hubbard_time: ${OBJFILES} main_bose_hubbard_time.o
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard_time $? ${LIBRARIES}

proj_bose_hubbard_otoc: ${OBJFILES} main_bose_hubbard_otoc.o
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard_otoc $? ${LIBRARIES}

proj_fermi_hubbard_rho: ${OBJFILES} main_fermi_hubbard_rho.o
	${CC} ${CCOPTS} -o bin/sim_fermi_hubbard_rho $? ${LIBRARIES}

proj_fermi_hubbard_time_current: ${OBJFILES} main_fermi_hubbard_time_current.o
	${CC} ${CCOPTS} -o bin/sim_fermi_hubbard_time_current $? ${LIBRARIES}

proj_ising_otoc: ${OBJFILES} main_ising_otoc.o
	${CC} ${CCOPTS} -o bin/sim_ising_otoc $? ${LIBRARIES}

proj_ising_otoc_comm:${OBJFILES} main_ising_otoc_comm.o
	${CC} ${CCOPTS} -o bin/sim_ising_otoc_comm $? ${LIBRARIES}

proj_test: ${OBJFILES} ${TSTFILES} run_tests.o
	${CC} ${CCOPTS} -o bin/run_tests $? ${LIBRARIES}


%.o: src/%.c
	${CC} -c ${CCOPTS} $<


run_tests.o: test/run_tests.c
	${CC} -c ${CCOPTS} -o run_tests.o $<

matrix_exp_test.o: test/matrix_exp_test.c
	${CC} -c ${CCOPTS} $<

tensor_test.o: test/tensor_test.c
	${CC} -c ${CCOPTS} $<

lanczos_test.o: test/lanczos_test.c
	${CC} -c ${CCOPTS} $<

qnumber_test.o: test/qnumber_test.c
	${CC} -c ${CCOPTS} $<

qnumber_test2.o: test/qnumber_test2.c
	${CC} -c ${CCOPTS} $<

bond_ops_test.o: test/bond_ops_test.c
	${CC} -c ${CCOPTS} $<

mps_test.o: test/mps_test.c
	${CC} -c ${CCOPTS} $<

mpo_test.o: test/mpo_test.c
	${CC} -c ${CCOPTS} $<

operation_test.o: test/operation_test.c
	${CC} -c ${CCOPTS} -o operation_test.o $<

hamiltonian_heisenberg_test.o: test/hamiltonian_heisenberg_test.c
	${CC} -c ${CCOPTS} $<

hamiltonian_ising_test.o: test/hamiltonian_ising_test.c
	${CC} -c ${CCOPTS} $<

hamiltonian_bose_hubbard_test.o: test/hamiltonian_bose_hubbard_test.c
	${CC} -c ${CCOPTS} $<

hamiltonian_fermi_hubbard_test.o: test/hamiltonian_fermi_hubbard_test.c
	${CC} -c ${CCOPTS} $<

minimization_test.o: test/minimization_test.c
	${CC} -c ${CCOPTS} $<

dynamics_test.o: test/dynamics_test.c
	${CC} -c ${CCOPTS} $<

peps_test.o: test/peps_test.c
	${CC} -c ${CCOPTS} $<

peps_test2.o: test/peps_test2.c
	${CC} -c ${CCOPTS} $<


clean:
	rm *.o
