function [J, grad] = lrCostFunction(theta, X, y, lambda)

% Initialize some useful values

m = length(y); % number of training examples
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================

h = sigmoid(X*theta);

J = -(1/m) * ((y'*log(h))+(1-y)'*log(1-h))+ (lambda/(2*m))*(theta(2:length(theta)))'*theta(2:length(theta))

theta0 = theta;
theta0(1) = 0

grad = ((1 / m) * (X'*(h - y))) + lambda / m * theta0;




% =============================================================

grad = grad(:);

end
