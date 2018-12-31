# Getting and Cleaning Data Course Project
This repository contains the Getting and Cleaning Data Week 4 Peer-Graded Assignment. The purpose of this project is to demonstrate the student's ability to collect, work with, and clean a data set.

## Analysis
The codes in *run_analysis.R* contain the steps performed to collect and clean the data set obtained from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The R script does the following:

1. Read train and test data files and bind them together
2. Extrace measurements on the mean and standard deviation
3. Describe activity names
4. Label variables descriptively
5. Create a separate data set that is clean and contains the average value of each variable for each subject and activity.

## Output
The text file named *tidydata.txt* contains the clean data set that was created as an output of the codes.
