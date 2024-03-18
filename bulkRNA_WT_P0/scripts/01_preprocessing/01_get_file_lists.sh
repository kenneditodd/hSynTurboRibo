#!/bin/bash

# get sample list
cd /research/labs/neurology/fryer/projects/hSynTurboRibo/WT_PS19_P0_short_read/01.RawData
out=/research/labs/neurology/fryer/m214960/hSynTurboRibo/bulkRNA_WT_P0/refs/sample_file_list.txt
ls -1 | grep WP > $out

# get fastq list
out=/research/labs/neurology/fryer/m214960/hSynTurboRibo/bulkRNA_WT_P0/refs/fastq_file_list.txt
find ~+ -type f -regex ".+fq.gz" | grep WP > $out

# get R1 fastq list
out=/research/labs/neurology/fryer/m214960/hSynTurboRibo/bulkRNA_WT_P0/refs/R1_fastq_file_list.txt
find ~+ -type f -regex ".+fq.gz" | grep WP | grep _1.fq.gz > $out