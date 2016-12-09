# coursera-accelerometer-data
Programming Assignment Submission for Coursera course: Getting and Cleaning Data (https://www.coursera.org/learn/data-cleaning)

run_analysis.R creates two data sets:
 * Combined Data is produced by the readCombinedData function and contains average and standard deviation data for each activity and each subject in the accelerometer data set. See CodeBook.md for more details.
 * Summary Data is produced by the readSummarizedData function and contains the above combined data averaged and grouped by the activity and subjects. See CodeBook.md for more details.

## Assumptions How the Code Works
The readCombinedData and readSummarizedData functions assume that the accelormeter data is in the working directory and unzipped. If you need to acquire the accelerometer data, a convenience function, downloadData, is included that will download the data to the working directory, extract it and change the working directory to the proper sub-directory within the extracted content (the "UCI HAR Dataset" sub-directory).

The code depends upon the dplyr library which can be installed using the command:
```
install.packages("dplyr")
```

The combined data loads the test and training data sets from the 'test' and 'train' sub-directories. It combines the accelerometer data in each directory with the activities (in y_test.txt and y_train.txt) and subjects (in subject_test.txt and subject_train.txt). The order of the records in the activity and subject files are assumed to be the same as the order of the corresponding records in the measurement data (X_test.txt and X_train.txt). The test and train data sets are kept separately until the very end of the combine process when they are concatenated together using rbind.

The columns in the data sets are reduced and renamed. The included measurement columns contain only the mean and standard deviation values from the original source data. 

The summarized data processes the combined data to produce an average for each of the mean and standard deviation measurement columns for each combination of activity and subject. This is where dplyr is used to do the average and group by. 
