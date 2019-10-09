%==========================================================================
%                        Select_Train_Test
%
% Select trips for training and test set
%==========================================================================
%% Select training set
% EC_8700 
%f1: 3/19  #test_set/#total_set
%f2: 3/19  #test_set/#total_set
test_1 = [3,9,16]; % index of test set
test_2 = [3,9,16]; 

% SW_8700
%f3: 2/10
%f4: 2/8
test_3 = [2,5]; 
test_4 = [2,5]; 

% MH_13000
%f5: 2/4
%f6: 2/4
test_5 = [1,3]; 
test_6 = [1,3]; 

% SW_13000 
%f7: 1/1 
%f8: 1/1
test_7 = [1]; 
test_8 = [1]; 

% SB_15000 
%f9: 3/6 
%f10: 3/8
test_9 =  [1,3,6 ]; 
test_10 = [1,3,6 ]; 

% HC_15000 
%f11: 3/10
%f12: 3/11
test_11 = [ 2,5,9 ]; 
test_12 = [ 2,5,9 ]; 

% HM_8700 
%f13: 3/4 
%f14: 3/4
test_13 =[1,4];
test_14 =[1,4];

%% Divide in training and test set
[ f1_train,f1_test ] = Seperate_TrainTest( f1,test_1 );
[ f2_train,f2_test ] = Seperate_TrainTest( f2,test_2 );
[ f3_train,f3_test ] = Seperate_TrainTest( f3,test_3 );
[ f4_train,f4_test ] = Seperate_TrainTest( f4,test_4 );
[ f5_train,f5_test ] = Seperate_TrainTest( f5,test_5 );
[ f6_train,f6_test ] = Seperate_TrainTest( f6,test_6 );
[ f7_train,f7_test ] = Seperate_TrainTest( f7,test_7 );
[ f8_train,f8_test ] = Seperate_TrainTest( f8,test_8 );
[ f9_train,f9_test ] = Seperate_TrainTest( f9,test_9 );
[ f10_train,f10_test ] = Seperate_TrainTest( f10,test_10 );
[ f11_train,f11_test ] = Seperate_TrainTest( f11,test_11 );
[ f12_train,f12_test ] = Seperate_TrainTest( f12,test_12 );
[ f13_train,f13_test ] = Seperate_TrainTest( f13,test_13 );
[ f14_train,f14_test ] = Seperate_TrainTest( f14,test_14 );