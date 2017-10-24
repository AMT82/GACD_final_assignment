summarise_mean <- function(meanstd=mean_std) {
        ## Group dataset by activity and by subject
        mean_std_g <- group_by(meanstd, activity, subject) 
        ## Summarise means
        return(dplyr::summarise_each(mean_std_g, funs(mean)))
}