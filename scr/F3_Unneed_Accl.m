function [ ratio_ua,UA_list] = F3_Unneed_Accl( p_list )
%==========================================================================
%                        F3_Unneed_Accl
% definition: 
%         occurance_of_accerlation_right_after_brake/occurance_of_brake
% 
% inputs:
% p_list: list of primitives
%
% output:
% ratio_ua: ratio of uneeded acceleration
% UA_list: detialed list of uneeded acceleration
%--------------------------------------------------------------------------
%                           Tuning Parameters 
   max_time = 15; % maxium search duration
   min_d_dv = -5; % minial change of decelerating speed
   min_a_dv = 3; % minial change of acceleration speed
%==========================================================================

% inicailize
UA_list = [];   % list of acceleration
decl_count = 0; % count number of decleration event
ua_count = 0;

% accelerating before breaking
for n=1:size(p_list,1)
    % found a brake event
    if (p_list(n,2) == 4 ) && (p_list(n,8) < min_d_dv )   
        % (is a brake event) and (change in speed is significant)
        decl_count = decl_count+1; % count+1
        
        time_sum = 0; % incilized time
        
        m=n-1; % start search index, from the previous event
        % keep search back is if the duration is less than a throhod
        while (time_sum < max_time)&&(m>0) 
            % (time < max duration) and (index is valid)
            
            % found a accelerating event
            if (p_list(m,2)==1) && (p_list(m,8)>min_a_dv ) 
                %(is acceleration) and (change in speed is significant)  
                
                % unneed count + 1
                ua_count = ua_count+1;
                % create a new entry
                new_entry = [p_list(n,3),time_sum];
                % start index, duration
                UA_list = [UA_list; new_entry];
                break;
            end
            
            % check if reach the begining of the list
            if m>1
                m=m-1;
            else
                break;
            end
            
            % update search duration
            time_sum = time_sum + p_list(m,5);
        end
    end
end
ratio_ua =  ua_count/(decl_count+0.01);
% count of uneeded acceleration/ (count of decelertion + small number)
% 0.01 is to prevent the situation 0/0

end

