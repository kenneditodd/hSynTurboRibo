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
id=$1
sample=$2
fastqs=$3
echo "sample: $sample"

# run cellranger
cellranger count \
	--id=$id \
	--sample=$sample \
	--fastqs=$fastqs \
	--transcriptome=/research/labs/neurology/fryer/projects/references/mouse/refdata-gex-mm10-2020-A \
	--localcores=20 \
	--localmem=75

# --id is a unique run id, 
# --sample is the the unique prefix cellranger will look for in all the fastq files
# --fastqs is the path to the entire FOLDER containing scRNA fastq files.
# --transcriptome path to the reference genome
# --localcores will restrict cellranger to x cores    
# --localmem will restrict cellranger to xG memory which is need in order to run, else you will receive the error of limited mem issue

