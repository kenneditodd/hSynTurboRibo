#!/bin/sh
#SBATCH --job-name trim_reads
#SBATCH --mem 10G
#SBATCH --mail-user todd.kennedi@mayo.edu
#SBATCH --mail-type END,FAIL
#SBATCH --output logs/%x.%j.stdout
#SBATCH --error logs/%x.%j.stderr
#SBATCH --partition cpu-short
#SBATCH --time 24:00:00 ## HH:MM:SS

# activate conda environment
source $HOME/.bash_profile
conda activate aducanumab

# trimmed reads
bbduk.sh -Xmx3g in1=../../rawData/SRR19850635_1.fastq.gz \
                in2=../../rawData/SRR19850635_2.fastq.gz \
                out1=../../trimmedData/SRR19850635_trim_1.fastq.gz \
                out2=../../trimmedData/SRR19850635_trim_2.fastq.gz \
                ref=../../refs/adapters.fa \
                ktrim=r \
                k=23 \
                mink=11 \
                hdist=1 \
                tpe \
                tbo

