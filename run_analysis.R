##Script to create new tidy data set containing the average 
##of each variable for each activity and each subject.

##Required packages
library(reshape2)

##Read folder contents
setwd("C:/Users/kroppa/Desktop/Coursera/Course3/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/")

##Meaning of the 6 activities measured
activity_labels_meaning <- read.table("activity_labels.txt")

##Meaning of the 561 columns in the main data files
features <- read.table("features.txt")

#Training data numerical values only
data_train<-read.table("train/X_train.txt")

##Participant IDs in the training data
subject_id_train<-read.table("train/subject_train.txt")

##Activity IDs in the training data
activity_labels_train<-read.table("train/y_train.txt")

#Test data numerical values only
data_test<-read.table("test/X_test.txt")

##Participant IDs in the test data
subject_id_test<-read.table("test/subject_test.txt")

##Activity IDs in the test data
activity_labels_test<-read.table("test/y_test.txt")


## PART 1 Merges the training and the test sets to create one data set.

## Add identifiers to training and test data before merging them.
## Use column bind to add the subject ID (from 1 to 30)
## Use column bind to add the activity type (from 1 to 6)

# Training data. New dimension 7352 x 563
data_train <- cbind(activity_labels_train,subject_id_train,data_train)

# Test data. New dimension 2947 x 563
data_test <- cbind(activity_labels_test, subject_id_test, data_test)


## Combine training and test data sets keeping all rows from both.
## New dimension 10299 x 563

data <- rbind(data_train,data_test)

## Add column names to data set

## Add two new identifiers to the list of 561 features provided.
## New dimension is 563 x 1
column_labels <- as.character(unlist(features[2]))
column_labels <- c("activity_id","subject_id",column_labels)

## Assign names to data set
colnames(data) <- column_labels

## Result is a data set with dimensions 10299 x 563 including column names


##PART 2 - Extracts only the measurements on the mean and standard deviation for each measurement.

## Create a smaller data set containing only the mean and standard deviation measures
## These can be identified in the column names using regualr expressions to search for
## "mean()" and "std()". There are 33 variables with a mean and std for a total of 66 matches.

columns_keep <- grep("mean\\(\\)|std\\(\\)", column_labels)

data_small <- data[c(1,2,columns_keep)]


##PART 3 -Uses descriptive activity names to name the activities in the data set

data_small$activity_id <- factor(data_small$activity_id, levels = c(1,2,3,4,5,6), labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"))


##PART 4 - Appropriately labels the data set with descriptive variable names.

##All lowercase
colnames(data_small) <- tolower(colnames(data_small))

##Remove parentheses from variable names "()"
colnames(data_small)<- gsub("\\(","",colnames(data_small))
colnames(data_small)<- gsub("\\)","",colnames(data_small))

##Replace hyphens with underscores
colnames(data_small)<- gsub("\\-","_",colnames(data_small))

##Expand abbrevaitions for clarity
colnames(data_small)<- gsub("tbody","time_body",colnames(data_small))
colnames(data_small)<- gsub("fbody","fourier_body",colnames(data_small))
colnames(data_small)<- gsub("tgravity","time_gravity",colnames(data_small))
colnames(data_small)<- gsub("acc","accel_",colnames(data_small))

##Add underscore between words
colnames(data_small)<- gsub("body","body_",colnames(data_small))
colnames(data_small)<- gsub("gyrojerk","gyro_jerk",colnames(data_small))
colnames(data_small)<- gsub("gyromag","gyro_magnitude",colnames(data_small))
colnames(data_small)<- gsub("jerkmag","jerk_magnitude",colnames(data_small))
colnames(data_small)<- gsub("gravityaccel","gravity_accel",colnames(data_small))

##Replace double underscore with single
colnames(data_small)<- gsub("__","_",colnames(data_small))



##PART 5 - From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.


## Melt data from wide format into long format by activity id and subject id

melt_data <-melt(data_small, id=c("activity_id","subject_id"))

## Cast data into new shape applying mean function to aggregate
## New dimensions are 180 x 68 as expected. 
## 180 represents 6 activities for each of 30 participants

new_data <- dcast(melt_data, activity_id + subject_id ~ variable, fun.aggregate = mean)

colnames(new_data)<- gsub("time","ave_time",colnames(new_data))
colnames(new_data)<- gsub("fourier","ave_fourier",colnames(new_data))

write.table(new_data,"tidy_data_course3_andrea_kropp.txt", row.name = FALSE)
