# Kennedi Todd
# March 18, 2024
# Adding transgenes to reference genome and aligning with STAR
# Human MAPT w/ missense mutation added as transgene in mouse

# Step 1
# Create FASTA file with the transgene sequence
# Should I have 32 bp flanking??

# Step 2
# Add genes to GTF file
chrTg
chr1    HAVANA  gene    3205901 3671498 .       -       .       gene_id "ENSMUSG00000051951"; gene_version "5"; gene_type "protein_coding"; gene_name "Xkr4"; level 2; mgi_id "MGI:3528744"; havana_gene "OTTMUSG00000026353.2";

# Step 2
# Create STAR reference using genome generate
STAR --genomeFastaFiles mm9.fa gene1.fa gene2.fa \
     --runMode genomeGenerate \
     --genomeDir ./ \
     --sjdbGTFfile mm9.gtf \
     --sjdbOverhang100  \
     --runThreadN 10  

