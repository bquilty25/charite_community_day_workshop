# Malaria Analysis Plan

## What to build
Generate a Quarto report analyzing malaria surveillance data.

## Programming setup
- Use R with tidyverse
- Use ggplot2 for plots
- Use the `here` package for all file paths
- Output: Quarto document (.qmd) that renders to HTML

## Data
- **File**: `here("data", "malaria_facility_count_data.rds")`
- **Load with**: `readRDS(here::here("data", "malaria_facility_count_data.rds"))`
- **Key variables**:
  - `data_date`: When cases occurred
  - `District`: Geographic area
  - `malaria_tot`: Total number of cases
  - `submitted_date`: When data was reported
  - `malaria_rdt_0-4`, `malaria_rdt_5-14`, `malaria_rdt_15`: Cases by age band (create age-group summaries from these columns)

## Analyses to include

### 1. Temporal trends
Show how total malaria cases changed over time (all districts combined and by district where helpful).
- Line plot with date on x-axis, total cases on y-axis
- Include a trend line
- Save as `here("images", "malaria_cases_by_district.png")`
- Report: total cases, mean daily cases, date with maximum cases

### 2. Age distribution
Compare malaria cases across age groups.
- Bar plot showing cases by age group
- Include percentage labels
- Save as `here("images", "malaria_age_distribution.png")`
- Report: total and percentage for each age group

### 3. Reporting delays
Analyze the delay between case occurrence and reporting.
- Calculate: `submitted_date - data_date`
- Create histogram or bar plot of delays
- Save as `here("images", "malaria_reporting_delay.png")`
- Report: median delay, percentage reported within 7 days

## Report format

Create a Quarto document with these sections:

1. **Introduction**: Brief overview of the data and goals
2. **Temporal trends**: Include the plot and key statistics
3. **Age distribution**: Include the plot and summary stats
4. **Reporting delays**: Include the plot and findings
5. **Conclusions**: Main takeaways and recommendations

Include YAML header:
```yaml
---
title: "Malaria Surveillance Analysis"
format: html
---
```

## Additional notes
- Use clean, well-commented code
- Handle any missing data appropriately
- Make sure the report is easy to understand
- Focus on practical insights for malaria surveillance
