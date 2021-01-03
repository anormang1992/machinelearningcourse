function [X_poly] = polyFeatures(X, p)


% You need to return the following variables correctly.
X_poly = zeros(numel(X), p);

m = size(X, 1);


for i=1:m
	poly_feat = zeros(p, 1);
	for j=1:p
        poly_feat(j) =  X(i).^j;
    	end

    X_poly(i, :) = poly_feat;

end

end
