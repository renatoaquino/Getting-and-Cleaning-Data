# Getting and Cleaning Data Course Project - Codebook

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. After processing only the features with names containing 'mean' and 'std' were included and an average calculation was performed for each feature, grouping by subject and activity type.


These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

```
tbodyacc-xyz
tgravityacc-xyz
tbodyaccjerk-xyz
tbodygyro-xyz
tbodygyrojerk-xyz
tbodyaccmag
tgravityaccmag
tbodyaccjerkmag
tbodygyromag
tbodygyrojerkmag
fbodyacc-xyz
fbodyaccjerk-xyz
fbodygyro-xyz
fbodyaccmag
fbodyaccjerkmag
fbodygyromag
fbodygyrojerkmag
```

The set of variables that were collected from these signals are: 
```
mean: Mean value
std: Standard deviation
```

The full list of fields follows bellow:
```
tbodyacc-mean-x
tbodyacc-mean-y
tbodyacc-mean-z
tbodyacc-std-x
tbodyacc-std-y
tbodyacc-std-z
tgravityacc-mean-x
tgravityacc-mean-y
tgravityacc-mean-z
tgravityacc-std-x
tgravityacc-std-y
tgravityacc-std-z
tbodyaccjerk-mean-x
tbodyaccjerk-mean-y
tbodyaccjerk-mean-z
tbodyaccjerk-std-x
tbodyaccjerk-std-y
tbodyaccjerk-std-z
tbodygyro-mean-x
tbodygyro-mean-y
tbodygyro-mean-z
tbodygyro-std-x
tbodygyro-std-y
tbodygyro-std-z
tbodygyrojerk-mean-x
tbodygyrojerk-mean-y
tbodygyrojerk-mean-z
tbodygyrojerk-std-x
tbodygyrojerk-std-y
tbodygyrojerk-std-z
tbodyaccmag-mean
tbodyaccmag-std
tgravityaccmag-mean
tgravityaccmag-std
tbodyaccjerkmag-mean
tbodyaccjerkmag-std
tbodygyromag-mean
tbodygyromag-std
tbodygyrojerkmag-mean
tbodygyrojerkmag-std
fbodyacc-mean-x
fbodyacc-mean-y
fbodyacc-mean-z
fbodyacc-std-x
fbodyacc-std-y
fbodyacc-std-z
fbodyacc-meanfreq-x
fbodyacc-meanfreq-y
fbodyacc-meanfreq-z
fbodyaccjerk-mean-x
fbodyaccjerk-mean-y
fbodyaccjerk-mean-z
fbodyaccjerk-std-x
fbodyaccjerk-std-y
fbodyaccjerk-std-z
fbodyaccjerk-meanfreq-x
fbodyaccjerk-meanfreq-y
fbodyaccjerk-meanfreq-z
fbodygyro-mean-x
fbodygyro-mean-y
fbodygyro-mean-z
fbodygyro-std-x
fbodygyro-std-y
fbodygyro-std-z
fbodygyro-meanfreq-x
fbodygyro-meanfreq-y
fbodygyro-meanfreq-z
fbodyaccmag-mean
fbodyaccmag-std
fbodyaccmag-meanfreq
fbodybodyaccjerkmag-mean
fbodybodyaccjerkmag-std
fbodybodyaccjerkmag-meanfreq
fbodybodygyromag-mean
fbodybodygyromag-std
fbodybodygyromag-meanfreq
fbodybodygyrojerkmag-mean
fbodybodygyrojerkmag-std
fbodybodygyrojerkmag-meanfreq
subject
activity
activityLabel
```