% Splits the data set training data and testing data
function [X_train, y_train, X_pred, y_pred] = split_dataset(X, y, percentage)
    num_lines = length(X);

    split_line = round(percentage * num_lines);

    % Training data
    X_train = X(1 : split_line, :);
    y_train = y(1 : split_line, :);

    % Testing data
    X_pred = X(split_line + 1 : end, :);
    y_pred = y(split_line + 1 : end, :);
endfunction
