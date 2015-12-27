#Course Project Code Book

Sushil Khandelwal

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script performs the following task

Loads the package - dpylr
Remove all local variables - clean the workspace
Create a "data" directory if it does not exists
Download and unzip the test data in "data" directory
Load the features, activity, training data set & test data set
Combine the following for training & tidy data set - Subject, Activity & Features
Combine both the training data set & tidy data set. And add the column names from featurs file
Remove duplicate columns.
Select only columns - Subject, Activity & any column containing mean & std
factorize the activity labels
Describe the columns
Aggregate , arrange and then write the clean data set.
