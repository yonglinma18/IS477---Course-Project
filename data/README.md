# Data Sources and Storage Notes
This folder contains the datasets used in our IS477 course project.  
Because some of the original raw datasets exceed GitHub’s 25MB upload limit, the full raw files are stored locally.  
This document records all download information so the data can be easily re-accessed for reproducibility.

## USDA Food Environment Atlas (Raw Data Stored Locally)
- Source: [https://www.ers.usda.gov/data-products/food-environment-atlas/](https://www.ers.usda.gov/data-products/food-environment-atlas/data-access-and-documentation-downloads)
- File format: CSV
- Download date: 2025-11-16
- Description: County-level indicators related to food access, food environment, and food resources.  
- Notes:  
  - The original USDA dataset is ~60-80MB and cannot be uploaded to GitHub.  
  - The full raw file is stored locally.  
  - Only extracted variables relevant to fast-food restaurant density and county identifiers will be uploaded later to `"data/processed/".

## CDC PLACES – County Data (Raw Data Stored Locally)
- Source: [https://data.cdc.gov/](https://data.cdc.gov/500-Cities-Places/PLACES-Local-Data-for-Better-Health-County-Data-20/swc5-untb/about_data)
- File format: CSV
- Download date: 2025-11-16
- Description: Model-based estimates for chronic disease, health outcomes, and related health behaviors at county and community levels.
- Notes:
  - The CDC dataset is also over GitHub’s upload limit (~60MB+).  
  - The original file is stored locally.  
  - Processed subsets will be added to this repository once cleaned.

## Folder Structure
data/
 ├── raw/         # Placeholder for raw data (too large for GitHub)
 ├── processed/   # Cleaned / filtered datasets for analysis
 └── README.md    # Data documentation (this file)
 
## Reproducibility
Anyone accessing this repository can re-download the original datasets using the links provided above.  
Only cleaned and analysis-ready subsets will be included in the repository.  
The documented folder structure ensures consistent organization for future integration and analysis.
