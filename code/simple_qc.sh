#!/usr/bin/env bash
set -euo pipefail

# --- BASIC CONFIGURATION ---

# URL for your sequences
RAW_URL="https://owl.fish.washington.edu/nightingales/M_trossulus/"

# Local folders (adjust if needed)
RAW_DIR="../data/raw"
OUT_DIR="../output/qc_reports"

# --- CREATE DIRECTORIES ---
mkdir -p "$RAW_DIR" "$OUT_DIR"

# --- STEP 1: DOWNLOAD ONLY SELECT FILES ---
echo "Downloading selected test reads..."
wget -nc -P "$RAW_DIR" \
  "${RAW_URL}/69M_1.fastq.gz" \
  "${RAW_URL}/69M_2.fastq.gz" \
  "${RAW_URL}/239M_1.fastq.gz" \
  "${RAW_URL}/239M_2.fastq.gz"

echo "✅ Downloads complete. Files are in $RAW_DIR"

# --- STEP 2: RUN FASTQC ---
echo "Running FastQC..."
fastqc -o "$OUT_DIR" "$RAW_DIR"/*.fastq.gz
echo "✅ FastQC complete."

# --- STEP 3: RUN MULTIQC ---
echo "Running MultiQC..."
multiqc "$OUT_DIR" -o "$OUT_DIR"
echo "✅ MultiQC report generated at $OUT_DIR"

echo "🎉 All done! Check your FastQC and MultiQC reports."
