% Creates the stochastic matrix
function retval = stochastic_matrix(k_secv_corpus, corpus_words, words_set, k_secv_set, k)
    n = numel(k_secv_set);
    m = numel(words_set);

    retval = zeros(n, m);

    % Creates the arrays which connect the sequences and words from corpus to their stochastic index in their respective sets
    [~, secv_idx] = ismember(k_secv_corpus, k_secv_set);
    [~, words_set_idx] = ismember(corpus_words, words_set);

    % Iterates the sequences and modifies the respective cell in the stochastic matrix
    for i = 1 : numel(secv_idx)
        row = secv_idx(i);
        col = words_set_idx(i + k);
        retval(row, col) += 1;
    endfor

endfunction