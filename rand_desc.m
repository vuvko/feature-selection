function [opt m] = rand_desc(X, y, iters)

k = size(X, 2);
m = 1;
shift = 0.5 - 10 / k;
%shift = 0.16;
opt = rand(k, 1) - shift >= 0.5;
theta = zeros(size(opt));
for i = 1:iters
	tic;
	fprintf("Iteration - %4i\n", i);
	%theta = desc([rand(k, 1)] , X, y);
	%theta = sa((rand(k, 1) - shift >= 0.5), X, y);
	theta = sa(opt, X, y);
	if cost_func(theta, X, y) < m
		m = cost_func(theta, X, y);
		opt = theta;
		fprintf("]>- New minimum %.4f\n", m);
	else
		break;
	endif;
	toc
	fflush(stdout);
end;



end