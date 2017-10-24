combine <- function(subjecttrain=subject_train, ytrain=y_train, Xtrain=X_train,
                    subjecttest=subject_test, ytest=y_test, Xtest=X_test) {
        trainData <- cbind(subjecttrain, ytrain, Xtrain)
        testData <- cbind(subjecttest, ytest, Xtest)
        return(rbind(trainData, testData))
}