# This function reads and merges the test and train datasets
# The file locations are hardcoded to getwd()+"/UCI HAR Dataset/*"
mergeAndLabelDatasets <- function(){  
  #Reads the labels that we will use
  columnLabels <- t(read.csv("UCI HAR Dataset/features.txt",sep=" ",colClasses=c("NULL","character"),header=FALSE))
  activityLabels <- t(read.csv("UCI HAR Dataset/activity_labels.txt",sep=" ",colClasses=c("NULL","character"),header=FALSE))
  
  #Performs some transformations for easy usage later
  interestingColumns <- grepl("mean",columnLabels) | grepl("std",columnLabels)
  colClasses <- rep("NULL",ncol(columnLabels))
  colClasses[interestingColumns] <- "numeric"
  colNames <- gsub("\\(|\\)|-",'',tolower(columnLabels[interestingColumns]))
  colWidths <- rep(16,ncol(columnLabels))
  
  #Clean as much as we can for now
  rm(columnLabels)
  rm(interestingColumns)
  
  #Reads the train dataset, associate the subjects, activity labels and labels the columns
  train <- read.table("UCI HAR Dataset/train/X_train.txt",colClasses=colClasses)
  #train <- laf_open_fwf("UCI HAR Dataset/train/X_train.txt",column_widths=colWidths,column_types=colClasses)
  names(train) <- colNames
  train$subject <- scan("UCI HAR Dataset/train/subject_train.txt")
  trainActivities <- scan("UCI HAR Dataset/train/y_train.txt")
  train$activity <- trainActivities
  rm(trainActivities)
  
  #Reads only what is needed from the test dataset
  test <- read.table("UCI HAR Dataset/test/X_test.txt",colClasses=colClasses)
  #Name the columns
  names(test) <- colNames
  #Attach the subject of the activity
  test$subject <- scan("UCI HAR Dataset/test/subject_test.txt")
  #Attach the activities
  testActivities <- scan("UCI HAR Dataset/test/y_test.txt")
  test$activity <- testActivities
  
  #More cleanup before the big merge
  rm(testActivities)
  rm(colClasses)
  rm(colNames)
  dataset <- merge(train,test,all=TRUE,sort=FALSE)
  rm(train)
  rm(test)
  
  #Aggregating the data by Subject and Activity
  attach(dataset)
  aggr <- aggregate(dataset,by=list(GSubject=subject,GActivity=activity),FUN=mean)
  detach(dataset)
  aggr$activitylabel <- activityLabels[aggr$activity]
  return(subset(aggr, select = -c(GSubject,GActivity) ))
}

oldwd <- getwd()
setwd(dirname(parent.frame(2)$ofile))
dataset = mergeAndLabelDatasets()
write.table(dataset,file='dataset.txt',row.names=FALSE)
rm(dataset)
setwd(oldwd)
rm(oldwd)
