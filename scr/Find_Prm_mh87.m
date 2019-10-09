function [ prm ] = Find_Prm_mh87( speed,throttle,acel)
%==========================================================================
%                               Find_Prm_mh87
% find primitives (driving events) for trip 13 and 14
% output:
%                     prm (types of primitives)
% 0.idel 1.accelerate 2.sustain 3.coasting 4.braking
%-------------------------------------------------------------------------- 
%                           Tuning Parameters 
t_tsd = 10; % throttle threshold
a_tsd = 0.1; % acceleration threshold
d_tsd = -0.1; % deceleration threshold
%========================================================================== 

% inicialization
prm = zeros(length(speed),1);

% rule based supervior
for n=1:length(speed)
    if  acel(n) > a_tsd % accelerating is greater than threshold
        prm(n) = 1; % accelerate
    end
    
    if  acel(n) < d_tsd % deccelerating is smaller than threshold
        prm(n) = 4; % decelerate
    end
    
    if (acel(n) > d_tsd ) && (acel(n) < a_tsd ) 
        % accelerating is in between the thresholds
        if  (throttle(n) > t_tsd) % throttle is greater than 10%
            prm(n) = 2; % sustain
        else
            prm(n) = 3; % coasting
        end
    end
    
    if (throttle(n) <1) && (speed(n) < 1) 
        % speed and threttle are essencially 0
        prm(n) = 5; % idling
    end
    
end


end

