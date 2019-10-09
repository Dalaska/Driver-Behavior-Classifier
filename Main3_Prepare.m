%==========================================================================
%                       Driver behavior classification 
%                                  Prepare Data
%                                   Nov 4 2015
% functions :
% 1. divide the dataset obtained in 'Main2_Parse' into
% training set and test set
%==========================================================================

clc
clear
close all

% load features vectors extract from 'Main2_Parse'
run('Load_Features.m')

% visulize the features vs average speed
run('EDA.m') % Exploratory Data Analysis

% make some modifications to the feature vector
run('Add_Trip_Numbers.m') % add the trip number in the end

% select trining test
run('Select_Train_Test');

% construct training and test sed 
run('Make_Train_Test');

% sort the feature by speed
run('Sort_by_Speed');

% save the training set into file
save('F_train_segment','f0_train_xn','f0_train_y','Nm0',...
    'f1_train_xn', 'f1_train_y','Nm1',...
    'f2_train_xn','f2_train_y','Nm2',...
    'f3_train_xn','f3_train_y','Nm3',...
    'f4_train_xn','f4_train_y','Nm4',...
    'f5_train_xn','f5_train_y','Nm5',...
    'f6_train_xn','f6_train_y','Nm6');

% save the test set into file
fa_test_xy = [fa_test_y,fa_test_x];
save('F_test','fa_test_x','fa_test_y')
