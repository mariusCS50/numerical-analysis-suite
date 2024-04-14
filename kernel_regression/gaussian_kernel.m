% Computes the gaussian kernel
function retval = gaussian_kernel(x, y, sigma)
    retval = exp(-norm(x - y)^2 / (2 * sigma^2));
endfunction
