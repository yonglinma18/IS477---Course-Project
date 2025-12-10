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

Because the full raw datasets exceed GitHub’s file-size limit, raw files are not stored in this repository.
Instead, acquisition scripts and documentation are provided to ensure full reproducibility.

This project uses two publicly available datasets:

**USDA Food Environment Atlas (2025 Release)**
- Source: https://www.ers.usda.gov/data-products/food-environment-atlas/ 
- Raw Data: https://ers.usda.gov/sites/default/files/_laserfiche/DataFiles/113063/2025-food-environment-atlas-data.zip
- File format: CSV
- Download date: 2025-11-16
- Description：County-level indicators related to food access, food environment, and food resources. 

**CDC PLACES - Local Data for Better Health (2024 Release)**
- Source: [https://data.cdc.gov/](https://data.cdc.gov/500-Cities-Places/PLACES-Local-Data-for-Better-Health-County-Data-20/swc5-untb/about_data)
- Raw Data:https://uofi.box.com/shared/static/kyr7iscrhy6943ictwt7voadier5mf7s
- File format: CSV
- Download date: 2025-11-16
- Description: Model-based estimates for chronic disease and health outcomes at the county level.
- Note on CDC Download Link: The CDC PLACES dataset website was updated after our download date. This project uses the version downloaded on November 16, 2025, and the exact version can be verified using the provided SHA-256 checksum and acquisition script.
- Note on CDC Download Link: The CDC PLACES dataset used in this project exceeds GitHub’s file-size upload limit. Because the full raw dataset cannot be stored directly in our repository, we provided a publicly accessible University of Illinois Box download link: **https://uofi.box.com/shared/static/kyr7iscrhy6943ictwt7voadier5mf7s** This Box link contains the exact raw CSV file we downloaded from the original CDC portal (https://data.cdc.gov/). The file in Box is unmodified and is shared only to support data reproducibility for this course. The SHA-256 checksum generated in our acquisition notebook verifies that the Box-hosted file matches the original CDC source file.

## Acquisition Scripts
This project includes fully reproducible acquisition scripts that automatically download the USDA and CDC datasets and verify their integrity using SHA-256 checksums.

All acquisition logic is implemented in the following scripts:
- scripts/acquire_usda.py
- scripts/acquire_cdc.py

What the Scripts Do - Each acquisition script performs the following steps:
- Send HTTP requests to download the datasets: The USDA script retrieves the raw ZIP file directly from the USDA ERS data portal. The CDC script downloads the exact raw CSV file used in this project from a publicly accessible University of Illinois Box link, which hosts the original dataset version downloaded from CDC before their website update.
- Save the files into the project directory: **USDA → data/raw/usda_food_atlas_2025.zip** & **CDC → data/raw/cdc_places_2024.csv**
- Compute SHA-256 checksums: After downloading, each script generates the SHA-256 hash of the raw file. This allows anyone to verify that their downloaded copy matches the original dataset used in this project.
- Print checksum values for verification: The printed SHA-256 digest ensures transparent and reproducible data acquisition.
  
How to Reproduce the Acquisition Step - There are two supported ways to reproduce the acquisition process:

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
- Because both datasets exceed GitHub’s file-size limit, raw data are not stored in the repository.
- All acquisition is fully reproducible using the scripts above.
- The CDC dataset used in this project reflects the version downloaded on 2025-11-16, verified by SHA-256 checksum.
- A Box link is provided to ensure persistent access to the exact dataset version used.

## Checksum Verification
To verify file integrity, each acquisition script computes a SHA-256 hash of the downloaded file.

- USDA SHA-256: 99750f549a3dd84222934dae77767724968a86b36f2cf15b3985bb6f0e863b8d
- CDC SHA-256: 710646e805aa7af92276ac9627b63c78532c81d799cb5db9ba647c015e24177c

Anyone reproducing this work can compare their own downloaded files against these hashes to confirm that the data matches exactly.


# Storage and Organization
This project follows a clear and reproducible directory structure.
All data, scripts, notebooks, and intermediate results are organized into dedicated folders to support transparency, reproducibility, and ease of navigation.

Because the project uses CSV files, OpenRefine, and Python-based workflows, a relational database (RDBMS) was not required.
All data integration and analysis steps were performed using Pandas and OpenRefine, and therefore no SQL loading scripts are included.

## Folder Structure
IS477---Course-Project/

- contribution # Group members' contribution
- data/
  - raw/           # Raw datasets (downloaded via scripts; not stored in GitHub)
    - usda_food_atlas_2025.zip
    - cdc_places_2024.csv                 
  - clean_1/       # First-stage cleaned datasets (OpenRefine)
    - cdc_cleaned.csv
    - foodatlas_clean.csv
  - merge/         # Intermediate merged dataset (before second cleaning)
    - merged_outpuet.csv
  - clean_2/       # Final cleaned merged dataset used for analysis
    
    - merged_output_cleaned.csv
- final project submission  # Final written project report
- notebooks/
  - acquire_cdc.ipynb
  - acquire_usda.ipynb
  - acquisition_demo.ipynb
  - analysis.ipynb
  - cleaning.ipynb
  - integration.ipynb   # Initial merge and inspection
- openrefine/     # OpenRefine operation histories (JSON “recipes”)
  - cdc-history.json
  - merged_output_cleaned.json
  - usda-foodatlas-history.json
- report/    # Previous written project report
  - ProjectPlan.md
  - StatusReport.md
- results & figures/  # Visualizations and computed results
  - correlation_result.txt
  - obesity_fastfood.png
  - obesity_fastfood_regression_line.png
- scripts/
  - acquire_cdc.py
  - acquire_usda.py
  - acquisition_demo.py
  - analysis.py
  - integration.py
- Snakefile                # Automation workflow for acquisition → merge → analysis
- run_all.sh               # One-click reproducibility script (executes Snakemake)
- README.md                # Main project documentation

## Naming Conventions
To ensure clarity and consistency, this project follows a uniform naming scheme:

Dataset Naming:
- _raw. are original, unmodified datasets.
- _clean.csv are datasets cleaned in OpenRefine stage 1.
- merged_output.csv is the initial Pandas merge output.
- merged_output_cleaned.csv is the final cleaned dataset used for analysis.
- Cleaning folders are versioned (clean_1, clean_2) to clearly separate stages.

Folders:
- raw/ contains original downloaded datasets (not pushed to GitHub due to size limits).
- clean_1/ and clean_2/ contain cleaned subsets ready for integration/analysis.
- merge/ contains intermediate results between cleaning steps.
- openrefine/ stores JSON history files for full reproducibility.
- results & figures/ contains outputs produced by analysis scripts.

Scripts & Notebooks:
- All Python scripts use lowercase_snake_case naming.
- Notebooks are stored separately from scripts to distinguish exploratory work from production workflow.
  
**RDBMS Usage**
- A relational database (PostgreSQL/MySQL/SQLite) was not used in this project because:
- Both datasets are already provided as structured CSV files.
- No large-scale relational joins or query processing were required.
- All integration was performed using Pandas after OpenRefine cleaning.
- The entire workflow remains fully reproducible without a database layer.

# Extraction and Enrichment
- This step is not applicable to our project.
- Both USDA Food Environment Atlas and CDC PLACES datasets are already structured, tabular CSV files provided by federal agencies.
- No unstructured text, HTML, XML, or JSON needed to be parsed, and no NLP-based extraction or external enrichment was required.

# Data Quality and Cleaning
This project performed all data profiling and cleaning using OpenRefine, with full transparency ensured by including a detailed description of all steps and the exported OpenRefine JSON operation history.

Two datasets were cleaned:
- USDA Food Environment Atlas (fast_food_density)
- CDC PLACES (obesity_rate)
Both were cleaned independently first, then merged, followed by a second cleaning pass to remove redundant merge columns.

**USDA Dataset – Cleaning Summary (Performed in OpenRefine)**

1. Imported the raw USDA CSV into OpenRefine
   
2. Filtered to keep only fast-food restaurant density
  - Faceted on Variable_Code
  - Selected indicator: FRTPTP020 (Fast-food restaurants per 1,000 population)
  - Removed all other indicators

3. Kept only relevant columns
- State
- County
- FIPS
- Data_Value → renamed to fast_food_density
  
4. Removed non-county rows - (Project focuses on 50 U.S. states only)
- Deleted rows where State = “DC” 

5. Validated FIPS codes
- Created a text facet on length(value)
- Ensured all FIPS codes were exactly 5 digits
- Confirmed no blank or malformed FIPS values

6. Cleaned density values
- Faceted on fast_food_density
- Removed invalid placeholders:
  - 9999
  - 8888
- Ensured all remaining values were numeric

7. Exported cleaned USDA dataset
- Saved as: **data/clean_1/foodatlas_cleaned.csv**

**CDC Dataset – Cleaning Summary (Performed in OpenRefine)**

1. Imported CDC dataset into OpenRefine
   
2. Filtered to keep only obesity data
- Faceted on Measure
- Selected: Obesity among adults

3. Kept only Age-adjusted prevalence
- Faceted on Data_Value_Type
- Selected: Age-adjusted prevalence
- Removed: Unadjusted prevalence & Crude prevalence

4. Selected relevant columns
- StateAbbr → renamed to State
- LocationName → renamed to County
- LocationID → renamed to FIPS
- Data_Value → renamed to Obesity_Rate

5. Removed non-county and aggregated rows
- Deleted rows where: State = "US" & County not part of 50 states

6. Validated FIPS codes
- Checked text length = 5
- Confirmed no missing or malformed codes

7. Cleaned obesity rate values
- Faceted on Obesity_Rate
- Verified values: numeric & within 0–100% & non-blank

8. Exported cleaned CDC dataset
- Saved as: data/clean_1/cdc_cleaned.csv

**Second Cleaning Step (After Merge)**

After merging USDA + CDC datasets using FIPS, the merged file contained duplicate county/state

Second-pass OpenRefine cleaning steps:
- Loaded merged dataset into OpenRefine
- Verified that State_x = State_y and County_x = County_y
- Deleted redundant merged columns: State_y & County_y
- Verified no duplicate FIPS values remained
- Exported final dataset: data/merge/merged_output_cleaned.csv

**OpenRefine JSON Operation History**

A full OpenRefine operation history (recipes) is included for reproducibility:
- openrefine/usda_food_cleaning.json
- openrefine/cdc_obesity_cleaning.json
- openrefine/merge_cleanup.json

These allow anyone to reproduce 100% of the cleaning steps by importing the JSON files into OpenRefine.

# Data Integration
Dataset integration was performed in Google Colab using Pandas, after both datasets were independently cleaned in OpenRefine.

## Integration Key
Both datasets contain a FIPS (5-digit county code) column, which uniquely identifies every U.S. county.

All FIPS values were validated during the cleaning stage in OpenRefine.

FIPS was chosen as the integration key because it is:
- standardized across federal datasets,
- consistent across years,
- not affected by county name changes or formatting inconsistencies.

**Conceptual Model for Integration**

Before integration, both datasets were aligned to the following conceptual schema:

Attribute -	Description - Source
FIPS - Unique county identifier - Both
State - State abbreviation - Both (validated to match)
County - County name - Both (validated to match)
fast_food_density - Fast-food restaurants per 1,000 population - USDA
obesity_rate - Age-adjusted adult obesity prevalence - CDC

This conceptual schema ensures that each county becomes a single integrated record combining food environment + health outcome.

**Integration Steps (Performed in Python)**

The integration was performed in notebooks/integration.ipynb using the following steps:

1. Loaded cleaned datasets
- data/clean_1/foodatlas_cleaned.csv  
- data/clean_1/cdc_cleaned.csv

2. Verified FIPS formatting
- Ensured both FIPS columns were strings
- Ensured they remained 5 digits after loading
- Confirmed no duplicates within each dataset

3. Performed an inner merge on FIPS
- **merged = usda.merge(cdc, on="FIPS", how="inner")**
- Inner join ensures only counties present in both datasets are included. This avoids mismatched or incomplete records.

4. Resolved post-merge duplicate columns
- Because both datasets contain State and County, Pandas produces: State_x, State_y & County_x, County_y

These were reconciled by:
- Verifying that State_x = State_y and County_x = County_y
- Keeping the left dataset's values
- Removing redundant columns: State_y, County_y

5. Exported the final integrated dataset
- Output saved as: data/merge/merged_output_cleaned.csv
- This file was used for all downstream analysis and visualizations.

**Resulting Integrated Schema**

After integration and cleanup, the final dataset contains:
- FIPS - county identifier
- State - state abbreviation
- County - county name
- fast_food_density (USDA)
- obesity_rate (CDC)

This schema supports statistical analysis of relationships between food environment and obesity outcomes.

**Script Location**
- The complete integration logic is documented in: notebooks/integration.ipynb

# Data analysis and/or visualization

All analysis was performed in the notebook: notebooks/analysis.ipynb

The goal of this analysis was to examine whether county-level fast-food restaurant density is associated with adult obesity rates.

**Analysis Overview**

1. Loaded the fully integrated dataset generated after cleaning and merging USDA and CDC data: df = pd.read_csv("data/clean_2/merged_output_cleaned.csv")
   
2. Computes the Pearson correlation coefficient between:
- fast_food_density
- obesity_rate

3. Generates two visualizations:
- A scatterplot showing county-level data
- A scatterplot with a fitted regression line (using numpy.polyfit)
- Both charts are automatically saved to: results & figures/

**Key Findings**
- The computed correlation was −0.1597, indicating a weak negative relationship between fast-food density and obesity rate.
- The regression line in the visualization reflects this slight downward trend.

**Output Files**
The following files were generated by the analysis step:
- results & figures/obesity_fastfood_scatter.png
- results & figures/obesity_fastfood_regression.png
- results & figures/correlation_result.txt   (if using Snakemake)

The entire analysis workflow can be reproduced by either:

**Option A - Running Snakemake**
- snakemake --cores 1
- This automatically executes the analysis step and regenerates all results.

**Option B - Running the Notebook Manually**
- Open and run: notebooks/analysis.ipynb

# Reproducibility and Transparency: Reproducible Package

This project provides a fully reproducible workflow that allows any user to regenerate the complete analysis results from raw data acquisition to the final visualizations. The repository includes all necessary scripts, workflow automation, documentation, and shared data so that another user can repeat every step of the process and obtain the same outputs.

1. How to Reproduce the Entire Workflow

There are two supported methods to reproduce this project:

**Option A: Run Everything Automatically**
- The entire workflow (acquisition → cleaning → integration → analysis → visualizations) can be executed using: bash run_all.sh

This command invokes Snakemake, which automatically runs the following steps in order:
- Acquire USDA dataset (scripts/acquire_usda.py)
- Acquire CDC dataset from Box mirror (scripts/acquire_cdc.py)
- Integrate cleaned datasets (scripts/integration.py)
- Generate visualizations and correlation results (scripts/analysis.py)

Note: Since all the cleaing steps are preformed in openrefine, we stored all the cleaning hsitory in openrefine/ for recreate

All outputs will be saved to:
- data/raw/
- data/merge/
- results & figures/

**Option B: Run Notebook Scripts Manually** 

Alternatively, each notebook or Python script may be executed individually:
- notebooks/acquire_cdc.ipynb
- notebooks/acquire_usda.ipynb
- notebooks/integration.ipynb
- notebooks/analysis.ipynb
- 
This produces the same final results.

Note: Since all the cleaing steps are preformed in openrefine, we stored all the cleaning hsitory in openrefine/ for recreate

