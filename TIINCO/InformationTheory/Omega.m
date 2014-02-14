function y = Omega(x)
% Helper function used with Binary Symmetric Channels
y =  x*log2(1/x)+(1-x)*log2(1/(1-x));
end