% Solves the system a = λ * (λ * I(m) + K)^(-1) * y using Cholesky's LU decomposition
% for a better stability and efficiency
function [a] = get_prediction_params(K, y, lambda)
    L = cholesky(lambda * eye(length(K)) + K);
    a = lambda * (get_lower_inverse(L') * get_lower_inverse(L) * y);
endfunction
