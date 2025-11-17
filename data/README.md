# Data Sources and Storage Notes
- This folder documents the datasets used in our IS477 course project.  
- Some of the original raw datasets exceed GitHub’s 25MB upload limit, so the full raw files are stored locally.  
- Only cleaned and analysis-ready subsets are stored in `data/processed/`.  
- This document ensures full transparency and reproducibility of data acquisition, cleaning, and storage.

## USDA Food Environment Atlas (Raw Data Stored Locally)

**Source:** [https://www.ers.usda.gov/data-products/food-environment-atlas/ ](https://www.ers.usda.gov/data-products/food-environment-atlas/data-access-and-documentation-downloads) 
**File format:** CSV  
**Download date:** 2025-11-16  

### Description  
County-level indicators related to food access, food environment, and food resources.  
We extracted only the variables related to **fast-food restaurant density**.

### Cleaning Summary  
- Extracted the variable **FFRPT20** (fast-food restaurants per 1,000 population)  
- Kept `State`, `County`, `FIPS`, and fast-food density  
- Removed non-county rows (e.g., `'US'`, blank counties)  
- Ensured numeric values, removed duplicates  
- Saved cleaned data to: data/processed/usda_clean.csv

### Notes  
- The full USDA dataset is ~60–80MB → too large for GitHub  
- The full raw dataset is stored locally  
- Only cleaned, compact subsets are uploaded

## CDC PLACES – County Health Indicators (Raw Data Stored Locally)

**Source:** [https://data.cdc.gov/  ](https://data.cdc.gov/500-Cities-Places/PLACES-Local-Data-for-Better-Health-County-Data-20/swc5-untb/about_data)
**File format:** CSV  
**Download date:** 2025-11-16  

### Description  
Model-based estimates for chronic disease and health outcomes at the county level.  
We extracted the measure **“Obesity among adults”**.

### Cleaning Summary  
- Filtered rows where `Measure = "Obesity among adults"`  
- Selected relevant columns: `State`, `County`, `Obesity Rate`, `FIPS`  
- Kept only the most recent year (2022)  
- Removed aggregate `'US'` rows with blank county names  
- Saved cleaned data to: data/processed/cdc_clean.csv

### Notes  
- The original CDC PLACES dataset exceeds GitHub’s 25MB limit (~60MB+)  
- Full raw data stored locally  
- Only cleaned obesity subset is included in the repository

## Folder Structure
data/
raw/ # Placeholder for raw data (stored locally due to file size)
processed/ # Cleaned datasets ready for merging & analysis
usda_clean.csv
cdc_clean.csv
README.md # Documentation describing data sources, cleaning, and storage

## Reproducibility
- Anyone accessing this repository can re-download the original datasets using the source links above.  
- All cleaning steps are documented to ensure the processed datasets can be regenerated if needed.
- Only cleaned, analysis-ready files are stored in GitHub due to file size limitations.
