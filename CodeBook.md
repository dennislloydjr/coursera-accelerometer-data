# Accelerometer Tidy Data Set
This data set was produced for the Coursera Getting and Cleaning Data course. It summarizes accelerometer data from Samsung smart phones that was captured while subjects (study participants) were performing various activities (e.g. standing, walking, etc). 

## Source Data
The data was acquired from the UCI Machine Learning Repository on Dec 1st, 2016.

A full description of the UCI experiment and data collection protocol, please see: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data was acquired from the following URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Sets
Two data sets are available from the run_analysis.R script. These are described in the sections below.

### Combined Data Set
The combined data set includes data from the original test and training data sets. It contains the following fields:

Each row indicates a single sliding time window, with the windows having a 50% overlap. Mean and standard deviations of the various measurements were provided in the source data over data in the time window.
 
Activity.Id - the unique identifier for the activity that the subject was performing when measurements were taken; the values are in the range 1 to 6
Activity.Name - the human readable name of the activity; the values are LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
Subject.Id - the unique identifier of the participant; there are 30 participants with Ids ranging from 1 to 30

The remaining columns are listed below and have the following characteristics:
Time - indicates that the measurement is from the time domain signals (from variables prefixed with 't' in the original data set)
FastFourierTransform - indicates that the measurement has been processed using a Fast Fourier Transform
Body - the signals were divided into components representing the effect of the body's movement and the effect of gravity. The term 'Body' in the variable name indicates the Body contribution of the measurement.
Gravity - the signals were divided into components representing the effect of the body's movement and the effect of gravity. The term 'Gravity' in the variable name indicates the Gravity contribution of the measurement.
Accelerometer - indicates that the measurement came from the accelerometer in the phone device
Gyroscope - indicates that the measurement came from the gyrsoscope in the phone device
Jerk - indicates that the measurement was from a jerk signal
Magnitude - indicates that the measurement was of the magnitude of movement
X, Y, and Z - indicate the spatial direction of the movement as recorded by the sensor
Mean, StdDev - indicate whether a mean or standard deviation was applied across the time window to the measurements

Time.Body.Accelerometer.X.Mean                                    
Time.Body.Accelerometer.Y.Mean                                    
Time.Body.Accelerometer.Z.Mean                                    
Time.Body.Accelerometer.X.StdDev                                  
Time.Body.Accelerometer.Y.StdDev                                  
Time.Body.Accelerometer.Z.StdDev                                  
Time.Gravity.Accelerometer.X.Mean                                 
Time.Gravity.Accelerometer.Y.Mean                                 
Time.Gravity.Accelerometer.Z.Mean                                 
Time.Gravity.Accelerometer.X.StdDev                               
Time.Gravity.Accelerometer.Y.StdDev                               
Time.Gravity.Accelerometer.Z.StdDev                               
Time.Body.Accelerometer.Jerk.X.Mean                               
Time.Body.Accelerometer.Jerk.Y.Mean                               
Time.Body.Accelerometer.Jerk.Z.Mean                               
Time.Body.Accelerometer.Jerk.X.StdDev                             
Time.Body.Accelerometer.Jerk.Y.StdDev                             
Time.Body.Accelerometer.Jerk.Z.StdDev                             
Time.Body.Gyroscope.X.Mean                                        
Time.Body.Gyroscope.Y.Mean                                        
Time.Body.Gyroscope.Z.Mean                                        
Time.Body.Gyroscope.X.StdDev                                      
Time.Body.Gyroscope.Y.StdDev                                      
Time.Body.Gyroscope.Z.StdDev                                      
Time.Body.Gyroscope.Jerk.X.Mean                                   
Time.Body.Gyroscope.Jerk.Y.Mean                                   
Time.Body.Gyroscope.Jerk.Z.Mean                                   
Time.Body.Gyroscope.Jerk.X.StdDev                                 
Time.Body.Gyroscope.Jerk.Y.StdDev                                 
Time.Body.Gyroscope.Jerk.Z.StdDev                                 
Time.Body.Accelerometer.Magnitude.Mean                            
Time.Body.Accelerometer.Magnitude.StdDev                          
Time.Gravity.Accelerometer.Magnitude.Mean                         
Time.Gravity.Accelerometer.Magnitude.StdDev                       
Time.Body.Accelerometer.Jerk.Magnitude.Mean                       
Time.Body.Accelerometer.Jerk.Magnitude.StdDev                     
Time.Body.Gyroscope.Magnitude.Mean                                
Time.Body.Gyroscope.Magnitude.StdDev                              
Time.Body.Gyroscope.Jerk.Magnitude.Mean                           
Time.Body.Gyroscope.Jerk.Magnitude.StdDev                         
FastFourierTransform.Body.Accelerometer.X.Mean                    
FastFourierTransform.Body.Accelerometer.Y.Mean                    
FastFourierTransform.Body.Accelerometer.Z.Mean                    
FastFourierTransform.Body.Accelerometer.X.StdDev                  
FastFourierTransform.Body.Accelerometer.Y.StdDev                  
FastFourierTransform.Body.Accelerometer.Z.StdDev                  
FastFourierTransform.Body.Accelerometer.Jerk.X.Mean               
FastFourierTransform.Body.Accelerometer.Jerk.Y.Mean               
FastFourierTransform.Body.Accelerometer.Jerk.Z.Mean               
FastFourierTransform.Body.Accelerometer.Jerk.X.StdDev             
FastFourierTransform.Body.Accelerometer.Jerk.Y.StdDev             
FastFourierTransform.Body.Accelerometer.Jerk.Z.StdDev             
FastFourierTransform.Body.Gyroscope.X.Mean                        
FastFourierTransform.Body.Gyroscope.Y.Mean                        
FastFourierTransform.Body.Gyroscope.Z.Mean                        
FastFourierTransform.Body.Gyroscope.X.StdDev                      
FastFourierTransform.Body.Gyroscope.Y.StdDev                      
FastFourierTransform.Body.Gyroscope.Z.StdDev                      
FastFourierTransform.Body.Accelerometer.Magnitude.Mean            
FastFourierTransform.Body.Accelerometer.Magnitude.StdDev          
FastFourierTransform.Body.Body.Accelerometer.Jerk.Magnitude.Mean  
FastFourierTransform.Body.Body.Accelerometer.Jerk.Magnitude.StdDev
FastFourierTransform.Body.Body.Gyroscope.Magnitude.Mean           
FastFourierTransform.Body.Body.Gyroscope.Magnitude.StdDev         
FastFourierTransform.Body.Body.Gyroscope.Jerk.Magnitude.Mean      
FastFourierTransform.Body.Body.Gyroscope.Jerk.Magnitude.StdDev

### Summarized Data
The summarized data produced contains the same variables as above. However, the data has been processed to contain the mean of the measurement columns above grouped by the activity and subject.
