# Test Setup Script for AI-Augmented R Coding Workshop
# This script verifies that all components are working correctly

# Test 1: Load required packages
cat("Testing package loading...\n")
required_packages <- c("tidyverse", "ggplot2", "lubridate", "scales", "knitr", "kableExtra")

for (pkg in required_packages) {
    if (require(pkg, character.only = TRUE, quietly = TRUE)) {
        cat("✓", pkg, "loaded successfully\n")
    } else {
        cat("✗", pkg, "failed to load\n")
    }
}

# Test 2: Check if data files exist
cat("\nTesting data files...\n")
data_files <- c("../data/malaria_facility_count_data.rds", "../data/malaria_data.csv")

for (file in data_files) {
    if (file.exists(file)) {
        cat("✓", file, "exists\n")
    } else {
        cat("✗", file, "missing\n")
    }
}

# Test 3: Load and examine data
cat("\nTesting data loading...\n")
tryCatch(
    {
        malaria_data <- readRDS("../data/malaria_facility_count_data.rds")
        cat("✓ Data loaded successfully\n")
        cat("  - Rows:", nrow(malaria_data), "\n")
        cat("  - Columns:", ncol(malaria_data), "\n")
        cat("  - Districts:", length(unique(malaria_data$District)), "\n")
        cat("  - Facilities:", length(unique(malaria_data$location_name)), "\n")
        cat("  - Date range:", min(malaria_data$data_date), "to", max(malaria_data$data_date), "\n")
    },
    error = function(e) {
        cat("✗ Data loading failed:", e$message, "\n")
    }
)

# Test 4: Check if plots were generated
cat("\nTesting plot files...\n")
plot_files <- c(
    "../images/malaria_cases_by_district.png", "../images/malaria_age_distribution.png",
    "../images/malaria_reporting_delay.png"
)

for (file in plot_files) {
    if (file.exists(file)) {
        cat("✓", file, "exists\n")
    } else {
        cat("✗", file, "missing\n")
    }
}

# Test 5: Check if HTML outputs were generated
cat("\nTesting HTML outputs...\n")
html_files <- c("01_workshop_slides.html", "05_final_report_template.html")

for (file in html_files) {
    if (file.exists(file)) {
        cat("✓", file, "exists\n")
    } else {
        cat("✗", file, "missing\n")
    }
}

# Test 6: Quick data analysis test
cat("\nTesting data analysis...\n")
tryCatch(
    {
        malaria_data <- readRDS("../data/malaria_facility_count_data.rds")

        # Test basic calculations
        total_cases <- sum(malaria_data$malaria_tot, na.rm = TRUE)
        total_0_4 <- sum(malaria_data$`malaria_rdt_0-4`, na.rm = TRUE)
        total_5_14 <- sum(malaria_data$`malaria_rdt_5-14`, na.rm = TRUE)
        total_15_plus <- sum(malaria_data$`malaria_rdt_15`, na.rm = TRUE)

        cat("✓ Basic calculations successful\n")
        cat("  - Total cases:", format(total_cases, big.mark = ","), "\n")
        cat("  - Age 0-4 years:", format(total_0_4, big.mark = ","), "cases\n")
        cat("  - Age 5-14 years:", format(total_5_14, big.mark = ","), "cases\n")
        cat("  - Age 15+ years:", format(total_15_plus, big.mark = ","), "cases\n")
    },
    error = function(e) {
        cat("✗ Data analysis failed:", e$message, "\n")
    }
)

# Test 7: Check Quarto availability
cat("\nTesting Quarto availability...\n")
quarto_path <- Sys.which("quarto")
if (nchar(quarto_path) > 0) {
    quarto_version <- system2(quarto_path, "--version", stdout = TRUE, stderr = FALSE)
    cat("✓ Quarto is available\n")
    if (length(quarto_version) > 0) {
        cat("  Version:", quarto_version[1], "\n")
    }
} else {
    cat("✗ Quarto not found or not working\n")
}

cat("\n=== Setup Test Complete ===\n")
cat("If all tests show ✓, the workshop materials are ready!\n")
cat("If any tests show ✗, please check the error messages above.\n")
