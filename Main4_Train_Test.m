%==========================================================================
%                       Driver behavior classification
%                                 Train & Test
%                                   Nov 4 2015
% functions :
% 1. train the classifier using the training set obtained in "Main3_Prepare"
% 2. test the classifer on microtrips
% 3. test the classifer on a entire trip and show the driver score
%==========================================================================

clc
clear all
close all

load('F_train_segment.mat') % load training set
load('F_test.mat') % load test set

lambda = 0.1; % regulization parameter

% train the model on different speed segments
[ theta_0 ] = Logis_Fit( f0_train_xn,f0_train_y,lambda ); % 10-15 mph
[ theta_1 ] = Logis_Fit( f1_train_xn,f1_train_y,lambda ); % 15-20 mph
[ theta_2 ] = Logis_Fit( f2_train_xn,f2_train_y,lambda ); % 20-25 mph
[ theta_3 ] = Logis_Fit( f3_train_xn,f3_train_y,lambda ); % 25-30 mph
[ theta_4 ] = Logis_Fit( f4_train_xn,f4_train_y,lambda ); % 30-35 mph
[ theta_5 ] = Logis_Fit( f5_train_xn,f5_train_y,lambda ); % 35-45 mph
[ theta_6 ] = Logis_Fit( f6_train_xn,f6_train_y,lambda ); % 45-up mph

%plot parameter
figure()
hold on
plot(theta_0,'-o','LineWidth',1)
plot(theta_1,'-o','LineWidth',1)
plot(theta_2,'-o','LineWidth',1)
plot(theta_3,'-o','LineWidth',1)
plot(theta_4,'-o','LineWidth',1)
plot(theta_5,'-o','LineWidth',1)
plot(theta_6,'-o','LineWidth',1)
legend('10-15','15-20','20-25','25-30','30-35','35-45','45 up')
xlabel('coefficient')
ylabel('value')

% test on training set
run('Test_on_Training_Set.m')

% test on test set
run('Test_on_Test_Set.m')
