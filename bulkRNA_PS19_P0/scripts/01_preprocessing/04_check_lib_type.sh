#!/bin/sh
#SBATCH --job-name check_lib_type
#SBATCH --mem 10G
#SBATCH --output logs/%x.%j.stdout
#SBATCH --error logs/%x.%j.stderr
#SBATCH --partition cpu-med
#SBATCH --tasks 15
#SBATCH --time 02:00:00 ## HH:MM:SS

# salmon was installed in it's own environment to work properly
# activate environment
source $HOME/.bash_profile
conda activate salmon

# salmon version
salmon -v

# validate mappings
# note this same sample has other lanes but this should be sufficient to check
salmon quant --libType A \
             --index /research/labs/neurology/fryer/projects/references/mouse/salmonIndexGRCm39 \
             --mates1 /research/labs/neurology/fryer/projects/hSynTurboRibo/WT_PS19_P0_short_read/01.RawData/PP_10_F/PP_10_F_1.fq.gz \
             --mates2 /research/labs/neurology/fryer/projects/hSynTurboRibo/WT_PS19_P0_short_read/01.RawData/PP_10_F/PP_10_F_2.fq.gz \
             --output ../../refs/transcript_quant \
             --threads 15 \
             --validateMappings

# Key
# --libType A is for autodetect library type
# --index Salmon index
# --mates1
# --mates2

# Results
# Automatically detected most likely library type as IU
# IU = inward unstranded

# Job stats
#State: COMPLETED (exit code 0)
#Nodes: 1
#Cores per node: 16
#CPU Utilized: 00:24:10
#CPU Efficiency: 64.27% of 00:37:36 core-walltime
#Job Wall-clock time: 00:02:21
#Memory Utilized: 1.67 GB
#Memory Efficiency: 16.75% of 10.00 GB

