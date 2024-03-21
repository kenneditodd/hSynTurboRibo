#!/bin/bash

# get sample list
cd /research/labs/neurology/fryer/projects/hSynTurboRibo/PS19_P0_snRNAseq/01.RawData
out=/research/labs/neurology/fryer/m214960/hSynTurboRibo/snRNA/refs/sample_file_list.txt
ls -1 | grep PP > $out

# get fastq list
out=/research/labs/neurology/fryer/m214960/hSynTurboRibo/snRNA/refs/fastq_file_list.txt
find ~+ -type f -regex ".+fastq.gz" | grep PP > $out
