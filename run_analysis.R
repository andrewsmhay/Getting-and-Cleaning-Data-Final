## 1) Merges the training and the test sets to create one data set.
## 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3) Uses descriptive activity names to name the activities in the data set
## 4) Appropriately labels the data set with descriptive variable names. 
## 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##
## Note, I grew tired of typing "train" and "training" so I used 't' to represent a training variable.
##

require("reshape2")
require("data.table")

## Set your working directory as appropriate
setwd("/Users/ahay/Downloads/UCI HAR Dataset")

## Load the activity lavels and the column names
activity_labels <- read.table("./activity_labels.txt")[,2]
features_in <- read.table("./features.txt")[,2]

## Extract only the measurements on the mean and standard deviation for each measurement.
e_features <- grepl("mean|std", features_in)

## Load and process x & y test data
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

names(x_test) = features_in

## Extract only the measurements on the mean and standard deviation for each measurement.
x_test = x_test[,e_features]

## Load the activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

## Bind the test data
test_dat <- cbind(as.data.table(subject_test), y_test, x_test)

## Load and process x & y train data.
x_t <- read.table("./train/X_train.txt")
y_t <- read.table("./train/y_train.txt")

subject_t <- read.table("./train/subject_train.txt")

names(x_t) = features_in

## Extract only the measurements on the mean and standard deviation for each measurement.
x_t = x_t[,e_features]

## Load activity data
y_t[,2] = activity_labels[y_t[,1]]
names(y_t) = c("Activity_ID", "Activity_Label")
names(subject_t) = "subject"

## Bind data 
t_dat <- cbind(as.data.table(subject_t), y_t, x_t)

## Merge test and train data
merged_data = rbind(test_dat, t_dat)
id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(merged_data), id_labels)
melt_down      = melt(merged_data, id = id_labels, measure.vars = data_labels)

## Apply mean function to dataset using dcast function
tidy_data_output   = dcast(melt_down, subject + Activity_Label ~ variable, mean)

## Write the tidy_data.txt with the added row.name=FALSE as per the instructions
write.table(tidy_data_output, file = "./tidy_data.txt", row.name=FALSE)