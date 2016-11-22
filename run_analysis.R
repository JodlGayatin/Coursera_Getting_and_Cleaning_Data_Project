## Code for extracting files from the Internet

setwd("~/")
if (!file.exists("data")){
  dir.create("data")
}
fileUrl <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/data2.zip",method="curl")
unzip(zipfile = "./data/data2.zip",exdir="./data")

## Reading the data

x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables

x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
features <- read.table('./data/UCI HAR Dataset/features.txt')
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

## Assigning column names

x_set <- rbind(x_train,x_test)
y_set <- rbind(y_train,y_test)
subject_set <- rbind(subject_train,subject_test)

y_set[,1] <- activityLabels[y_set[,1],2]


colnames(x_set) <- features[,2]
colnames(y_set)<- "activityType"
colnames(subject_set) <- "subjectId"

merge_all<-cbind(x_set,y_set,subject_set)

columnNames <- colnames(merge_all)

mean_sd <-(grepl("activityType" , columnNames) | 
             grepl("subjectId" , columnNames) | 
             grepl("mean.." , columnNames) | 
             grepl("std.." , columnNames) 
)

subsetMeanSd<- merge_all[,mean_sd==TRUE]
##subsetNames<- merge(subsetMeanSd, activityLabels,by='activityId',all.x = TRUE)
library(dplyr)
library(tidyr)
tidySet <- aggregate(.~subjectId+activityType, subsetMeanSd,mean)
tidySet<-tidySet[order(tidySet$subjectId,tidySet$activityType),]

newcolnames<-gsub("BodyBody","Body",colnames(tidySet))
newcolnames<-gsub("tBody","TotalBody",newcolnames)
newcolnames<-gsub("tGravity","TotalGravity",newcolnames)
## next step is to use gsub to subsitute the title
## never use a function name as a variable
colnames(tidySet)<-newcolnames
write.table(tidySet, "Tidy.txt", row.names = FALSE, quote = FALSE)
