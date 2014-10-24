Getting-and-Cleaning-Data-Final
===============================

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The data linked to from the course website represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site from which the data was obtained [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

This project was a requirement of the [Coursera *Getting and Cleaning Data* signature track](https://class.coursera.org/getdata-008).

##Description of the dataset
The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

##Script Purpose
A script, called **run_analysis.R**, was created to perform the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

An [R Markdown](http://rmarkdown.rstudio.com/) file was also created to serve as a codebook. This file is called **run_analysis.Rmd** and, when run, generates a descriptive HTML formatted codebook (also provided).

*Notes:*

- *Features are normalized and bounded within [-1,1].* 
- *Each feature vector is a row on the text file.*
- *The raw data for the package can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).*

##Contact
To provide any feedback or ask any questions please reach out to Andrew Hay on Twitter at [@andrewsmhay](https://twitter.com/andrewsmhay).