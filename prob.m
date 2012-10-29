function p = prob(e, e_new, temp)

eps = 0.0001;
p = (e_new < e) .* exp((e_new - e) ./ (temp + eps));


end