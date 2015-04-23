# Getting and Cleaning Data Course Project

The purpose of this project is to prepare a tidy data that can be used for later analysis.
The file run_analysis.R can be run as long as the Samsung data is in your working directory (Folder "UCI HAR Dataset").

After executing the run_analysis.R file, a dataset.txt file will be generated with a tidy dataset from the Samsung data.

The generated database can be easily read with read.table:
```
data <- read.table("dataset.txt", header = TRUE)
```

Database Source:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Details about the generated data can be found at [Codebook.md](https://github.com/renatoaquino/Getting-and-Cleaning-Data/blob/master/Codebook.md)


## Script details

The run_analysis.R script does the following tasks:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- From the generated data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- Save the tidy data set to a file named dataset.txt.

Since the output is a tidy dataset, the column names were cleaned to fit the requirements.
