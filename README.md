#GettingAndCleaningData_Project
==============================

##Project for the Coursera Getting and Cleaning Data course.

This document sets out the details of how to run the analysis script
named run_analysis.R for the project work in the Getting and Cleaning Data Coursera course.

###Step 1
Place the run_analysis.R into your woking directory.

###Step 2
Place the UCI HAR Dataset folder and its associated data into your working directory.

####At this point you will have the following (WD means working directory):

- WD\UCI HAR Dataset\features.txt
- WD\UCI HAR Dataset\activity_labels.txt
- WD\UCI HAR Dataset\test\subject_test.txt
- WD\UCI HAR Dataset\test\X_test.txt
- WD\UCI HAR Dataset\test\y_test.txt
- WD\UCI HAR Dataset\train\subject_train.txt
- WD\UCI HAR Dataset\train\X_train.txt
- WD\UCI HAR Dataset\train\y_train.txt

###Step 3
Run the run_analysis.R script.

###Result
A new comma separated file named output.txt will be created in your working directory which will
contain the tidy data set holding the means by subject and activity of all mean and standard deviation
in the original data sets.

For details of how the script accomplishes its task please refer to the CodeBook.md markdown file.


