# Code Book
### Retrieving Data
The data was retrieved from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#### `UCI HAR Dataset` Folder Components
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
### Data Source
The data for this project was sourced from the Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

The experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

For more information, see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Cleaning Data
After downloading the `UCI HAR Dataset` Folder and reading the files 'features.txt', 'activity_labels.txt', 'train/X_train.txt', 'train/y_train.txt', 'test/X_test.txt', and 'test/y_test.txt':
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

### Variables in Output
- subject: identifier of the subject performing the activity
- activity: activity label, where
  - 1 indicates WALKING
  - 2 indicates WALKING_UPSTAIRS
  - 3 indicates WALKING_DOWNSTAIRS
  - 4 indicates SITTING
  - 5 indicates STANDING
  - 6 indicates LAYING
  
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. These time domain signals were captured at a constant rate of 50 Hz. Then, they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm.

Finally a Fast Fourier Transform (FFT) was applied to some of these signals, producing the frequency domain measurements.

**Time Domain**

- Mean of time domain body acceleration along X, Y, and Z
  - timeDomainBodyAccelerometerMeanX
  - timeDomainBodyAccelerometerMeanY
  - timeDomainBodyAccelerometerMeanZ
- Standard Deviation of time domain body acceleration along X, Y, and Z: 
  - timeDomainBodyAccelerometerStandardDeviationX
  - timeDomainBodyAccelerometerStandardDeviationY
  - timeDomainBodyAccelerometerStandardDeviationZ 
- Mean of time domain gravity acceleration along X, Y, and Z: 
  - timeDomainGravityAccelerometerMeanX
  - timeDomainGravityAccelerometerMeanY
  - timeDomainGravityAccelerometerMeanZ
- Standard Deviation of time domain gravity acceleration along X, Y, and Z 
  - timeDomainGravityAccelerometerStandardDeviationX
  - timeDomainGravityAccelerometerStandardDeviationY
  - timeDomainGravityAccelerometerStandardDeviationZ 
- Mean of time domain body acceleration jerk signals along X, Y, and Z:
  - timeDomainBodyAccelerometerJerkMeanX
  - timeDomainBodyAccelerometerJerkMeanY
  - timeDomainBodyAccelerometerJerkMeanZ 
- Standard deviation of time domain body acceleration jerk signals along X, Y, and Z:
  - timeDomainBodyAccelerometerJerkStandardDeviationX 
  - timeDomainBodyAccelerometerJerkStandardDeviationY
  - timeDomainBodyAccelerometerJerkStandardDeviationZ 
- Mean of time domain body gyroscope along X, Y, and Z:
  - timeDomainBodyGyroscopeMeanX
  - timeDomainBodyGyroscopeMeanY
  - timeDomainBodyGyroscopeMeanZ 
- Standard Deviation of time domain body gyroscope along X, Y, and Z:
  - timeDomainBodyGyroscopeStandardDeviationX
  - timeDomainBodyGyroscopeStandardDeviationY
  - timeDomainBodyGyroscopeStandardDeviationZ 
- Mean of time domain body gyroscope jerk signals along X, Y, and Z:
  - timeDomainBodyGyroscopeJerkMeanX
  - timeDomainBodyGyroscopeJerkMeanY
  - timeDomainBodyGyroscopeJerkMeanZ
- Standard Deviation of time domain body gyroscope jerk signals along X, Y, and Z: 
  - timeDomainBodyGyroscopeJerkStandardDeviationX
  - timeDomainBodyGyroscopeJerkStandardDeviationY
  - timeDomainBodyGyroscopeJerkStandardDeviationZ
- Mean of the magnitude of time domain body acceleration
  - timeDomainBodyAccelerometerMagnitudeMean
- Standard Deviation of the magnitude of time domain body acceleration
  - timeDomainBodyAccelerometerMagnitudeStandardDeviation
- Mean of the magnitude of time domain gravity acceleration
  - timeDomainGravityAccelerometerMagnitudeMean 
- Standard Deviation of the magnitude of time domain body acceleration
  - timeDomainGravityAccelerometerMagnitudeStandardDeviation 
- Mean of the magnitude of time domain body acceleration jerk signals
  - timeDomainBodyAccelerometerJerkMagnitudeMean 
- Standard Deviation of the magnitude of time domain body acceleration jerk signals
  - timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation 
- Mean of the magnitude of time domain body gyroscope
  - timeDomainBodyGyroscopeMagnitudeMean 
- Standard Deviation of the magnitude of time domain body gyroscope 
  - timeDomainBodyGyroscopeMagnitudeStandardDeviation 
- Mean of the magnitude of time domain body gyroscope jerk signals
  - timeDomainBodyGyroscopeJerkMagnitudeMean 
- Standard deviation of the magnitude of time domain body gyroscope jerk signals
  - timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation 
  
**Frequency Domain**

- Mean of frequency domain body acceleration along X, Y, and Z:
  - frequencyDomainBodyAccelerometerMeanX 
  - frequencyDomainBodyAccelerometerMeanY 
  - frequencyDomainBodyAccelerometerMeanZ 
- Standard Deviation of frequency domain body acceleration along X, Y, and Z:
  - frequencyDomainBodyAccelerometerStandardDeviationX 
  - frequencyDomainBodyAccelerometerStandardDeviationY 
  - frequencyDomainBodyAccelerometerStandardDeviationZ 
- Mean of the frequency of frequency domain body acceleration along X, Y, and Z:
  - frequencyDomainBodyAccelerometerMeanFrequencyX 
  - frequencyDomainBodyAccelerometerMeanFrequencyY
  - frequencyDomainBodyAccelerometerMeanFrequencyZ
- Mean of frequency domain body acceleration jerk signals along X, Y, and Z:
  - frequencyDomainBodyAccelerometerJerkMeanX 
  - frequencyDomainBodyAccelerometerJerkMeanY 
  - frequencyDomainBodyAccelerometerJerkMeanZ 
- Standard Deviation of frequency domain body acceleration jerk signals along X, Y, and Z:
  - frequencyDomainBodyAccelerometerJerkStandardDeviationX 
  - frequencyDomainBodyAccelerometerJerkStandardDeviationY 
  - frequencyDomainBodyAccelerometerJerkStandardDeviationZ 
- Mean of the frequency of frequency domain body acceleration jerk signals along X, Y, and Z:
  - frequencyDomainBodyAccelerometerJerkMeanFrequencyX 
  - frequencyDomainBodyAccelerometerJerkMeanFrequencyY 
  - frequencyDomainBodyAccelerometerJerkMeanFrequencyZ 
- Mean of frequency domain body gyroscope along X, Y, and Z:
  - frequencyDomainBodyGyroscopeMeanX 
  - frequencyDomainBodyGyroscopeMeanY 
  - frequencyDomainBodyGyroscopeMeanZ 
- Standard Deviation of frequency domain body gyroscope along X, Y, and Z:
  - frequencyDomainBodyGyroscopeStandardDeviationX 
  - frequencyDomainBodyGyroscopeStandardDeviationY 
  - frequencyDomainBodyGyroscopeStandardDeviationZ 
- Mean of the frequency of frequency domain body gyroscope along X, Y, and Z:
  - frequencyDomainBodyGyroscopeMeanFrequencyX 
  - frequencyDomainBodyGyroscopeMeanFrequencyY 
  - frequencyDomainBodyGyroscopeMeanFrequencyZ 
- Mean of the magnitude of frequency domain body acceleration:
  - frequencyDomainBodyAccelerometerMagnitudeMean 
- Standard Deviation of the magnitude of frequency domain body acceleration:
  - frequencyDomainBodyAccelerometerMagnitudeStandardDeviation 
- Mean of the frequency of the magnitude of frequency domain body acceleration:
  - frequencyDomainBodyAccelerometerMagnitudeMeanFrequency 
- Mean of the magnitude of frequency domain body acceleration jerk signals:
  - frequencyDomainBodyAccelerometerJerkMagnitudeMean 
- Standard Deviation of the magnitude of frequency domain body acceleration jerk signals:
  - frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation
- Mean of the frequency of the magnitude of frequency domain body acceleration jerk signals:
  - frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency 
- Mean of the magnitude of frequency domain body gyroscope:
  - frequencyDomainBodyGyroscopeMagnitudeMean 
- Standard deviation of the magnitude of frequency domain body gyroscope:
  - frequencyDomainBodyGyroscopeMagnitudeStandardDeviation 
- Mean of the frequency of the magnitude of frequency domain body gyroscope:
  - frequencyDomainBodyGyroscopeMagnitudeMeanFrequency 
- Mean of the magnitude of frequency domain body gyroscope jerk signals:
  - frequencyDomainBodyGyroscopeJerkMagnitudeMean 
- Standard Deviation of the magnitude of frequency domain body gyroscope jerk signals:
  - frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation
- Mean of the frequency of the magnitude of frequency domain body gyroscope jerk signals:
  - frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency
