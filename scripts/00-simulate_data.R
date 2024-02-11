#### Preamble ####
# Purpose: simulate and generate a dataset with columns for Aggression, Hostile_online, and Hostile_offline scores
# Author: Yingxuan Sun
# Date: 11 February 2023
# Contact: lindayx.sun@mail.utoronto.ca 
# License: MIT

#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
# Define function to calculate Aggression
calculate_Aggression <- function() {
  # Generate 12 random integers between 1 and 7
  Aggression_values <- sample(1:7, 12, replace = TRUE)
  
  # Calculate the final value
  Aggression <- (sum(Aggression_values - 1)) / ((7 - 1) * 12)
  
  return(Aggression)
}

# Define function to calculate Hostile_online
calculate_Hostile_online <- function() {
  # Generate 3 random integers between 1 and 7
  Hostile_online_values <- sample(1:7, 3)
  
  # Calculate the final value
  Hostile_online <- (sum(Hostile_online_values - 1)) / ((7 - 1) * 3)
  
  return(Hostile_online)
}

# Define function to calculate Hostile_offline
calculate_Hostile_offline <- function() {
  # Generate 3 random integers between 1 and 7
  Hostile_offline_values <- sample(1:7, 3)
  
  # Calculate the final value
  Hostile_offline <- (sum(Hostile_offline_values - 1)) / ((7 - 1) * 3)
  
  return(Hostile_offline)
}

# Set the number of rows to generate
num_rows <- 100

# Generate data
data <- data.frame(
  Aggression = replicate(num_rows, calculate_Aggression()),
  Hostile_online = replicate(num_rows, calculate_Hostile_online()),
  Hostile_offline = replicate(num_rows, calculate_Hostile_offline())
)

# Create directory if it doesn't exist
dir.create("data/simulated_data", showWarnings = FALSE, recursive = TRUE)

# Add an ID column for sequence numbers
data$ID <- seq_len(nrow(data))

# Ensure ID column is the first column
data <- data %>% select(ID, everything())
names(data)[1] <- "NO."

# Write data to a CSV file
write.csv(data, file = "data/simulated_data/simulated_data.csv", row.names = FALSE)

  



