function x = corError(dmin)
% Calculate the correctable erros given the minimum Hamming distance
% corError(dmin) returns the number of correctable bits
x = (dmin-1)/2;
x= floor(x);
end