% Creates a map with the words as keys and the indexes as values
function retval = word_idx(distinct_wds)
    retval = containers.Map(distinct_wds, 1 : numel(distinct_wds));
endfunction
