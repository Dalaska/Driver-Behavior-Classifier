function [  ] = Plot_MicroTrip( Trip_list,p_list,time )
%==========================================================================
%                         Plot_MicroTrip
%
% Plot the start and end positio of microtrips
%==========================================================================

% plot the start of micro-trip
hgt = 60; % line height

for n=1:size(Trip_list,1)
    start_in = Trip_list(n,1);
    
    start_pos = p_list(start_in,3); %micor tirp start postion
    x = [time(start_pos)+0.5, time(start_pos)+0.5];
    %offset the position so they don't overlap
    y = [0, hgt];
    plot(x,y,'b','LineWidth',2)
    
    end_in = Trip_list(n,2);
    end_pos = p_list(end_in,4); % micotrip end position
    x = [time(end_pos)-1, time(end_pos)-1]; %time
    y = [0, hgt];
    plot(x,y,'m','LineWidth',2)
    
end
end

