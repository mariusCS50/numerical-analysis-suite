% Computes the estimation for a current vector x based on the training data set
function pred = eval_value(x, X, f, f_param, a)
    pred = 0;
    for i = 1 : length(X)
        ker_val = f(x, X(i, :), f_param);
        pred += (a(i) * ker_val);
    endfor
endfunction