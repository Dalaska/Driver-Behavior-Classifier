function [ stream ] = Filter_Accel_mh87( stream )
%==========================================================================
%                   Smooth acceleration for trip 13 and 14
% trip 13 and 14  use acceleration derive from vehichel speed
% it requires different parameters
%==========================================================================

stream(:,3)= [0;diff(stream(:,2))]; % adjust the dimension of the signal
a_f = smooth(stream(:,1),stream(:,3),0.004,'moving');
stream(:,3)=a_f;

end

