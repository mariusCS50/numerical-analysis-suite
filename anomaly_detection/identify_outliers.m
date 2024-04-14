% Selects the outliers based on the data computed by the other functions
function outliers = identify_outliers(X, yval)
    [mean_values, variances] = estimate_gaussian(X);
    probabilities = multivariate_gaussian(X, mean_values, variances);
    [epsilon, F1, precision, recall] = optimal_threshold(yval, probabilities);
    outliers = find(probabilities < epsilon);
endfunction