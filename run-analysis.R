######
# Getting and Cleaning Data Course Project
# 
# Author: anu061 
# 
# The data linked to from the course website represent data collected from the 
# accelerometers from the Samsung Galaxy S smartphone. 
# 
# A full description is available at the site where the data was obtained:
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#       
# Here are the data for the project:
#       https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#       
# The following code (run_analysis.R) does the following:
# - Merges the training and the test sets to create one data set.
# - Extracts only the measurements on the mean and standard deviation for each 
#       measurement.
# - Uses descriptive activity names to name the activities in the data set 
# - Appropriately labels the data set with descriptive variable names.
# - From the data set in step 4, creates a second, independent tidy data set 
#       with the average of each variable for each activity and each subject.
#
################################################################################


# read in training & test data.. 
# ..subject data from subject_train.txt
# ..feature measurements (via accelerometer & gyroscope) from x_train.txt 
# ..activity data from y_train.txt

subTrain <- read.table("data/train/subject_train.txt")
xTrain <- read.table("data/train/X_train.txt")
yTrain <- read.table("data/train/y_train.txt")

subTest <- read.table("data/test/subject_test.txt")
xTest <- read.table("data/test/X_test.txt")
yTest <- read.table("data/test/y_test.txt")


# identify features corresponding to the mean and standard deviation for each measurement
featuresAll <- read.table("data/features.txt")
featuresSelect <- grep(".*mean.*|.*std.*", featuresAll[,2])
featuresSelectNames <- as.character(featuresAll[featuresSelect,2])

# clean up feature names: remove/replace '-' and '()'to make them more readable and less error-prone
featuresSelectNames <- gsub('-mean', 'Mean', featuresSelectNames)
featuresSelectNames <- gsub('-std', 'Std', featuresSelectNames)
featuresSelectNames <- gsub('[-()]', '', featuresSelectNames)

        
# select training & test data corresponding to mean and standard deviation features
xTrainSelect <- xTrain[featuresSelect]
xTestSelect <- xTest[featuresSelect]

# read in activity labels to name the activities in the data set (yTrain & yTest) 
actLabels <- read.table("data/activity_labels.txt")

# convert subjects & activities to factor
subTrain[,1] <- as.factor(subTrain[,1])
yTrain[,1] <- factor(yTrain[,1], levels = actLabels[,1], labels = actLabels[,2])

subTest[,1] <- as.factor(subTest[,1])
yTest[,1] <- factor(yTest[,1], levels = actLabels[,1], labels = actLabels[,2])


# merge data corresponding to the subjects, activity, features..
trainData <- cbind(subTrain, yTrain, xTrainSelect)
testData <- cbind(subTest, yTest, xTestSelect)

# combine training and test data into one big dataset
allData <- rbind(trainData, testData)


# assign meaningful names to the variables in the combined data set
colnames(allData) <- c("subject", "activity", featuresSelectNames)


# From allData, create a tidy data set with the average of each variable for 
# each activity and each subject.

# tidyDataMelt contains: subject, activity, variable, value
tidyDataMelt <- melt(allData, id = c("subject", "activity"))

#tidyData contains: subject, activity, feature1, feature2,........,feature79
tidyData <- dcast(tidyDataMelt, subject + activity ~ variable, mean)
  
#write tidyData into a text file
write.table(tidyData, file = "tidyData.txt", row.names = FALSE, col.names = TRUE)

str(tidyDataMelt)
