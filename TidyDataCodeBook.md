---
title: "Tidy Data Code Book"
author: "Andrea Cárdenas"
date: "17/9/2020"
output: 
  html_document:
    keep_md: true
urlcolor: blue
---


## About This Document

This document contains the description of all variables contained in the *tidymeans*  dataset created by the run_analysis.R script contained in the repository. The *tidymeans* dataset can be accesed [here](https://github.com/deacardenas/TidyDataProject/blob/master/tidymeans.txt).

## Data Source

The run_analysis.R script uses data downloaded from the Human Activity Recognition Using Smartphones Dataset compiled by the Non Linear Complex Systems Laboratory in Università degli Studi di Genova. The full dataset can be accessed in this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 

This dataset contains the data collected from sensor signals of a smartphone that was placed on the waist of subjects while performing different activities. The following is the description of the data contained in the README file from the  original dataset linked above:

*"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.*

## *tidymeans* Dataset Description

The *tidymeans* dataset returned by the run_analysis.R script has 180 rows and  68 columns. The dataset contains the average value for 66 different variables grouped by subject ID and performed activity.

The first column named *SubjectID* refers to the ID of the subject performing the activity. Since there are 30 subjects, *SubjectID* has values 1-30. It is a  factor column with 30 integer levels.

The second column named *Activity* refers to the activity the subject was performing while the sensor signals were measured. It is a factor vector with 6 possible values: "walking", "walking upstairs", "walking downstairs", "sitting", "standing", and "laying".

Columns 3 through 68 contain the average value of each measured variable, given the subject and activity specified in columns 1 and 2. The column names indicate  which measured variable is contained in the corresponding column. The column names  are structured as follows:

*[Time/Freq][Body/Gravity][Accelerometer/Gyroscope][Jerk][Magnitude][Mean/StdDev][X/Y/ZAxis]*

Each of the words in the column name indicate a certain aspect of the variable. The descriprion for each word contained in the column names is listed in the following table:


|ColumnName    |Description                                                                                                   |
|:-------------|:-------------------------------------------------------------------------------------------------------------|
|Time          |Signal in time domain, captured at a constant rate of 50Hz.                                                   |
|Freq          |Signal in the frequency domain, calculated as the Fast Fourier Transform of time-domain signals.              |
|Body          |Indicates measurements due to the body of the subject, derived from the phone's accelerometer signal.         |
|Gravity       |Indicates measurements due to gravity, derived from the phone's accelerometer signal.                         |
|Accelerometer |Indicates measurements derived from the phone's accelerometer signal.                                         |
|Gyroscope     |Indicates measurements derived from the phone's gyroscope signal.                                             |
|Jerk          |Calculated by deriving the body linear acceleration or angular velocity in time.                              |
|Magnitude     |Indicates the magnitude of a 3-dimensional measurement.                                                       |
|Mean          |Indicates that this is the mean calculated from all signals of this type during the experiment.               |
|StdDev        |Indicates that this is the standard deviation calculated from all signals of this type during the experiment. |
|X/Y/ZAxis     |Indicates the corresponding axis value for 3-dimensional variables.                                           |
So, for example, column 32 of the *tidymeans* dataset has a column name "TimeBodyGyroscopeJerkStdDevZAxis". According to the table, this column has the standard deviation of the time derivative of a time-domain variable measuring the output of the smartphone's gyroscope regarding the subject's body movements along the Z axis.
