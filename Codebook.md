# Codebook for Getting and Cleaning Data Course Project

# Data Source
For more information about data collection methodology and transformation performed prior to this analysis, consult the README files provided by the original investigators.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Acccessed January 27, 2016


# Data Structure
The data set is a .csv file containing 180 observations of 68 variables.

The first 2 variables are for classification purposes. The remaining 66 variables are the body of the data set. All 66 variables are mean values calculated from the raw data provided.

There were 30 study participants with unique identifers ranging from 1 to 30 as listed in column 2 - subject_id. For each participant, measurements were taken under 6 different conditions provided by column 1 - activity_id.

30 participants x 6 conditions = 180 observations in the data file


# Data Transforms
Please read the comments embedded within the R script called run_analysis.R to understand the sequence and purpose of each step in the transformation.


# Variables Provided
The 66 variables provided are listed below. All of these are averages for the specific participants (subject_id) under the specific consitions (activity_id).

##Key to variables names:

_x, _y, _z : Signals in the X, Y and Z directions

ave_ : Indicates the data is an average across all samples

mean_ : Indicates that the raw data was a mean

std_ : Indicates that the raw data was a standard deviation

time_ : Indicates that the raw data was a time domain signal

fourier_ : Indicate that the data is a result of a previous Fast Fourier Transform (FFT)

body_accel_ : Body accelerometer data

body_gyro_ : Body gyroscope data

gravity_accel_ : Acceleration due to gravity

jerk_ : Jerk signal derived from the body linear acceleration and angular velocity 

magnitude_ : Magnitude of the Jerk signals calculated using the Euclidean norm


activity_id:

1 WALKING

2 WALKING_UPSTAIRS

3 WALKING_DOWNSTAIRS

4 SITTING

5 STANDING

6 LAYING

---
##Variable list (in order that they appear in the data file)

activity_id 

subject_id

ave_time_body_accel_mean_x

ave_time_body_accel_mean_y

ave_time_body_accel_mean_z

ave_time_body_accel_std_x

ave_time_body_accel_std_y

ave_time_body_accel_std_z

ave_time_gravity_accel_mean_x

ave_time_gravity_accel_mean_y

ave_time_gravity_accel_mean_z

ave_time_gravity_accel_std_x

ave_time_gravity_accel_std_y

ave_time_gravity_accel_std_z

ave_time_body_accel_jerk_mean_x

ave_time_body_accel_jerk_mean_y

ave_time_body_accel_jerk_mean_z

ave_time_body_accel_jerk_std_x

ave_time_body_accel_jerk_std_y

ave_time_body_accel_jerk_std_z

ave_time_body_gyro_mean_x

ave_time_body_gyro_mean_y

ave_time_body_gyro_mean_z

ave_time_body_gyro_std_x

ave_time_body_gyro_std_y

ave_time_body_gyro_std_z

ave_time_body_gyro_jerk_mean_x

ave_time_body_gyro_jerk_mean_y

ave_time_body_gyro_jerk_mean_z

ave_time_body_gyro_jerk_std_x

ave_time_body_gyro_jerk_std_y

ave_time_body_gyro_jerk_std_z

ave_time_body_accel_mag_mean

ave_time_body_accel_mag_std

ave_time_gravity_accel_mag_mean

ave_time_gravity_accel_mag_std

ave_time_body_accel_jerk_magnitude_mean

ave_time_body_accel_jerk_magnitude_std

ave_time_body_gyro_magnitude_mean

ave_time_body_gyro_magnitude_std

ave_time_body_gyro_jerk_magnitude_mean

ave_time_body_gyro_jerk_magnitude_std

ave_fourier_body_accel_mean_x

ave_fourier_body_accel_mean_y

ave_fourier_body_accel_mean_z

ave_fourier_body_accel_std_x

ave_fourier_body_accel_std_y

ave_fourier_body_accel_std_z

ave_fourier_body_accel_jerk_mean_x

ave_fourier_body_accel_jerk_mean_y

ave_fourier_body_accel_jerk_mean_z

ave_fourier_body_accel_jerk_std_x

ave_fourier_body_accel_jerk_std_y

ave_fourier_body_accel_jerk_std_z

ave_fourier_body_gyro_mean_x

ave_fourier_body_gyro_mean_y

ave_fourier_body_gyro_mean_z

ave_fourier_body_gyro_std_x

ave_fourier_body_gyro_std_y

ave_fourier_body_gyro_std_z

ave_fourier_body_accel_mag_mean

ave_fourier_body_accel_mag_std

ave_fourier_body_body_accel_jerk_magnitude_mean

ave_fourier_body_body_accel_jerk_magnitude_std

ave_fourier_body_body_gyro_magnitude_mean

ave_fourier_body_body_gyro_magnitude_std

ave_fourier_body_body_gyro_jerk_magnitude_mean

ave_fourier_body_body_gyro_jerk_magnitude_std

