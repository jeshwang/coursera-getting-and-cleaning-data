## Coursera: Getting and Cleaning Data - Week 4, Assignment 1
## For Week Ending: Dec. 31, 2017
## User: jeshwang

#########################################################################
# The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
# The goal is to prepare tidy data that can be used for later analysis. 
# You will be graded by your peers on a series of yes/no questions related to the project. 
# You will be required to submit: 
#         1) a tidy data set as described below, 
#         2) a link to a Github repository with your script for performing the analysis, and 
#         3) a code book that describes the variables, the data, and any transformations or work that you 
#         performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. 
#         This repo explains how all of the scripts work and how they are connected.
# 
# One of the most exciting areas in all of data science right now is wearable computing - see for example this article. 
# Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. 
# The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.
# A full description is available at the site where the data was obtained:
#         http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Here are the data for the project:
#         https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# 
# You should create one R script called run_analysis.R that does the following.
# 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject.

#########################################################################

#########################################################################
# STEP 0: Set up environment
#########################################################################
## Clear Memory
rm(list=ls())
gc(reset=TRUE)

## Set working directory
setwd("C:/Users/jhwang/Documents/R/Class3/Week 4")

## Load libraries
library(dplyr)

#########################################################################
# STEP 1a: Download data (optional step)
#########################################################################
# Specify URL to download zip file from and give new name for file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileNAME <- "UCI HAR Dataset.zip"

# Download zip file
if(!file.exists(fileNAME)){
        download.file(fileURL, fileNAME, mode = "wb")
}

# Unzip file
filePATH <- "UCI HAR Dataset"
if(!file.exists(filePATH)){
        unzip(fileNAME)
}

#########################################################################
# STEP 1b: Read data
#########################################################################
# Read in test data
testSubject <- read.table(file.path(filePATH, "test", "subject_test.txt"))
testValues <- read.table(file.path(filePATH, "test", "X_test.txt"))
testActs <- read.table(file.path(filePATH, "test", "Y_test.txt"))

# Read in training data
trainSubject <- read.table(file.path(filePATH, "train", "subject_train.txt"))
trainValues <- read.table(file.path(filePATH, "train", "X_train.txt"))
trainActs <- read.table(file.path(filePATH, "train", "Y_train.txt"))

# Read in features
features <- read.table(file.path(filePATH, "features.txt"), as.is=TRUE)

# Read in labels for activities performed
acts <- read.table(file.path(filePATH, "activity_labels.txt"))
colnames(acts) <- c("activityIdentity", "activityLabel")

#########################################################################
# STEP 2: Merge training and test sets
#########################################################################
data <- rbind(cbind(trainSubject, trainValues, trainActs),
      cbind(testSubject, testValues, testActs))

colnames(data) <- c("subject", features[,2], "activity")

#########################################################################
# STEP 3: Extracts only mean and standard deviation for each measurement.
#########################################################################
data_subset <- data[,grepl("mean|std|subject|activity", colnames(data))]

#########################################################################
# STEP 4: Uses descriptive activity names to name the activities in data
#########################################################################
data_subset$activity <- factor(data_subset$activity, 
                               levels = acts[,1],
                               labels = acts[,2])

#########################################################################
# STEP 5: Appropriately label the data set with descriptive variable names.
#########################################################################

# Read current column names of merged dataset
names <- colnames(data_subset)

# Remove extra symbols
names <- gsub("[\\(\\)-]", "", names)

# Clean column names
names <- gsub("^t", "timeDomain", names)
names <- gsub("^f", "frequencyDomain", names)
names <- gsub("Acc", "Accelerometer", names)
names <- gsub("Gyro", "Gyroscope", names)
names <- gsub("Mag", "Magnitude", names)
names <- gsub("Freq", "Frequency", names)
names <- gsub("mean", "Mean", names)
names <- gsub("std", "StandardDeviation", names)

# Remove repeated word in some column names
names <- gsub("BodyBody", "Body", names)

# Replace old column names in merged dataset with revised names
colnames(data_subset) <- names

#########################################################################
# STEP 6: Creates a second, independent tidy data set with the average 
# of each variable for each activity and each subject. Output this dataset
# into a text file.
#########################################################################
data_averages <- data_subset %>%
                        group_by(subject, activity) %>%
                        summarise_all(mean)


write.table(data_averages, "tidy_data.txt", 
                quote = FALSE, row.names = FALSE)
