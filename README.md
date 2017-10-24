# GACD_final_assignment
Final assignment for the course "Getting and Cleaning Data", by John Hopkins University,
Andrew M Telford

DATA SOURCE: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

DATA INFO: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Master script
run_analysis.R
This script uses the scripts below to perform the complete data analysis.
Example: run_analysis("C:/.....","C:/.....")

## Slave scripts used in run_analysis.R, in order of use
NOTE: script 1 below, used to import data, returns variables with the relevant data programmatically.
All of the following functions use these variable names as default if no other value is
specified, giving the option of making the analysis fully automated.

Script 1: import_data.R
This script imports all the relevant data, given the location of the "UCI HAR Dataset"
folder.
Example: import("C:/folder/UCI HAR Dataset")

Script 2: combine_data.R
This script adds the columns "subject" and "activity" a the beginning of each of the 
"train" and "test" datasets, and then combines the two datasets into a single one.
Example: fullData <- combine()

Script 3: tidy_up_varnames.R
This script cleans up the variable names from the file "features.txt"
(removes non-character symbols) and assigns those names to the variables in the full
dataframe.
Example: fullData <- tidy_up(fullData)

Script 4: subset_data.R
This script selects only the columns of the full dataframe that contain either mean or
standard deviation values.
Example: mean_std <- subset(fullData)

Script 5: change_factors.R
This script converts the class of the first two columns ("subject" and "activity") into
factor, and changes the "activity" values from numbers to descriptive strings, according
to the file "activity_labels.txt".
Example: mean_std <- change_factrors(mean_std)

Script 6: summarise_data.R
This script summarises mean and standard deviation data by reporting the mean for each
variable, per activity and per subject.
Example: summary <- sumamrise_mean(mean_std)
