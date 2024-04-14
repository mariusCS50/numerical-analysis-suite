% Computes the lower triangular matrix L using Cholesky's decomposition
function [L] = cholesky (A)
    L = chol(A)';
endfunction
