function [all_theta] = oneVsAll(X, y, num_labels, lambda)

% Some useful variables
m = size(X, 1);
n = size(X, 2);


all_theta = zeros(num_labels, n + 1);


% Add ones to the X data matrix
X = [ones(m, 1) X];



% ====================== YOUR CODE HERE ======================


% Set Initial theta
initial_theta = zeros(n + 1, 1);
     
% Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 50);

for i = 1:num_labels 
	all_theta(i,:) = fmincg (@(t)(lrCostFunction(t, X, (y == i), lambda)), initial_theta, options);
 
	end

end
