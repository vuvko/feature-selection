function [opt m] = rand_desc2(X, y, iters)

k = size(X, 2);
m = 1;
load task3.out opt;
theta = zeros(size(opt));
i = 1;
while(1)
	tic;
	fprintf("Iteration - %4i\n", i++);
	theta = sa(opt, X, y);
	if cost_func(theta, X, y) < m
		m = cost_func(theta, X, y);
		opt = theta;
		fprintf("]>- New minimum %.4f\n", m);
	endif;
	toc
	fflush(stdout);
end;



end