#!/bin/sh
#SBATCH --job-name mkref
#SBATCH --mem 25G
#SBATCH --tasks 20
#SBATCH --output logs/%x.%j.stdout
#SBATCH --error logs/%x.%j.stderr
#SBATCH --partition cpu-short
#SBATCH --time 24:00:00 ## HH:MM:SS
#SBATCH --propagate=NONE

# source settings
source $HOME/.bash_profile

# get cellranger version
cellranger -V

# set ref path
ref=/research/labs/neurology/fryer/projects/references/mouse/PS19_TurboRibo_refdata-gex-mm10-2020-A

# make new ref
# refdata-gex-mm10-2020-A with TurboRibo and TgMAPT added
cellranger mkref \
    --genome=$ref/cellrangerGenomeDir \
    --fasta=$ref/fasta/genome.fa \
    --fasta=$ref/fasta/MAPT_transgene.fa \
    --fasta=$ref/fasta/turbo_ribo_construct.fa \
    --genes=$ref/genes/genes.gtf \
    --nthreads=20
