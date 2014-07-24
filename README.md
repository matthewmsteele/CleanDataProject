# Getting And Cleaning Data Course Project
## Matt Steele 	7-24-2014

The R script `run_analysis.R` is provided here in fulfillment of the *Getting And
Cleaning Data* Course Project.  Upon execution the script the script reformats
the UCI [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) in accordance
with the tidy data principles layed out in the course.

The `run_analysis.R` script condenses the data from multiple test and training
data files into one single data file. This output data file is then written to a
file called `tidy_data1.txt`. The variables included in this file are described
in the `CodeBook.md` file. In a secondary analysis the script also calculates
the average value for each included variable by activity and experimental
subject. The results of this summary analysis is written to the file
`tidy_data2.txt`.

The relative locations of the original data set is hard-coded in the script, so the script must be executed in the base directory of the UCI data set.