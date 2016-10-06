SRCFILES = mps.o mpo.o hamiltonian.o dynamics.o peps.o tensor.o util.o sim_params.o dupio.o
TSTFILES = matrix_exp_test.o mps_test.o mps_test2.o mpo_test.o hamiltonian_heisenberg_test.o hamiltonian_bose_hubbard_test.o dynamics_test.o peps_test.o peps_test2.o tensor_test.o

# use Intel compiler
CC = icc

# compiler options
CCOPTS = -Wall -O2 -xHost -Iinclude -DNDEBUG -restrict -DMEM_DATA_ALIGN=64 -mkl:parallel

# set these with appropriate libraries for your system
LIBRARIES = -mkl:parallel -lrt


all: proj_heisenberg proj_bose_hubbard proj_bose_hubbard_rho proj_bose_hubbard_time proj_bose_hubbard_imag_time proj_bose_hubbard_otoc proj_bose_hubbard_otoc_quench proj_bose_hubbard_hole proj_test

proj_heisenberg: ${SRCFILES} main_heisenberg.o
	${CC} ${CCOPTS} -o bin/sim_heisenberg $? ${LIBRARIES}

proj_bose_hubbard: ${SRCFILES} main_bose_hubbard.o
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard $? ${LIBRARIES}

proj_bose_hubbard_rho: ${SRCFILES} main_bose_hubbard_rho.o
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard_rho $? ${LIBRARIES}

proj_bose_hubbard_time: ${SRCFILES} main_bose_hubbard_time.o
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard_time $? ${LIBRARIES}

proj_bose_hubbard_imag_time: ${SRCFILES} main_bose_hubbard_imag_time.o
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard_imag_time $? ${LIBRARIES}

proj_bose_hubbard_otoc: ${SRCFILES} main_bose_hubbard_otoc.o
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard_otoc $? ${LIBRARIES}

proj_bose_hubbard_otoc_quench: ${SRCFILES} main_bose_hubbard_otoc_quench.o
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard_otoc_quench $? ${LIBRARIES}

proj_bose_hubbard_hole: ${SRCFILES} main_bose_hubbard_hole.o
	${CC} ${CCOPTS} -o bin/sim_bose_hubbard_hole $? ${LIBRARIES}

proj_test: ${SRCFILES} ${TSTFILES} run_tests.o
	${CC} ${CCOPTS} -o bin/run_tests $? ${LIBRARIES}


%.o: src/%.c
	${CC} -c -I../include ${CCOPTS} $<


run_tests.o: test/run_tests.c
	${CC} -c -I../include ${CCOPTS} $<


matrix_exp_test.o: test/matrix_exp_test.c
	${CC} -c -I../include ${CCOPTS} $<

mps_test.o: test/mps_test.c
	${CC} -c -I../include ${CCOPTS} $<

mps_test2.o: test/mps_test2.c
	${CC} -c -I../include ${CCOPTS} $<

mpo_test.o: test/mpo_test.c
	${CC} -c -I../include ${CCOPTS} $<

hamiltonian_heisenberg_test.o: test/hamiltonian_heisenberg_test.c
	${CC} -c -I../include ${CCOPTS} $<

hamiltonian_bose_hubbard_test.o: test/hamiltonian_bose_hubbard_test.c
	${CC} -c -I../include ${CCOPTS} $<

dynamics_test.o: test/dynamics_test.c
	${CC} -c -I../include ${CCOPTS} $<

peps_test.o: test/peps_test.c
	${CC} -c -I../include ${CCOPTS} $<

peps_test2.o: test/peps_test2.c
	${CC} -c -I../include ${CCOPTS} $<

tensor_test.o: test/tensor_test.c
	${CC} -c -I../include ${CCOPTS} $<


clean:
	rm *.o
