function [ prob ] = Test( X_n,theta )
%==========================================================================
%                   Predict the class of a feature
% X_n: feature vector
% theta: logistic regresion model parameter
% prob: prediction result
%==========================================================================
[m, n] = size(X_n);
x = [ones(m,1), X_n]; % adding the bias terms
prob = zeros(m,1); % inicialize 
g = inline('1.0 ./ (1.0 + exp(-z))'); % the logistic function
    for i = 1:m
    % test 
    test = x(i,:);
    prob(i) = g(test*theta);
    end

end

