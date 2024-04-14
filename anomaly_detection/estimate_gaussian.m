% This function estimates the parameters of a Gaussian distribution using the data in X.
function [mean_values variances] = estimate_gaussian(X)
    mean_values = mean(X);
    variances = cov(X);
endfunction