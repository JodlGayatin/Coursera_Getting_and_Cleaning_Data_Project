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

1.`TimeBodyAcc-mean()-X`

2.`TimeBodyAcc-mean()-Y`

3.`TimeBodyAcc-mean()-Z`

4.`TimeBodyAcc-std()-X`

5.`TimeBodyAcc-std()-Y`

6.`TimeBodyAcc-std()-Z`

7.`TimeGravityAcc-mean()-X`

8.`TimeGravityAcc-mean()-Y`

9.`TimeGravityAcc-mean()-Z`

10.`TimeGravityAcc-std()-X`

11.`TimeGravityAcc-std()-Y`

12.`TimeGravityAcc-std()-Z`

13.`TimeBodyAccJerk-mean()-X`

14.`TimeBodyAccJerk-mean()-Y`

15.`TimeBodyAccJerk-mean()-Z`

16.`TimeBodyAccJerk-std()-X`

17.`TimeBodyAccJerk-std()-Y`

18.`TimeBodyAccJerk-std()-Z`
19.`TimeBodyGyro-mean()-X`
20.`TimeBodyGyro-mean()-Y`
21.`TimeBodyGyro-mean()-Z`
22.`TimeBodyGyro-std()-X`
23.`TimeBodyGyro-std()-Y`
24.`TimeBodyGyro-std()-Z`
25.`TimeBodyGyroJerk-mean()-X`
26.`TimeBodyGyroJerk-mean()-Y`
27.`TimeBodyGyroJerk-mean()-Z`
28.`TimeBodyGyroJerk-std()-X`
29.`TimeBodyGyroJerk-std()-Y`
30.`TimeBodyGyroJerk-std()-Z`
31.`TimeBodyAccMag-mean()`
32.`TimeBodyAccMag-std()`
33.`TimeGravityAccMag-mean()`
34.`TimeGravityAccMag-std()`
35.`TimeBodyAccJerkMag-mean()`
36.`TimeBodyAccJerkMag-std()`
37.`TimeBodyGyroMag-mean()`
38.`TimeBodyGyroMag-std()`
39.`TimeBodyGyroJerkMag-mean()`
40.`TimeBodyGyroJerkMag-std()`
41.`FreqBodyAcc-mean()-X`
42.`FreqBodyAcc-mean()-Y`
43.`FreqBodyAcc-mean()-Z`
44.`FreqBodyAcc-std()-X`
45.`FreqBodyAcc-std()-Y`
46.`FreqBodyAcc-std()-Z`
47.`FreqBodyAcc-meanFreq()-X`
48.`FreqBodyAcc-meanFreq()-Y`
49.`FreqBodyAcc-meanFreq()-Z`
50.`FreqBodyAccJerk-mean()-X`
51.`FreqBodyAccJerk-mean()-Y`
52.`FreqBodyAccJerk-mean()-Z`
53.`FreqBodyAccJerk-std()-X`
54.`FreqBodyAccJerk-std()-Y`
55.`FreqBodyAccJerk-std()-Z`
56.`FreqBodyAccJerk-meanFreq()-X`
57.`FreqBodyAccJerk-meanFreq()-Y`
58.`FreqBodyAccJerk-meanFreq()-Z`
59.`FreqBodyGyro-mean()-X`
60.`FreqBodyGyro-mean()-Y`
61.`FreqBodyGyro-mean()-Z`
62.`FreqBodyGyro-std()-X`
63.`FreqBodyGyro-std()-Y`
64.`FreqBodyGyro-std()-Z`
65.`FreqBodyGyro-meanFreq()-X`
66.`FreqBodyGyro-meanFreq()-Y`
67.`FreqBodyGyro-meanFreq()-Z`
68.`FreqBodyAccMag-mean()`
69.`FreqBodyAccMag-std()`
70.`FreqBodyAccMag-meanFreq()`
71.`FreqBodyAccJerkMag-mean()`
72.`FreqBodyAccJerkMag-std()`
73.`FreqBodyAccJerkMag-meanFreq()`
74.`FreqBodyGyroMag-mean()`
75.`FreqBodyGyroMag-std()`
76.`FreqBodyGyroMag-meanFreq()`
77.`FreqBodyGyroJerkMag-mean()`
78.`FreqBodyGyroJerkMag-std()`
79.`FreqBodyGyroJerkMag-meanFreq()`

