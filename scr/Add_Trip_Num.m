function [ f ] = Add_Trip_Num( f )
%==========================================================================
%                           Add_Trip_#
% add the trip number in the end of a feature vector
% inputs:
% f: feature vectors
%
% output:
% f: updated feature vectors with trip # in the end
%==========================================================================

% initialize
count = 0;
for n=1: size(f,1)
    if f(n,1)==1 % if microtrip number start from 1 again
        count= count+1; % add 1 to the number of trips
    end
    f(n,9) = count; % add trip number in the end
end
end

