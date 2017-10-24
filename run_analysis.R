run_analysis <- function() {
        
        source("./scripts/import_data.R")
        source("./scripts/combine_data.R")
        source("./scripts/tidy_up_varnames.R")
        source("./scripts/subset_data.R")
        source("./scripts/change_factors.R")
        source("./scripts/summarise_data.R")
        
        import("./UCI HAR Dataset")
        fullData <- combine()
        fullData <- tidy_up(features, fullData)
        mean_std <- subset(fullData)
        mean_std <- change_factors(mean_std)
        summary <- summarise_mean(mean_std)
        write.table(summary, file=paste("./summary_database.txt",
                                        sep=""), sep=",", row.names = F)
}
