## Introduction

The original dataset used in this assignment can be downloaded: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Getting the data

Dataset in the zip above is downloaded and unzipped into the working directory.

* The dataset contains a training set and a test set.

* There are features, activities, and subjects information in separate files.

## Cleaning the data

* The training and the test data set are merged into one data set

* Using the feature data, only mean and std measurements are extracted

* Descriptive activity names are added to the mean and std data set

* Variable are labeled with their descriptive names

* A tidy data set with the average of each variable for each activity and each subject is produced and saved to the working directory



