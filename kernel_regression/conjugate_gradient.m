% Computes the conjugate gradient
function [x] = conjugate_gradient(A, b, x0, tol, max_iter)
    r = b - A*x0;
    v = r;
    x = x0;
    tol = tol^2;
    k = 1;

    while (k <= max_iter) && (r' * r > tol)
        t_k = (r' * r) / (v' * A * v);
        x = x + t_k * v;
        tmp = r;
        r = r - t_k * A * v;
        s_k = (r' * r) / (tmp' * tmp);
        v = r + s_k * v;
        k = k + 1;
    endwhile

endfunction