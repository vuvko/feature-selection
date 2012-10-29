clear; clc;

data = load('task1.txt');
y = data(:, 1);
X = data(:, 2:end);

tic;
J = cost_func(ones(10, 1), X(:, 1:10), y);
toc
fprintf("Cost Function - %f\nThis should be %f.\n", J, 1 - 0.67);