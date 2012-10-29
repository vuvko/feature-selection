function J = cost_func(theta, X, y)

theta = theta >= 0.5;

J = 0;
%X = X .* repmat(theta', n, 1);
X = X(:, theta);
[n m] = size(X);
X = X ./ repmat(norm(X, 'rows'), 1, m);
R = X * X';
R = R - diag(diag(R));
[max, m_idx] = max(R, [], 2);
J = 1 - sum(y == y(m_idx)) / n;

end