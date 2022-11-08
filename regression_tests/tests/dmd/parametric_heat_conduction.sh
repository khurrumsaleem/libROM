#!/bin/bash
source $GITHUB_WORKSPACE/regression_tests/common.sh

CMDS=( 
    "rm -rf parameters.txt" 
    "$COMMAND parametric_heat_conduction -r 0.4  -offline -rdim 16" 
    "$COMMAND parametric_heat_conduction -r 0.45 -offline -rdim 16"
    "$COMMAND parametric_heat_conduction -r 0.55 -offline -rdim 16"
    "$COMMAND parametric_heat_conduction -r 0.6 -offline -rdim 16"
    "$COMMAND parametric_heat_conduction -r 0.5 -online -predict"
)
TYPE="DMD"
run_tests

#cd ${EX_DMD_PATH_LOCAL}
#run_cmds


#cd ${EX_DMD_PATH_BASELINE} # Baseline(master) branch libROM
#run_cmds

#cd ${GITHUB_WORKSPACE}/build/tests

#./solutionComparator ${EX_DMD_PATH_LOCAL}/parametric_heat_conduction_0.400000_0.010000_0.000000_0.000000-final.000000 ${EX_DMD_PATH_BASELINE}/parametric_heat_conduction_0.400000_0.010000_0.000000_0.000000-final.000000 "1.0e-5" "8"
#check_fail

#move_output_files