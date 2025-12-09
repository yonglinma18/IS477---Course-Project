# -------------------------
# Snakemake Workflow
# Automates acquisition + integration + analysis.
# Cleaning steps are manually performed in OpenRefine (documented in README).

rule all:
    input:
        "results & figures/obesity_fastfood.png",
        "results & figures/obesity_fastfood_regression_line.png"

# Acquire USDA Dataset
rule acquire_usda:
    output:
        "data/raw/usda_food_atlas_2025.zip"
    script:
        "scripts/acquire_usda.py"

# Acquire CDC Dataset
rule acquire_cdc:
    output:
        "data/raw/cdc_places_2024.csv"
    script:
        "scripts/acquire_cdc.py"

# Merge cleaned datasets (Python)
rule integrate:
    input:
        cdc="data/clean_1/cdc_cleaned.csv",
        atlas="data/clean_1/foodatlas_clean.csv"
    output:
        "data/merge/merged_output.csv"
    script:
        "scripts/integration.py"

# Analysis using the final cleaned merged dataset
rule analyze:
    input:
        "data/clean_2/merged_output_cleaned.csv"
    output:
        "results & figures/obesity_fastfood.png",
        "results & figures/obesity_fastfood_regression_line.png"
    script:
        "scripts/analysis.py"
