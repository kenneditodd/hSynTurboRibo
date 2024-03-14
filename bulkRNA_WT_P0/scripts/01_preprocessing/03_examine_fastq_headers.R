# Kennedi Todd
# March 14, 2024

# load file
library(stringr)
library(tidyr)
library(dplyr)
file <- read.delim2("bulkRNA_WT_P0/refs/fastq_header.tsv", sep = "\t", header = FALSE)

# reformat
colnames(file) <- c("fastq_file","fastq_header")
file$fastq_file <- gsub(
  "/research/labs/neurology/fryer/projects/hSynTurboRibo/WT_PS19_P0_short_read/01.RawData/",
  "",
  file$fastq_file)
# WP_1_Final/WP_1_Final_2.fq.gz
file$fastq_file <- str_match(file$fastq_file, ".+/(.+.fq.gz)")[,2]

# parse header info
file$fastq_header <- gsub("@", "", file$fastq_header)
file <- separate(file, 
                 col = "fastq_header", 
                 sep = ":", 
                 into = c("sequencer","run","flow_cell","lane","pos1","pos2","pos3",
                          "var1","var2","var3"))
file <- file[,1:5]

# parse fastq file info
file$mouse <- str_match(file$fastq_file, "(WP_[0-9]+)_[InputFial]+_[12].fq.gz")[,2]
file$group <- str_match(file$fastq_file, "WP_[0-9]+_([InputFial]+)_[12].fq.gz")[,2]
file$group <- factor(file$group, levels = c("Input","Final"))
file$read <- str_match(file$fastq_file, "WP_[0-9]+_[InputFial]+_([12]).fq.gz")[,2]
file$read <- factor(file$read, levels = c(1,2))
file <- file[,c(1,6:8,2:5)]
file <- file %>% arrange(mouse,group,read)


