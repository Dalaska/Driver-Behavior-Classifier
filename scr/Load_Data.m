%==========================================================================
%                               Load trip data       
% construct trip name: 
% e.g. EC_8700_B_01_1 (route_vehilce_Bad/Good_driver#_trip#)
%==========================================================================

if trip==1
    trip_n1='EC_8700_B_'; % Eagel creak, 8700kg, Bad
    trip_n2 = {'01','02','03','04','05','06','07','08','09','10','11'};% driver #
    trip_n3 = [4;1;2;2;3;1;1;1;2;1;1];% trip #
else if trip ==2
        trip_n1='EC_8700_G_';% Eagel creak, 8700kg, Good
        trip_n2 = {'01','02','03','04','05','06','07','08','09','10','11'};  % driver #
        trip_n3 = [4;1;2;2;3;1;1;1;2;1;1]; % trip #
    else if trip ==3
            trip_n1='SW_8700_B_';% Speedway, 8700kg, Bad
            trip_n2 = {'01','02','05','09','11','12'};% driver #
            trip_n3 = [1;1;3;2;1;2];% trip #
        else if trip ==4
                trip_n1='SW_8700_G_'; % Speedway, 8700kg, Good
                trip_n2 = {'01','02','05','09','11','12'};% driver #
                trip_n3 = [1;1;2;2;1;1];% trip #
            else if trip ==5
                    trip_n1='MH_13000_B_'; % Manhattan, 13000kg, Bad
                    trip_n2 = {'01','02','03','05'};% driver #
                    trip_n3 = [1;1;1;1];% trip #
                else if  trip ==6
                        trip_n1='MH_13000_G_'; % Manhattan,13000kg, Good
                        trip_n2 = {'01','02','03','05'};% driver #
                        trip_n3 = [1;1;1;1];% trip #
                    else if trip ==7
                            trip_n1='SW_13000_B_'; % Speedway,13000kg, Bad
                            trip_n2 = {'05'};% driver #
                            trip_n3 = [1];% trip #
                        else if trip ==8
                                trip_n1='SW_13000_G_'; % Speedway,13000kg,Good
                                trip_n2 = {'05'};% driver #
                                trip_n3 = [1];% trip #
                            else if trip ==9
                                    trip_n1='SB_15000_B_'; % Suburb,15000kg, Bad
                                    trip_n2 = {'13','14'};% driver #
                                    trip_n3 = [3;3];% trip #
                                else if trip ==10
                                        trip_n1='SB_15000_G_'; % Suburb,15000kg, Good
                                        trip_n2 = {'13','14'};% driver #
                                        trip_n3 = [2;6];% trip #
                                    else if trip ==11
                                            trip_n1='HC_15000_B_'; % Highwaycity,15000kg, Bad
                                            trip_n2 = {'13','14'};% driver #
                                            trip_n3 = [5;5];% trip #
                                        else if trip ==12
                                                trip_n1='HC_15000_G_'; % Highwaycity,15000kg, Good
                                                trip_n2 = {'13','14'};% driver #
                                                trip_n3 = [6;5];% trip #
                                            else if trip ==13
                                                    trip_n1='MH_13000_B_'; % Manhattan,13000kg, Bad
                                                    trip_n2 = {'01','02','03','05'};% driver #
                                                    trip_n3 = [1;1;1;1];% trip #
                                                else if trip ==14
                                                        trip_n1='MH_13000_G_'; % Manhattan,13000kg, Good
                                                        trip_n2 = {'01','02','03','05'};% driver #
                                                        trip_n3 = [1;1;1;1];% trip #
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                
                            end
                        end
                    end
                end
            end
        end
    end
end




%% construct trip list
count = 1; % inicalize
for n=1:length(trip_n2)
    for m=1:trip_n3(n)
        trip_list(count) = strcat(trip_n1,trip_n2(n),'_',num2str(m),'.mat');
        count = count+1;
    end
end


