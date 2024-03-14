#!/bin/sh
#SBATCH --job-name n10x_count
#SBATCH --mem 75G
#SBATCH --tasks 20
#SBATCH --output logs/%x.%j.stdout
#SBATCH --error logs/%x.%j.stderr
#SBATCH --partition cpu-med
#SBATCH --time 08:00:00 ## HH:MM:SS
#SBATCH --propagate=NONE


# change directory to your desired output folder
cd ../../counts

# source settings
source $HOME/.bash_profile

# get cellranger version
cellranger -V

# print sample
sample=$1
echo "sample: $sample"

# run cellranger
cellranger count \
	--id=$sample \
	--sample=$sample \
	--fastqs=/research/labs/neurology/fryer/projects/hSynTurboRibo/PS19_P0_snRNAseq/01.RawData/$sample \
	--transcriptome=/research/labs/neurology/fryer/projects/references/mouse/refdata-gex-mm10-2020-A \
	--localcores=20 \
	--localmem=75


