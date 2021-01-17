function idx = findClosestCentroids(X, centroids)

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);
m = size(X,1)
for i = 1:m
    distance = zeros(1,K);
    for j = 1:K
        distance(1,j) = sqrt(sum(power((X(i,:)-centroids(j,:)),2)));
    end
    [~, min_idx] = min(distance);
    idx(i,1) = min_idx;
end

end

