%==========================================================================
%                             Extract feature 
% Outputs:
% Ftr:feature vector
% (detailed lists of events)
% Brake_big_list : brake events
% Coast_big_list : coasting events
% UA_big_list : unnecessary events
% Energy_big_list : energy index
%==========================================================================

for k=1:size(Trip_list,1)
    st = Trip_list(k,1); % start of microtrip
    sp = Trip_list(k,2); % stop of the microtrip
    p_list_j = p_list(st:sp,:); % list for microtrip
    
    % Feature 1: how hard is the braking
    [ b_mean,Brake_list ] = F1_Brake_Level( p_list_j );
    
    % Feature 3: duration of coasting before brake
    [ c_mean,Coast_list  ] = F2_Coast_Time( p_list_j );
    
    % Feature 4: time braking after accelertion
    [ ua_ratio,UA_list ] = F3_Unneed_Accl( p_list_j );
    
    % Feature 6: engery index ideal/actual
    [ energy_index ] = F4_Energy_Index( p_list_j,Trip_list(k,4));
    
    % feature vector
    ftr = [Trip_list(k,3:5),b_mean,c_mean,ua_ratio, energy_index]; % new entry
    Ftr = [Ftr;[k,ftr]]; %save into a list
    % 1 #micro trip, 2 distance 3duration 4average speed 5.F1 6F2 7F3 8F4
    
    % detail lists of devents
    Brake_big_list = [Brake_big_list;[k*ones(size(Brake_list,1),1),Brake_list]];
    Coast_big_list = [Coast_big_list;[k*ones(size(Coast_list,1),1),Coast_list]];
    UA_big_list = [UA_big_list;[k*ones(size(UA_list,1),1),UA_list]];
    Energy_big_list = [Energy_big_list;energy_index];
end
