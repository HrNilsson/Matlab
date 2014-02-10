%% Helper function used with Binary Symmetric Channels
function y = Omega(x)
y =  x*log2(1/x)+(1-x)*log2(1/(1-x));
end