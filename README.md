# IS477 Final Project - Fast-Food Density & Obesity Analysis
Contributors:
- Yonglin Ma 
- Richard(Ting Yu) Wu

# Summary: 
As college students, we often find ourselves with limited time to cook due to heavy coursework, tight schedules, and extracurricular commitments. Because of this, fast food has become the most convenient option for many of us. Around most university campuses, fast-food chains dominate the local food environment, which offer quick, inexpensive meals that fit a busy student lifestyle, but not necessarily a healthy one. Over time, frequent consumption of fast food, which is usually high in calories, fat, and sodium, may contribute to weight gain and other preventable health concerns.

This project explores a broader version of that everyday experience: whether the density of fast-food restaurants in a region is related to local obesity rates. We focus on county-level trends in the United States, using public health data from the CDC PLACES dataset and food-environment data from the USDA Food Environment Atlas. These datasets allow us to combine county-level estimates of adult obesity prevalence with measures of fast-food restaurant availability, giving us a structured way to examine potential relationships between the food environment and health outcomes.

Beyond satisfying personal curiosity, this topic raises an important public health question: how much does the built food environment influence people’s eating behaviors and long-term health? Understanding this relationship can help identify whether certain communities, especially those with limited access to healthier food options, face structural disadvantages that contribute to higher obesity rates. As students who regularly navigate food choices around campus, this project also encourages us to think more critically about how convenience-driven environments shape our habits.

Our research question is: How does the density of fast-food restaurants in a region relate to its obesity rate? By integrating food-environment data with regional health statistics, we aim to determine whether higher fast-food availability is associated with higher levels of adult obesity. While this project does not claim to establish causation, we hope it provides insight into how food accessibility patterns might be linked to health outcomes across different parts of the country.

With this framework established, we can briefly summarize what our exploratory findings show about the connection between these variables. Our initial analysis shows a weak negative association between fast food restaurant density and adult obesity rates, with a correlation coefficient of -0.1579. The findings reflect considerable variation across counties, suggesting that the relationship between these variables is not strong based on this preliminary measure.

# Data Profile:

For this project, we used two publicly available government datasets that provide county level information relevant to our research question. The CDC PLACES dataset offers model based health estimates, including adult obesity prevalence, while the USDA Food Environment Atlas provides indicators of local food environments, such as fast food restaurant density. Both datasets use the Federal Information Processing Standard (FIPS) code as a standardized geographic identifier, which allows us to merge them cleanly and analyze relationships at the county level.
 
The CDC PLACES dataset contains county level estimates for a broad set of health outcomes and risk factors. These indicators include adult obesity rates, chronic disease prevalence, and preventive health behaviors, all of which are produced through small area estimation techniques that draw on national survey data, primarily the Behavioral Risk Factor Surveillance System. Because these model based estimates are calculated for every county in the United States, even for areas with limited survey participation, the dataset provides comprehensive nationwide coverage. For our project, the key variable extracted from this dataset is adult obesity prevalence, which serves as our primary outcome measure.
 
The USDA Food Environment Atlas contains county level statistics related to food access, food availability, economic conditions, and community characteristics. The most important variable for our study is fast food restaurant density per one thousand residents, represented in the dataset as FFRPTH20. This variable measures the concentration of fast food establishments relative to the population size in each county, providing a consistent way to compare fast food availability across the country. The indicators in this dataset are compiled from federal administrative sources such as business establishment data, census population records, and economic surveys, which allows us to quantify environmental food exposure using reliable and standardized government information.
 
CDC PLACES is produced through survey based modeling techniques designed to generate stable population level health estimates, while the Food Environment Atlas is assembled using administrative and census based data collected by government agencies. Because both datasets originate from trusted federal sources, the methods, documentation, and data quality are transparent and consistent with academic research standards.
 
Ethically and legally, both datasets pose no privacy or confidentiality concerns. They contain only aggregated county level information and exclude any individual level records, personal identifiers, or sensitive health data. Even the geographic coordinates included in CDC PLACES represent only general county centroids, not specific locations tied to individuals. Both datasets are released under Public Domain licensing, meaning they are free to use for academic and research purposes with no restrictions other than standard attribution. The documentation provided by both agencies clearly outlines their data sources, methodology, and limitations, ensuring that the datasets can be used responsibly and reproducibly.
 
These datasets align directly with our research question and analytical needs. The CDC PLACES dataset supplies a consistent nationwide measure of adult obesity prevalence, allowing us to study variation in health outcomes across regions. The USDA Food Environment Atlas provides a standardized measure of fast food restaurant density, specifically the FFRPTH20 variable which captures fast food outlets per one thousand residents, enabling us to consider environmental factors that may influence dietary behavior and obesity risk. Because both datasets are county level, share compatible identifiers, and originate from credible government sources, they form a strong foundation for exploring the relationship between fast food availability and adult obesity in the United States.


# Data Quality:

Ensuring that the data was clean and reliable was very important for this project, because the analysis depends on the accuracy of both datasets we used. Even though the USDA Food Environment Atlas and the CDC PLACES datasets come from well established federal agencies, both of them contained quality issues that needed to be reviewed carefully before they could be combined. When evaluating data quality, we mainly focused on completeness, accuracy, consistency, validity, and whether the data was appropriate for the analysis. Fixing problems in each of these areas helped create a final dataset that was much more dependable and ready for meaningful analysis.

In terms of completeness, both datasets covered most counties in the United States, but they were not fully complete for every variable. The USDA dataset provides many different indicators related to food environment conditions, but not all counties had usable values for each indicator. For the specific measure used in this project, which is fast food restaurants per 1000 population, some counties had placeholder values like -9999 or -8888. These values indicate missing data, so they needed to be removed to prevent them from interfering with calculations and patterns in the analysis. The CDC dataset did not have the same issue. It contained valid FIPS identifiers and obesity rates for each row used in this project. Instead, the CDC file included some entries that were not county level observations, such as aggregate regions or national level rows. Since these entries could not be merged accurately and did not represent real counties, they were removed during cleaning. After taking out these non county rows, the CDC file became consistent with the geographic level used in the USDA data.

Accuracy and validity were also important to review, and many of the issues we found were connected to the completeness problems described above. In the USDA dataset, the main accuracy concern came from placeholder values like -9999 and -8888. These are not real measurements, so keeping them would have produced inaccurate averages or patterns in the analysis. This meant they had to be removed for the data to reflect actual county-level conditions. The CDC dataset did not have placeholder numbers, and all obesity rates were valid, but it contained a few rows that were not real counties. These entries are not meaningful for county-level analysis, and including them would lower the accuracy of the merged dataset. Removing both types of inaccurate entries ensured that the final dataset contained only real counties with interpretable values.

Consistency between the two datasets was another key area of focus. Even though both datasets include information about states and counties, the way these fields are formatted is not always the same. For example, county names may appear with abbreviations in one dataset and fully spelled out in the other. Because of these inconsistencies, the merge relied entirely on the FIPS identifier rather than textual fields. Using FIPS as the join key ensured that counties were matched correctly across datasets. After the merge, the combined dataset contained duplicate fields for county and state names. These redundant columns were compared to make sure that the values aligned, and once consistency was confirmed, the extra columns were removed to simplify the structure of the dataset.

The timing of the data also needed to be considered. The CDC dataset used in this project is from the 2024 release, while the USDA indicators come from the 2025 release. Although the years do not match exactly, both datasets provide recent nationwide estimates. The variables we used, such as fast food density and age adjusted obesity prevalence, typically do not fluctuate dramatically from year to year. Because of this, the slight timing difference does not seriously undermine the analysis, although it remains a minor limitation.

After these steps, the final integrated dataset was evaluated for overall fitness for use. At this stage, all rows represented real U.S. counties, with correct FIPS identifiers and valid values for each variable included in the analysis. Placeholder values had been removed, non county rows were filtered out, and numeric variables were standardized so they could be used directly in correlation and visualization procedures. The cleaned dataset was coherent and well structured, making it appropriate for studying the relationship between fast food restaurant density and adult obesity rates across U.S. counties.


# Findings: 
The relationship between fast food restaurant density and adult obesity rates was examined using merged county level data from the CDC PLACES dataset and the USDA Food Environment Atlas. The primary numerical result of this analysis was a correlation coefficient of -0.1579, indicating a weak negative association between the two variables. While the correlation is small in magnitude, it suggests that counties with higher fast food restaurant density tend to have slightly lower obesity rates, which is a surprising direction given common assumptions about fast food availability and health outcomes.
 
The scatterplot of obesity rate against fast food density supports this conclusion. Most counties cluster at lower density levels, with many observations falling between zero and two fast food restaurants per one thousand residents. Within this range, obesity rates vary widely, which helps explain the overall weakness of the relationship. Counties with very high fast food density are relatively rare, yet when they do appear, they often correspond to moderate obesity levels rather than the highest rates. The downward sloping line of best fit reflects the negative correlation, but the wide dispersion of points around the line shows that fast food density alone does not strongly predict obesity outcomes.
 
One interpretation of this pattern is that many other factors beyond fast food availability influence obesity rates, including socioeconomic conditions, lifestyle differences, and built environment characteristics. The negative direction of the correlation, although weak, points toward a dynamic in which places with the highest fast food density often differ in meaningful ways from places with the highest obesity rates. Counties with a larger number of fast food establishments tend to be urban or more densely populated areas where there are many restaurants of all kinds. In these environments, residents typically have greater access to a variety of food options, including healthier alternatives, and may not rely on fast food as heavily as the density measure might suggest. Additionally, urban residents often engage in more routine walking, public transit use, and active commuting, which can counterbalance dietary factors.
 
In contrast, counties with low fast food density often represent rural or suburban areas where obesity rates are typically higher. In these regions, long commuting distances, limited walkability, and reduced access to diverse food options can contribute to less healthy lifestyle patterns. Paradoxically, having fewer fast food restaurants does not necessarily indicate healthier environments. Instead, limited food choice combined with greater reliance on car travel may help explain why obesity rates tend to be higher in lower density areas.
 
Overall, the findings suggest that fast food restaurant density alone is not a strong determinant of obesity levels at the county level. The weak negative correlation and substantial variability in the data highlight the complex interplay between food environments, urbanization, lifestyle patterns, and socioeconomic contexts. While the direction of the relationship may be counterintuitive, the data indicate that broader structural and demographic factors shape health outcomes more strongly than fast food density by itself.
 
 
 
# Future work:
While this project provides an initial look at the relationship between fast food restaurant density and adult obesity rates, the findings highlight several opportunities for deeper analysis in the future. The weak negative correlation we observed suggests that obesity is influenced by a wide range of factors not captured by fast food availability alone. To gain a more complete understanding of these patterns, future work could incorporate additional variables, refine existing indicators, and explore more advanced analytical methods.
 
A major direction for future research is the inclusion of socioeconomic indicators that are known to shape health outcomes. Variables such as income, education, housing affordability, employment, and food insecurity could help explain why obesity rates differ so widely across counties with similar food environments. Including these factors would allow for multivariate modeling, making it possible to isolate the impact of fast food density from broader structural conditions.
 
Future studies may also benefit from improving the way food environments are measured. Fast food density per one thousand residents captures only one dimension of food access, and it may overlook important differences in how people interact with their local food landscape. Another insight that emerged during this project came from reflecting on our original motivation, which was based on the lived experience of college students who frequently rely on quick and convenient food options. While the fast food density metric captures the number of chain restaurants per one thousand residents, it does not necessarily reflect the full range of food choices available in certain communities. For example, in college towns such as the University of Illinois at Urbana Champaign, the number of fast food chain restaurants may appear relatively low per capita, yet the overall restaurant landscape is dominated by quick service options that function similarly to fast food in terms of convenience and nutritional profile. This suggests that future analyses might benefit from incorporating broader measures such as the total number of restaurants, the proportion of fast food outlets relative to all dining options, or the availability of healthier alternatives. These additional indicators could provide a more accurate representation of the food environment in communities where population size does not fully reflect the density or type of food establishments students regularly encounter.
 
In addition to refining food environment measures, future work could examine the role of urbanization more directly. The negative correlation observed in our study may partially reflect differences between urban and rural counties, where patterns of transportation, walkability, and access to amenities vary significantly. Including measures of population density, land use, or transportation behavior could help reveal whether the relationship between fast food density and obesity depends on the type of community being analyzed.
 
Methodologically, expanding beyond simple correlation analysis would also strengthen future research. Multivariate regression, clustering approaches, or geographic modeling could uncover non linear relationships or spatial patterns not visible through simple scatterplots. Geographic visualizations, such as heat maps or spatial autocorrelation measures, would also help highlight regional differences and identify potential clusters of high or low obesity.
 
Overall, future work should aim to capture more of the complexity underlying food environments and health outcomes. By incorporating additional variables, refining indicators, and applying more advanced analytical techniques, researchers can develop a more nuanced understanding of how environmental and socioeconomic factors interact to shape obesity patterns across the United States.


# Reproducing: 

To reproduce the results from this project, someone else would need to go through the same steps we used for data acquisition, cleaning, integration, and analysis. The process starts with obtaining the two raw datasets. Both datasets can be downloaded by running the Python acquisition scripts in the scripts folder. These scripts automatically pull the USDA Food Environment Atlas ZIP file and the CDC PLACES dataset from Box and generate SHA-256 checksums so the user can confirm that the files match the original versions we used. After the datasets are downloaded and verified, the next step is the first round of cleaning.

All cleaning for this project was done manually in OpenRefine, because many of the issues involved placeholder values, formatting inconsistencies, or rows that were not actual counties. Once the USDA and CDC files are opened in OpenRefine, the user needs to remove the USDA placeholder values like -9999 and -8888, delete any non-county rows from the CDC dataset, and make sure that all FIPS codes follow the standard five-digit format. Depending on the variable, a few additional filters may be needed. After this first cleaning step, the cleaned versions of both datasets should be exported and saved in the data/clean_1 folder following the same structure used in the project.

The next part of the workflow is the integration step. The cleaned USDA and CDC datasets can be merged by running the integration script in the repository. This merge uses FIPS as the only join key and produces a combined file containing both fast-food density and obesity rates. Because merging sometimes creates duplicate columns or formatting issues, the merged dataset goes through a second round of OpenRefine cleaning. In this step, the user should check the duplicate state and county columns to confirm that they match, then remove the extra ones. Any final formatting adjustments can also be made at this point. Once this second round of cleaning is completed, the final merged dataset should be exported to the data/clean_2 folder, where it becomes the analysis-ready file.

After preparing the final dataset, the last step is to run the analysis script in the scripts directory. This script loads the cleaned dataset, calculates the correlation, and produces the visualizations used in the report, including the scatterplot and the version with the regression line. All results are saved automatically in the results & figures folder. By following this full sequence of downloading the raw data, completing two rounds of cleaning in OpenRefine, merging the datasets, and running the final analysis script, another person would be able to fully reproduce the results in this project.


# References: 
Centers for Disease Control and Prevention. PLACES: Local Data for Better Health, County Data 2024. CDC, 2024, https://www.cdc.gov/places.

United States Department of Agriculture, Economic Research Service. Food Environment Atlas. USDA ERS, https://www.ers.usda.gov/data-products/food-environment-atlas/.

OpenRefine Project. OpenRefine, Version 3.7. OpenRefine, https://openrefine.org.

Google Research. Google Colaboratory. Google, https://colab.research.google.com.




## ***The following things that come below are the artifacts that are part of our project:***

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
- Source: https://www.cdc.gov/nccdphp/dph/
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

**USDA Dataset - Cleaning Summary (Performed in OpenRefine)**

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
- FIPS - Unique county identifier - Both
- State - State abbreviation - Both (validated to match)
- County - County name - Both (validated to match)
- fast_food_density - Fast-food restaurants per 1,000 population - USDA
- obesity_rate - Age-adjusted adult obesity prevalence - CDC

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

All outputs will be saved to:
- data/raw/
- data/merge/
- results & figures/

**Important Note on the Cleaning Step (OpenRefine)**

The cleaning step is not automated inside Snakemake, because both datasets required interactive transformations in OpenRefine, such as facet filtering, placeholder removal, FIPS validation, and column renaming.

1. However, the cleaning step remains fully reproducible. All OpenRefine operation histories (JSON recipes) are included:
- openrefine/usda-foodatlas-history.json
- openrefine/cdc-history.json
- openrefine/merged_output_cleaned.json

Anyone can reproduce the cleaning by loading the raw dataset into OpenRefine and applying the JSON recipe 

2. Snakemake is designed to start after cleaning.
Cleaning happens once outside the workflow, and Snakemake begins at integration using the cleaned files in data/clean_1/ and data/clean_2/

3. Cleaned outputs are versioned and stored
- data/clean_1/foodatlas_clean.csv
- data/clean_1/cdc_cleaned.csv
- data/clean_2/merged_output_cleaned.csv

Thus, although OpenRefine requires manual interaction, the full cleaning workflow is transparent, well-documented, and fully reproducible.

**Option B: Run Notebook Scripts Manually** 

Alternatively, instead of using Snakemake, each notebook or Python script may be
executed individually in the following order:
- notebooks/acquire_cdc.ipynb
- notebooks/acquire_usda.ipynb
- openrefine/cdc-history.json
- openrefine/foodatlas-history.json
- notebooks/integration.ipynb
- usda-foodatlas-history.json
- notebooks/analysis.ipynb
  
This produces the same final merged dataset and visualizations as the automated workflow.

## Data Access & Box Storage Requirements

Output & Raw Data Folder in Box
**https://uofi.box.com/s/0q80kvk5cen4nqxyh6vimmoknd11z1ul** 

This folder contains:
- Raw USDA ZIP file
- Raw CDC CSV (original version from 2025-11-16)
- cdc_cleaned.csv
- foodatlas_clean.csv
- merged_output.csv
- merged_output_cleaned.csv

Where to Place These Files

- data/raw/  → USDA & CDC raw files  
- data/clean_1/ → cdc_cleaned.csv & foodatlas_clean.csv
- data/merge/ → merged_output.csv
- data/clean_2/ → merged_output_cleaned.csv

## Gitignore
The .gitignore file excludes all Box-hosted datasets and auto-generated system files to keep the repository clean and compliant with project requirements.

Ignored paths include:
- data/raw/
- data/clean_1/
- data/clean_2/
- data/merge/
- .snakemake/
- .ipynb_checkpoints/
- __pycache__/

These folders contain large raw/cleaned data or temporary files that should not be pushed to GitHub.

## Software Dependencies

This project uses a minimal set of Python dependencies required to reproduce the acquisition, integration, and analysis workflows. All dependencies are listed in the requirements.txt file in the project root.

To recreate the environment, run: pip install -r requirements.txt

These packages were used for data acquisition (requests), cleaning and integration (pandas, numpy), visualization (matplotlib), and workflow automation (snakemake).

## Data Licenses

This project uses two publicly available U.S. federal datasets. All federal data used in this project is in the Public Domain, in accordance with U.S. government open-data policy.

**USDA Food Environment Atlas (2025 Release)**
- Publisher: U.S. Department of Agriculture, Economic Research Service
- License: Public Domain (U.S. Federal Government Data)
- Source Link: https://www.ers.usda.gov/data-products/food-environment-atlas/
- Citation: U.S. Department of Agriculture, Economic Research Service (USDA ERS). Food Environment Atlas Data, 2025 Release. Last Updated 7/30/2025. Accessed November 16, 2025. https://www.ers.usda.gov/data-products/food-environment-atlas/

**CDC PLACES - Local Data for Better Health (2024 Release)**
- Publisher: Centers for Disease Control and Prevention
- License: Public Domain
- Source Link: https://www.cdc.gov/nccdphp/dph/
- Citation: Centers for Disease Control and Prevention (CDC), National Center for Chronic Disease Prevention and Health Promotion, Division of Population Health.
PLACES: Local Data for Better Health, County Data, 2024 Release. Last Updated 12/23/2024. Accessed November 16, 2025. https://www.cdc.gov/nccdphp/dph/

**Special Note on Data Hosting**

The CDC PLACES dataset download link changed after our original acquisition date.
Because the raw CSV exceeds GitHub’s 25–50MB limit, we stored the exact version we downloaded (verified by SHA-256 checksum) in a public Box folder, which preserves access to the exact dataset version used in this project.

## Software License

All Python scripts, Jupyter notebooks, and Snakemake workflows included in this repository are released into the Public Domain under the: CC0 1.0 Universal (Public Domain Dedication)
- The authors waives all copyright and related rights to the extent possible.
- The software may be used, modified, or redistributed without permission or attribution.

# Metadata and data documentation

## Data Dictionary

| Column Name        | Type     | Description                                                         | Example     |
|--------------------|----------|---------------------------------------------------------------------|-------------|
| FIPS               | string   | 5-digit county identifier used by U.S. federal datasets            | "17031"     |
| State              | string   | U.S. state two-letter abbreviation                                  | "IL"        |
| County             | string   | County name                                                         | "Cook County" |
| fast_food_density  | float    | Number of fast-food restaurants per 1,000 population (USDA)         | 0.83        |
| obesity_rate       | float    | Age-adjusted adult obesity prevalence (%) from CDC PLACES          | 34.7        |

## Descriptive Metadata
```json
{
  "@context": "https://schema.org/",
  "@type": "Dataset",
  "name": "County-level Fast Food Density and Obesity Dataset",
  "description": "An integrated dataset combining USDA Food Environment Atlas fast food restaurant density with CDC PLACES adult obesity prevalence. This dataset supports exploratory analysis of environmental influences on health outcomes.",
  "creator": {
    "@type": "Person",
    "name": "Yonglin Ma"
  },
  "license": "CC0 1.0 Universal",
  "distribution": {
    "@type": "DataDownload",
    "contentUrl": "https://uofi.box.com/s/0q80kvk5cen4nqxyh6vimmoknd11z1ul", 
    "encodingFormat": "CSV"
  },
  "dateCreated": "2025-11-18",
  "keywords": [
    "USDA",
    "CDC",
    "public health",
    "obesity",
    "fast food",
    "county-level data"
  ]
}
