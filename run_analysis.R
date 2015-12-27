library(plyr)
## Merges the training and the test sets to create one data set.

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
X_data <- rbind(X_train, X_test)

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y_data <- rbind(y_train, y_test)

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject_data <- rbind(subject_train, subject_test)

## Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("./UCI HAR Dataset/features.txt")
mean <- grep("(.*)mean+\\(\\)(.*)", features[, 2])
std <- grep("(.*)std+\\(\\)(.*)", features[, 2])
mean_and_std <- c(mean, std)
X_data <- X_data[, mean_and_std]

## Uses descriptive activity names to name the activities in the data set

activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
y_data[, 1] <- activities[y_data[, 1], 2]
names(y_data) <- "activity"

## Appropriately labels the data set with descriptive variable names. 

names(subject_data) <- "subject"
names(X_data) <- features[mean_and_std, 2]

## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

data <- cbind(X_data, y_data, subject_data)
averages_data <- ddply(data, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "averages_data.txt", row.name=FALSE)