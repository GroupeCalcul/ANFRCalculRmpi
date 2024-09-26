##!/bin/bash
#OAR --project pr-groupecalcul
#OAR -n hello_rmpi
#OAR -l /nodes=1/core=4,walltime=00:01:00
#OAR --stdout hello_mpi.out
#OAR --stderr hello_mpi.err

## Ensure conda is loaded. The following line can be into your ~/.bashrc file.
source /applis/environments/conda.sh

## Run the program
conda activate rmpi
mpirun --np 4 --machinefile $OAR_NODE_FILE --mca plm_rsh_agent "oarsh" $OAR_WORKING_DIRECTORY/hello_mpi
mpirun --np 4 --machinefile $OAR_NODE_FILE --mca plm_rsh_agent "oarsh" Rscript --vanilla $OAR_WORKING_DIRECTORY/hello_mpi.R
