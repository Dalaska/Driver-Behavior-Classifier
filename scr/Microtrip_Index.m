function [ Trip_Index ] = Microtrip_Index( p_list )
%==========================================================================
%                        Microtrip_Index
% input:
% p_list: list of primitives
% output
% Trip_Index: list of start and step index of microtrips
%--------------------------------------------------------------------------
%                     Trip_Index (n,2)
% 1 microtrip start index, 2 microtrip end index
%--------------------------------------------------------------------------
%                           Tuning Parameters 
v_min = 10; % speed lower bound
%==========================================================================


% incialization  
Trip_Index = [];  % microtrip list
trip_start = 0;   % state of the finite state machine
start_index = 0;  % micotrip starting point
stop_index = 0;    % micotrip end point

% scan through the primitive list
for m=1:length(p_list)
    % finite state machine
    switch trip_start
        case 0 % microtrip not started
            if p_list(m,2)==1  
             % if encout an accelerating event, start    
                trip_start = 1; % microtrip start
                start_index = p_list(m,1); % update micotrip starting point
            end
        case 1 %  microtrip started
            if (p_list(m,2)==5)
                % stop when idle 
                trip_start = 0;
                stop_index = p_list(m-1,1);
                % write 
                Trip_Index = [Trip_Index;[start_index,stop_index]];
            else if ((p_list(m,2)==1)&&(p_list(m,6)<v_min))
                    % stop when acceleration start beflow 10 and start again
                    trip_start = 0; % microtrip stop
                    stop_index = p_list(m-1,1); % update micotrip stop point
                    % write
                    Trip_Index = [Trip_Index;[start_index,stop_index]];
                    % start again
                    trip_start = 1; % microtrip start again
                    start_index = p_list(m,1); % update micotrip starting point
                end
            end
    end
end

end

