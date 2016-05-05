###
# GettingAndCleaningData Project - README
#
# Author: AK
#
###

This is a README file for the human activity recognition project, which is a part of the "Getting and Cleaning Data" course. 

The purpose of this project is to demonstrate ways to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 


# Data Set
Data for the project is downloaded from the following link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description about the data is available at the below site (where the data was originally obtained from):
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

- The data has been recorded through experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
- Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
- Using its embedded accelerometer and gyroscope, 3-axial linear acceleration (total acceleration and estimated body acceleration) and 3-axial angular velocity were captured at a constant rate of 50Hz. 
- The experiments were video-recorded to label the data manually. 
- The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The "data/train" folder in the downloaded dataset contains the training data, and the "data/test" folder contains all the test data.

The specific files in the downloaded dataset are:

- 'data/features.txt': List of all features.
- 'data.activity_labels.txt': Links the class labels with their activity name.
- "data/train/X_train.txt" & "data/test/X_test.txt": A 561-feature vector with time and frequency domain variables, corresponding to the measurements from the accelermoter & gyroscope.
- "data/train/y_train.txt" & "data/test/y_test.txt": Activity identifiers corresponding to the recorded activity.
- "data/train/subject_train.txt" & "data/test/subject_test.txt": Identifier for subjects who carried out the experiments.


# run_analysis.R 

The "run_analysis.R" script included in the repository performs the following overall steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

