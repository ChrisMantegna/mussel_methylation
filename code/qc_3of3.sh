#!/usr/bin/env bash
set -euo pipefail

# Load bash variables into memory
source .bashvars

# Make output directory if it doesn't exist
mkdir --parents "${raw_fastqc_dir}"

############ RUN FASTQC ############


# Create array of trimmed FastQs
raw_fastqs_array=(${raw_reads_dir}/${fastq_pattern})

# Pass array contents to new variable as space-delimited list
raw_fastqc_list=$(echo "${raw_fastqs_array[*]}")

echo "Beginning FastQC on raw reads..."
echo ""

# Run FastQC
### NOTE: Do NOT quote raw_fastqc_list
fastqc \
--outdir ${raw_fastqc_dir} \
--quiet \
${raw_fastqc_list}

echo "FastQC on raw reads complete!"
echo ""

############ END FASTQC ############

############ RUN MULTIQC ############
echo "Beginning MultiQC on raw FastQC..."
echo ""

multiqc ${raw_fastqc_dir} -o ${raw_fastqc_dir}

echo ""
echo "MultiQC on raw FastQs complete."
echo ""

############ END MULTIQC ############

echo "Removing FastQC zip files."
echo ""
rm ${raw_fastqc_dir}/*.zip
echo "FastQC zip files removed."
echo ""

# View directory contents
ls -lh ${raw_fastqc_dir}