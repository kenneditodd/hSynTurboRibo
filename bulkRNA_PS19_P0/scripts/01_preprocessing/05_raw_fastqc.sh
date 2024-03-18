#!/bin/sh
#SBATCH --job-name raw_fastqc
#SBATCH --mem 50G
#SBATCH --tasks 30
#SBATCH --mail-user todd.kennedi@mayo.edu
#SBATCH --mail-type END,FAIL
#SBATCH --output logs/%x.%j.stdout
#SBATCH --error logs/%x.%j.stderr
#SBATCH --partition cpu-short
#SBATCH --time 8:00:00 ## HH:MM:SS

# activate conda environment
source $HOME/.bash_profile
conda activate turboribo

# change directory to raw reads
cd /research/labs/neurology/fryer/projects/hSynTurboRibo/WT_PS19_P0_short_read/01.RawData

# run raw fastqc
out=/research/labs/neurology/fryer/m214960/hSynTurboRibo/bulkRNA_PS19_P0/rawQC
fastqc --threads 30 --outdir $out PP*/PP*.fq.gz

# multiqc
cd /research/labs/neurology/fryer/m214960/hSynTurboRibo/bulkRNA_PS19_P0/rawQC
multiqc *.zip --interactive --filename raw_reads_multiqc

