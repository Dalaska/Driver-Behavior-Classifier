function [ X_n ] = Normalize_Feature( X,X_min,X_max )
%==========================================================================
%                 Max Min Normal
% normalize the feature by max and min value
%--------------------------------------------------------------------------
% inputs:
% X: features
% X_min: maxium value  
% X_max: minimal value  
%
% output:
% X_n: normalized features
%==========================================================================

% iniclaize
X_n = X;
for n=1:size(X,1)
    % max min normalization
    X_n(n) = (X(n)-X_min)/(X_max-X_min);    
    
    % if value greater than 1 or less than 0, truncate
    if X_n(n)>1
        X_n(n) =1;
    end
    if X_n(n)<0
        X_n(n)=0;
    end
end

end


