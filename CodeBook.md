# Code Book
This codebook describes the variables, the data, and important transformations or work that is performed in run_analysis to clean up the data

## Variables
* `activityLabels` - Table consisting of activities and their respective labelled values provided in the `UCI HAR Dataset/activity_labels.txt`
* `featureList` - List of all the features provided in the `UCI HAR Dataset/features.txt`
* `requiredFeatures` - List of the features related to the mean or std deviation measurements 
* `requiredFeaturesNameList` - requiredFeatures named representation list without the id's
* `trainSubject` - table data identifying the subject who performed the training activity for each window sample provided in the `UCI HAR Dataset/train/subject_train.txt`. Its range is from 1 to 30
* `trainActivities` - Training Labels of the activities provided in the `UCI HAR Dataset/train/trainY.txt`
* `trainX` - Table with training set and the recorded measurements given in `UCI HAR Dataset/train/trainX.txt`
* `testSubject` - table data identifying the subject who performed the testing activity for each window sample provided in the `UCI HAR Dataset/test/subject_test.txt`. Its range is from 1 to 30
* `testActivities` - Testing labels of the activities provided in the `UCI HAR Dataset/test/testY.txt`
* `testX` - Table with test data set and the recorded measurements given in `UCI HAR Dataset/test/testX.txt`
* `train` - Table representation of the training data set along with associated activity and subject that were involved 
* `test` - Table representation of the test data set along with associated activity and subject that were involved 
* `mergedSet` - Table representation of the entire data set along with associated activity and subject that were involved 
* `tidyData` - data set with the average of each variable for each activity and each subject in the `mergedSet` (Done by grouping by activity, subject on `mergedSet` into transition set called `groupData`)

## Data
### Input
* `UCI HAR Dataset/features.txt`: List of all features.
* `UCI HAR Dataset/activity_labels.txt`: Links the class labels with their activity name.
* `UCI HAR Dataset/train/X_train.txt`: Training set.
* `UCI HAR Dataset/train/y_train.txt`: Training labels.
* `UCI HAR Dataset/test/X_test.txt`: Test set.
* `UCI HAR Dataset/test/y_test.txt`: Test labels.
* `UCI HAR Dataset/train/subject_train.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
* `UCI HAR Dataset/test/subject_test.txt`: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
### Result
* `tidydata.txt` - The resulting tidy data set with the average of each variable for each activity and each subject. The following summarizes the resulting fields in the file:

#### Identifiers
* `subject` - The ID of the subject for which the measurements were taken
* `activity` - The type of activity subject was performing for the corresponding measurement

#### Measurements
* `tBodyAccMeanX`
* `tBodyAccMeanY`
* `tBodyAccMeanZ`
* `tBodyAccStdX`
* `tBodyAccStdY`
* `tBodyAccStdZ`
* `tGravityAccMeanX`
* `tGravityAccMeanY`
* `tGravityAccMeanZ`
* `tGravityAccStdX`
* `tGravityAccStdY`
* `tGravityAccStdZ`
* `tBodyAccJerkMeanX`
* `tBodyAccJerkMeanY`
* `tBodyAccJerkMeanZ`
* `tBodyAccJerkStdX`
* `tBodyAccJerkStdY`
* `tBodyAccJerkStdZ`
* `tBodyGyroMeanX`
* `tBodyGyroMeanY`
* `tBodyGyroMeanZ`
* `tBodyGyroStdX`
* `tBodyGyroStdY`
* `tBodyGyroStdZ`
* `tBodyGyroJerkMeanX`
* `tBodyGyroJerkMeanY`
* `tBodyGyroJerkMeanZ`
* `tBodyGyroJerkStdX`
* `tBodyGyroJerkStdY`
* `tBodyGyroJerkStdZ`
* `tBodyAccMagMean`
* `tBodyAccMagStd`
* `tGravityAccMagMean`
* `tGravityAccMagStd`
* `tBodyAccJerkMagMean`
* `tBodyAccJerkMagStd`
* `tBodyGyroMagMean`
* `tBodyGyroMagStd`
* `tBodyGyroJerkMagMean`
* `tBodyGyroJerkMagStd`
* `fBodyAccMeanX`
* `fBodyAccMeanY`
* `fBodyAccMeanZ`
* `fBodyAccStdX`
* `fBodyAccStdY`
* `fBodyAccStdZ`
* `fBodyAccMeanFreqX`
* `fBodyAccMeanFreqY`
* `fBodyAccMeanFreqZ`
* `fBodyAccJerkMeanX`
* `fBodyAccJerkMeanY`
* `fBodyAccJerkMeanZ`
* `fBodyAccJerkStdX`
* `fBodyAccJerkStdY`
* `fBodyAccJerkStdZ`
* `fBodyAccJerkMeanFreqX`
* `fBodyAccJerkMeanFreqY`
* `fBodyAccJerkMeanFreqZ`
* `fBodyGyroMeanX`
* `fBodyGyroMeanY`
* `fBodyGyroMeanZ`
* `fBodyGyroStdX`
* `fBodyGyroStdY`
* `fBodyGyroStdZ`
* `fBodyGyroMeanFreqX`
* `fBodyGyroMeanFreqY`
* `fBodyGyroMeanFreqZ`
* `fBodyAccMagMean`
* `fBodyAccMagStd`
* `fBodyAccMagMeanFreq`
* `fBodyBodyAccJerkMagMean`
* `fBodyBodyAccJerkMagStd`
* `fBodyBodyAccJerkMagMeanFreq`
* `fBodyBodyGyroMagMean`
* `fBodyBodyGyroMagStd`
* `fBodyBodyGyroMagMeanFreq`
* `fBodyBodyGyroJerkMagMean`
* `fBodyBodyGyroJerkMagStd`
* `fBodyBodyGyroJerkMagMeanFreq`

## Transformation
1. Imported dplyr library required for the analysis
2. Downloaded the data file and extracted the zip file into the data directory `UCI HAR Dataset`
3. Read the activity label and feature list into `activityLabels` and `featureList`
4. Extracted features that contained mean and std deviation features into `requiredFeatures`
5. Loaded the training data sets from train sub folders and bind them into `train`
6. Loaded the testing data sets from test sub folders and bind them into `test`
7. Merge the training and the test datasets into `mergedSet`
8. Added proper labels from `activityLabels` to the merged data with discriptive variable names
9. Grouped activity and subject in merged data into transition set `groupData`
10. Calculated the summary mean for respective measurements grouped by activity and subject, and assigned the result to `tidyData` 
