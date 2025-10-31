#!/usr/bin/env bash
set -euo pipefail

{
echo "#### Assign Variables ####"
echo ""

echo "# Data directories"
echo 'export output_dir_top="../output/00.00-WGBSseq-reads-FastQC-MultiQC"'
echo 'export raw_fastqc_dir="${output_dir_top}/raw-fastqc"'
echo 'export raw_reads_dir="../data/raw-wgbs"'
echo 'export raw_reads_url="https://owl.fish.washington.edu/nightingales/M_trossulus/"'
echo ""

echo "# FastQ filename patterns"
echo "export fastq_pattern='*.fastq.gz'"
echo "export R1_fastq_pattern='*_1.fastq.gz'"
echo "export R2_fastq_pattern='*_2.fastq.gz'"
echo ""

echo "## Initialize arrays"
echo 'export fastq_array_R1=()'
echo 'export fastq_array_R2=()'
echo 'export raw_fastqs_array=()'
echo 'export R1_names_array=()'
echo 'export R2_names_array=()'
echo ""

echo "# Print formatting"
echo 'export line=\"--------------------------------------------------------\"'
echo ""
} > .bashvars

cat .bashvars
