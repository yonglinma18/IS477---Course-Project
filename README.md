# IS477 Final Project - Fast-Food Density & Obesity Analysis
University of Illinois Urbana-Champaign - Fall 2025 - Data Curation & Management

# Project Overview

This project explores the relationship between **fast-food restaurant density** and **adult obesity rates** across U.S. counties.

We use two publicly available datasets:

- USDA Food Environment Atlas (2025 Release)
- CDC PLACES – Local Data for Better Health (2024 Release)

All acquisition, cleaning, and integration were completed using **Google Colab** and **OpenRefine**.

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
  - cleaning.ipynb
  - integration.ipynb
- scripts/
  - acquire_data.py          
- ProjectPlan.md

## Naming Conventions

### Raw Data (not uploaded to GitHub)
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
- cleaning.ipynb
- integration.ipynb

### Scripts
- acquire_data.py

All filenames follow lowercase snake_case.

# Extraction and Enrichment
- This step is not applicable to our project.
- Both USDA Food Environment Atlas and CDC PLACES datasets are already structured, tabular CSV files provided by federal agencies.
- No unstructured text, HTML, XML, or JSON needed to be parsed, and no NLP-based extraction or external enrichment (e.g., API lookups, census augmentation, geocoding, or metadata retrieval) was required.

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
5. Exported the final integrated dataset as `merged_usda_cdc.csv`.

## Resulting Integrated Schema
- `FIPS` — County identifier  
- `State`  
- `County`  
- `fast_food_density` (USDA)  
- `obesity_rate` (CDC)

## Script Location
The full integration script is available in:
notebooks/integration.ipynb

# Database Usage

A relational database (PostgreSQL/MySQL/SQLite) was **not used**.  
All integration was performed using:

- Google Colab (Pandas)
- OpenRefine (filtering, cleaning, transformation)

Therefore, this step is **not applicable** to our workflow.

# Reproducibility

- Raw datasets can be re-downloaded using the acquisition notebook or script.
- All cleaning steps are documented in `data/README.md`.
- Cleaned datasets (`data/processed/`) are ready for analysis.
- Processed datasets can be regenerated using the documented OpenRefine steps.
- The entire workflow (acquisition → cleaning → integration → analysis) is reproducible using Colab + OpenRefine.
