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
