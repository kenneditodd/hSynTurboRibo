#!/bin/sh
#SBATCH --job-name submit_Rscript
#SBATCH --mem 10G
#SBATCH --output logs/%x.%j.stdout
#SBATCH --error logs/%x.%j.stderr
#SBATCH --partition cpu-med
#SBATCH --tasks 30
#SBATCH --time 08:00:00 ## HH:MM:SS

# init
source $HOME/.bash_profile

# store var
sample=$1

# submit Rscript
Rscript 01_calculate_nuclear_fraction.R $sample
