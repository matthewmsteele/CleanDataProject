# Getting and Clean Data Course Project: Code Book
## Matt Steele	    	 7-24-2014

### The Data 

The data used in this project comes from the UCI [Human Activity
Recognition Using Smartphones Data
Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
(hereafter HARUS).  In this project we handle only the processed data made
available by the UCI HARUS group. The raw data collected from individual
accelerometers and gyroscopes is part of the collection, however the script
included here does not process the raw data.

### Transformations 

The chief transformation performed in the project is consolidation.  The HARUS
data set is spread across files for training and testing data sets for the
processed smartphone sensor data as well as files identifying the number of the
experimental subject from with the data was collected and the activity class
describing the activity the subject was engaged in at the time of data
collection. The R script included here consolidates the data from all of these
files in a single data table file. As a secondary action, in accordance with the
tidy data principles, the `activity` variable is coded as a character string
rather than the numerical encoding originally used by the HARUS group.

As a secondary procedure a summery analysis is performed to calculate the average value of each variable for each subject performing each activity.

### The Variables

The execution of the included `run_analysis.R` script produces two text data
files; `tidy_data1.txt`, and `tidy_data2.txt`. Each file contains 68 variables
which describe processed features of the HARUS data set. The `tidy_data2.txt`
file includes the average value of each variable for a given subject and
activity. As such each value in summary file is prefixed by `AVG` to denote that
it is an average value.

The original HARUS data set contains 17 processed measurement types. These are encoded using the names as follows:

`tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag`

Any measurement which is appended here by an `-XYZ` has three associated
variables, corresponding to the each of the three Cartesian dimensions. The
dimension associated with each variable is noted with a suffix (`.X`, `.Y`, or
`.Z`). Further, each of the above measurements has a variable for value of the
mean of the measurement set (denoted with `.mean`) and the standard deviation
of the set (`.std`). With all possible combinations of measurement type,
calculation value, and dimension there are a total of 66 variables.

As an example the value of the mean of the `tBodyAcc` measurement along the X
dimension will be registered in the variable `tBodyAcc.mean.X`.

Two additional variables are included in the data table:
    
    `activity` - codes for the type of activity the subject was engaged in for a specific set of measurements

    `subject` - provides the subject identifier number