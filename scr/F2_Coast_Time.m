function [ C_time_mean,Coast_list ] = F2_Coast_Time( p_list )
%==========================================================================
%                        F2_Coast
% definition: 
%               average coasting time before deceleration event
% inputs:
% p_list: list of primitives
%
% output:
% C_time_mean: average coasting time
% Coast_list: detialed list of coasting events
%--------------------------------------------------------------------------
%                           Tuning Parameters 
C_minv = -8; % minimal change of speed in a break event
C_max = 10; % maxium duration
%==========================================================================

Coast_list=[]; % initialize coasting events
C_time_mean = 0;

for n=2:size(p_list,1)
    d_v = p_list(n,8);    % change of speed
    
    if (p_list(n,2) == 4) && (p_list(n,8) < C_minv) 
        % event is decelerating
        % event is braking and change of speed is greater than threshold
        if (p_list(n-1,2)==3) %if the previous event is coasting
            
            % truncate max value
            p_list(n-1,5) = min(p_list(n-1,5),C_max);
            
            Coast_list=[Coast_list;[p_list(n-1,:),d_v]];
            % last colum is the change of speed of the brake event
        else
            % if the previous event is not coasting enter 0s
            Coast_list=[Coast_list;[0 0 0 0 0 0 0 0 0]];
        end
    end
end
try     
    % caculate average coasting time
    C_time_mean = mean(Coast_list(:,5));
end
end

