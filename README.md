# Getting_And_Cleaning_Data 

This is the course project for the Getting and Cleaning Data Coursera course.
The R script, `run_analysis.R`, does the following:

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
11. Describe the columns
12. Aggregate , arrange and then write the clean data set


The end result is shown in the file `TidyData.txt`.
