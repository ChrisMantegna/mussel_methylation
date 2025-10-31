#!/usr/bin/env bash
set -euo pipefail

# Step: Alignment and QC (example using Bismark)

# environment checks
bismark --version || echo "bismark not found"

# directory setup
REF_DIR="./reference"
ALIGN_DIR="./aligned_reads"
mkdir -p "$ALIGN_DIR"

# genome preparation (only once per reference)
bismark_genome_preparation "$REF_DIR"

# align trimmed reads
for fq1 in ./trimmed_reads/*_R1_val_1.fq.gz; do
  base=$(basename "$fq1" _R1_val_1.fq.gz)
  fq2="./trimmed_reads/${base}_R2_val_2.fq.gz"
  echo "Aligning $base"
  bismark \
    --genome "$REF_DIR" \
    -1 "$fq1" -2 "$fq2" \
    -o "$ALIGN_DIR"
done

# summarize alignment results
multiqc "$ALIGN_DIR" -o "$ALIGN_DIR"
