#!/bin/bash

# Go to project folder
cd /research/labs/neurology/fryer/projects/hSynTurboRibo/PS19_P0_snRNAseq/01.RawData

# get fastq filename
out=/research/labs/neurology/fryer/m214960/hSynTurboRibo/scRNA/refs/fastq_file_list.txt
find -type f -regex ".+fastq.gz" | grep PP > $out
