run_analysis <- function(scripts_folder, data_folder) {
        
        source(paste(scripts_folder, "/import_data.R", sep=""))
        source(paste(scripts_folder, "/combine_data.R", sep=""))
        source(paste(scripts_folder, "/tidy_up_varnames.R", sep=""))
        source(paste(scripts_folder, "/subset_data.R", sep=""))
        source(paste(scripts_folder, "/change_factors.R", sep=""))
        source(paste(scripts_folder, "/summarise_data.R", sep=""))
        
        import(data_folder)
        fullData <- combine()
        fullData <- tidy_up(features, fullData)
        mean_std <- subset(fullData)
        mean_std <- change_factors(mean_std)
        summary <- summarise_mean(mean_std)
        write.table(summary, file=paste(data_folder, "/summary_database.csv",
                                        sep=""), sep=",", row.names = F)
}
