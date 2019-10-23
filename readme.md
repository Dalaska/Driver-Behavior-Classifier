# Driver Behavior Classifer
## Overview

The driver behavior can substantially affect the real-world fuel economy of a vehicle. Evaluating the driver behavior in real-time can provide feedbacks to the drivers to enhance their awareness on eco-driving, and further, enable the powertrain control schemes to adapt automatically to the current driving style. 

In this project aims to use a microtrip-based driver scoring algorithm to reduce the influence of various driving cycles. The algorithm uses the signals from the CAN bus. To further improves the computational and memory efficiency, the algorithm converts the time-series driving data into events represented by symbolic data. 


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
