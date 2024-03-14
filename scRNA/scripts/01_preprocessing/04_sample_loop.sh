#!/bin/bash
for sample in $(cat ../../refs/sample_file_list.txt)
do
  sbatch 03_count.sh $sample
done

