# Read Me

This is the project for the Coursera class "Getting and Cleaning Data".
You will find the following files:

## run_analysis.R

This script downloads the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and does the following:
1- Merges the training and the test sets to create one data set (data). 
2- Extracts only the measurements on the mean and standard deviation for each measurement.
3- Uses descriptive activity names to name the activities in the dataset.
4- Creates a second, independent tidy data set with the average of each variable for each activity and each subject (tidyDataset)
5- Writes a text file (tidy_data.txt) containing the tidy data set created at step 4. in your working directory.

N.B.: If you wish to write a text file (data.txt) to your working directory with the data created in step 1, you will need to uncomment the following command: "# write.table(data, "data.txt", sep="\t", row.names = FALSE)" by removing the first character "#".

## tidy_data.txt
Independent tidy data set created by the run_analysis.R script.

## cookbook.md
This file details the variables in the data sets created in steps 1 and 4.

