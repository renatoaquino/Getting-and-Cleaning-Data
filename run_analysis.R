library(stringr)

# This function reads and merges the test and train datasets
# The file locations are hardcoded to getwd()+"/UCI HAR Dataset/*"
mergeAndLabelDatasets <- function(){  
  #Reads the labels that we will use
  columnLabels <- t(read.csv("UCI HAR Dataset/features.txt",sep=" ",colClasses=c("NULL","character"),header=FALSE))
  activityLabels <- t(read.csv("UCI HAR Dataset/activity_labels.txt",sep=" ",colClasses=c("NULL","character"),header=FALSE))
  
  #Performs some transformations for easy usage later
  interestingColumns <- str_detect(columnLabels,"-mean()") | str_detect(columnLabels,"-std()")
  colClasses <- rep("NULL",ncol(columnLabels))
  colClasses[interestingColumns] <- "numeric"
  colNames <- columnLabels[interestingColumns]
  colWidths <- rep(16,ncol(columnLabels))
  
  #Clean as much as we can for now
  rm(columnLabels)
  rm(interestingColumns)
  
  #Reads the train dataset, associate the subjects, activity labels and labels the columns
  train <- read.fwf("UCI HAR Dataset/train/X_train.txt",widths=colWidths,colClasses=colClasses,n=10)
  names(train) <- colNames
  train$Subject <- read.fwf("UCI HAR Dataset/train/subject_train.txt",widths=c(2),colClasses=c("numeric"),n=10)[1,]
  trainActivities <- t(read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE,nrows=10))
  train$Activity <- activityLabels[trainActivities]
  rm(trainActivities)
  train$Dataset <- 'train'
  
  #Reads only what is needed from the test dataset
  test <- read.fwf("UCI HAR Dataset/test/X_test.txt",widths=colWidths,colClasses=colClasses,n=10)
  #Name the columns
  names(test) <- colNames
  #Attach the subject of the activity
  test$Subject <- read.fwf("UCI HAR Dataset/test/subject_test.txt",widths=c(2),colClasses=c("numeric"),n=10)[1,]
  #Attach the activity names
  testActivities <- t(read.table("UCI HAR Dataset/test/y_test.txt",header=FALSE,nrows=10))
  test$Activity <- activityLabels[testActivities]
  test$Dataset <- 'test'
  
  #More cleanup before the big merge
  rm(testActivities)
  rm(activityLabels)
  rm(colClasses)
  rm(colNames)
  
  result <- merge(train,test,all=TRUE,sort=FALSE)
  return(result)
}

#Given a treated dataset, calculates the average by subject and activity
avgDataSet <- function(dataset){
  
}
