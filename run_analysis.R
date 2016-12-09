library(dplyr)

# Download and extract the accelerometer data to the working directory.
# Note: Changes the working directory to the "UCI HAR Dataset" sub-directory in the 
# extracted archive.
downloadData <- function() {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "accelerometer-data.zip")
  unzip("accelerometer-data.zip", overwrite = TRUE)
  setwd("./UCI HAR Dataset")
}

# Reads the list of activities from the specified subfolder so that they can be merged
# the accelerometer results from the same subfolder.
readActivities <- function(subfolder) {
  activity.labels <- read.table("activity_labels.txt", sep = " ")
  colnames(activity.labels) <- c("id", "label")
  activity.column <- read.table(paste("./", subfolder, "/y_", subfolder, ".txt", sep = ""))
  labeled <- activity.labels[,2][match(activity.column[[1]], activity.labels[,1])]
  cbind(activity.column, labeled)
}

# Reduces the set of accelerometer data columns to those of interest. The columns of
# interest are those that compute a mean or standard deviation. The columns are renamed
# to be human readable while maintaining some element of machine readability as well.
# See the code book for more details on the columns.
reduceColumns <- function(dataSet) {
  keepCols <- colnames(dataSet)[grepl(".*(mean|std)\\(\\).*", colnames(dataSet))]
  
  newNames <- gsub("^(t)", "Time.", keepCols)
  newNames <- gsub("^(f)", "FastFourierTransform.", newNames)
  newNames <- gsub("(Body|Gravity)", "\\1.", newNames)
  newNames <- gsub("(Acc)", "Accelerometer", newNames)
  newNames <- gsub("(Gyro)", "Gyroscope", newNames)
  newNames <- gsub("(Jerk)", ".Jerk", newNames)
  newNames <- gsub("(Mag)", ".Magnitude", newNames)
  newNames <- gsub("(-mean\\(\\)-)(X|Y|Z)", ".\\2.Mean", newNames)
  newNames <- gsub("(-std\\(\\)-)(X|Y|Z)", ".\\2.StdDev", newNames)
  newNames <- gsub("(-mean\\(\\))", ".Mean", newNames)
  newNames <- gsub("(-std\\(\\))", ".StdDev", newNames)
  
  reduced <- dataSet[keepCols]
  colnames(reduced) <- newNames
  reduced
}

# Reads the list of subjects from the specified subfolder so that they can be merged
# with the accelerometer results in the same subfolder.
readSubjects <- function(subfolder) {
  read.table(paste("./", subfolder, "/subject_", subfolder, ".txt", sep = ""))
}

# Reads the accelerometer data from the specified subfolder (test or train) and combines it
# with the activity labels and subjects.
readData <- function(subfolder) {
  accelerometer.data <- read.table(paste("./", subfolder, "/X_", subfolder, ".txt", sep = ""))
  feature.names <- read.table("features.txt", sep = " ")[[2]]
  colnames(accelerometer.data) <- feature.names
  accelerometer.data <- reduceColumns(accelerometer.data)

  activities <- readActivities(subfolder)
  subjects <- readSubjects(subfolder)
  
  accelerometer.data <- cbind(activities, subjects, accelerometer.data)
  colnames(accelerometer.data)[1] <- "Activity.Id"
  colnames(accelerometer.data)[2] <- "Activity.Name"
  colnames(accelerometer.data)[3] <- "Subject.Id"
  
  accelerometer.data
}

# Reads and combines accelerometer data from the training and test data sets.
readCombinedData <- function() {
  rbind(readData("train"), readData("test"))
}

# Provides an average aggregation grouped by the activities and subjects for the combined
# data set.
readSummarizedData <- function() {
  combined <- readCombinedData()
  combined %>%
    group_by(Activity.Id, Activity.Name, Subject.Id) %>%
    summarize_each(funs(mean))
}