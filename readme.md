# Driver Behavior Classifer
## Overview
This project examines estimating vehicle rolling resistance and aerodynamic drag  using model-based approach with a supervisory data extraction scheme. The estimator uses signals from the standard vehicle CAN bus and accelerometer sensor to determine vehicle rolling resistance and aerodynamic drag coefficient on-the-fly. A supervisor monitors vehicle motion and extracts data only during events with high signal to noise ratio.

## Usage
Start from one the four Matlab scripts:

1. Main1_Demo.m (starter code)	 
    * Visualize trips	 
    * Parse time-series data to symbolic data
    * Separate microtrips	 
    * Extract features

2. Main2_Parse.m
    * Parse raw data into feature vectors

3. Main3_Prepare.m
    * Divide the dataset obtained in 'Main2_Parse' into training set and test set

4. Main4_Train_Test
	* Train the classifier using the training set obtained in "Main3_Prepare"
	* Test the classifier on micro trips
	*  Test the classifier on an entire trip and show the driver score

*Illustration of a microtrip*

![microtrip](/img/microtrip.png)

*Symbolic representation of a driving cycle*

![symbolic](/img/symbolic.png)
