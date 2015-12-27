#Course Project Code Book

Sushil Khandelwal

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The script performs the following task:

1. Loads the package - dpylr
2. Remove all local variables - clean the workspace
3. Create a "data" directory if it does not exists
4. Download and unzip the test data in "data" directory
5. Load the features, activity, training data set & test data set
6. Combine the following for training & tidy data set - Subject, Activity & Features
7. Combine both the training data set & tidy data set. And add the column names from featurs file
8. Remove duplicate columns.
9. Select only columns - Subject, Activity & any column containing mean & std
10. factorize the activity labels
11. Describe the columns - Appropriate labeling such as "t" to "time"
12. Aggregate , arrange and then write the clean data set.
