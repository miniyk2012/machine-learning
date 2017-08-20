function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
m = length(idx);
% 下面的代码太难看了，有向量化的方案
% for i = 1:m
%     xi = X(i,:);
%     min_distance = realmax;
%     min_index = 0;
%     for k = 1:K
%         centroid_k = centroids(k,:);
%         distance = norm(xi-centroid_k);
%         if distance < min_distance
%             min_distance = distance;
%             min_index = k;
%         end
%     end
%     idx(i) = min_index; 
% end

% 法2，自己想的一个方案
% for i = 1:m
%     xi = X(i,:);
%     [E,I] = min(sum((xi-centroids).^2, 2));
%     idx(i) = I;
% end

% 法3，不用循环的方案
distance = zeros(m, K);
for k = 1:K
    distance(:,k) = sum(bsxfun(@minus, X, centroids(k,:)).^2, 2);  % 第k列保存所有examples到第k个centroid的距离
end
[M, idx] = min(distance, [], 2);  % 对每个example找到最近的那个centroid（每行最小的那个index）
% distance
% =============================================================

end

