## Code for extracting files from the Internet

setwd("~/")
if (!file.exists("data")){
  dir.create("data")
}
fileUrl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/data2.zip",method="curl")
unzip(zipfile = "./data/data2.zip",exdir="./data")

## Reading the training data

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Reading test data, features and activity labels

x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
features <- read.table('./data/UCI HAR Dataset/features.txt')
activityLabels <- read.table('./data/UCI HAR Dataset/activity_labels.txt')

## This part of the code "1) merges the training and the test sets to create one data set."

x_set <- rbind(x_train,x_test)
y_set <- rbind(y_train,y_test)
subject_set <- rbind(subject_train,subject_test)

## This part of the code "2) Extracts only the measurements on the mean and standard deviation for each measurement."
## Only variables that contain the expression "mean" and "std" were filtered.

colnames(x_set) <- features[,2]
columnNames <- colnames(x_set)

mean_sd <-(grepl("mean.." , columnNames) | grepl("std.." , columnNames) )
x_setMeanSd<- x_set[,mean_sd==TRUE]

## This part of the code "3) Uses descriptive activity names to name the activities in the data set."
## The activity ID was replaced with the information in Activity Type

y_set[,1] <- activityLabels[y_set[,1],2]
colnames(y_set)<- "activityType"
colnames(subject_set) <- "subjectId"

merge_all<-cbind(x_setMeanSd,y_set,subject_set)

## This part of the code "4) Appropriately labels the data set with descriptive variable names."
## There was not much changes because the variable names seemed explanatory.
## I just eliminated the extra "Body" in some variables and converted t to Time and f to Frequency
## as explained in the Data Set information.

newcolnames<-gsub("BodyBody","Body",colnames(merge_all))
newcolnames<-gsub("tBody","TimeBody",newcolnames)
newcolnames<-gsub("tGravity","TimeGravity",newcolnames)
newcolnames<-gsub("fBody","FreqBody",newcolnames)

colnames(merge_all)<-newcolnames

# This part of the code " 5) creates a second, independent tidy data set with the average of each variable for each activity and 
# each subject."

library(dplyr)
library(tidyr)
tidySet <- aggregate(.~subjectId+activityType,merge_all,mean)
tidySet<-tidySet[order(tidySet$subjectId,tidySet$activityType),]
write.table(tidySet, "Tidy.txt", row.names = FALSE, quote = FALSE)
