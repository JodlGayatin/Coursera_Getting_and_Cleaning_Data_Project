### Data Information

This second programming assignment will require you to write an R
function that is able to cache potentially time-consuming computations.
For example, taking the mean of a numeric vector is typically a fast
operation. However, for a very long vector, it may take too long to
compute the mean, especially if it has to be computed repeatedly (e.g.
in a loop). If the contents of a vector are not changing, it may make
sense to cache the value of the mean so that when we need it again, it
can be looked up in the cache rather than recomputed. In this
Programming Assignment you will take advantage of the scoping rules of
the R language and how they can be manipulated to preserve state inside
of an R object.

### Example: Caching the Mean of a Vector

In this example we introduce the `<<-` operator which can be used to
assign a value to an object in an environment that is different from the
current environment. Below are two functions that are used to create a
special object that stores a numeric vector and caches its mean.

The first function, `makeVector` creates a special "vector", which is
really a list containing a function to

`subjectId`                     
`activityType`                  

*`TimeBodyAcc-mean()-X`      
*`TimeBodyAcc-mean()-Y`          
*`TimeBodyAcc-mean()-Z`
*`TimeBodyAcc-std()-X`          
*`TimeBodyAcc-std()-Y`           
*`TimeBodyAcc-std()-Z`
*`TimeGravityAcc-mean()-X`
*`TimeGravityAcc-mean()-Y`
*`TimeGravityAcc-mean()-Z`
*`TimeGravityAcc-std()-X`
*`TimeGravityAcc-std()-Y`
*`TimeGravityAcc-std()-Z`
*`TimeBodyAccJerk-mean()-X`
*`TimeBodyAccJerk-mean()-Y`
*`TimeBodyAccJerk-mean()-Z`
*`TimeBodyAccJerk-std()-X`
*`TimeBodyAccJerk-std()-Y`
*`TimeBodyAccJerk-std()-Z`
*`TimeBodyGyro-mean()-X`
*`TimeBodyGyro-mean()-Y`
*`TimeBodyGyro-mean()-Z`
*`TimeBodyGyro-std()-X`
*`TimeBodyGyro-std()-Y`
*`TimeBodyGyro-std()-Z`
*`TimeBodyGyroJerk-mean()-X`
*`TimeBodyGyroJerk-mean()-Y`
*`TimeBodyGyroJerk-mean()-Z`
*`TimeBodyGyroJerk-std()-X`
*`TimeBodyGyroJerk-std()-Y`
*`TimeBodyGyroJerk-std()-Z`
*`TimeBodyAccMag-mean()`
*`TimeBodyAccMag-std()`
*`TimeGravityAccMag-mean()`
*`TimeGravityAccMag-std()`
*`TimeBodyAccJerkMag-mean()`
*`TimeBodyAccJerkMag-std()`
*`TimeBodyGyroMag-mean()`
*`TimeBodyGyroMag-std()`
*`TimeBodyGyroJerkMag-mean()`
*`TimeBodyGyroJerkMag-std()`
*`FreqBodyAcc-mean()-X`
*`FreqBodyAcc-mean()-Y`
*`FreqBodyAcc-mean()-Z`
*`FreqBodyAcc-std()-X`
*`FreqBodyAcc-std()-Y`
*`FreqBodyAcc-std()-Z`
*`FreqBodyAcc-meanFreq()-X`
*`FreqBodyAcc-meanFreq()-Y`
*`FreqBodyAcc-meanFreq()-Z`
*`FreqBodyAccJerk-mean()-X`
*`FreqBodyAccJerk-mean()-Y`
*`FreqBodyAccJerk-mean()-Z`
*`FreqBodyAccJerk-std()-X`
*`FreqBodyAccJerk-std()-Y`
*`FreqBodyAccJerk-std()-Z`
*`FreqBodyAccJerk-meanFreq()-X`
*`FreqBodyAccJerk-meanFreq()-Y`
*`FreqBodyAccJerk-meanFreq()-Z`
*`FreqBodyGyro-mean()-X`
*`FreqBodyGyro-mean()-Y`
*`FreqBodyGyro-mean()-Z`
*`FreqBodyGyro-std()-X`
*`FreqBodyGyro-std()-Y`
*`FreqBodyGyro-std()-Z`
*`FreqBodyGyro-meanFreq()-X`
*`FreqBodyGyro-meanFreq()-Y`
*`FreqBodyGyro-meanFreq()-Z`
*`FreqBodyAccMag-mean()`
*`FreqBodyAccMag-std()`
*`FreqBodyAccMag-meanFreq()`
*`FreqBodyAccJerkMag-mean()`
*`FreqBodyAccJerkMag-std()`
*`FreqBodyAccJerkMag-meanFreq()`
`FreqBodyGyroMag-mean()`
`FreqBodyGyroMag-std()`
`FreqBodyGyroMag-meanFreq()`
`FreqBodyGyroJerkMag-mean()`
`FreqBodyGyroJerkMag-std()`
`FreqBodyGyroJerkMag-meanFreq()`
