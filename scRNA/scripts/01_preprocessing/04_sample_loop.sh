#!/bin/bash

# get first read
cat ../../refs/fastq_file_list.txt | grep R1 > R1_prefix.txt
# remove ./ at the begining of each path
sed -i -e 's/\.\///g' R1_prefix.txt
# remove suffix
pattern="_S[0-9]_L004_[IR][12]_001\.fastq\.gz"
sed -i -e "s/$pattern//g" R1_prefix.txt

# pass parsed names to script
for prefix in $(cat R1_prefix.txt)
do
  
  # get sample
  sample=$(echo $prefix | sed -s 's/.*\/\(.*\)/\1/')
  
  # get id
  id=$(echo $prefix | sed -s 's/\(.*\)\/.*/\1/')
  echo $id
  
  # get path
  fastqs=$(echo /research/labs/neurology/fryer/projects/hSynTurboRibo/PS19_P0_snRNAseq/01.RawData/$id)
  
  # pass to script
  sbatch 03_count.sh $id $sample $fastqs
done

# cleanup
rm R1_prefix.txt
