# Kennedi Todd
# March 22, 2024
# Calculate nuclear fraction with 10x single nucleus output

# load libraries
library(DropletQC, lib.loc = "/home/mayo/m214960/R/x86_64-pc-linux-gnu-library/4.2")

# nuclear fraction = # intronic reads / (# intronic reads + # of exonic reads) 
# The nuclear_fraction_tag() function uses Cell Ranger's output BAM file to 
# calculate nuclear fraction. The BAM file contains tags for reads algined to an 
# intron or exon
# This took ~11 minutes with 10 cores. \

# get command line arg
#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly = TRUE)
sample <- args[1]
print(sample)

# calculate nuclear fraction using BAM tags
prefix <- "/research/labs/neurology/fryer/m214960/hSynTurboRibo/snRNA/counts/"
dir <- paste0(prefix, sample, "/outs")
tags <- nuclear_fraction_tags(outs = dir, cores = 15, verbose = TRUE)

# save
prefix <- "/research/labs/neurology/fryer/m214960/hSynTurboRibo/snRNA/refs/"
write.table(tags, 
            file = paste0(prefix, sample, "_nuclear_fraction.tsv"),
            quote = FALSE, sep = "\t", col.names = TRUE, row.names = TRUE)
