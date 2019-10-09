function [ stream ] = Filter_Accel( stream )
%==========================================================================
%                   Smooth acceleration 
% update the accelerating signal in 'stream'
%==========================================================================

% use moving average
a_f = smooth(stream(:,1),stream(:,3),0.0005,'moving'); 
stream(:,3)=a_f;


end

