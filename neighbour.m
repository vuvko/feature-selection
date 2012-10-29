function X_new = neighbour(X, T)

%X_new = xor((randn(size(X)) - 0.5) .* (T + 0.1) >= -0.3, X);

X_new = X + 0;
k = length(X(:));
r = randi(k, round(T * k / 8), 1);
X_new(r) = (randn(size(r)) - 0.5) .* (T + 0.1) + X(r) >= 1 - 10 / k;

end