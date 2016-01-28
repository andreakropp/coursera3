# coursera3
Getting and Cleaning Data Course Project

The files for this project consist of:

1) README.md (this document)

2) Codebook - Description of variables and transformations

3) run_analysis.R - R script to transformed download data set into tidy data set

4) tidy_data_course3_andrea_kropp.csv - Final tidy data set


#How to use these files:

1) Download the starting files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Originally accessed January 27, 2016.

2) Unzip folder

3) Modify working directory in line 8 of run_analysis.R to match the location of the UCI HAR Dataset folder within the unzipped folder contents

4) Execute R script


#Analysis Logic

Please see code comments for a full explanation of each step. The overall logic is as follows.

1) The test and training data are both lacking the identifiers for the person (1 to 30) and the activity being performed (1 to 6). The first step is to add these two identifiers to the the training and test data separately.

2) The training and test data have observations on different people therefore they should be combined rowwise keeping all records. The second piece of the logic combines the rows from each file.

3) The next procedure is to add the column labels which identify the variables. Now the data set is complete with both train and test data, column names and row identifiers.

4) The next part of the logic removes the unwanted variables. Only the variables corresponding to a mean or standard deviation are retained in the smaller data set.

5) Finally the smaller data set is melted to a long form data set and then recast into the desired format. For each of the 30 participanst x 6 activities = 180 rows the new data set contains the average value of each variable.

