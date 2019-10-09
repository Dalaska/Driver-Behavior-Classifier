function [ energy_index ] = F4_Energy_Index( p_list, trip_dist)
%==========================================================================
%                               Energy_Index
% definition: 
%               kinetic_energy/trip_distance
%-------------------------------------------------------------------------- 
% inputs:
% p_list: list of primitives
% trip_dist: distance of the microtrip
% output:
% energy_index: energy index
%--------------------------------------------------------------------------
% inicialize 
energy = 0;
for m=1:size(p_list,1)
        % kenatic energy
        if p_list(m,8)>0 
           % if speed increase, add to kenatic energy
            energy = energy + (p_list(m,7)^2-p_list(m,6)^2);
            % end_speed^2 - start_speed^2
        end
        
end
% kinetic_energy/trip_distance
energy_index = energy/trip_dist; 

end

