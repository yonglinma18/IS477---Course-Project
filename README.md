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

**USDA Food Environment Atlas (2025 Release)**
- Source: https://www.ers.usda.gov/data-products/food-environment-atlas/ 
- Raw Data: https://ers.usda.gov/sites/default/files/_laserfiche/DataFiles/113063/2025-food-environment-atlas-data.zip
- File format: CSV
- Download date: 2025-11-16
- Description：County-level indicators related to food access, food environment, and food resources. 

**CDC PLACES – Local Data for Better Health (2024 Release)**
- Source: [https://data.cdc.gov/](https://data.cdc.gov/500-Cities-Places/PLACES-Local-Data-for-Better-Health-County-Data-20/swc5-untb/about_data)
- Raw Data:https://uofi.box.com/shared/static/kyr7iscrhy6943ictwt7voadier5mf7s
- File format: CSV
- Download date: 2025-11-16
- Description: Model-based estimates for chronic disease and health outcomes at the county level.
- Note on CDC Download Link: The CDC PLACES dataset website was updated after our download date. This project uses the version downloaded on November 16, 2025, and the exact version can be verified using the provided SHA-256 checksum and acquisition script.
- Note on CDC Download Link: The CDC PLACES dataset used in this project exceeds GitHub’s 25–50MB file-size upload limit. Because the full raw dataset cannot be stored directly in our repository, we provided a publicly accessible University of Illinois Box download link: **https://uofi.box.com/shared/static/kyr7iscrhy6943ictwt7voadier5mf7s** This Box link contains the exact raw CSV file we downloaded from the original CDC portal (https://data.cdc.gov/). The file in Box is unmodified and is shared only to support data reproducibility for this course. The SHA-256 checksum generated in our acquisition notebook verifies that the Box-hosted file matches the original CDC source file.

## Acquisition Scripts
This project includes fully reproducible acquisition scripts that automatically download the USDA and CDC datasets and verify their integrity using SHA-256 checksums.

All acquisition logic is implemented in the following scripts:
- scripts/acquire_usda.py
- scripts/acquire_cdc.py

What the Scripts Do - Each acquisition script performs the following steps:
- Send HTTP requests to download the datasets: The scripts retrieve the raw USDA ZIP file and the raw CDC CSV file directly from their official data portals (USDA ERS and CDC).
- Save the files into the project directory: **USDA → data/raw/usda_food_atlas_2025.zip** & **CDC → data/raw/cdc_places_2024.csv**
- Compute SHA-256 checksums: After downloading, each script generates the SHA-256 hash of the raw file. This allows anyone to verify that their downloaded copy matches the original dataset used in this project.
- Print checksum values for verification: The printed SHA-256 digest ensures transparent and reproducible data acquisition.
  
How to Reproduce the Acquisition Step
There are two supported ways to reproduce the acquisition process:
**Option A: Run through Snakemake**
This workflow automatically executes the acquisition scripts: **snakemake --cores 1**

Snakemake will run:
- scripts/acquire_usda.py
- scripts/acquire_cdc.py
  
and download fresh copies of the datasets into data/raw/.

**Option B: Run the scripts manually**

From the project root directory, run:
- python scripts/acquire_usda.py
- python scripts/acquire_cdc.py

This will re-download both datasets and regenerate their SHA-256 checksums.

Output of Acquisition Step:
After running acquisition, the following files will appear:
- data/raw/usda_food_atlas_2025.zip
- data/raw/cdc_places_2024.csv
  
Checksum values printed to the console can be compared against the values listed earlier in this README to ensure file integrity.

**Notes**
- Because both datasets exceed GitHub’s 25–50MB file-size limit, raw data are not stored in the repository.
- All acquisition is fully reproducible using the scripts above.
- The CDC dataset used in this project reflects the version downloaded on 2025-11-16, verified by SHA-256 checksum.
- A Box link is provided to ensure persistent access to the exact dataset version used.


## Checksum Verification
To verify file integrity, each acquisition script computes a SHA-256 hash of the downloaded file.

- USDA SHA-256: 
- CDC SHA-256: 

Anyone reproducing this work can compare their own downloaded files against these hashes to confirm that the data matches exactly.


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
