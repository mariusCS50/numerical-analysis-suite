% Creates the array of sequences
function B = k_secv(A, k)
    for i = 1 : length(A) - k
        B{i, 1} = strjoin(A(i : i + k - 1));
    endfor
endfunction
