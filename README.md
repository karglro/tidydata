

# Cleaning Data

## File: run_analysis.R

## Description: 
The provided R script takes the Human Activity Recognition Using Smartphones Data Set and provides a tidy dataset for further analysis.
The original dataset can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

For the script to run correctly, the follwing requirements must be met:

1) run_analysis.R must be run in the root folder of the original dataset folder
2) The R package reshape2 must be installed

The tidy output will be stored in the file tidydata.txt


The script performs the following basic steps

1) It merges the original training and test sets into one data set
2) It extracts only measurements related to mean and standard deviation of a measurement
3) Integer values for Activities in the original dataset are replaced by descriptiv names (SITTING,WALKING, STANDING, etc.) 
4) A header with descriptiv names of the measures is provided
5) A tidy data set is extracted listing average values for each subject, activity and variable



## Background for the original data set

The data was gained from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


