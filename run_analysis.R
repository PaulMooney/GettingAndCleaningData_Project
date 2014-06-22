
#Read in the variable names and hold them for later
col.names.fn <- file.path(getwd(),"UCI HAR Dataset", "features.txt", fsep = .Platform$file.sep)
col.names <- read.table(col.names.fn, header = FALSE, stringsAsFactors = FALSE)

#Read in the test data.
#-------------------------------------------------------------------------------------------------------
#Read in the x data and assign the column names
x.test.fn <- file.path(getwd(),"UCI HAR Dataset", "test", "X_test.txt", fsep = .Platform$file.sep)
x.test <- read.table(x.test.fn, header = FALSE)
#Assign the column names and place MO- before each name to indicate "mean of".
colnames(x.test) <- gsub(col.names$V2, pattern = "^", replacement = "MO-\\1", perl = TRUE)


#Read in the y data and give it the activity column name
y.test.fn <- file.path(getwd(),"UCI HAR Dataset", "test", "y_test.txt", fsep = .Platform$file.sep)
y.test <- read.table(y.test.fn, header = FALSE)
colnames(y.test) <- "activityid" 

#Read in the subject data and give it the subject column name
subject.test.fn <- file.path(getwd(),"UCI HAR Dataset", "test", "subject_test.txt", fsep = .Platform$file.sep)
subject.test <- read.table(subject.test.fn, header = FALSE)
colnames(subject.test) <- "subject"

#Read in the training data.
#-------------------------------------------------------------------------------------------------------
#Read in the x data and assign the column names
x.train.fn <- file.path(getwd(),"UCI HAR Dataset", "train", "X_train.txt", fsep = .Platform$file.sep)
x.train <- read.table(x.train.fn, header = FALSE)
#Assign the column names and place MO- before each name to indicate "mean of".
colnames(x.train) <- gsub(col.names$V2, pattern = "^", replacement = "MO-\\1", perl = TRUE)

#Read in the y data and give it the activity column name
y.train.fn <- file.path(getwd(),"UCI HAR Dataset", "train", "y_train.txt", fsep = .Platform$file.sep)
y.train <- read.table(y.train.fn, header = FALSE)
colnames(y.train) <- "activityid"

#Read in the subject data and give it the subject column name
subject.train.fn <- file.path(getwd(),"UCI HAR Dataset", "train", "subject_train.txt", fsep = .Platform$file.sep)
subject.train <- read.table(subject.train.fn, header = FALSE)
colnames(subject.train) <- "subject"


#Get the lookup table to establish the activities
activity.labels.fn <- file.path(getwd(),"UCI HAR Dataset", "activity_labels.txt", fsep = .Platform$file.sep)
activity.labels <- read.table(activity.labels.fn, header = FALSE)
colnames(activity.labels) <- c("id", "activity")

#Establish the matching for test
#Build a vector of the date we want to match in the y.test data
ActivityMatch.y.test <- match(y.test$activityid, activity.labels$id)
#Build a vector of matching indices into the lookup table for the matches
lkpMatches.y.test <- activity.labels$activity[ActivityMatch.y.test]
#Bind the subject, lookup value for ativities and the x.test data.
full.test <- cbind(subject.test,"activity" = lkpMatches.y.test, x.test)

#Establish the matching for train
#Build a vector of the date we want to match in the y.test data
ActivityMatch.y.train <- match(y.train$activityid, activity.labels$id)
#Build a vector of matching indices into the lookup table for the matches
lkpMatches.y.train <- activity.labels$activity[ActivityMatch.y.train]

#Bind the subject, lookup value for ativities and the x.train data.
full.train <- cbind(subject.train,"activity" = lkpMatches.y.train, x.train)

#Combine test and training set for the full data set
full.all <- rbind(full.train, full.test)

#Build a data of variable names containing mean or std
idx.col.names.mean.std <- grep("mean|std", col.names$V2)
#Increase each index by two to allow for the subject and activity columns
idx.col.names.mean.std <- idx.col.names.mean.std+2
#Insert the index 1 and 2 for the subject and activity columns
idx.col.names.mean.std <- c(c(1,2), idx.col.names.mean.std)

#Limit the columns in final data set to subject, 
#activity, mean and std columns.
full.all <- full.all[,idx.col.names.mean.std]

#Order the output by subject
#full.all <- full.all[order(full.all$subject),]
#full.output.fn <- file.path(getwd(),"UCI HAR Dataset", "outputFull.csv", fsep = .Platform$file.sep)
#write.table(full.all, full.output.fn,col.names = TRUE, row.names = FALSE, sep = ",")


full.mean <- aggregate(full.all[,-c(1,2)], by=list(subject=full.all[,1],activity=full.all[,2]), FUN=mean)
full.mean <- full.mean[order(full.mean$subject),]
output.fn <- file.path(getwd(), "output.txt", fsep = .Platform$file.sep)
write.table(full.mean, output.fn,col.names = TRUE, row.names = FALSE, sep = ",")

