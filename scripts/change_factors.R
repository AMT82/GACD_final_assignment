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