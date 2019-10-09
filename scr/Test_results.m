function [ cm,p,prob  ] = Test_results( x_test,y_test,theta )
%==========================================================================
%                       Caculate Test Resuls
% inputs
% x_test: feature vectors
% y_test: labels
% theta: model coefficients
%
% outputs
% cm: comfusion metrix
% p: accuracy
% prob: driver scores
%==========================================================================

% test 
[ prob ] = Test( x_test,theta ); 

% comfusion matrix
[ cm ] = Confusion_Matrix( prob,y_test );

% accuracy
p = (cm(1)+cm(4))/(cm(1)+cm(2)+cm(3)+cm(4));

end

