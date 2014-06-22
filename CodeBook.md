GettingAndCleaningData_Project
==============================

Code Book for the Project for the Coursera Getting and Cleaning Data course.

This document sets out the details of how to understand the run_analysis.R script
for the project work in the Getting and Cleaning Data Coursera course.

#Note: the required location for all files can be found in the ReadMe.md markdown file.

#Read in the variable names and hold them for later
Firstly the column names for the data set are read in from the features.txt file. These are stored 
in the col.names for use later. The names are stored in the V2 column.

#Read in the test data.
##Read in the x data and assign the column names
The full dataset is read in from the X_test.txt file and stored in the x.test variable.
The script then assigns the columns names in $V2 column on the  col.names. The script also places
"MO-" before each name to indicate "mean of". We will later only include variables with the words
mean or std in them.

##Read in the y data and give it the activity column name
The activity data is read in from the y_test.txt file and stored in the y.test variable. It then
assigns the column name if "activityid" to it.

##Read in the subject data and give it the subject column name
Read in the data from the subject_test.txt file and store it in the subject.test variable.
Assign the column name "subject" to it.

#Read in the training data.
##Read in the x data and assign the column names
The full dataset is read in from the X_train.txt file and stored in the x.test variable.
The script then assigns the columns names in $V2 column on the  col.names. The script also places
"MO-" before each name to indicate "mean of". We will later only include variables with the words
mean or std in them.

##Read in the y data and give it the activity column name
The activity data is read in from the y_train.txt file and stored in the y.train variable. It then
assigns the column name if "activityid" to it.

##Read in the subject data and give it the subject column name
Read in the data from the subject_train.txt file and store it in the subject.train variable.
Assign the column name "subject" to it.


#Get the lookup table to establish the activities
Read in the data from the activity_labels.txt file ans assign it to the activity.labels variable.
Assign the column names "id" and "activity" to the activity.labels variable.

#Establish the matching for test.
The script then carries the following steps to replace the the activity id with the activity names:
 - Build a vector of the date we want to match in the y.test data
 - Build a vector of matching indices into the lookup table for the matches

#Bind the subject, lookup value for ativities and the x.test data.
The script then combines the columns for the subject, looked up activity names and the x.test data and
store it in the full.test variable.

#Establish the matching for train.
The script then carries the following steps to replace the the activity id with the activity names:
 - Build a vector of the date we want to match in the y.train data
 - Build a vector of matching indices into the lookup table for the matches

#Bind the subject, lookup value for ativities and the x.train data.
The script then combines the columns for the subject, looked up activity names and the x.test data and
store it in the full.train variable.


#Combine test and training set for the full data set
The script then combines the rows from both the full.train and full.test data sets and stores them in 
the full.all variable. 

#Build a data of variable names containing mean or std
The script then uses a regular expression to extract only those columns that have the words mean or std in them
along with the first two columns Subject and activity. This column filtered set is stored in the full.all variable effectively
just dropping columns we do not require.#Limit the columns in final data set to subject, 
#activity, mean and std columns.
full.all <- full.all[,idx.col.names.mean.std]

#Build final data set of means of all mean and std variables across subject and activity
The scipt the stores the mean value of each mean and std variable accross subjects and activities and stores the resuts in 
full.mean data frame. It then sorts the data frame by subject.
Note as the variables (other than subject ans activity) have had "MO-" appended to them to indicate "Mean of" the reader
can easily determine the meaning of the new variables.

#Save the final data frame to file.
Finally the script saves the full.mean data frame to the "output.txt" file in the working directory.


