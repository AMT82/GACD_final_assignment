tidy_up <- function(feat=features, fulldata=fullData) {
        clean_features <- gsub("\\(|\\)|-|,","", features$V2)
        colnames(fullData) <- c("subject", "activity", clean_features)
        return(fulldata)
        }