function r = codeRate(G)
% Calculate the code rate given a generator matrix
% codeRate(G) returns the code rate
[k,n] = size(G);
r = k/n;
end