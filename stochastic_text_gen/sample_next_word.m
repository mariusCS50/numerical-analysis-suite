% Gets the row in the stochastic matrix associated with the last k sequence in the text
function probs = sample_next_word (text, words_idx, k_secv_idx, k, stoch)
    last_k_seq = strjoin(text(end - k + 1:end));
    probs = stoch(k_secv_idx(last_k_seq), :);
endfunction
