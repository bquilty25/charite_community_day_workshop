# Explore Malaria Dataset from Epi R Handbook
# Workshop: AI-Augmented R Coding
# Authors: Billy Quilty & Stefan Flasche

# Load required libraries
library(tidyverse)
library(ggplot2)
library(lubridate)
library(scales)

# Load the malaria dataset
malaria_data <- readRDS("../data/malaria_facility_count_data.rds")

# Explore the dataset structure
cat("=== MALARIA DATASET EXPLORATION ===\n")
cat("Dataset structure:\n")
str(malaria_data)

cat("\nDataset dimensions:\n")
dim(malaria_data)

cat("\nColumn names:\n")
colnames(malaria_data)

cat("\nFirst few rows:\n")
head(malaria_data)

cat("\nSummary statistics:\n")
summary(malaria_data)

cat("\nUnique values in each column:\n")
sapply(malaria_data, function(x) length(unique(x)))

cat("\nSample of unique values for each column:\n")
for (col in colnames(malaria_data)) {
  cat("\n", col, ":\n")
  print(head(unique(malaria_data[[col]]), 10))
}

# Check for missing values
cat("\nMissing values:\n")
colSums(is.na(malaria_data))

# Check data types
cat("\nData types:\n")
sapply(malaria_data, class)

# Save the exploration results
cat("\n=== EXPLORATION COMPLETE ===\n")
cat("Malaria dataset successfully loaded and explored!\n")

# Save the dataset as CSV for easier access
write.csv(malaria_data, "../data/malaria_data.csv", row.names = FALSE)
cat("Dataset also saved as ../data/malaria_data.csv for easier access\n")
