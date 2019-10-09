function [ prm ] = Find_Prm( speed,throttle,acel)
%==========================================================================
%                               Find_Prm
% find primitives (driving events)
% output:
%                     prm (types of primitives)
% 0.idel 1.accelerate 2.sustain 3.coasting 4.braking
%-------------------------------------------------------------------------- 
%                           Tuning Parameters 
T_tsd = 10; % throttle threshold
a_tsd = 0.2; % acceleration threshold
b_tsd = -0.5; % braking threshold
%==========================================================================

% inicialization
prm = zeros(length(speed),1);

% rule based supervior
for n=1:length(speed)
    if  acel(n) > a_tsd % accelerating is greater than threshold
        prm(n) = 1; % accelerate
    end
    
    if  acel(n) < b_tsd % deccelerating is smaller than threshold
        prm(n) = 4; % decelerate
    end
    
    if (acel(n) > b_tsd ) && (acel(n) < a_tsd )
        % accelerating is in between the thresholds
        if  (throttle(n) > T_tsd) % throttle is greater than 10%
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

