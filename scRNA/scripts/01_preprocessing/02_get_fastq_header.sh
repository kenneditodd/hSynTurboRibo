#!/bin/bash
# This script will print to standard out.
# Redirect output to save.

# set variables
cd ../../
files=refs/fastq_file_list.txt

# print fastq file name + header
cat $files | while read partFile
do
  file=$(/research/labs/neurology/fryer/projects/hSynTurboRibo/PS19_P0_snRNAseq/01.RawData/$partFile)
  header=$(zcat $file | head -1)
  echo -n $file && echo -ne '\t' && echo $header
done