% % Solves the system a = λ * (λ * I(m) + K)^(-1) * y iteratively using the conjugate gradient method
function [a] = get_prediction_params_iterative(K, y, lambda)
    m = length(K);
    x0 = zeros(m, 1);

    % This is a tolerance low enough to get precise results
    tol = 1e-3;

    % A sufficient number of iterations to get the best precision and efficiency
    max_iter = 50;

    a = conjugate_gradient(lambda * (lambda * eye(m) + K), y, x0, tol, max_iter);
endfunction
