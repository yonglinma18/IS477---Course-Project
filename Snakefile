# Rule 1: Acquire USDA Dataset
rule acquire_usda:
    output:
        "data/raw/usda_food_atlas_2025.zip"
    script:
        "scripts/acquire_usda.py"

# Rule 2: Acquire CDC Dataset
rule acquire_cdc:
    output:
        "data/raw/cdc_places_2024.csv"
    script:
        "scripts/acquire_cdc.py"

# Rule 3: Clean USDA Raw (OpenRefine)
rule clean_usda:
    input:
        "data/raw/usda_food_atlas_2025.zip"
    output:
        "data/clean/foodatlas_clean.csv"
    shell:
        """
        echo "Please open OpenRefine, import raw USDA dataset, apply 'openrefine/usda-foodatlas-history.json', 
        and export to data/clean/foodatlas_clean.csv"
        """

# Rule 4: Clean CDC Raw (OpenRefine)
rule clean_cdc:
    input:
        "data/raw/cdc_places_2024.csv"
    output:
        "data/clean/cdc_cleaned.csv"
    shell:
        """
        echo "Please open OpenRefine, import raw CDC dataset, apply 'openrefine/cdc-history.json', 
        and export to data/clean/cdc_cleaned.csv"
        """

# Rule 5: Integration (Python merge)
rule integrate:
    input:
        cdc="data/clean/cdc_cleaned.csv",
        atlas="data/clean/foodatlas_clean.csv"
    output:
        "data/processed/merged_output.csv"
    script:
        "scripts/integration.py"

# Rule 6: Clean merged dataset (OpenRefine #2)
rule clean_merged_dataset:
    input:
        "data/processed/merged_output.csv"
    output:
        "data/processed/merged_output_cleaned.csv"
    shell:
        """
        echo "Please open OpenRefine, import merged_output.csv, apply 'openrefine/merged_output_cleaned.json', 
        and export to data/processed/merged_output_cleaned.csv"
        """

# Rule 7: Analysis (Python)
rule analyze:
    input:
        "data/processed/merged_output_cleaned.csv"
    output:
        "results & figures/obesity_fastfood.png",
        "results & figures/obesity_fastfood_regression_line.png"
    script:
        "scripts/analysis.py"

# Default Target: run everything
rule all:
    input:
        "results & figures/obesity_fastfood.png",
        "results & figures/obesity_fastfood_regression_line.png"
