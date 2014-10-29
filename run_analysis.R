# setwd("./courseproject")

if(!file.exists("./data")){dir.create("./data")}


# - 'features.txt': List of all features.
features <- read.csv("./features.txt",sep=" ", head=FALSE); 

# - 'activity_labels.txt': Links the class labels with their activity name.
activity_labels <- read.csv("./activity_labels.txt", sep=" ", head=FALSE, col.names=c("activity_id", "activity"));

# - 'train/X_train.txt': Training set.
X_train <- read.table("./train/X_train.txt");
colnames(X_train) <- as.vector(features$V2);

# - 'train/y_train.txt': Training labels.
Y_train <- read.table("./train/y_train.txt", col.names = "activity_id");

# - 'train/subject_train.txt' : subjects
sub_train <- read.table("./train/subject_train.txt", col.names="subject");

# - 'test/X_test.txt': Test set.
X_test <- read.table("./test/X_test.txt" ); 
colnames(X_test) <- as.vector(features$V2);

# - 'test/y_test.txt': Test labels.
Y_test <- read.table("./test/y_test.txt", col.names = "activity_id" ); 

# - 'train/subject_train.txt' : subjects
sub_test <- read.table("./test/subject_test.txt", col.names="subject");

# extract the mean and std part parts

# 1) Merges the training and the test sets to create one data set.
X_train_test <- rbind(X_train, X_test)
sub_train_test <- rbind(sub_train, sub_test)
# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
features_sel <- as.vector(features[grepl("std()", features$V2, fixed=TRUE) | grepl("mean()", features$V2, fixed=TRUE),2])
X_train_test_part <- X_train_test[,features_sel]
# 3) Uses descriptive activity names to name the activities in the data set
Y_train_label <- merge(Y_train, activity_labels, by="activity_id", all=TRUE)
Y_test_label <- merge(Y_test, activity_labels, by="activity_id", all=TRUE)
Y_train_test_label <- rbind(Y_train_label, Y_test_label)
# 4) Appropriately labels the data set with descriptive variable names. 
XY_sub_train_test_label <- cbind(sub_train_test, X_train_test_part, Y_train_test_label )
# 5) From the data set in step 4, creates a second, independent tidy data
#    set with the average of each variable for each activity and each subject.
# subject x activity : average(features)
library(reshape2)
xyMelt <- melt(XY_sub_train_test_label,id=c("subject","activity"),measure.vars=features_sel )
tidy_data_set <- dcast(xyMelt, subject + activity ~ variable, mean)
write.table(tidy_data_set, file = "./data/tidy_data_set.txt", row.names=FALSE);


