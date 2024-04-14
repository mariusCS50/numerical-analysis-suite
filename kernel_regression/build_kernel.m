% Computes the kernel matrix
function [K] = build_kernel(X, f, f_param)
    m = length(X);

    for i = 1 : m
        for j = 1 : m
            K(i, j) = f(X(i, :), X(j, :), f_param);
        end
    end

endfunction
