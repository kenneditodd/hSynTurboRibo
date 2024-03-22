#!/bin/bash

for sample in PP_4 PP_11 PP_13 PP_14 PP_15 PP_19 PP_22 PP_23
do
  # pass to script
  sbatch 02_submit_Rscript.sh $sample
done