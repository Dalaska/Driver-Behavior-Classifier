function [ f_train,f_test ] = Seperate_TrainTest( f,train_id )
%==========================================================================
%                           Seperate_TrainTest
% seperate the dataset vector into training and test sets
%--------------------------------------------------------------------------
% inputs:
% f: total dataset
% train_id: index of training set
%
% output:
% f_train: traiing set
% f_test:  test set
%==========================================================================

% inicialize
f_test =[]; % test set
f_train =[]; % training set
for n=1:size(f,1)
    trip_id = f(n,9); % index of test set
    if ismember(trip_id,train_id) % index is in the list
        f_test = [f_test;f(n,:)]; % add to test set
    else
        f_train = [f_train;f(n,:)]; % add to training set
    end
end
end

