DISCLAIMER:

All data and information were obtined from:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

DATA:

activity_labels.txt -> meaningful labels for "activity" column
features.txt -> list of variable names for full dataset
subject_test.txt -> "subject" column for partial dataset "test"
X_test.txt -> values for partial dataset "test"
y_test.txt -> "activity" column for partial dataset "test"
Subject_train.txt -> "subject" column for partial dataset "train"
X_train.txt -> values for partial dataset "train"
y_train.txt -> "activity" column for partial dataset "train"

VARIABLES:

The following parameters are available. The suffix "XYZ" indicates that there are 3 different variables, one for each direction in space.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

For each parameter, the following calculations were performed:

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

The following additional calculations were performed on the parameters angles():

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

TRANSFORMATIONS:

1. To each of the "test" and "train" datasets, the columns "subject" and "activity" were added.
2. The resulting partial datasets were combined in a single full dataset.
3. The features names in the file "features.txt" were stripped of any non-character symbols, and used as variable names for the full dataset.
4. Duplicate variables were removed from the full dataset.
5. The full dataset was subset by selecting only the variables containing the words "mean" and "std".
6. The first two columns of the subset ("activity" and "subject") were converted to class factor.
7. The levels of the column "activity" were changed to meaningful strings from the file "activity_labels.txt".
8. The subset was grouped by activity and by subject.
9. A summary was performed to return the mean of each variable, grouped by activity and by subject.