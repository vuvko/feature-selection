function [opt J_hist] = sa(theta, X, y)

k_max = 300;
J_hist = zeros(k_max, 1);

[n m] = size(X);

e = cost_func(theta, X, y);
opt = theta;
e_opt = e;

for k = 1:k_max
	fprintf("Current tempreture - %4i\r", k);
	fflush(stdout);
	T = temprature(k, k_max);
	theta_new = neighbour(theta, T) >= 0.5;
	e_new = cost_func(theta_new, X, y);
	if prob(e, e_new, T) > rand()
		theta = theta_new;
		e = e_new;
	endif;
	if e < e_opt
		opt = theta_new;
		e_opt = e_new;
	endif;
	J_hist(k) = e;
end;

fprintf("\n");


end