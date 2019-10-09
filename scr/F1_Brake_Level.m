function [ b_mean,brake_list ] = F1_Brake_Level( p_list )
%==========================================================================
%                        F1_Brake_Level 
% definition: 
%         average deceleration rate in brake events
% 
% inputs:
% p_list: list of primitives
%
% output:
% b_mean: average acceleration of brake
% brake_list: detialed list of brake events
%--------------------------------------------------------------------------
%                           Tuning Parameters 
T_dv = -5; %thredhold for minal change of speed, significant change
T_max = - 4.5; % thredhold for truncate maxium decleration
%==========================================================================

% inicialize
brake_list = []; % record all break event 
b_mean = 0; % caculate the mean

for n=1:size(p_list,1)
    if (p_list(n,2) == 4) && (p_list(n,8) < T_dv) 
        % (event is decelerating) and (change of speed is greater than the thredhod)
        
        % approximation of decelerating: change_of_speed/event_duration
        decel = p_list(n,8)/p_list(n,5);
        
        % truncate max value
        decel = max(decel,T_max);
        
        % record brake event
        brake_list = [brake_list; [p_list(n,:), decel]];
    end
end

% caculate the mean brake
try
    b_mean = -mean(brake_list(:,9));
end

end

