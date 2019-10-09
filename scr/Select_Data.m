%==========================================================================
%                              Select data set   
 
%========================================================================== 
disp(' Data Set:')
disp('     1  - EC_8700_G_01_1')
disp('     2  - EC_8700_B_01_1')
disp('     3  - SW_8700_G_01_1')
disp('     4  - SW_8700_B_01_1')
disp('     5  - MH_13000_G_01_1')
disp('     6  - MH_13000_B_01_1')
disp('     7  - SW_13000_G_05_1')
disp('     8  - SW_13000_B_05_1')
disp('     9  - SB_15000_G_13_1')
disp('     10 - SB_15000_B_13_1')
disp('     11 - HC_15000_G_14_1')
disp('     12 - HC_15000_B_14_1')
disp('     13 - MH_8700_G_01_1')
disp('     14 - MH_8700_B_01_1')
data_set = input('Which data set to analyze? \n  (Enter a number from 1 to 14 and Press ENTER) ');

 % constract trip name
 switch data_set
    case 1
        % Eagle Creek 8700 Good
        trip_name = strcat('data\','EC_8700_G_01_1');
    case 2
        % Eagle Creek 8700 Bad 
        trip_name = strcat('data\','EC_8700_B_01_1');
    case 3
        % SpeedWay 8700 Good 
        trip_name = strcat('data\','SW_8700_G_01_1');
    case 4
        % SpeedWay 8700 Bad 
        trip_name = strcat('data\','SW_8700_B_01_1');
    case 5
        % Manhattan 8700 Good 
        trip_name = strcat('data\','MH_13000_G_01_1');
    case 6
        % Manhattan 8700 Bad
        trip_name = strcat('data\','MH_13000_B_01_1');
    case 7
        % Eagle Creek 13000  Good
        trip_name = strcat('data\','SW_13000_G_05_1');
    case 8
        % Eagle Creek 13000 Bad
        trip_name = strcat('data\','SW_13000_B_05_1');
    case 9
        % Manhattan 13000 Good
        trip_name = strcat('data\','SB_15000_G_13_1');
    case 10
        % Manhattan 13000 Bad
        trip_name = strcat('data\','SB_15000_B_13_1');
    case 11
        % Heavy City 15000 Good
        trip_name = strcat('data\','HC_15000_G_14_1');
    case 12
        % Heavy City 15000 Bad
        trip_name = strcat('data\','HC_15000_B_14_1');
    case 13
        % Suburb 15000 Good
        trip_name = strcat('data\','MH_8700_B_01_1');
    case 14
        % Suburb 15000 Bad
        trip_name = strcat('data\','MH_8700_B_01_1');
    otherwise
        'please select 1 to 14'     
        
end
load(trip_name);
