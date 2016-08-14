Getting and Cleaning Data

Course Project

Don Hescht

FILES

run_analysis.R = Script to transform Data into tidy average summary dataset

README.md = This file

CodeBook.md = Contain code information about run_analysis.R

TidyDataSet.csv = The main output of this project. 

WeareablesAnalysis.Pproj = is a RStudio project file.

INTRODUCTION

The purpose of this project is to demonstrate the ability to collect, 
work with, and clean a data set.  To this end smart phone motion
data was collected from the UCI, Machine Learning Repository[1].  The following 
link explains the study.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

SETUP 

Prior to running the run_analysis.R script the following setup must be 
performed.

1) Download the following zip file:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2) Unzip the data into the working directory in a folder called "Data".

REQUIREMENTS

1. Merge the training and test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for 
each measurement.
3. Use descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.

INPUT

The "Data" folder contains data as described by the "Data/README.txt."  Please 
refer to the UCI readme file to understand all inputs, collected 
data variable names, how the data was collected, the calculated features.

The following 7 files from the "Data" directory are used

1. features.txt: Feature column names.

2. .\test\X_test.txt: Feature data.

3. .\test\y_test.txt: Subject (human) activity for each feature obseration.

4. .\test\subject_test.txt: The subject (human) wearing the smart phone.

5. .\train\X_test.txt: Feature data.

6. .\train\y_test.txt: Subject (human) activity for each feature obseration.

7. .\train\subject_test.txt: The subject (human) wearing the smart phone.

DESIGN

The input data represents observation of test subjects (30) for 
each activity (6).  The run_analysis.R is designed to read the collected data 
training and test sets and merge them into a single tidy set that summarzies 
by the mean and standard deviations of the various axis observations into 
a tidy[2] data set that is itself an average of these observations binned
by subject and activity.

The main design choice was whether to display the tidy set as wode or long 
data.  After experimenting with both it was decided to the wide dataset as 
it more closely matches the principle of one variable per column.  Secondly,
it allowed easy comparison of subject and activty values as they are in the 
same column.  Thirdly, the dataset was saved in a csv allowing easy 
Excel viewing and pivot table viewing.

OUTPUT

A tidy, wide data set where each column is a domain value (ID) or measurement 
average.  Please see CodeBook.md for a full description of data columns 
and structure.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. 
Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass 
Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). 
Vitoria-Gasteiz, Spain. Dec 2012
[2]Hadley Wickham, Tidy Data.  
Journal of Statististical Software.  
August 2014, Volume 59, Issue 10