% Calculates the precision of our predictions with the actual true values
function [false_positives, false_negatives, true_positives] = check_predictions(predictions, truths)

    true_positives = sum(predictions == 1 & truths == 1);
    false_positives = sum(predictions == 1 & truths == 0);
    false_negatives = sum(predictions == 0 & truths == 1);

endfunction

