%==========================================================================
%                       Driver behavior classification 
%                                  Parse
%                               Nov 4 2015
% function :
% parse raw data into feature vectors
%==========================================================================

clc
clear all
close all

for  trip = 1:14;
    % 1:EC_8700_B_
    % 2:EC_8700_G_
    % 3:SW_8700_B_
    % 4:SW_8700_G_
    % 5:MH_13000_B_
    % 6:MH_13000_G_
    % 7:SW_13000_B_
    % 8:SW_13000_G_
    % 9:SB_15000_B_
    % 10:SB_15000_G_
    % 11:HC_15000_B_
    % 12:HC_15000_G_
    % 13:HM_8700_B_ (acceleration derived)
    % 14:HC_8700_G_ (acceleration derived)
    
    run('Load_Data.m')
    %----------------------------------------------------------------------
    %                       Stream(n,14)
    % 1.t 2.v 3.a 4.lateral_a 5.engine speed 6.engine toruqe
    % 7.grade 8.fuel rate 9.throttle position 10.brake
    % 11.pedal positon 12.gear 132.23694.longtitude 14. latitude
    %----------------------------------------------------------------------
    
    % inicialize
    Ftr=[]; % list of feature vectors
    Brake_big_list = []; % list of braking events
    Coast_big_list = []; % list of coasting 
    UA_big_list =[]; % list of unnecessary accelerating
    Energy_big_list = []; % list of benergy index
    
    for   n = 1:length(trip_list);
        % construct trip name
        trip_name = strcat('data\',trip_list{n});       
        load(trip_name); % load trip data
        
        % smooth accelerationg (moving average)
        if (trip==13)||(trip==14)
            
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
        
        % Rule-based event parsing
        if (trip==13)||(trip==14)
            % parser for trip 13 and 14
            [ prm ] = Find_Prm_mh87( speed,throttle,acel);
            % trip 13 and 14  use acceleration derive from vehichel speed
            % the parseing parameters are different
        else
            % parser for other trips
            [ prm ] = Find_Prm( speed,throttle,acel);
            
        end
        %------------------------------------------------------------------
        %                     prm (types of primitives)
        % 0.idel 1.accelerate 2.sustain 3.coasting 4.braking
        %------------------------------------------------------------------
        
        % consolidate events into a list
        [ p_list ] = Prm2List( prm,time,speed );
        
        %------------------------------------------------------------------
        %                     p_list (n,8)
        % 1 c#, 2 type, 3 start index, 4 end index, 5 duration,
        % 6 start speed, 7 end speed, 8 change of speed
        %------------------------------------------------------------------
        
        % find microtrip index
        [ Trip_Index ] = Microtrip_Index( p_list );
        %------------------------------------------------------------------
        %                     Trip_Index (n,2)
        % 1 microtrip start index, 2 microtrip end index
        %------------------------------------------------------------------
        % filter micro trips
        [ Trip_list ] = Filter_Trips( Trip_Index,p_list );
        %------------------------------------------------------------------
        %                     Trip_list (n,5)
        % 1 star event, 2 end event, 3 trip time,
        % 4 trip distance, 5 averge speed
        %------------------------------------------------------------------
        
        % extract features
        run('Extract_Features.m');
        
    end
    % save to file
    filename = strcat('micro_',num2str(trip))
    save(filename,'Ftr','Brake_big_list','Coast_big_list','UA_big_list','Energy_big_list');
end