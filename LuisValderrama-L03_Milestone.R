# ------------------------------------------------------------------------------
# Title: 'Lesson 3 Milestone 1: Business Problem solving, SQL, Data Wrangling, 
# Power Query & Excel Data Modeling'
# Author: "Luis Valderrama"
# Create Date: 1/15/2022
# Last Modification Date and What: 1/6/2022 - updated destination folder
# ------------------------------------------------------------------------------

# ## Lesson 3 Milestone 1 Objectives:
# Write a R query using sqldf package that does all the following:

# 1. Load the two CSV files in R using fread function from data.table package. 
# They can have any name in R (example, dt1, dt2) but for simplicity sake, 
# call them MFG_DEFECT_DATA and RETURNS_DATA.

# 2. Use the data.table syntax to add a new column to MFG_DEFECT_DATA 
# called MFG_DEFECT_RATE where MFG_DEFECT_RATE = ITEMS_DEFECTIVE/ITEMS_SAMPLED

# 3. In both datasets, the MFG_DATE column is currently in character format. 
# Convert it to a Date format in both datasets.
# Hint: as.Date(unformatted_date_field, pattern_of_the_unformatted_date). 
# The pattern here is "%m/%d/%y" (small letter y denotes 2 digit year. 
# capital letter Y denotes four digit year)

# 4. Using write.csv(dataset_name, file="complete_file_path with .csv suffix", 
# row.names = FALSE) syntax, write the modified datasets to csv file. 
# Keep the names of the files the same (i.e MFG_DEFECT_DATA.csv 
# and RETURNS_DATA.csv). 
# Hint: If you are writing to the same location where you read the data from, 
# then this operation will overwrite the two files.
# ------------------------------------------------------------------------------

## Step 1: Install Packages and Libraries 
install.packages("data.table")
install.packages("sqldf")
install.packages("curl")
library(data.table) # Loading `data.table` package
library(sqldf) # Loading `sqldf` package
library(curl) # Loading `curl` package
library(tidyverse) # Loading tidyverse

## Step 2: Data File Folder Location Setup 
folder_path = "C:/Users/lvald/OneDrive/Desktop/DBs/"

## Step 3: Read Data Files 
# Read .csv files
MFG_DEFECT_DATA = fread(paste(folder_path, "MFG_DEFECT_DATA.csv", sep = ""), header = TRUE)
RETURNS_DATA = fread(paste(folder_path, "RETURNS_DATA.csv", sep = ""), header = TRUE)

# glimpse the data in the .csv files
MFG_DEFECT_DATA %>% glimpse()
RETURNS_DATA %>% glimpse ()

## Step 3: Convert MFG_DATE in both datasets from Char to a Date format
MFG_DEFECT_DATA <- MFG_DEFECT_DATA[,MFG_DATE := as.Date(MFG_DATE, "%m/%d/%y")]
RETURNS_DATA <- RETURNS_DATA [,MFG_DATE := as.Date(MFG_DATE, "%m/%d/%y")]

# Glimpse changes
MFG_DEFECT_DATA %>% head()
RETURNS_DATA %>% head()

## Step 4: Add new column to MFG_DEFECT_DATA called MFG_DEFECT_RATE
# Logic: MFG_DEFECT_RATE = ITEMS_DEFECTIVE/ITEMS_SAMPLED
MFG_DEFECT_DATA_RATE <- MFG_DEFECT_DATA [, MFG_DEFECT_RATE := ITEMS_DEFECTIVE/ITEMS_SAMPLED]
MFG_DEFECT_DATA_RATE %>% head()

## Step 5: Transformed Data File Folder Destination
destination_folder = "C:/Users/lvald/OneDrive/Documents/Classes/DATAANA 320 A - Data Visualization Essentials/Part 1/Lesson 3/Group03-L03_Milestone/"

file_MFG_DEFECT_DATA = "MFG_DEFECT_DATA.csv"
file_RETURNS_DATA = "RETURNS_DATA.csv"

## Step 6: Write the modified datasets to csv file.
write.csv(MFG_DEFECT_DATA_RATE, file = paste0(destination_folder,file_MFG_DEFECT_DATA), row.names = TRUE)
write.csv(RETURNS_DATA, file = paste0(destination_folder,file_RETURNS_DATA), row.names = TRUE)

# END















