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

Because the full raw datasets exceed GitHub’s 25–50MB file-size limit, raw files are not stored in this repository.
Instead, acquisition scripts and documentation are provided to ensure full reproducibility.

This project uses two publicly available datasets:

USDA Food Environment Atlas (2025 Release)
- Source: https://www.ers.usda.gov/data-products/food-environment-atlas/ 
- Raw Data: https://ers.usda.gov/sites/default/files/_laserfiche/DataFiles/113063/2025-food-environment-atlas-data.zip
- File format: CSV
- Download date: 2025-11-16
- Description：County-level indicators related to food access, food environment, and food resources. 

CDC PLACES – Local Data for Better Health (2024 Release)
- Source: https://data.cdc.gov/
- Raw Data:https://uofi.box.com/shared/static/kyr7iscrhy6943ictwt7voadier5mf7s
- File format: CSV
- Download date: 2025-11-16
- Description: Model-based estimates for chronic disease and health outcomes at the county level.
- Note on CDC Download Link
  -The CDC PLACES dataset website was updated after our download date. This project uses the version downloaded on November 16, 2025, and the exact version can be verified using the provided SHA-256 checksum and acquisition script.
  -The CDC PLACES dataset used in this project exceeds GitHub’s 25–50MB file-size upload limit. Because the full raw dataset cannot be stored directly in our repository, we provided a publicly accessible University of Illinois Box download link: **https://uofi.box.com/shared/static/kyr7iscrhy6943ictwt7voadier5mf7s** This Box link contains the exact raw CSV file we downloaded from the original CDC portal (https://data.cdc.gov/). The file in Box is unmodified and is shared only to support data reproducibility for this course. The SHA-256 checksum generated in our acquisition notebook verifies that the Box-hosted file matches the original CDC source file.

## Acquisition Scripts
The raw datasets are downloaded using two Python scripts:
- scripts/acquire_usda.py
- scripts/acquire_cdc.py

These scripts:
- Send HTTP requests to the official data sources
- Download the raw files into data/raw/
- Save the files with consistent names
- Compute SHA-256 checksums for integrity validation
  
These acquisition scripts are executed automatically when running Snakemake: **snakemake --cores 1**

Or manually by executing each script: **python scripts/acquire_usda.py** & **python scripts/acquire_cdc.py**

The corresponding Jupyter notebooks (**notebooks/acquire_usda.ipynb** and **notebooks/acquire_cdc.ipynb**) provide a documented version of the same workflow.

## Data Sources
Both datasets originate from publicly available federal sources:
- USDA Food Environment Atlas (2025 Release)
https://ers.usda.gov/data-products/food-environment-atlas/

- CDC PLACES – Local Data for Better Health (2024 Release)
https://www.cdc.gov/places/

## Checksum Verification
To verify file integrity, each acquisition script computes a SHA-256 hash of the downloaded file.

- USDA SHA-256: 
- CDC SHA-256: 

Anyone reproducing this work can compare their own downloaded files against these hashes to confirm that the data matches exactly.

## Manual Reproduction

If users prefer to download the datasets manually:
- Download the USDA and CDC files from the links above
- Place them inside the data/raw/ folder
- Run the checksum validation code
- Proceed to the cleaning and integration steps

## Output of Acquisition Step
After running acquisition:
- data/raw/usda_food_atlas_2025.zip
- data/raw/cdc_places_2024.csv

These files then serve as inputs to the cleaning and integration workflows.

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
