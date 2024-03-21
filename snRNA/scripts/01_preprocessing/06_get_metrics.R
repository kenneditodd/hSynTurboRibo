# load libraries
library(stringr)

# file locations
locations <- c("/research/labs/neurology/fryer/m214960/hSynTurboRibo/snRNA/counts/PP_13/outs/metrics_summary.csv",
               "/research/labs/neurology/fryer/m214960/hSynTurboRibo/snRNA/counts/PP_11/outs/metrics_summary.csv",
               "/research/labs/neurology/fryer/m214960/hSynTurboRibo/snRNA/counts/PP_22/outs/metrics_summary.csv",
               "/research/labs/neurology/fryer/m214960/hSynTurboRibo/snRNA/counts/PP_15/outs/metrics_summary.csv",
               "/research/labs/neurology/fryer/m214960/hSynTurboRibo/snRNA/counts/PP_14/outs/metrics_summary.csv",
               "/research/labs/neurology/fryer/m214960/hSynTurboRibo/snRNA/counts/PP_23/outs/metrics_summary.csv",
               "/research/labs/neurology/fryer/m214960/hSynTurboRibo/snRNA/counts/PP_4/outs/metrics_summary.csv",
               "/research/labs/neurology/fryer/m214960/hSynTurboRibo/snRNA/counts/PP_19/outs/metrics_summary.csv")

# sample names
names <- str_match(locations, "/research/labs/neurology/fryer/m214960/hSynTurboRibo/snRNA/counts/(.+)/outs/metrics_summary.csv")[,2]

# initialize df and loop through files
df <- data.frame()
for (i in 1:length(locations)) {
  if (i == 1) {
    df <- read.csv(locations[i])
  } else {
    row <- read.csv(locations[i])[1,]
    df <- rbind(df,row)
  }
}

rownames(df) <- names
c.names <- c("estimated_cells", "mean_reads", "median_genes", "number_reads",
                  "valid_barcodes", "sequencing_saturation", "Q30_bases_barcode",
                  "Q30_bases_read", "Q30_bases_UMI", "reads_mapped_genome", "confident_reads_mapped_genome",
                  "confident_intergenic_reads_mapped", "confident_intronic_reads_mapped",
                  "confident_exonic_reads_mapped", "confident_reads_mapped_transcriptome",
                  "reads_mapped_antisense", "fraction_reads", "total_genes", "median_UMI")
colnames(df) <- c.names

write.table(df, 
            "/research/labs/neurology/fryer/m214960/hSynTurboRibo/snRNA/counts/web_summaries/overall_metrics.tsv",
            sep = "\t",
            quote = FALSE)


