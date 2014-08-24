==================================================================
Merged Accelerometer data from Train and Test
==================================================================
Swethak Yadav Chandrashekar
==================================================================

The scope of this project is to merge Test and Train data, provided in course project in Getting and Cleaning Data course, and generate a new tidy 
data set grouped on Activity and Subject.

This directory includes 4 files:

1. run_analysis.R
2. run_Analysis_TidyData_CodeBook.txt
3. New_Names.txt
4. README.md

Description of each of the files is provided below:

1. On sourcing and running run_analysis.R the script will use data from the files(described below) and merges and transforms it to a single tidy data set in the form of an output file of name TidyData.txt  
This script will generate a output file as described below:
	a. TidyData.txt - This is a tab separated text file that will have final output from the source dataset with averages of means and standard deviations based on Activity and Subject

This script assumes all relevent data files are placed in the working directory along with the New_Names.txt file. Below is the list of files required.
	a. activity_labels.txt
	b. features.txt
	c. New_Names.txt
	d. subject_test.txt
	e. subject_train.txt
	f. X_test.txt
	g. X_train.txt
	h. y_test.txt
	i.  y_train.txt

2. run_Analysis_TidyData_CodeBook will provide the details of all variables for TidyData.txt (See a. above)

3. File with a list of column names that are desciptive label names. This file needs to be present in the working directory.

4. Current Readme file
