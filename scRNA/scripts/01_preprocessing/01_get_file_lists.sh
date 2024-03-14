#!/bin/bash

# Go to project folder
cd /research/labs/neurology/fryer/projects/hSynTurboRibo/PS19_P0_snRNAseq/01.RawData

# Get file names
out=/research/labs/neurology/fryer/m214960/hSynTurboRibo/scRNA/refs/fastq_file_list.txt
find -type f -regex ".+fastq.gz" | grep PP > $out
sed -i -e 's/\.\///g' $out # remove ./ at the begining of each path
pattern="_S[0-9]_L004_[IR][12]_001\.fastq\.gz"
sed -i -e "s/$pattern//g" $out # remove _S2_L004_R2_001.fastq.gz

# Get sample names
out=/research/labs/neurology/fryer/m214960/hSynTurboRibo/scRNA/refs/sample_file_list.txt
find -type f -regex ".+fastq.gz" | grep PP | grep R1 > $out
sed -i -e 's/\.\///g' $out # remove ./ at the begining of each path
pattern="_S[0-9]_L004_[IR][12]_001\.fastq\.gz"
sed -i -e "s/$pattern//g" $out # remove _S2_L004_R2_001.fastq.gz
