%==========================================================================
%                       Driver behavior classification
%                                      Demo
%                                   Nov 4 2015
%                                  
% functions :
% 1. visualize trip data
% 2. parse time-series data to symbolic data
% 3. seperate microtrip
% 4. extract features
%==========================================================================
clc
clear all
close all

%% Load data
run('Select_Data.m');

% inicilize
Ftr=[]; % inicialize feature vector
Brake_big_list = []; % list of braking events
Coast_big_list = []; % list of coasting
UA_big_list =[];     % list of unnecessary accelerating
Energy_big_list = []; % list of energy index

%% smooth accelerationg (moving average)
if (data_set==13)||(data_set==14)
    % for trip 13 and 14
    [ stream ] = Filter_Accel_mh87( stream );
    % trip 13 and 14  use acceleration derive from vehichel speed
    % it requires different parameter
else
    % for other trips
    [ stream ] = Filter_Accel( stream );
end

% signals
time = stream(:,1);
speed = stream(:,2);
acel = stream(:,3);
brake = stream(:,10);
throttle = stream(:,9);

%% Pase in sybmolic data
% 0.idel 1.accelerate 2.sustain 3.coasting 4.braking

% find primitives
if (data_set==13)||(data_set==14)
    [ prm ] = Find_Prm_mh87( speed,throttle,acel); % rule based supervior
else
    [ prm ] = Find_Prm( speed,throttle,acel); % rule based supervior
end
%--------------------------------------------------------------------------
%                     prm (types of primitives)
% 0.idel 1.accelerate 2.sustain 3.coasting 4.braking
%--------------------------------------------------------------------------

% consolidate list
[ p_list ] = Prm2List( prm,time,speed ); % prm 2 list

%--------------------------------------------------------------------------
%                     p_list (n,8)
% 1 c#, 2 type, 3 start index, 4 end index, 5 duration,
% 6 start speed, 7 end speed, 8 change of speed
%--------------------------------------------------------------------------

% plot primatives
run('Plot_Prm')

% find microtrip index
[ Trip_Index ] = Microtrip_Index( p_list );
%--------------------------------------------------------------------------
%                     Trip_Index (n,2)
% 1 microtrip start index, 2 microtrip end index
%--------------------------------------------------------------------------

% filter microtrips
[ Trip_list ] = Filter_Trips( Trip_Index,p_list );
%--------------------------------------------------------------------------
%                     Trip_list (n,5)
% 1 star event, 2 end event, 3 trip time,  4 trip distance, 5 averge speed
%--------------------------------------------------------------------------

% plot the start of micro-trip
Plot_MicroTrip( Trip_list,p_list,time );

% % extract features
run('Extract_Features.m');

% display feature
'feature list'
Ftr
%--------------------------------------------------------------------------
%                     Ftr (n,8)
% 1 # microtrips,  2 trip duration, 3 trip distance 4 brake level, 
% 5 coasting time, 6 uncessary acceleration, 7 energy index
%--------------------------------------------------------------------------