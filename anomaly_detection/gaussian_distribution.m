% The formula for the probaability used in the multivariate Gaussian distribution
function probability = gaussian_distribution(X, mean_value, variance)
    probability = exp(-0.5 * (X - mean_value) * inv(variance) * (X - mean_value)');
    probability /= (2 * 3.14)^(length(X) / 2) * det(variance)^0.5;
endfunction