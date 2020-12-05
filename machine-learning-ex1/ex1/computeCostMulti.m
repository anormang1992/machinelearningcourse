function J = computeCostMulti(X, y, theta)

% Initialize some useful values
m = length(y); % number of training examples

predictions = X*theta;
squaredErrors = (predictions - y).^2;


J = 1/(2*m)*sum(squaredErrors);

end
