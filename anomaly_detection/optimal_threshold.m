% Finds the best threshold to use for selecting outliers.
function [best_epsilon best_F1 associated_precision associated_recall] = optimal_threshold(truths, probabilities)
    best_epsilon = 0;
    best_F1 = 0;
    associated_precision = 0;
    associated_recall = 0;

    % Selects the minimum and maximul probability
    max_prob = max(probabilities);
    min_prob = min(probabilities);

    % Iterates inside the span for 1000 steps
    for epsilon = min_prob : (max_prob - min_prob) / 1000 : max_prob

        % Calculates the variables required for the current iteration
        predictions = probabilities < epsilon;
        [false_positives, false_negatives, true_positives] = check_predictions(predictions, truths);
        [precision, recall, F1] = metrics(true_positives, false_positives, false_negatives);

        % Saves the best values
        if F1 > best_F1
            best_epsilon = epsilon;
            best_F1 = F1;
            associated_precision = precision;
            associated_recall = recall;
        endif

    endfor

endfunction