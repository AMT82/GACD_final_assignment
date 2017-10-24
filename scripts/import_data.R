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