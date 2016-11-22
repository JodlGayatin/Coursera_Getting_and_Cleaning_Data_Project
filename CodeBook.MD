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
 `TimeBodyAcc-mean()-X`      
 `TimeBodyAcc-mean()-Y`          
 [5] "TimeBodyAcc-mean()-Z"          
 [6] "TimeBodyAcc-std()-X"           
 [7] "TimeBodyAcc-std()-Y"           
 [8] "TimeBodyAcc-std()-Z"           
 [9] "TimeGravityAcc-mean()-X"       
[10] "TimeGravityAcc-mean()-Y"       
[11] "TimeGravityAcc-mean()-Z"       
[12] "TimeGravityAcc-std()-X"        
[13] "TimeGravityAcc-std()-Y"        
[14] "TimeGravityAcc-std()-Z"        
[15] "TimeBodyAccJerk-mean()-X"      
[16] "TimeBodyAccJerk-mean()-Y"      
[17] "TimeBodyAccJerk-mean()-Z"      
[18] "TimeBodyAccJerk-std()-X"       
[19] "TimeBodyAccJerk-std()-Y"       
[20] "TimeBodyAccJerk-std()-Z"       
[21] "TimeBodyGyro-mean()-X"         
[22] "TimeBodyGyro-mean()-Y"         
[23] "TimeBodyGyro-mean()-Z"         
[24] "TimeBodyGyro-std()-X"          
[25] "TimeBodyGyro-std()-Y"          
[26] "TimeBodyGyro-std()-Z"          
[27] "TimeBodyGyroJerk-mean()-X"     
[28] "TimeBodyGyroJerk-mean()-Y"     
[29] "TimeBodyGyroJerk-mean()-Z"     
[30] "TimeBodyGyroJerk-std()-X"      
[31] "TimeBodyGyroJerk-std()-Y"      
[32] "TimeBodyGyroJerk-std()-Z"      
[33] "TimeBodyAccMag-mean()"         
[34] "TimeBodyAccMag-std()"          
[35] "TimeGravityAccMag-mean()"      
[36] "TimeGravityAccMag-std()"       
[37] "TimeBodyAccJerkMag-mean()"     
[38] "TimeBodyAccJerkMag-std()"      
[39] "TimeBodyGyroMag-mean()"        
[40] "TimeBodyGyroMag-std()"         
[41] "TimeBodyGyroJerkMag-mean()"    
[42] "TimeBodyGyroJerkMag-std()"     
[43] "FreqBodyAcc-mean()-X"          
[44] "FreqBodyAcc-mean()-Y"          
[45] "FreqBodyAcc-mean()-Z"          
[46] "FreqBodyAcc-std()-X"           
[47] "FreqBodyAcc-std()-Y"           
[48] "FreqBodyAcc-std()-Z"           
[49] "FreqBodyAcc-meanFreq()-X"      
[50] "FreqBodyAcc-meanFreq()-Y"      
[51] "FreqBodyAcc-meanFreq()-Z"      
[52] "FreqBodyAccJerk-mean()-X"      
[53] "FreqBodyAccJerk-mean()-Y"      
[54] "FreqBodyAccJerk-mean()-Z"      
[55] "FreqBodyAccJerk-std()-X"       
[56] "FreqBodyAccJerk-std()-Y"       
[57] "FreqBodyAccJerk-std()-Z"       
[58] "FreqBodyAccJerk-meanFreq()-X"  
[59] "FreqBodyAccJerk-meanFreq()-Y"  
[60] "FreqBodyAccJerk-meanFreq()-Z"  
[61] "FreqBodyGyro-mean()-X"         
[62] "FreqBodyGyro-mean()-Y"         
[63] "FreqBodyGyro-mean()-Z"         
[64] "FreqBodyGyro-std()-X"          
[65] "FreqBodyGyro-std()-Y"          
[66] "FreqBodyGyro-std()-Z"          
[67] "FreqBodyGyro-meanFreq()-X"     
[68] "FreqBodyGyro-meanFreq()-Y"     
[69] "FreqBodyGyro-meanFreq()-Z"     
[70] "FreqBodyAccMag-mean()"         
[71] "FreqBodyAccMag-std()"          
[72] "FreqBodyAccMag-meanFreq()"     
[73] "FreqBodyAccJerkMag-mean()"     
[74] "FreqBodyAccJerkMag-std()"      
[75] "FreqBodyAccJerkMag-meanFreq()" 
[76] "FreqBodyGyroMag-mean()"        
[77] "FreqBodyGyroMag-std()"         
[78] "FreqBodyGyroMag-meanFreq()"    
[79] "FreqBodyGyroJerkMag-mean()"    
[80] "FreqBodyGyroJerkMag-std()"     
[81] "FreqBodyGyroJerkMag-meanFreq()"
