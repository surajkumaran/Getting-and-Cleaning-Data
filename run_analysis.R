## Step 0: Downloading the data ##
##################################

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile="./accelerometer_data.zip")
unzip("./accelerometer_data.zip")


## Step 1. Merging the training and the test sets to create one data set ##
###########################################################################

## 1.1. Creating dataset for X_test, Y_test & subject_test
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## 1.2. Creating dataset for X_train, Y_train & subject_train
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## 1.3. Binding the training and test sets to create X_data, Y_data & subject_data
X_data <- rbind(X_train,X_test)
Y_data <- rbind(Y_train,Y_test)
subject_data <- rbind(subject_train, subject_test)


## Step 2: Extracting only the measurements on the mean and standard deviation for each measurement ##
######################################################################################################

## 2.1. Creating dataset for features
features <- read.table("./UCI HAR Dataset/features.txt")

## 2.2. Creating a vector of names of features (names of columns for X_data)
X_col_names <- as.vector(features[,2])

## 2.3. Assigning the column names for X_data
colnames(X_data) <- X_col_names

## 2.3. Creating a vector of mean and standard deviation features
reqd_names <- as.vector(grep("(mean|std)\\(\\)",features[,2]))

## 2.4 Subsetting only required features for X_data
X_data <- X_data[,reqd_names]


## Step 3: Using descriptive activity names to name the activities in the data set ##
#####################################################################################

## 3.1. Creating a dataset for activities
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

## 3.2. Mapping activity names for Y_data
activities <- activities[Y_data[,1],2]
Y_data[,1] <- activities

## 3.3. Giving Column name for activities
colnames(Y_data) <- "Activity"


## Step 4: Appropriately labeling the data set with descriptive variable names ##
#################################################################################

## 4.1. Labeling Subject_data
colnames(subject_data) <- "Subject"

## 4.2. Combining all required datasets into one dataset
final_data <- cbind(subject_data,Y_data,X_data)


## Step 5: From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject ##
############################################################################################################################################################

## 5.1. Creating dataset for averages
library(plyr)
avg_data <- ddply(final_data,.(Subject,Activity),function(x) colMeans(x[,3:68]))

## 5.2. Writing into text file
write.table(avg_data,"avg_data.txt",row.name=F)

