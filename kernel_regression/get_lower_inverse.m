% Computes the inverse of matrix L using an algorithm inspired by the GPP elimination
function [P] = get_lower_inverse(L)
    n = length(L);
    A = [L, eye(n)];

    for p = 1 : n
        [max_val, idx] = max(abs(A(p : n, p)));
        idx = idx + p - 1;
        temp = A(idx, :);
        A(idx, :) = A(p, :);
        A(p, :) = temp;

        if (A(p, p) == 0)
            continue;
        endif

        A(p, :) /= A(p, p);
        for l = 1 : n
            if l != p
                A(l, :) -= A(l, p) * A(p, :);
            endif
        endfor

    endfor
    P = A(:, n + 1 : end);
endfunction
