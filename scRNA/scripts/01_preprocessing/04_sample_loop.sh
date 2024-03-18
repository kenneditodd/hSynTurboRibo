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

  # get id, output dir name (i.e. PP_13)
  id=$(echo $prefix | sed -s 's/.*RawData\/\(PP.*\)\/.*/\1/')
  
  # get sample, the prefix to what all files for that sample have in common (i.e. PP_13_CKDL240007381-1A_H2T5GDSXC)
  sample=$(echo $prefix | sed -s 's/.*\/\(.*\)/\1/')
  
  # get path to the entire FOLDER containing scRNA fastq files
  fastqs=$(echo $prefix | sed -s 's/\(.*RawData\/PP.*\)\/.*/\1/')
  
  # pass to script
  sbatch 03_count.sh $id $sample $fastqs
done

#works
#cellranger count --id=PP_14 --sample=PP_14_CKDL240007382-1A_H2T5GDSXC --fastqs=/research/labs/neurology/fryer/projects/hSynTurboRibo/PS19_P0_snRNAseq/01.RawData/PP_14 --transcriptome=/research/labs/neurology/fryer/projects/references/mouse/refdata-gex-mm10-2020-A
# cleanup
rm R1_prefix.txt
