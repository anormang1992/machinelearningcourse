function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));




% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));



% Foward propagation
X = [ones(m,1) X]; % 5000*401
z2 = Theta1 * X'; % (25*401)*(401*5000)
a2 = sigmoid(z2); % (25*5000)

a2 = [ones(m,1) a2'];
z3 = Theta2 * a2';
h_theta = sigmoid(z3);



%convert y labels to vectors containing only 0s or 1s
y_vector_labels = zeros(num_labels,m);
for i=1:m,
  y_vector_labels(y(i),i)=1;
end


J = (1/m) * sum ( sum ( (-y_vector_labels) .* log(h_theta) - (1-y_vector_labels) .* log(1-h_theta) ));

t1 = Theta1(:,2:size(Theta1,2));
t2 = Theta2(:,2:size(Theta2,2));


J = J + (lambda  * (sum( sum ( t1.^ 2 )) + sum( sum ( t2.^ 2 ))) / (2*m));




for t=1:m
	% set X equal to a1 and calculate the first z and a values for the second layer

	a1 = X(t,:); 
      a1 = a1'; 
	z2 = Theta1 * a1; 
	a2 = sigmoid(z2); 
    
	%add bias unit to a2
     a2 = [1 ; a2]; 

	%calculate the z and a values for the final layer
	z3 = Theta2 * a2;
	a3 = sigmoid(z3); 

	%the first delta value    
	delta_3 = a3 - y_vector_labels(:,t); % (10*1)
	
    z2=[1; z2]; 
    delta_2 = (Theta2' * delta_3) .* sigmoidGradient(z2); 

    delta_2 = delta_2(2:end);

    Theta2_grad = Theta2_grad + delta_3 * a2';
    Theta1_grad = Theta1_grad + delta_2 * a1'; 
    
end;


Theta2_grad = (1/m) * Theta2_grad; 
Theta1_grad = (1/m) * Theta1_grad; 




Theta1_grad(:, 2:end) = Theta1_grad(:, 2:end) + ((lambda/m) * Theta1(:, 2:end)); 

Theta2_grad(:, 2:end) = Theta2_grad(:, 2:end) + ((lambda/m) * Theta2(:, 2:end)); 


% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
