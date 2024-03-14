#!/bin/bash

# Get fastq file list
# There are 8 fastq files per sample
# Each sample has R1 and R2 on all 4 lanes
cd /research/labs/neurology/fryer/m214960/mouseTBI/rawData
out=/research/labs/neurology/fryer/m214960/mouseTBI/refs/fastq_file_list.txt
ls -1 | grep .fastq.gz > $out

# Get sample file list
cd /research/labs/neurology/fryer/m214960/mouseTBI/rawData
out=/research/labs/neurology/fryer/m214960/mouseTBI/refs/sample_file_list.txt
ls -1 | grep _1.fastq.gz > $out