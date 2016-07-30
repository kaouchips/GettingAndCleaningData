This is the project for the Coursera class "Getting and Cleaning Data".
You will find the following files:

run_analysis.R:

This script downloads the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and does the following:
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the dataset.
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data.txt:
Independent tidy data set created by the run_analysis.R script.

cookbook.md:
This file details the dataset content.

