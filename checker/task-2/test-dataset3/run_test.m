function run_test()
    "task-2";
    fout = fopen("out", "w+");
    load("../../input/task2/load2.mat");
    
    

    [X_train, y_train, X_pred, y_pred] = split_dataset(points, z, 0.85);
    
    kernel_func = @gaussian_kernel
    kernel_func_param = 1;
    
    [K] = build_kernel(X_train, kernel_func, kernel_func_param);
    
    
    [a] = get_prediction_params_iterative(K, y_train, 1);
    
    n_pred = size(y_pred, 1);
    my_y = zeros(n_pred, 1);
    
    for i = 1 : n_pred
    	my_y(i) = eval_value(X_pred(i, :), X_train, kernel_func, kernel_func_param, a);
    endfor
    
    rel_errs = abs(y_pred - my_y) ./ y_pred;
    
    ok_rel_errs = rel_errs < 0.20;
    %err = norm((y_pred - my_y) ./ y_pred, 1) / n_pred;
    
    %fprintf(fout, "%e\n", err);
    fprintf(fout, "%e\n", sum(ok_rel_errs)/n_pred * 100);
    %fprintf(fout, "%e\n", n_pred);
    fclose(fout);
endfunction
