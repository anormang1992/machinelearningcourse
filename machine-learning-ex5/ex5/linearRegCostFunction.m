function [J, grad] = linearRegCostFunction(X, y, theta, lambda)

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));


h = X * theta

J = 1/(2*m) *(h-y)'*(h-y)+(lambda/(2*m))*(theta(2:length(theta)))'*theta(2:length(theta));

theta0 = theta;
theta0(1)=0;


grad = ((1/m)*(h-y)'*X)+lambda/m*theta0';



grad = grad(:);

end
