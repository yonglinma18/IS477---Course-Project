# Project Overview & Overall Progress:
Our project investigates whether fast-food restaurant density in U.S. counties is associated with adult obesity rates, using two authoritative federal datasets: the USDA Food Environment Atlas (2025) and the CDC PLACES county-level health indicators (2024). Since Milestone 2, we have made progress in acquisition, documentation, cleaning, validation, and integration of the data. Our entire data pipeline, from downloading the two datasets to producing the final merged dataset, is now fully reproducible and complete. With all preprocessing tasks finished, the project is ready to transition into the exploratory data analysis phase.

# Progress Update by Project Plan Tasks：

## Task 1: Data Collection & Acquisition (Completed)
We successfully developed a fully reproducible acquisition workflow in Google Colab. Because the raw USDA and CDC files exceed GitHub’s upload limits, only cleaned and size-reduced subsets are included in the repository, while the raw datasets are downloaded programmatically. The acquisition script automatically retrieves both datasets, creates directory structures, verifies file integrity using SHA-256 checksums, and documents all procedures in the repository. This ensures that any user can reproduce the entire acquisition process directly from our notebook.

## Task 2: Data Cleaning & Quality Checking (Completed)
Data cleaning was the most time-intensive portion of this milestone. All cleaning work was conducted in OpenRefine, ensuring reproducibility through operation-history JSON files. We split the cleaning workflows by dataset.

- USDA Cleaning (Completed by Yonglin)
Yonglin extracted only the variables relevant to fast-food density, focusing exclusively on FFRPTPTH20 (fast-food restaurants per 1,000 population). County-level rows were retained, while non-county aggregates and rows outside the 50 states were removed. FIPS codes were validated to ensure exact 5-digit formatting, and placeholders such as “-9999” were cleaned and removed. After selecting and renaming the final variables (State, County, FIPS, fast_food_density), the dataset was exported as foodatlas_cleaned.csv and documented in data/README.md

- CDC Cleaning (Completed by Yonglin)
The CDC dataset was filtered to retain only the indicator “Obesity among adults,” focusing on age-adjusted prevalence values. Non-county rows, national aggregates, and Washington D.C. were removed to match our 50-state scope. Column names were standardized (including State, County, FIPS, and Obesity_rate), and malformed FIPS or numeric values were corrected. The final dataset, cdc_cleaned.csv, was exported and documented thoroughly. All cleaning steps are recorded in OpenRefine JSON files for full reproducibility.

## Task 3: Data Integration (Completed)
Richard conducted the integration workflow in Google Colab using Pandas. Cleaned USDA and CDC datasets were imported from the processed/ directory and merged using the validated 5-digit FIPS codes as the join key. An inner merge was performed to retain only counties present in both datasets. After merging, Richard identified overlapping and redundant columns and resolved them in OpenRefine by standardizing names and removing duplicates. The resulting schema includes:
- FIPS

- State

- County

- fast_food_density (USDA)

- Obesity_rate (CDC)

## Task 4: Ethics, Privacy, and Licensing Review (Completed Together)
We reviewed the privacy, licensing, and ethical considerations. Both datasets are published by U.S. federal agencies and are in the public domain, containing only aggregated, non-identifiable information. FIPS geographic identifiers do not introduce privacy risks, and no external enrichment sources were added. Our original ethical guidelines from the Project Plan remain fully valid.

## Task 5: Repository Structure & Documentation (Completed)
The repository has been reorganized to emphasize transparency and reproducibility. It now includes a structured data directory with placeholders for raw files and processed outputs, detailed cleaning documentation, modular notebooks for acquisition, cleaning, and integration, and a script for automated data downloading. All project planning and reporting documents (ProjectPlan.md, StatusReport.md) are included in the main directory.

# 3. Updated Timeline & Milestone Status
All tasks planned for this phase of the project have been completed on schedule, and the timeline remains fully aligned with our original plan. Data acquisition was finished first, and the entire workflow is now fully reproducible through the Colab notebook. Data cleaning for both the USDA and CDC datasets was completed as intended, and all OpenRefine operation histories have been uploaded to the repository. FIPS validation was completed without any inconsistencies, and data integration was successfully carried out, including resolving duplicate columns that appeared during the merge. The ethics and licensing review raised no concerns and confirmed that both datasets are appropriate for analysis. With preprocessing fully completed, the project is now positioned to begin exploratory analysis and visualization in the following weeks. Overall, the project is progressing exactly as scheduled.

# 4. Changes Since Milestone 2
- As we began carrying out the tasks in our project plan, it became clear that certain steps needed to be changed in order to maintain reproducibility standards and ensure better data quality. Thus, we implemented the following refinements:
Shifted from "merge:clean" to "clean: merge"
Cleaning each dataset independently before merging ensured consistent formatting and prevented mismatches.

- Added duplicate-column cleanup:
Merging introduced overlapping column names, which Richard resolved in OpenRefine.

- Expanded documentation:
We added more detailed explanations of naming conventions, cleaning logic, and acquisition workflows to improve clarity.

- Deferred analysis to Milestone 4:
Because we dedicated significant time to ensuring the quality and consistency of our cleaned datasets, we have not yet begun the analysis stage and will be pushing that work into the following weeks.

# 5. Remaining Gaps & Next Steps
- Remaining Gaps:
Preliminary statistical checks of the merged dataset are still needed.
No exploratory visualizations have been created yet.
No correlation or hypothesis testing has been conducted.

- Next Steps (Milestone 4):
Generate EDA visualizations (scatterplots, distributions, county-level maps).
Compute correlations and explore preliminary statistical relationships.
Begin writing the analytical narrative for the final report.
Finalize and upload the merged dataset.
