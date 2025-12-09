# IS477 Final Project - Fast-Food Density & Obesity Analysis
Contributors:
- Yonglin Ma 
- Richard(Ting Yu) Wu 

# Project Overview
This project explores the relationship between **fast-food restaurant density** and **adult obesity rates** across U.S. counties.

We use two publicly available datasets:

- USDA Food Environment Atlas (2025 Release)
- CDC PLACES - Local Data for Better Health (2024 Release)

All acquisition, cleaning, and integration were completed using **Google Colab** and **OpenRefine**.

# Data Collection and Acquisition
Because the USDA and CDC datasets exceed GitHub’s file-size limits, only the acquisition scripts and processed outputs are included in this repository.

## Acquisition Scripts
The acquisition workflow is implemented in:
notebooks/acquisition.ipynb

This notebook uses `requests` to:
- Download the USDA ZIP file  
- Download the CDC CSV file (via Box link)  
- Save files into `data/raw/`  
- Compute SHA-256 checksums to verify integrity

## Checksum Verification
For reproducibility, SHA-256 checksums were generated using Python:

- Allows validation of downloaded files  
- Ensures file integrity when re-running acquisition  
- Required because raw datasets are not stored directly in GitHub

## Storage Notes
Processed subsets suitable for analysis are available in:
data/processed/

## Reproducibility
Anyone can fully reproduce the acquisition process by running the notebook:
notebooks/acquisition.ipynb

# Storage and Organization
This project follows a clear and reproducible directory structure.  
Raw data, processed data, notebooks, and scripts are organized in dedicated folders.

A relational database (RDBMS) was **not used**.  
CSV and OpenRefine workflows were sufficient for this project.

## Folder Structure
IS477---Course-Project/
- data/
  - raw/                     # Raw datasets (not uploaded; stored locally)
  - processed/               # Cleaned datasets (uploaded)
    - foodatlas_clean.csv
    - cdc_cleaned.csv
  - README.md                # Data source notes + cleaning documentation
- README.md
- notebooks/
  - acquisition.ipynb
  - integration.ipynb
- scripts/
  - acquire_data.py          
- ProjectPlan.md

## Naming Conventions

### Raw Data (not uploaded to GitHub due to upload size limits)
Examples:
- usda_food_atlas_2025.zip
- cdc_places_2024.csv

### Processed Data
Stored in: `data/processed/`

Naming pattern:
<dataset>_clean.csv

Examples:
- foodatlas_clean.csv
- cdc_cleaned.csv

### Notebooks
- acquisition.ipynb
- integration.ipynb

### Scripts
- acquire_data.py

All filenames follow lowercase snake_case.

# Extraction and Enrichment
- This step is not applicable to our project.
- Both USDA Food Environment Atlas and CDC PLACES datasets are already structured, tabular CSV files provided by federal agencies.
- No unstructured text, HTML, XML, or JSON needed to be parsed, and no NLP-based extraction or external enrichment was required.

# Data Quality and Cleaning
All data profiling and cleaning were performed using **OpenRefine**.  
Detailed cleaning steps for both datasets (USDA and CDC) are fully documented in:
data/README.md

Cleaning actions include:
- Profiling with facets (numeric/text)
- Validating FIPS codes
- Filtering non-county or invalid records
- Standardizing variable names and column formats
- Exporting cleaned subsets for analysis

The complete OpenRefine operation history (JSON recipe) has also been uploaded to ensure full reproducibility.

# Data Integration
Dataset integration was performed in Google Colab using **Pandas**, after both datasets were independently cleaned in OpenRefine.

## Integration Key
Both datasets use **FIPS** (5-digit county code) as the unique identifier.  
All FIPS values were validated during the cleaning stage to ensure consistent formatting across sources.

## Integration Steps
1. Loaded cleaned USDA and CDC datasets from `data/processed/`.
2. Verified that all FIPS codes were valid 5-digit strings.
3. Performed an **inner merge** on the shared key: `FIPS`.
4. Ensured no duplicate counties remained after merging.
5. Exported the final integrated dataset as `merged_output_cleaned.csv`.

## Resulting Integrated Schema
- `FIPS` - County identifier  
- `State`  
- `County`  
- `fast_food_density` (USDA)  
- `obesity_rate` (CDC)

## Script Location
The full integration script is available in:
notebooks/integration.ipynb

# Database Usage
A relational database (PostgreSQL/MySQL/SQLite) was **not used** in this project, as all integration was performed using CSV files, OpenRefine, and Pandas.  
Therefore, this step is **not applicable** to our workflow.

# Reproducibility
- Raw datasets can be re-downloaded using the acquisition notebook or script.
- All cleaning steps are documented in `data/README.md`.
- Cleaned datasets (`data/processed/`) are ready for analysis.
- Processed datasets can be regenerated using the documented OpenRefine steps.
- The entire workflow (acquisition → cleaning → integration → analysis) is reproducible using Colab + OpenRefine.
