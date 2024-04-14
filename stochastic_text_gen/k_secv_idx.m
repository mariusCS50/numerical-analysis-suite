% % Creates a map with the sequences as keys and the indexes as values
function retval = k_secv_idx(distinct_k_sec)
    retval = containers.Map(distinct_k_sec, 1 : numel(distinct_k_sec));
endfunction