# common object files,
# object files compiled with NQNUMBER=1 preprocessor constant (one quantum number), and
# object files compiled with NQNUMBER=2 preprocessor constant (two quantum numbers)
OBJFILES = dupio.o lanczos.o tensor.o util.o peps.o sim_params.o
OBJFILES1 = qnumber1.o bond_ops1.o mps1.o mpo1.o operation1.o minimization1.o dynamics1.o hamiltonian_ising.o hamiltonian_heisenberg.o hamiltonian_bose_hubbard.o
OBJFILES2 = qnumber2.o bond_ops2.o mps2.o mpo2.o operation2.o minimization2.o dynamics2.o hamiltonian_fermi_hubbard.o 

# object files for tests, partitioned into corresponding number of quantum numbers
TSTFILES  = matrix_exp_test.o tensor_test.o lanczos_test.o peps_test.o peps_test2.o
TSTFILES1 = qnumber_test.o bond_ops_test.o mps_test.o mpo_test.o operation_test1.o hamiltonian_heisenberg_test.o hamiltonian_ising_test.o hamiltonian_bose_hubbard_test.o minimization_test.o dynamics_test.o
TSTFILES2 = qnumber_test2.o operation_test2.o hamiltonian_fermi_hubbard_test.o

# Intel compiler
CC = icc

# compiler options
CCOPTS = -Wall -O2 -Iinclude -DNDEBUG -restrict -DMEM_DATA_ALIGN=64 -DGIT_COMMIT=\"$(shell git describe --always)\" -qopenmp -mkl:sequential

# set these with appropriate libraries for your system
LIBRARIES = -mkl:sequential -lrt


all: proj_heisenberg proj_bose_hubbard proj_bose_hubbard_rho proj_bose_hubbard_time proj_bose_hubbard_otoc proj_fermi_hubbard_rho proj_fermi_hubbard_time_current proj_ising_otoc proj_ising_otoc_comm proj_test1 proj_test2

proj_heisenberg: ${OBJFILES} ${OBJFILES1} main_heisenberg.o
	${CC} ${CCOPTS} -o bin/sim_heisenberg $? ${LIBRARIES}

proj_bose_hubbard: ${OBJFILES} ${OBJFILES1} main_bose_hubbard.o
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard $? ${LIBRARIES}

proj_bose_hubbard_rho: ${OBJFILES} ${OBJFILES1} main_bose_hubbard_rho.o
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard_rho $? ${LIBRARIES}

proj_bose_hubbard_time: ${OBJFILES} ${OBJFILES1} main_bose_hubbard_time.o
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard_time $? ${LIBRARIES}

proj_bose_hubbard_otoc: ${OBJFILES} ${OBJFILES1} main_bose_hubbard_otoc.o
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard_otoc $? ${LIBRARIES}

proj_fermi_hubbard_rho: ${OBJFILES} ${OBJFILES2} main_fermi_hubbard_rho.o
	${CC} ${CCOPTS} -o bin/sim_fermi_hubbard_rho $? ${LIBRARIES}

proj_fermi_hubbard_time_current: ${OBJFILES} ${OBJFILES2} main_fermi_hubbard_time_current.o
	${CC} ${CCOPTS} -o bin/sim_fermi_hubbard_time_current $? ${LIBRARIES}

proj_ising_otoc: ${OBJFILES} ${OBJFILES1} main_ising_otoc.o
	${CC} ${CCOPTS} -o bin/sim_ising_otoc $? ${LIBRARIES}

proj_ising_otoc_comm:${OBJFILES} ${OBJFILES1} main_ising_otoc_comm.o
	${CC} ${CCOPTS} -o bin/sim_ising_otoc_comm $? ${LIBRARIES}

proj_test1: ${OBJFILES} ${OBJFILES1} ${TSTFILES} ${TSTFILES1} run_tests1.o
	${CC} ${CCOPTS} -o bin/run_tests1 $? ${LIBRARIES}

proj_test2: ${OBJFILES} ${OBJFILES2} ${TSTFILES} ${TSTFILES2} run_tests2.o
	${CC} ${CCOPTS} -o bin/run_tests2 $? ${LIBRARIES}


qnumber1.o: src/qnumber.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 -o qnumber1.o $<
qnumber2.o: src/qnumber.c
	${CC} -c ${CCOPTS} -DNQNUMBER=2 -o qnumber2.o $<

bond_ops1.o: src/bond_ops.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 -o bond_ops1.o $<
bond_ops2.o: src/bond_ops.c
	${CC} -c ${CCOPTS} -DNQNUMBER=2 -o bond_ops2.o $<

mps1.o: src/mps.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 -o mps1.o $<
mps2.o: src/mps.c
	${CC} -c ${CCOPTS} -DNQNUMBER=2 -o mps2.o $<

mpo1.o: src/mpo.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 -o mpo1.o $<
mpo2.o: src/mpo.c
	${CC} -c ${CCOPTS} -DNQNUMBER=2 -o mpo2.o $<

operation1.o: src/operation.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 -o operation1.o $<
operation2.o: src/operation.c
	${CC} -c ${CCOPTS} -DNQNUMBER=2 -o operation2.o $<

minimization1.o: src/minimization.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 -o minimization1.o $<
minimization2.o: src/minimization.c
	${CC} -c ${CCOPTS} -DNQNUMBER=2 -o minimization2.o $<

dynamics1.o: src/dynamics.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 -o dynamics1.o $<
dynamics2.o: src/dynamics.c
	${CC} -c ${CCOPTS} -DNQNUMBER=2 -o dynamics2.o $<

hamiltonian_ising.o: src/hamiltonian_ising.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

hamiltonian_heisenberg.o: src/hamiltonian_heisenberg.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

hamiltonian_bose_hubbard.o: src/hamiltonian_bose_hubbard.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

hamiltonian_fermi_hubbard.o: src/hamiltonian_fermi_hubbard.c
	${CC} -c ${CCOPTS} -DNQNUMBER=2 $<

main_heisenberg.o: src/main_heisenberg.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

main_bose_hubbard.o: src/main_bose_hubbard.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

main_bose_hubbard_rho.o: src/main_bose_hubbard_rho.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

main_bose_hubbard_time.o: src/main_bose_hubbard_time.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

main_bose_hubbard_otoc.o: src/main_bose_hubbard_otoc.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

main_fermi_hubbard_rho.o: src/main_fermi_hubbard_rho.c
	${CC} -c ${CCOPTS} -DNQNUMBER=2 $<

main_fermi_hubbard_time_current.o: src/main_fermi_hubbard_time_current.c
	${CC} -c ${CCOPTS} -DNQNUMBER=2 $<

main_ising_otoc.o: src/main_ising_otoc.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

main_ising_otoc_comm.o: src/main_ising_otoc_comm.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<


%.o: src/%.c
	${CC} -c ${CCOPTS} $<


run_tests1.o: test/run_tests.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 -o run_tests1.o $<
run_tests2.o: test/run_tests.c
	${CC} -c ${CCOPTS} -DNQNUMBER=2 -o run_tests2.o $<

matrix_exp_test.o: test/matrix_exp_test.c
	${CC} -c ${CCOPTS} $<

tensor_test.o: test/tensor_test.c
	${CC} -c ${CCOPTS} $<

lanczos_test.o: test/lanczos_test.c
	${CC} -c ${CCOPTS} $<

qnumber_test.o: test/qnumber_test.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

qnumber_test2.o: test/qnumber_test2.c
	${CC} -c ${CCOPTS} -DNQNUMBER=2 $<

bond_ops_test.o: test/bond_ops_test.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

mps_test.o: test/mps_test.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

mpo_test.o: test/mpo_test.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

operation_test1.o: test/operation_test.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 -o operation_test1.o $<
operation_test2.o: test/operation_test.c
	${CC} -c ${CCOPTS} -DNQNUMBER=2 -o operation_test2.o $<

hamiltonian_heisenberg_test.o: test/hamiltonian_heisenberg_test.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

hamiltonian_ising_test.o: test/hamiltonian_ising_test.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

hamiltonian_bose_hubbard_test.o: test/hamiltonian_bose_hubbard_test.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

hamiltonian_fermi_hubbard_test.o: test/hamiltonian_fermi_hubbard_test.c
	${CC} -c ${CCOPTS} -DNQNUMBER=2 $<

minimization_test.o: test/minimization_test.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

dynamics_test.o: test/dynamics_test.c
	${CC} -c ${CCOPTS} -DNQNUMBER=1 $<

peps_test.o: test/peps_test.c
	${CC} -c ${CCOPTS} $<

peps_test2.o: test/peps_test2.c
	${CC} -c ${CCOPTS} $<


clean:
	rm *.o
