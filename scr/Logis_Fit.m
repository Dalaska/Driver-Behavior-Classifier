function [ theta ] = Logis_Fit( x,y,lambda )
%==========================================================================
%               train the logistic regression model
% x: feature vectors
% y: label 
% lambda: regularization parameter
% theta: model coefficients
%==========================================================================
%% Newton's method

[m, n] = size(x);

% Add intercept term to x
x = [ones(m, 1), x]; 
n= n+1;
% Initialize fitting parameters
theta = zeros(n, 1);

% Define the sigmoid function
g = inline('1.0 ./ (1.0 + exp(-z))'); 

% Newton's method
MAX_ITR = 50;
J = zeros(MAX_ITR, 1);

for i = 1:MAX_ITR
    
    % Calculate the hypothesis function
    z = x * theta;
    h = g(z);
    
    % Calculate J (for testing convergence)
    J(i) =(1/m)*sum(-y.*log(h) - (1-y).*log(1-h))+ ...
    (lambda/(2*m))*norm(theta([2:end]))^2;
    
    % Calculate gradient and hessian.
    G = (lambda/m).*theta; G(1) = 0; % extra term for gradient
    L = (lambda/m).*eye(n); L(1) = 0;% extra term for Hessian
    grad = ((1/m).*x' * (h-y)) + G;
    H = ((1/m).*x' * diag(h) * diag(1-h) * x) + L;
    
    % Here is the actual update
    theta = theta - H\grad;
end
  

end

