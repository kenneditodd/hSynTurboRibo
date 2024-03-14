#!/bin/sh
#SBATCH --job-name trimmed_fastqc
#SBATCH --mem 50G
#SBATCH --tasks 30
#SBATCH --mail-user todd.kennedi@mayo.edu
#SBATCH --mail-type END,FAIL
#SBATCH --output logs/%x.%N.%j.stdout
#SBATCH --error logs/%x.%j.stderr
#SBATCH --partition cpu-short
#SBATCH --time 4:00:00 ## HH:MM:SS

# activate conda environment
source $HOME/.bash_profile
conda activate meningitis

# change directory to raw reads
cd ../..//trimmedReads

# run raw fastqc
fastqc --threads 30 --outdir ../trimmedQC *.fastq.gz

# multiqc
cd ../trimmedQC
multiqc *.zip --interactive --filename trimmed_reads_multiqc
