function [ P_list ] = Prm2List( prm,time,speed )
%==========================================================================
%                               Find_Prm
% find primitives (driving events)
% output:
%                     prm (types of primitives)
% 0.idel 1.accelerate 2.sustain 3.coasting 4.braking
%-------------------------------------------------------------------------- 
%--------------------------------------------------------------------------
%                     p_list (n,8)
% 1 c#, 2 type, 3 start index, 4 end index, 5 duration,
% 6 start speed, 7 end speed, 8 change of speed
%--------------------------------------------------------------------------
 

P_list = [];
p_prv = prm(1); % privous p
start = 1;
count = 1;
    for n=2:length(prm)
        if prm(n)~=p_prv
            new_entry = [count, p_prv,start,n-1]; % create a new entry
            P_list = [P_list;new_entry];
            p_prv = prm(n); % the new state
            start = n;
            count =count+1;
        else
            ;  
        end
    end
    
for m=1:length(P_list)
    P_list(m,5) = time(P_list(m,4))-time(P_list(m,3)); % duration
    P_list(m,6) = speed(P_list(m,3));
    P_list(m,7) = speed(P_list(m,4));
    P_list(m,8) = P_list(m,7)-P_list(m,6);
end
 
end

