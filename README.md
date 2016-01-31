# Coursera Cleaning Data assignment
Michael Mikhailidi, 2016

## Script Purpose
Script gets experimental data from Center for Machine Learning and Intelligent Systems University of California, Irving and return tidy data set.
Resulting data set contains average measurements by subject and activity types for 50 variables. 

## Source Data
Source data were collected in [Human Activity Recognition Using Smartphone](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) project. 
Source data set contains measurements for 30 subjects and 6 activities with 561 collected and calculated
Raw data archive:  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Prerequisites
- Script requires at least 50Mb of disk space to download and unpack dataset
- Function requires library **dplyr** installed in your system 

## How it works
- Script doesn’t accept any parameters
- It checks if source data are located I working directory under **UCI HAR Dataset** folder
- If folder does not exist script downloads and unpacks data archive.
- Script tidy activity data and prepares features dictionary to limit resulting data with average and standard deviation variables only
-	Script combines test and train results sets and returns data frame with average measurements by subject and activity.
-	Script returns average data as result.

## How to run
 1. Source script file [run_analysis.R] (https://github.com/mikhailidim/cleandata/blob/master/run_analysis.R)
 2. Run function with no parameters:
   > asummary<- run_analysis()
