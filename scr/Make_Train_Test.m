%==========================================================================
%                          Make_Train_Test
%
% Construct training and test set
%==========================================================================
%% make training set
fb_train_x = [f1_train;f3_train;f5_train;f7_train;f9_train;f11_train;f13_train]; % Bad, features
fb_train_y = zeros(size(fb_train_x,1),1); % Bad, labels

fg_train_x = [f2_train;f4_train;f6_train;f8_train;f10_train;f12_train;f14_train]; % Good,features
fg_train_y = ones(size(fg_train_x,1),1); % Good,labels

fa_train_x = [fb_train_x;fg_train_x]; % Total, features
fa_train_y = [fb_train_y;fg_train_y]; % Total, labels 
fa_train_xy = [fa_train_y,fa_train_x]; % Total, labels & features

%% make test set
fb_test_x = [f1_test;f3_test;f5_test;f7_test;f9_test;f11_test;f13_test]; % Bad, features
fb_test_y = zeros(size(fb_test_x,1),1); % Bad, label

fg_test_x = [f2_test;f4_test;f6_test;f8_test;f10_test;f12_test;f14_test]; % Good, features
fg_test_y = ones(size(fg_test_x,1),1); % Good, label

fa_test_x = [fb_test_x;fg_test_x]; % Total, features
fa_test_y = [fb_test_y;fg_test_y]; % Total, labels 
fa_test_xy = [fa_test_y,fa_test_x]; % Total, labels & features