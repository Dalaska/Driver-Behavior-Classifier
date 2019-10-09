%==========================================================================
%                      Test on training set  
%==========================================================================

[ cm0,p0,prob0 ] = Test_results( f0_train_xn,f0_train_y,theta_0 ); % 10-15 mph
[ cm1,p1,prob1 ] = Test_results( f1_train_xn,f1_train_y,theta_1 ); % 15-20 mph
[ cm2,p2,prob2 ] = Test_results( f2_train_xn,f2_train_y,theta_2 ); % 20-25 mph
[ cm3,p3,prob3 ] = Test_results( f3_train_xn,f3_train_y,theta_3 ); % 25-30 mph
[ cm4,p4,prob4 ] = Test_results( f4_train_xn,f4_train_y,theta_4 ); % 30-35 mph
[ cm5,p5,prob5 ] = Test_results( f5_train_xn,f5_train_y,theta_5 ); % 35-45 mph
[ cm6,p6,prob6 ] = Test_results( f6_train_xn,f6_train_y,theta_6 ); % 45-up mph

%'results of the test on training set'
P = [0 p0; 1 p1; 2 p2; 3 p3;4 p4;5 p5;6 p6];