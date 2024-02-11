---
#### Preamble ####
# Purpose: Clean the data up so that only the columes we need remained
# Author: Yiyi Feng
# Date: 10 February 2024
# Contact: yiyi.feng@mail.utoronto.ca
# License: MIT
# Pre-requisites: [s1_us_2018.csv, s2_dk_2019.csv,s4_us_2021.csv]
# Any other information needed? nope
---

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Import data ####
raw_us_2018 <-
  read_csv(
    file = "../data/raw_data/s1_us_2018.csv",
    show_col_types = FALSE
  )

raw_dk_2019 <-
  read_csv(
    file = "../data/raw_data/s2_dk_2019.csv",
    show_col_types = FALSE
  )

raw_us_2021 <-
  read_csv(
    file = "../data/raw_data/s4_us_2021.csv",
    show_col_types = FALSE
  )

####Basic data cleaning####
#Only remain the columns needed
raw_us_2018_1 <-
  raw_us_2018 |>
  select(...1, hostile_offline, hostile_online, aggression)
#Show the first six lines to check
head(raw_us_2018_1)

#Only remain the columns needed
raw_dk_2019_1 <-
  raw_dk_2019 |>
  select(...1, hostile_offline, hostile_online, aggression)
#Show the first six lines to check
head(raw_dk_2019_1)

#Only remain the columns needed
raw_us_2021_1 <-
  raw_us_2021 |>
  select(...1, hostile_offline, hostile_online, aggression)
#Show the first six lines to check
head(raw_us_2021_1)

#Remove the rows contains NA
raw_us_2018_2 <- raw_us_2018_1[complete.cases(raw_us_2018_1), ]
#Show the first six lines to check
head(raw_us_2018_2)

#Remove the rows contains NA
raw_dk_2019_2 <- raw_dk_2019_1[complete.cases(raw_dk_2019_1), ]
#Show the first six lines to check
head(raw_dk_2019_2)

#Remove the rows contains NAS
raw_us_2021_2 <- raw_us_2021_1[complete.cases(raw_us_2021_1), ]
#Show the first six lines to check
head(raw_us_2021_2)


####Combine cleaned data into one big data set####
combined_cleaned_data <- bind_rows(raw_us_2018_2, raw_dk_2019_2, raw_us_2021_2)

#re-number the rows after combining data
combined_cleaned_data <- combined_cleaned_data %>%
  mutate(...1 = row_number())

#rename the first column
combined_cleaned_data <- combined_cleaned_data %>%
  rename(NO. = ...1)

#Add another column hold the data of hostile_online minus hostile_offline
combined_cleaned_data <- combined_cleaned_data %>%
  mutate(online_offline = hostile_online - hostile_offline)

#Show the first six lines to check
head(combined_cleaned_data)

#### Save data ####
write_csv(
  x = combined_cleaned_data,
  file = "../data/analysis_data/combined_cleaned_data.csv"
)


