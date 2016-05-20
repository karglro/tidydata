##########################################################################################
# File: run_analysis.R 
# Description:
#     Merges the training and the test sets to create one data set
#     Extracts only the measurements on the mean and standard deviation for each measurement
#     Uses descriptive activity names to name the activities in the data set (from "activity_labels.txt")
#     Appropriately labels the data set with descriptive variable names (from "features.txt")
#     Creates a second, independent tidy data set with the average of each variable for each activity and each subject
###########################################################################################

library(reshape2)

###########################################################################################
# load train and test data and rbind it
###########################################################################################
traindata <- read.table("train/X_train.txt",header = FALSE)
testdata <- read.table("test/X_test.txt",header = FALSE)
mergeddata <- rbind(traindata, testdata)


###########################################################################################
# load train and test activity data and rbind it
###########################################################################################
traindata_activity <- read.table("train/Y_train.txt",header = FALSE)
testdata_activity <- read.table("test/Y_test.txt",header = FALSE)
mergeddata_activity <- rbind(traindata_activity, testdata_activity)



###########################################################################################
# load train and test subjects data and rbind it, and generate vector
###########################################################################################
traindata_subjects <- read.table("train/subject_train.txt",header = FALSE)
testdata_subjects <- read.table("test/subject_test.txt",header = FALSE)
mergeddata_subjects <- rbind(traindata_subjects, testdata_subjects)[,1]




###########################################################################################
# load names of activities and create create a vector of names from the activities in the data sets
###########################################################################################
activities <- read.table("activity_labels.txt",header = FALSE,stringsAsFactors = FALSE,row.names = 1)
mergeddata_activity_names <- sapply(mergeddata_activity, function(x){activities[x,]})


###########################################################################################
# grab names of and filter those for mean() and std()
###########################################################################################
features <- read.table("features.txt",header = FALSE,stringsAsFactors = FALSE)
extractedfeatures <- features[grepl("mean",features[[2]],ignore.case = TRUE) | grepl("std",features[[2]],ignore.case = TRUE),]


###########################################################################################
# reduce merged data to relevant columns
###########################################################################################
mergeddata <- mergeddata[,extractedfeatures[[1]]]

###########################################################################################
# set column names to different feature names
###########################################################################################
names(mergeddata) <- extractedfeatures[[2]]


###########################################################################################
# add subjects and activity column upfront and set values
###########################################################################################
mergeddata <- cbind(subject=0,activity=0,mergeddata)
mergeddata$subject <- mergeddata_subjects
mergeddata$activity <- mergeddata_activity_names


###########################################################################################
# tidy data set, collapse all measures into one column to evaluate means 
# by subject and activity
###########################################################################################
melteddata <- melt(mergeddata, id=c("subject","activity"), measure.vars = extractedfeatures[[2]])
summary <- dcast(melteddata, subject + activity ~ variable,mean)


###########################################################################################
# write tidy data set to file
###########################################################################################
write.table(summary,file = "tidydata.txt", row.names = FALSE) 



