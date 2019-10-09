function [ Trip_list ] = Filter_Trips( Trip_Index,p_list )
%==========================================================================
%                        Filter_Trips
% 1. discard trips which are too short or average speed too slow
% 2. caculate trip distance, trip time and average speed
%
% input:
% p_list: list of primitives
% Trip_Index: list of start and step index of microtrips
%
% output:
% Trip_list: list of filter microtrips with trip distance, time and speed
%--------------------------------------------------------------------------
%                           Tuning Parameters
T_dist_min = 100; % minimal trip distance
T_min_v = 10; % minimal average speed
max_idle = 10; % idle penality max
%==========================================================================

% scan throuh trip index
for k=1:size(Trip_Index,1)
    
    % start and stop of a mirco_trip
    start_index = Trip_Index(k,1); % start index
    end_index = Trip_Index(k,2); % stop
    
    % incialize trip time
    trip_time = 0;
    
    % incialize trip distance
    trip_dist = 0;
    
    % caculate trip time and trip distance
    for m=start_index:end_index
        % tirp time
        trip_time = trip_time + p_list(m,5);
        
        % trip distance
        dist = 0.44704*p_list(m,5)*(p_list(m,6)+p_list(m,7))/2; 
        % approximate trip distance:
        % (start_speed + end_speed)*trip_duration/2
        % convert distance from mile to meter
        
        trip_dist = trip_dist + dist; 
    end
    
    % if the next event is idle, add some time to trip duration
    if p_list(end_index+1,2)==5
        %'idle'
        trip_time = trip_time + max(p_list(end_index+1,5),max_idle);
        % if idle time too long, truncate to a threshold
    end
    
    Trip_Index(k,3) = trip_time; % trip time (second)
    Trip_Index(k,4) = trip_dist; % trip distance (meter)
    
    % averge speed
    v_mean = 2.23694* trip_dist/trip_time; % in mph
    Trip_Index(k,5) = v_mean; % averge speed
    
    % filter list
    Trip_list =[];
    for n=1:size(Trip_Index,1)
        if (Trip_Index(n,4)>T_dist_min) && (Trip_Index(n,5)>T_min_v) 
            % ( trip distance greater than minial) and (average speed greater than minial) 
            Trip_list =[Trip_list;Trip_Index(n,:)];
        end
    end
end

