library(dplyr)

rm(list=ls())

# Download the file & unzip

if(!file.exists("./data")) {
  dir.create("./data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/Dataset.zip", mode = "wb")

unzip(zipfile = "./data/Dataset.zip", exdir = "./data")
pathToUnzipDataSet <- file.path("./data", "UCI HAR Dataset")


# Read the files into variables
features <- read.table(file.path(pathToUnzipDataSet, "features.txt"), header = F, stringsAsFactors = F)
activityLabels <- read.table(file.path(pathToUnzipDataSet, "activity_labels.txt"), header = F, stringsAsFactors = F)
colnames(activityLabels) <- c("activityId", "activityLabel")

# Read the training data
trainingDataActivity <- read.table(file.path(pathToUnzipDataSet, "train", "y_train.txt"), header = F)
trainingDataSubjects <- read.table(file.path(pathToUnzipDataSet, "train", "subject_train.txt"), header = F)
trainingDataFeatures <- read.table(file.path(pathToUnzipDataSet, "train", "X_train.txt"), header = F)
trainingData <- cbind(trainingDataSubjects, trainingDataActivity, trainingDataFeatures)


# Read the test data
testDataActivity <- read.table(file.path(pathToUnzipDataSet, "test", "y_test.txt"), header = F)
testDataSubjects <- read.table(file.path(pathToUnzipDataSet, "test", "subject_test.txt"), header = F)
testDataFeatures <- read.table(file.path(pathToUnzipDataSet, "test", "X_test.txt"), header = F)
testData <- cbind(testDataSubjects, testDataActivity, testDataFeatures)


# 1. Merges the training and the test sets to create one data set
allData <-  rbind(trainingData, testData)
colnames(allData) <- c("subject","activity", features$V2)


# 2. Extract only the measurements on the mean & standard deviation for each measurement

allData <- allData[, !duplicated(colnames(allData))]
allData <- select(allData, matches("((subject|activity)|(mean|std)\\(\\))"))

# 3. Uses descriptive activity names to name the activities in the data set
allData$activity <- factor(allData$activity, levels = activityLabels[, 1], labels = activityLabels[,2])

# 4. Appropriately labels the data set with descriptive variable names
names(allData) <- gsub("Acc","Accelerator", names(allData))
names(allData) <- gsub("Mag","Magnitude", names(allData))
names(allData) <- gsub("Gyro","Gyroscope", names(allData))
names(allData) <- gsub("^t","time", names(allData))
names(allData) <- gsub("^f","frequency", names(allData))
names(allData) <- gsub("BodyBody","Body", names(allData))
names(allData) <- gsub("mean","Mean", names(allData))
names(allData) <- gsub("std","StdDev", names(allData))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
finalData <- aggregate(. ~subject + activity, allData, mean)
finalData <- arrange(finalData, subject, activity)
write.table(finalData, file="TidyData.txt", row.names = F)