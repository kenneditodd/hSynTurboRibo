# https://www.ncbi.nlm.nih.gov/sra/docs/sradownload/

# export path
export PATH=$PATH:/research/labs/neurology/fryer/m214960/tools/sratoolkit.3.0.7-centos_linux64/bin

# download the runs in SRA format with the prefetch command
# convert .sra to .fastq with fastq-dump
cat ../../refs/SRR_Acc_List.txt | while read line
do
  echo $line;
  cd /research/labs/neurology/fryer/m214960/mouseTBI/rawReads;
  prefetch $line;
  cd $line;
  fastq-dump --split-3 "$line".sra;
  gzip *.fastq
done