# Import Libraries required for the analysis

# Download the data file and unzip into the data directory
file_url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
file_loc <- './data_set.zip'

#download.file(url = file_url, destfile = file_loc)
#unzip(zipfile = file_loc)

# Read activity label and feature list
activityLabels <- read.table('./UCI HAR Dataset/activity_labels.txt')
featureList <- read.table('./UCI HAR Dataset/features.txt')

# Extract data on mean and std deviation features 
requiredFeatures <- grep("*mean*|*std*", featureList[,2])
requiredFeaturesNameList <- featureList[requiredFeatures,2]

# Cleanse the required feature list
requiredFeaturesNameList <- gsub('-mean', ' Mean', requiredFeaturesNameList)
requiredFeaturesNameList <- gsub('-std', ' Std', requiredFeaturesNameList)
requiredFeaturesNameList <- gsub('[()]', '', requiredFeaturesNameList)
requiredFeaturesNameList <- gsub('[-]', ' ', requiredFeaturesNameList)

# Load the training data sets from sub folders and bind them
trainSubject <- read.table('./UCI HAR Dataset/train/subject_train.txt')
trainActivities <- read.table('./UCI HAR Dataset/train/y_train.txt')
trainX <- read.table('./UCI HAR Dataset/train/X_train.txt')

train <- cbind(trainSubject, trainActivities, trainX[requiredFeatures])

# Load the test data sets from sub folders and bind them
testSubject <- read.table('./UCI HAR Dataset/test/subject_test.txt')
testActivities <- read.table('./UCI HAR Dataset/test/y_test.txt')
testX <- read.table('./UCI HAR Dataset/test/X_test.txt')

test <- cbind(testSubject, testActivities, testX[requiredFeatures])

# Merge the training and the test datasets 
mergedSet <- rbind(train, test)

# Add the labels to the merged data with discriptive variable names
colnames(mergedSet) <- c("subject", "activity", requiredFeaturesNameList)
mergedSet$activity <- factor(mergedSet$activity, activityLabels[,1], activityLabels[,2])

# Create tidy data set grouping activity and subject

# Find the average for each group and bind it to tidy dataset