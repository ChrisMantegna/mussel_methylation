#!/usr/bin/env bash
set -euo pipefail

# =========================================================
# Step: Download and verify raw WGBSseq reads
# =========================================================

# Load variables
source .bashvars

# Make output directory if it doesn't exist
mkdir -p "${raw_reads_dir}"

echo "$line"
echo "Downloading raw reads from ${raw_reads_url}"
echo "$line"

# Download all matching FastQ and md5sum files
wget \
  --directory-prefix "${raw_reads_dir}" \
  --recursive \
  --no-check-certificate \
  --continue \
  --cut-dirs 3 \
  --no-host-directories \
  --no-parent \
  --quiet \
  --level=1 \
  --accept "[0-9]M*.fastq.gz,[0-9]M*.fastq.gz.md5sum" \
  "${raw_reads_url}"

echo "$line"
echo "✅ Downloads complete. Verifying MD5 checksums..."
echo "$line"

cd "${raw_reads_dir}"

for file in *.md5sum; do
  echo "Checking ${file}"
  md5sum --check "${file}"
done

echo "$line"
echo "✅ All checksum verifications complete"
echo "$line"
