% Generates a n word sentence starting with a k word sequence
function retval = sample_n_words (text,  widx, kscvidx, k, stoch, word_set, n)
    for i = 1 : n
        probs = sample_next_word(text, widx, kscvidx, k, stoch);
        new_word = prob_choose(probs, word_set);
        text{end+1} = new_word;
    endfor
    retval = text;
endfunction
