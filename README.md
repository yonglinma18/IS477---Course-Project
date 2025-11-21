IS477 Final Project – Fast-Food Density & Obesity Analysis
University of Illinois Urbana-Champaign
Fall 2025 – Data Curation & Management
📘 Project Overview

This project explores the relationship between fast-food restaurant density and adult obesity rates across U.S. counties.

We use two authoritative, publicly available federal datasets:

USDA Food Environment Atlas (2025 Release)

CDC PLACES – Local Data for Better Health (2024 Release)

All data acquisition, cleaning, transformation, and merging were performed using Google Colab (Pandas) and OpenRefine, following reproducible and transparent curation procedures.

📦 Storage & Organization

This project follows a structured, reproducible, and transparent data-management workflow.
All raw data, processed data, notebooks, scripts, and documentation are organized in a clear directory structure.

We did not use a relational database (RDBMS).
CSV-level processing with OpenRefine + Python was sufficient for this project.

📁 Filesystem Structure
IS477---Course-Project/
│
├── data/
│   ├── raw/                     # Raw datasets (not uploaded due to size limits; stored locally)
│   │   └── README.md            # Raw data notes, source URLs, download dates
│   │
│   ├── processed/               # Cleaned, OpenRefine-processed datasets
│   │   ├── foodatlas_clean.csv
│   │   └── cdc_cleaned.csv
│   │
│   └── README.md                # Detailed cleaning notes (already completed)
│
├── notebooks/                   # Google Colab notebooks
│   ├── acquisition.ipynb        # Programmatic acquisition from USDA + CDC
│   ├── cleaning.ipynb           # Optional additional data cleaning
│   ├── integration.ipynb        # Merging USDA + CDC datasets
│   └── analysis.ipynb           # Visualization + statistical analysis
│
├── scripts/
│   └── acquire_data.py          # Python script for automated downloading
│
├── results/
│   ├── figures/                 # Visualizations created in analysis
│   └── tables/                  # Summary tables (optional)
│
└── ProjectPlan.md               # Project plan from Phase 1

📝 Naming Conventions
Raw data (not stored in GitHub)

Because USDA + CDC datasets exceed GitHub’s 25–50MB file-size limit, they are stored locally or in Box but documented in data/raw/README.md.

Examples of raw filenames:

usda_food_atlas_2025.zip

cdc_places_2024.csv

Processed data

Stored in: data/processed/

Naming pattern:
<dataset>_clean.csv

Examples:

foodatlas_clean.csv

cdc_cleaned.csv

Scripts

acquire_data.py → programmatic dataset download

Notebooks

Each notebook maps to one stage of the data lifecycle:

acquisition.ipynb

cleaning.ipynb

integration.ipynb

analysis.ipynb

All filenames follow lowercase snake_case for clarity.

🗄️ Database Usage

A relational database (PostgreSQL / MySQL / SQLite) was not used in this project.
All integration was performed using:

Google Colab (Pandas)

OpenRefine (facet-based cleaning & transformation)

Per project instructions:

Scripts for loading data into an RDBMS are required only if an RDBMS is used.

Thus, this step is not applicable to our workflow.

🔄 Reproducibility

Raw data can be re-downloaded using our acquisition notebook (notebooks/acquisition.ipynb) or Python script (scripts/acquire_data.py).

All OpenRefine cleaning steps are fully documented in data/README.md.

Cleaned datasets are provided in data/processed/ for easy analysis.

Processed data can be regenerated using the documented facet filters and transformations applied to the raw files.

The entire workflow—from acquisition to integration—is repeatable on any system using Colab + OpenRefine.
