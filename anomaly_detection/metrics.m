% Calculates the precision, recall and F1 values
function [precision recall F1] = metrics(true_positives, false_positives, false_negatives)
    precision = true_positives / (true_positives + false_positives);
    recall = true_positives / (true_positives + false_negatives);
    F1 = (2 * precision * recall) / (precision + recall);
endfunction