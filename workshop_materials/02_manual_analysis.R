# Malaria Data Analysis: Manual Approach
# Workshop: AI-Augmented R Coding
# Authors: Billy Quilty & Stefan Flasche

# Load required libraries
library(tidyverse)
library(ggplot2)
library(lubridate)
library(scales)

# Load the malaria dataset from Epi R Handbook
# Download the dataset if it doesn't exist
if (!file.exists("../data/malaria_facility_count_data.rds")) {
    download.file(
        "https://github.com/appliedepi/epirhandbook_eng/raw/master/data/malaria_facility_count_data.rds",
        "../data/malaria_facility_count_data.rds"
    )
}

# Load the malaria dataset
malaria_data <- readRDS("../data/malaria_facility_count_data.rds") %>%
    mutate(
        data_date = as.Date(data_date),
        submitted_date = as.Date(submitted_date)
    )

# Data exploration
print("Dataset structure:")
str(malaria_data)

print("First few rows:")
head(malaria_data)

print("Summary statistics:")
summary(malaria_data)

# Data transformation: Calculate age group proportions and rates
malaria_data <- malaria_data %>%
    mutate(
        # Calculate proportions by age group
        prop_0_4 = `malaria_rdt_0-4` / malaria_tot,
        prop_5_14 = `malaria_rdt_5-14` / malaria_tot,
        prop_15_plus = `malaria_rdt_15` / malaria_tot,
        # Create week and month variables
        week = floor_date(data_date, "week"),
        month = floor_date(data_date, "month"),
        # Calculate reporting delay
        reporting_delay = as.numeric(submitted_date - data_date)
    )

# Create weekly aggregates by district for better visualisation
weekly_data <- malaria_data %>%
    group_by(week, District) %>%
    summarise(
        total_cases = sum(malaria_tot, na.rm = TRUE),
        total_0_4 = sum(`malaria_rdt_0-4`, na.rm = TRUE),
        total_5_14 = sum(`malaria_rdt_5-14`, na.rm = TRUE),
        total_15_plus = sum(`malaria_rdt_15`, na.rm = TRUE),
        avg_reporting_delay = mean(reporting_delay, na.rm = TRUE),
        num_facilities = n(),
        .groups = "drop"
    ) %>%
    mutate(
        prop_0_4 = total_0_4 / total_cases,
        prop_5_14 = total_5_14 / total_cases,
        prop_15_plus = total_15_plus / total_cases
    )

# Plot 1: Total malaria cases over time by district
p1 <- ggplot(weekly_data, aes(x = week, y = total_cases, colour = District)) +
    geom_line(size = 0.8) +
    labs(
        title = "Weekly Malaria Cases by District",
        subtitle = "May-August 2020",
        x = "Date",
        y = "Number of Cases",
        colour = "District"
    ) +
    theme_minimal() +
    theme(
        plot.title = element_text(size = 14, face = "bold"),
        plot.subtitle = element_text(size = 12),
        axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "bottom"
    ) +
    scale_x_date(date_labels = "%b %d", date_breaks = "2 weeks")

print(p1)

# Plot 2: Age group distribution over time
age_data <- weekly_data %>%
    select(week, District, prop_0_4, prop_5_14, prop_15_plus) %>%
    pivot_longer(cols = starts_with("prop"), names_to = "age_group", values_to = "proportion") %>%
    mutate(age_group = case_when(
        age_group == "prop_0_4" ~ "0-4 years",
        age_group == "prop_5_14" ~ "5-14 years",
        age_group == "prop_15_plus" ~ "15+ years"
    ))

p2 <- ggplot(age_data, aes(x = week, y = proportion, fill = age_group)) +
    geom_area() +
    facet_wrap(~District, scales = "free_y") +
    labs(
        title = "Age Group Distribution of Malaria Cases",
        subtitle = "Proportion of cases by age group and district",
        x = "Date",
        y = "Proportion of Cases",
        fill = "Age Group"
    ) +
    theme_minimal() +
    theme(
        plot.title = element_text(size = 14, face = "bold"),
        plot.subtitle = element_text(size = 12),
        axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "bottom"
    ) +
    scale_x_date(date_labels = "%b %d", date_breaks = "2 weeks") +
    scale_y_continuous(labels = percent_format())

print(p2)

# Plot 3: Reporting delay by district
p3 <- ggplot(weekly_data, aes(x = week, y = avg_reporting_delay, colour = District)) +
    geom_line(size = 0.8) +
    labs(
        title = "Average Reporting Delay by District",
        subtitle = "Days between data collection and submission",
        x = "Date",
        y = "Average Reporting Delay (Days)",
        colour = "District"
    ) +
    theme_minimal() +
    theme(
        plot.title = element_text(size = 14, face = "bold"),
        plot.subtitle = element_text(size = 12),
        axis.text.x = element_text(angle = 45, hjust = 1),
        legend.position = "bottom"
    ) +
    scale_x_date(date_labels = "%b %d", date_breaks = "2 weeks")

print(p3)

# Statistical analysis: Compare districts and age groups
district_summary <- malaria_data %>%
    group_by(District) %>%
    summarise(
        total_cases = sum(malaria_tot, na.rm = TRUE),
        total_0_4 = sum(`malaria_rdt_0-4`, na.rm = TRUE),
        total_5_14 = sum(`malaria_rdt_5-14`, na.rm = TRUE),
        total_15_plus = sum(`malaria_rdt_15`, na.rm = TRUE),
        avg_daily_cases = mean(malaria_tot, na.rm = TRUE),
        max_daily_cases = max(malaria_tot, na.rm = TRUE),
        avg_reporting_delay = mean(reporting_delay, na.rm = TRUE),
        num_facilities = n_distinct(location_name),
        .groups = "drop"
    ) %>%
    mutate(
        prop_0_4 = total_0_4 / total_cases,
        prop_5_14 = total_5_14 / total_cases,
        prop_15_plus = total_15_plus / total_cases
    )

print("District summary statistics:")
print(district_summary)

# Age group analysis
age_summary <- malaria_data %>%
    summarise(
        total_0_4 = sum(`malaria_rdt_0-4`, na.rm = TRUE),
        total_5_14 = sum(`malaria_rdt_5-14`, na.rm = TRUE),
        total_15_plus = sum(`malaria_rdt_15`, na.rm = TRUE),
        total_cases = sum(malaria_tot, na.rm = TRUE)
    ) %>%
    mutate(
        prop_0_4 = total_0_4 / total_cases,
        prop_5_14 = total_5_14 / total_cases,
        prop_15_plus = total_15_plus / total_cases
    )

print("Overall age group distribution:")
print(age_summary)

# Peak period analysis
peak_weeks <- weekly_data %>%
    group_by(District) %>%
    slice_max(total_cases, n = 3) %>%
    arrange(District, desc(total_cases))

print("Peak weeks by district:")
print(peak_weeks)

# Save plots
ggsave("../images/malaria_cases_by_district.png", p1, width = 10, height = 6, dpi = 300)
ggsave("../images/malaria_age_distribution.png", p2, width = 12, height = 8, dpi = 300)
ggsave("../images/malaria_reporting_delay.png", p3, width = 10, height = 6, dpi = 300)

print("Analysis complete! Plots saved to ../images/ directory.")
