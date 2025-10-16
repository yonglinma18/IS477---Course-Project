# Overview:
As college students, we often find ourselves with limited time to cook due to heavy coursework, tight schedules, and extracurricular commitments. As a result, fast food has become the most convenient and accessible option for many of us. Around most university campuses, fast-food chains dominate the local food environment, offering cheap and quick meals that fit a student lifestyle and needs, but not necessarily a healthy one. Over time, frequent consumption of fast food, which is often high in calories, fat, and sodium, may contribute to weight gain and other health issues.

In this project, we aim to explore how the density of fast-food restaurants in a region may be related to local obesity rates, particularly among young adults and students who rely on these options for daily meals. We plan to obtain health-related data from a public health website and combine it with a dataset that contains detailed information about fast-food restaurant locations and density. By analyzing and integrating these datasets, we hope to identify whether areas with higher fast-food availability tend to experience higher obesity prevalence.

Beyond satisfying personal curiosity, this analysis also highlights an important public health concern, how the built food environment can influence people’s eating behaviors and long-term health outcomes. Ultimately, we hope this project encourages greater awareness about the impact of food accessibility on lifestyle and motivates students to make more balanced nutritional choices even in busy academic environments.

# Research Question:
Our research question is: How does the density of fast-food restaurants in a region relate to its obesity rate? We aim to explore whether areas with a higher concentration of fast-food locations tend to have higher obesity levels. By analyzing data on restaurant distribution and regional health statistics, we hope to uncover patterns that show how the food environment may influence public health outcomes.

# Team:
Our team consists of Richard Wu and Yonglin Ma. Yonglin will handle data collection and cleaning to ensure the datasets on fast-food locations and obesity rates are accurate and consistent. Richard will focus on analyzing the prepared data and identifying meaningful patterns and insights. Throughout the project, we’ll work together on building visualizations, interpreting our findings, and preparing the final report to effectively communicate our results.

# Datasets:
For this project, we will use two main datasets from trustworthy public sources, following the data lifecycle model discussed in class, from planning and acquisition to integration and analysis.

The first dataset comes from the Centers for Disease Control and Prevention (CDC) PLACES - Local Data for Better Health, County Data (2024). It provides county-level estimates for adult obesity rates and other health indicators across the United States. This dataset is available in CSV format and includes a unique Federal Information Processing Standard (FIPS) code for each county, which will serve as our primary key for integration.

The second dataset is from the U.S. Department of Agriculture (USDA) Food Environment Atlas. It includes measures of food access and availability, such as the number and density of fast-food restaurants per 1,000 residents. This dataset is also at the county level and contains the same FIPS identifiers, making it compatible with the CDC dataset for merging.

All of our datasets are publicly available and do not include any personal information. We will use the data responsibly by complying with each source’s terms of use, giving proper credit, and keeping our process clear and easy to reproduce.

# Timeline:
Our project will follow the full data lifecycle model discussed in class, moving through five main phases: planning, data collection, integration and cleaning, analysis, and documentation.

Phase 1 - Planning and Ethics (Modules 1-2) 
We will finalize our research question, select datasets from the CDC and USDA, and review all ethical and licensing considerations. Both of us will ensure the selected data is publicly available, ethically sourced, and free of personal information.

Phase 2 - Data Collection and Organization (Modules 3-5)
We will obtain the datasets in CSV or Excel format, confirm their credibility, and organize them into structured folders within our GitHub repository. This phase also includes establishing consistent naming conventions and documenting the storage structure for easier reference.

Phase 3 - Data Integration and Cleaning (Modules 6-9)
Yonglin will work on integrating the datasets by selecting relevant variables, standardizing FIPS codes, and calculating fast-food density per 100,000 residents. Both of us will assess data completeness, handle missing values, and apply cleaning procedures to ensure consistency across datasets before analysis.

Phase 4 - Data Analysis (Modules 10-12)
Richard will conduct the main analysis, exploring patterns and relationships between fast-food density and obesity rates. This phase will involve testing different approaches to identify meaningful insights and summarizing key findings for visualization and discussion.

Phase 5 - Documentation and Final Collaboration (Modules 13-15)
We will work together to create visualizations, interpret results, and prepare the final report. We will also compile metadata, document our workflow, and submit the completed project on GitHub with all relevant files and descriptions.

# Constraints: 
One constraint of this project is data availability and timing alignment. The two datasets we plan to use were last updated at different times, the CDC PLACES dataset (last updated December 23, 2024) and the USDA Food Environment Atlas (last updated July 30, 2025). Since the datasets may represent data collected in different reference years, it may be difficult to perfectly align time periods across sources. We plan to address this by using the most recent overlapping year available and clearly noting this as a limitation when interpreting our results.

Another limitation is that both datasets are aggregate-level data, meaning we cannot analyze individual-level behaviors or make causal inferences. Our analysis will focus on correlations and general patterns at the county level, recognizing that the observed relationships may be influenced by broader socioeconomic or environmental factors.

Additionally, fast-food classification in the USDA data may not perfectly capture all relevant establishments, as some restaurants may fall outside the NAICS code 722513 or be misclassified. Minor technical constraints also exist, such as missing values, inconsistent variable names, and formatting differences across datasets, which will require additional cleaning and standardization.

Despite these limitations, both datasets are publicly available, up-to-date, and methodologically robust, providing a strong foundation for meaningful exploratory and statistical analysis.

# Gaps:
At this stage, there are still a few parts of our project that need more work or feedback. One clear gap is in our data analysis plan, as we are still deciding which statistical methods will best show the relationship between fast-food density and obesity rate. We plan to start with correlation and simple linear regression, but we may explore other techniques later, depending on the quality and patterns in our data.

We also plan to seek feedback on data interpretation, especially regarding socioeconomic confounders such as income, education, and urbanization that may influence obesity rates. Including such control variables will depend on the availability of relevant data from the Census or USDA sources.

