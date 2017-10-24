subset <- function(fulldata=fullData) {
        library(dplyr)
        ## Remove duplicate variable names
        fulldata <- fulldata[ , !duplicated(colnames(fulldata))]
        ## Select columns subject, activity, and any with mean or std
        return(select(fulldata, subject, activity, matches("mean|std")))
}