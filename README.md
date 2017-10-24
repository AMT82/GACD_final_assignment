# GACD_final_assignment
Final assignment for the course "Getting and Cleaning Data" by John Hopkins University
Andrew M Telford

NOTE: script 1, used to import data, returns variables with the relevant data programmatically.
All of the following functions use these variable names as default if no other value is
specified, giving the option of making the analysis fully automated.

Script 1: import_data.R
This script imports all the relevant data, given the location of the "UCI HAR Dataset"
folder.

Example: import("C:/folder/UCI HAR Dataset")

import <- function(folder) {
        ## Checks that folder exists
        if (!dir.exists(folder)) {
                message("The source folder does not exist")
                stop()
        }
        ## Imports relevant data and returns as global variables
        X_train <<- read.table(file=paste(folder, "/train/", "X_train.txt", sep=""),
                             sep="")
        y_train <<- read.table(file=paste(folder, "/train/", "y_train.txt", sep=""),
                             sep="")
        subject_train <<- read.table(file=paste(folder, "/train/", "subject_train.txt",
                                               sep=""), sep="")
        X_test <<- read.table(file=paste(folder, "/test/", "X_test.txt", sep=""),
                             sep="")
        y_test <<- read.table(file=paste(folder, "/test/", "y_test.txt", sep=""), 
                             sep="")
        subject_test <<- read.table(file=paste(folder, "/test/", "subject_test.txt", 
                             sep=""), sep="")
        ## Import "features" as character, to use as column names
        features <<- read.table(file=paste(folder, "/", "features.txt", sep=""),
                             sep="", colClasses="character")
}


Script 2: combine_data.R
This script adds the columns "subject" and "activity" a the beginning of each of the 
"train" and "test" datasets, and then combines the two datasets into a single one.
If no variable is specified, the default names output from the "import_data.R" script
are used instead.

Example: fullData <- combine()

combine <- function(subjecttrain=subject_train, ytrain=y_train, Xtrain=X_train,
                    subjecttest=subject_test, ytest=y_test, Xtest=X_test) {
        trainData <- cbind(subjecttrain, ytrain, Xtrain)
        testData <- cbind(subjecttest, ytest, Xtest)
        return(rbind(trainData, testData))
}


Script 3: tidy_up_varnames.R
This script cleans up the variable names from the file "features.txt"
(removes non-character symbols) and assigns those names to the variables in the full
dataframe.

Example: fullData <- tidy_up(fullData)

tidy_up <- function(feat=features, fulldata=fullData) {
        clean_features <- gsub("\\(|\\)|-|,","", features$V2)
        colnames(fullData) <- c("subject", "activity", clean_features)
        return(fulldata)
        }

Script 4: subset_data.R
This script selects only the columns of the full dataframe that contain either mean or
standard deviation values.

Example: mean_std <- subset(fullData)

subset <- function(fulldata=fullData) {
        library(dplyr)
        ## Remove duplicate variable names
        fulldata <- fulldata[ , !duplicated(colnames(fulldata))]
        ## Select columns subject, activity, and any with mean or std
        return(select(fulldata, subject, activity, matches("mean|std")))
}

Script 5: change_factors.R
This script converts the class of the first two columns ("subject" and "activity") into
factor, and changes the "activity" values from numbers to descriptive strings, according
to the file "activity_labels.txt".

Example: mean_std <- change_factrors(mean_std)

change_factors <- function(meanstd=mean_std) {
        ## Change class of first two columns to factor
        meanstd[,1:2] <- lapply(meanstd[,1:2], as.factor) 
        ## Assign meaningful strings to factors
        levels(meanstd$activity) <- list("walking"="1",
                                          "walkingupstairs"="2",
                                          "walkingdownstairs"="3",
                                          "sitting"="4",
                                          "standing"="5",
                                          "laying"="6")
        return(meanstd)
}

Script 6: summarise_data.R
This script summarises mean and standard deviation data by reporting the mean for each
variable, per activity and per subject.

Example: summary <- sumamrise_mean(mean_std)

summarise_mean <- function(meanstd=mean_std) {
        ## Group dataset by activity and by subject
        mean_std_g <- group_by(mean_std, activity, subject) 
        ## Summarise means
        return(dplyr::summarise_each(mean_std_g, funs(mean)))
}

