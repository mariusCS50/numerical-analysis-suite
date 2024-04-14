% Eliminates duplicates and sorts the tokens
function retval = distinct_words(tokens)
    retval = sort(unique(tokens));
endfunction
