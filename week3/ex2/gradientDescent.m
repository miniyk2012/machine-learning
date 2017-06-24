function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    h = sigmoid(X*theta); 
    theta = theta-alpha/m*X'*(h-y) ;
    % 收敛速度过慢，[theta, J_history] = gradientDescent(X, y, initial_theta, 0.001, 2000000);要运行分钟10





    % ============================================================

    % Save the cost J in every iteration    
    %J_history(iter) = costFunction(theta, X, y);

end

end
