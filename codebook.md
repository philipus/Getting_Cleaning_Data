## Codebook for the tidy Data Set

# Source of the Data
The data is about "Human Activity Recognition Using Smartphones Data Set" which is given by Samsung. 

The reference of the Data you can find [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

At this web side you will have the discription of the data which is used in this course project

# Features of the tidy_data_set.txt
the tidy data is made by the original data puting X, Y and Subject together using cbind. after doing this a Feature Selection is done. all med() and std() of the mesurement of the data set X are chosen. on this data it is an agregation don on the dimension subject + activity on all chosen features (feature selection). so... it is a mean of mean() and std() which makes not realy sense but that was the task.

so in tidy data you find

subject
activity

and the mean of the original data

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
'-Measure -' is used to denote mean() and std()

tBodyAcc-Measure-XYZ
tGravityAcc-Meauser-XYZ
tBodyAccJerk-Measure-XYZ
tBodyGyro-Measure-XYZ
tBodyGyroJerk-Measure-XYZ
tBodyAccMag-Meausre
tGravityAccMag-Measure
tBodyAccJerkMag-Measure
tBodyGyroMag-Measure
tBodyGyroJerkMag-Measure
fBodyAcc-Measure-XYZ
fBodyAccJerk-Measure-XYZ
fBodyGyro-Measure-XYZ
fBodyAccMag-Measure
fBodyAccJerkMag-Measure
fBodyGyroMag-Measure
fBodyGyroJerkMag-Measure

# Missing Attributes

The Attribute when you average over the window sample is missing because I guess it shouldnt be a part of the tidy data set.
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


