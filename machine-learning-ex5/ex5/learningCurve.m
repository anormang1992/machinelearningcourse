function [error_train, error_val] = ...
    learningCurve(X, y, Xval, yval, lambda)

% Number of training examples
m = size(X, 1);

% You need to return these values correctly
error_train = zeros(m, 1);
error_val   = zeros(m, 1);


for i = 1:m
    X_subset = X(1:i, :);
    y_subset = y(1:i); 

    theta = trainLinearReg(X_subset, y_subset, lambda);

    error_train(i) = linearRegCostFunction(X_subset, y_subset, theta, 0);
    error_val(i) = linearRegCostFunction(Xval, yval, theta, 0);
end



end
