function [ f_xn,label,Nm ] = F_Trans( f_xy )
%==========================================================================
%                           Transform Features
% 1.normalize the feature by percentile
% 2. return normalized feature, labels and max min value of normalization
%--------------------------------------------------------------------------
% inputs:
% f_xy: list of primitives
%
% output:
% f_xn: normalize features
% label: labels
% Nm: max and min value for normalization
%==========================================================================

  label = f_xy(:,1); % get label
  features = f_xy(:,6:9); % get features
  Nm = zeros(size(features,2),2); % max and min value for normalization
    
    % normalize the value by percentile
    for n=1:size(features,2)
        [f_xn(:,n),Nm(n,:)]= Normal_Percentile(features(:,n),98,2);     
    end
 
end

