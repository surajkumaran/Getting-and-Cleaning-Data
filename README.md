Coursera--Getting-and-Cleaning-Data--Course-Project
===================================================

This is the Repository for the Final Course Project of the Getting and Cleaning Data course on Coursera.


## Project Description

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The following are required to be submitted: 
* A tidy data set as described below 
* A link to a Github repository with the script for performing the analysis
* A code book that describes the variables, the data, and any transformations or work performed to clean up the data called CodeBook.md
* A README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The R script called run_analysis.R does the following: 
* Merges the training and the test sets to create one data set
* Extracts only the measurements on the mean and standard deviation for each measurement 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


## Contents of this Repository:
* READ.md: Explains how the scripts work and how they are connected
* CodeBook.md: Describes variables, data and transformations performed for data clean up
* UCI HAR Dataset: Unwipped folder from download link containing all raw data
* run_analysis.R: R scipt that downloads and unwips the raw data and transforms it to the tidy avg_data
* avg_data: The final tidy output


## Procedure:
* The R scipt is commented appropriately to be self-explanatory
* Make sure that the plyr package is pre-installed.
* Run the scipt run_analysis.R after setting the working directory of your choice.
* The script downloads and unwips the required raw data and creates the output in the form of a text file in your working directory.
