#!/bin/bash
source $GITHUB_WORKSPACE/regression_tests/common.sh

cd ${GITHUB_WORKSPACE}/build/examples/dmd
mpirun -np 8 heat_conduction -s 1 -a 0.0 -k 1.0 
#mpirun -np 8 heat_conduction -s 3 -a 0.5 -k 0.5 -o 4 -tf 0.7 -vs 1


cd ${BASELINE_DIR}/libROM/build/examples/dmd # Baseline(master) branch libROM
mpirun -np 8 heat_conduction -s 1 -a 0.0 -k 1.0 
#mpirun -np 8 heat_conduction -s 3 -a 0.5 -k 0.5 -o 4 -tf 0.7 -vs 1

cd ${GITHUB_WORKSPACE}/build/tests

#./basisComparator ${GITHUB_WORKSPACE}/build/examples/dmd/heat_conduction-final ${BASELINE_DIR}/libROM/build/examples/dmd/heat_conduction-final 1e-7 1
./solutionComparator ${GITHUB_WORKSPACE}/build/examples/dmd/heat_conduction-final.000000 ${BASELINE_DIR}/libROM/build/examples/dmd/heat_conduction-final.000000 "1.0e-5" "$1"












