# Startup File: Mussel Methylation Analysis
# Created 10.30.2025

# Tell RStudio to use the conda Python from your bioinformatics environment
Sys.setenv(RETICULATE_PYTHON = "/Users/cmantegna/miniforge3/envs/bio-cli/bin/python")

# Add the conda environment's bin directory to your system PATH for R sessions
# This ensures that R and Quarto can find tools like fastqc, hisat2, bismark, multiqc, etc.
Sys.setenv(
  PATH = paste(
    "/Users/cmantegna/miniforge3/envs/bio-cli/bin",
    Sys.getenv("PATH"),
    sep = ":"
  )
)

# Optional: Set a default CRAN mirror
options(repos = c(CRAN = "https://cloud.r-project.org"))

# Optional: Activate renv if it exists
suppressPackageStartupMessages({
  if (requireNamespace("renv", quietly = TRUE)) {
    renv::activate()
  }
})

# Confirmation message on load
cat("\n✅ Loaded R project with Python env: bio-cli\n")
cat("Python path: ", Sys.getenv("RETICULATE_PYTHON"), "\n")
cat("Environment bin path added to PATH:\n", Sys.getenv("PATH"), "\n\n")
