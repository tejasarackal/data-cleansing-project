# Import Libraries required for the analysis
# Download the data file and unzip into the data directory

file_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
file_loc <- './data_set.zip'

download.file(url = file_url, destfile = file_loc)
unzip(zipfile = file_loc)

# Read activity label and feature list
activityLabels <- read.table('./UCI HAR Dataset/activity_labels.txt')

# Extract data on mean and std deviation features 
# Cleanse the feature list

# Load the training data sets from sub folders and bind them
# Load the test data sets from sub folders and bind them

# Merge the training and the test datasets 
# Add the labels to the merged data with discriptive variable names

# Create second tidy data set grouping activity and subject
# Find the average for each group and bind it to tidy dataset