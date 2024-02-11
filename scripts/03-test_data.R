#### Preamble ####
# Purpose: test the simulated dataset
# Author: Yingxuan Sun
# Date: 11 February 2023
# Contact: lindayx.sun@mail.utoronto.ca 
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(testthat)

#### Test data ####
# read the dataset
data <- read_csv("data/simulated_data/simulated_data.csv")

# Test that the data frame has the correct column names
test_that("Data frame has correct column names", {
  # Expected column names, assuming the first column name is intentionally left blank
  expected_colnames <- c("NO.","Aggression","Hostile_online","Hostile_offline")
  # Actual column names from the generated data frame
  actual_colnames <- names(data)
  # Check if the actual column names match the expected ones
  expect_equal(actual_colnames, expected_colnames)
})

# Test that the dataset has the correct number of rows
test_that("Dataset has correct number of rows", {
  # Check if the number of rows in the data frame matches the expected number, assuming 100 rows were intended
  expect_equal(nrow(data), 100) # Assuming you expected to generate 100 rows of data
})

# Test that data values are within the correct range
test_that("Data values are in the correct range", {
  # Check if all values in the Aggression column are between 0 and 1, inclusive
  expect_true(all(data$Aggression >= 0 & data$Aggression <= 1))
  # Check if all values in the Hostile_online column are between 0 and 1, inclusive
  expect_true(all(data$Hostile_online >= 0 & data$Hostile_online <= 1))
  # Check if all values in the Hostile_offline column are between 0 and 1, inclusive
  expect_true(all(data$Hostile_offline >= 0 & data$Hostile_offline <= 1))
})

# Test that the data file is correctly generated
test_that("Data file is correctly generated", {
  # Check if the expected CSV file exists in the specified directory
  expect_true(file.exists("data/simulated_data/simulated_data.csv"))
})