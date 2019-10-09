function [ P_list ] = Prm2List_OL( prm,p_prv,time,speed )
%% prm 2 list
% 1count, 2primitive, 3start index, 4 end index, 5 duration,6 start speed, 7end speed,
% 8change of speed

%P_list = [];
%p_prv = prm(1); % privous p
%start = 1;
%count = 1;
%    for n=2:length(prm)

if prm ~= p_prv
    %new_entry = ; % create a new entry
    P_list = [P_list; [p_prv,count]];
    %p_prv = prm; % update the 
    
    % inicialize
    start = n;
    count =count+1;
else
    ; % do nothing
end
%   end

for m=1:length(P_list)
    P_list(m,5) = time(P_list(m,4))-time(P_list(m,3)); % duration
    P_list(m,6) = speed(P_list(m,3));
    P_list(m,7) = speed(P_list(m,4));
    P_list(m,8) = P_list(m,7)-P_list(m,6);
end


end

