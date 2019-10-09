function [ X_n,N ] = Normal_Percentile( X,upper_bound,lower_bound )
%==========================================================================
%               Normal Features by Percentile 
% normalize the feature by percentile
%--------------------------------------------------------------------------
% inputs:
% X: features
% upper_bound: maxium value for normalization in percentile (%)
% lower_bound: minimal value for normalization in percentile (%)
%
% output:
% X_n: normalize features
% N: max and min value for normalization
%==========================================================================

N = prctile(X,[lower_bound  upper_bound]); % find the max and min value
N_min = N(1); % maxium value
N_max = N(2); % minimal value
[ X_n ] = Normalize_Feature( X,N_min,N_max ); % normalize features
 
end

