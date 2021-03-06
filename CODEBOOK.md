# Result data set description

## Description
Measurements selected for data this data set  come  the accelerometer and gyroscope 3-axial raw signals tAcc.XYZ and tGyro.XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc.XYZ and tGravityAcc.XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk.XYZ and tBodyGyroJerk.XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc.XYZ, fBodyAccJerk.XYZ, fBodyGyro.XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'.XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

We've limited feature set with list below

 - tBodyAcc.XYZ
 - tGravityAcc.XYZ
 - tBodyAccJerk.XYZ
 - tBodyGyro.XYZ
 - tBodyGyroJerk.XYZ
 - fBodyAcc.XYZ
 - fBodyAccJerk.XYZ
 - fBodyGyro.XYZ
 
and  set of variables that were estimated from these signals are: 

avg : Mean value
std : Standard deviation

Additionally all measurements were averaged by subject and activity type (Two factors in result data set)
 
## Full list of variables

 - subject
 - activity
 - tBodyAcc.avg.X
 - tBodyAcc.avg.Y
 - tBodyAcc.avg.Z
 - tBodyAcc.std.X
 - tBodyAcc.std.Y
 - tBodyAcc.std.Z
 - tGravityAcc.avg.X
 - tGravityAcc.avg.Y
 - tGravityAcc.avg.Z
 - tGravityAcc.std.X
 - tGravityAcc.std.Y
 - tGravityAcc.std.Z
 - tBodyAccJerk.avg.X
 - tBodyAccJerk.avg.Y
 - tBodyAccJerk.avg.Z
 - tBodyAccJerk.std.X
 - tBodyAccJerk.std.Y
 - tBodyAccJerk.std.Z
 - tBodyGyro.avg.X
 - tBodyGyro.avg.Y
 - tBodyGyro.avg.Z
 - tBodyGyro.std.X
 - tBodyGyro.std.Y
 - tBodyGyro.std.Z
 - tBodyGyroJerk.avg.X
 - tBodyGyroJerk.avg.Y
 - tBodyGyroJerk.avg.Z
 - tBodyGyroJerk.std.X
 - tBodyGyroJerk.std.Y
 - tBodyGyroJerk.std.Z
 - fBodyAcc.avg.X
 - fBodyAcc.avg.Y
 - fBodyAcc.avg.Z
 - fBodyAcc.std.X
 - fBodyAcc.std.Y
 - fBodyAcc.std.Z
 - fBodyAccJerk.avg.X
 - fBodyAccJerk.avg.Y
 - fBodyAccJerk.avg.Z
 - fBodyAccJerk.std.X
 - fBodyAccJerk.std.Y
 - fBodyAccJerk.std.Z
 - fBodyGyro.avg.X
 - fBodyGyro.avg.Y
 - fBodyGyro.avg.Z
 - fBodyGyro.std.X
 - fBodyGyro.std.Y
 - fBodyGyro.std.Z
 
