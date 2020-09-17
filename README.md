# README File
# TidyDataProject

This repository contains files regarding my Tidy Data Project for the Getting and Cleaning Data Course from JHU on Coursera.

The following files are contained in this repository:
1. README file, which you are reading right now.
2. Tidy Data Code Book, which contains the variable description of the tidymeans dataset.
3. run_analysis.R script, which calculates and returns the tidymeans dataset.
4. tidymeans.txt file, which contains the tidymeans dataset returned from the run_analysis.R script.

run_analysis.R Script Description

This script reads data from several files and outputs a tidy data set containing the means of several variables grouped by subject ID and activity. For a more detailed description of the original data and the tidy dataset's variables, please refer to the Tidy Data Code Book contained in this repository.

The purpose of this script is to return a tidy data set that may be used for later analysis.

The script does the following:

1. Reads all necessary files from the original dataset.
2. Merges the training and testing sets for the x, y, and subject data.
3. Assigns the measured variable's names in the x dataset according to the original data.
4. Extracts only the mean and standard deviation columns for each measurement.
5. Changes the variable names to a more readable version (the description of the dataset's column names is found in the Tidy Data Code Book).
6. Changes the activities from integers to their corresponding string values (e.g. "walking").
7. Sets the measurement's activity and subject ID variables to factor vectors (needed step to build the final tidymeans dataset).
8. Merges the measurements, subject ID and activities into one tidy data set.
9. Creates the tidymeans dataset, which has the average of each variable for each activity and each subject (using the dplyr package).
10. Writes the tidymeans dataset into a text file ("tidymeans.txt").

The final output (tidymeans) contains a tidy dataset, since it complies with the following criteria:
* Each variable is in one column.
* Each different observation of that variable is in a different row.
* There is one table for each "kind" of variable.
* Each column has a variable name.
* Column names were modified to be readable.
* Data is saved in one file per table.