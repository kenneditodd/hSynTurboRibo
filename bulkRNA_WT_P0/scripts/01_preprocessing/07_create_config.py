#!/usr/bin/python3

# create a new output file
outfile = open('../../refs/config.json', 'w')

# get all file names
allSamples = list()
read = ["1", "2"]
numSamples = 0

with open('../../refs/sample_file_list.txt', 'r') as infile:
    for line in infile:
        numSamples += 1
        sample = line.strip()
        allSamples.append(sample)

# create header and write to outfile
header = '''{{
    "DIRECTORIES",
    "rawReads" : "/research/labs/neurology/fryer/projects/hSynTurboRibo/WT_PS19_P0_short_read/01.RawData/",
    "rawQC" : "rawQC/",
    "trimmedReads" : "trimmedReads/",
    "trimmedQC" : "trimmedQC/",
    "starAligned" : "starAligned/",
    "featureCounts" : "featureCounts/",
    "genomeDir" : "refs/starGenomeDir/",

    "FILES",
    "Mmusculus.gtf" : "/research/labs/neurology/fryer/projects/references/mouse/refdata-gex-mm10-2020-A/genes/genes.gtf",
    "Mmusculus.fa" : "/research/labs/neurology/fryer/projects/references/mouse/refdata-gex-mm10-2020-A/fasta/genome.fa",

    "SAMPLE INFORMATION",
    "allSamples": {0},
    "read": {1},

    "CLUSTER INFORMATION",
    "threads" : "20",
'''
outfile.write(header.format(allSamples, read))


# config formatting
counter = 0
with open('../../refs/sample_file_list.txt', 'r') as infile:
    for line in infile:
        counter += 1

        # store filename
        sample = line.strip()
        baseName = sample
        read1 = sample + "_1.fq.gz"
        read2 = sample + "_2.fq.gz"

        # break down fastq file info
        # @A00127:312:HVNLJDSXY:2:1101:2211:1000
        # @<instrument>:<run number>:<flowcell ID>:<lane>:<tile>:<x-pos>:<y-pos>

        out = '''
    "{0}":{{
        "read1": "{1}",
        "read2": "{2}"
        '''
        outfile.write(out.format(baseName, read1, read2))
        if (counter == numSamples):
            outfile.write("}\n}")
        else:
            outfile.write("},\n")
outfile.close()

