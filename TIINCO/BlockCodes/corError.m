function x = corError(dmin)
% Calculate the correctable erros given the minimum Hamming distance
% detError(dmin) returns the number of correctable
x = (dmin-1)/2;
x= floor(x);

end