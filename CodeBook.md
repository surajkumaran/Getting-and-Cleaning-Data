# Code Book


## About the Data

The raw data was obtained from UCI Machine Learning Repository's Human Activity Recognition Using Smartphones Data Set. The Human Activity Recognition database was built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors:

### Characteristics:

* Data-Set Characteristics: Multi-variate, time series
* Attribute Characteristics: N/A
* Number of Attributes: 561
* Missing Values: N/A
* Area: Computer

### Source:

* Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
* Smartlab - Non Linear Complex Systems Laboratory 
* DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
* activityrecognition '@' smartlab.ws 
* www.smartlab.ws 

### Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information:

For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration
* Triaxial Angular velocity from the gyroscope 
* A 561-feature vector with time and frequency domain variables
* Its activity label
* An identifier of the subject who carried out the experiment.

### Contents 

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector
* 'features.txt': List of all features
* 'activity_labels.txt': Links the class labels with their activity name
* 'train/X_train.txt': Training set
* 'train/y_train.txt': Training labels
* 'test/X_test.txt': Test set
* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean   


## Data Transformation:

The raw data is transformed into the tidy data through the follwing steps:

### 1. Merging the training and the test sets to create one data set

In this step, the data regarding the subject, activity and the features are read into 6 separate datasets for both the Training and Test sets. The subject, activity and the features for both Training and Test sets are then row bound into 3 separate datasets. However, they are not combined at this stage.

### 2. Extracting only the measurements on the mean and standard deviation for each measurement

The text file with the names of features is read into a dataset and then transformed to a vector. This is then assigned as column names for the combined Features data of the 2 sets. The required features which measure only mean and standard deviation are found out and transformed to a vector. This is then used to subset the combined Features data to give only the required features.

### 3. Using descriptive activity names to name the activities in the data set

Similarly the text file containing the mapping for activities is read into a dataset. By using this to create a factor variable, the combined Activities data of 2 sets is mapped to their correct names and the column is named as "Activity".

### 4. Appropriately labeling the data set with descriptive variable names 

Here, the column containing the combined Subject data of the 2 sets is named as "Subject" and then the 3 combined datasets of the Training and Test sets are column bound to form a single dataset.

### 5. From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject

The plyr package is called to use the ddply function to create a dataset with the mean values of each feature for each activity of a subject. The resulting dataset is written into a text file in the working directory.


## Variables in R Script:

* url: download link
* X_test: dataset containing data read from X_test.txt
* Y_test: dataset containing data read from y_test.txt
* subject_test: dataset containing data read from subject_test.txt
* X_train: dataset containing data read from X_train.txt
* Y_train: dataset containing data read from y_train.txt
* subject_train: dataset containing data read from subject_train.txt
* X_data: Combined data of X_train and X_test; subsetted for features measuring only either mean or standard deviation
* Y_data: Combined data of Y_train and Y_test; overwritten with corresponding activity names 
* subject_data: Combined data of subject_train and subject_test
* features: dataset containing data read from features.txt
* X_col_names: Vector of names of features
* reqd_name: Vector of names of features measuring mean or standard deviation
* activities: dataset containing data read from activity_labels.txt; overwritten as factor variable with 6 levels
* final_data: Combined data of modified X_data, Y_data and subject_data
* avg_data: Dataset with mean values of each feature for each activity of a subject

