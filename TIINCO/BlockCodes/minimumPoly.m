function [minPol b] = minimumPoly(E,P,root)
% Returns the minimum polynomial and the conjugated roots, given the
% exponential and polynomial form of the Galois Field, and one root.
% [minPol b] = minimumPoly(E,P,root)
% See gfPol2Table for E and P parameter.
%
% Note: 
% root = 0 -> X     (Not supported)
% root = 1 -> 1 + X (Not supported)
%
% Ex: 
% [E V P] = gfPol2Table([...]);
% [minPol b] = minimumPoly(E,P,a^3);

m = log2(length(E));
syms X;
% All conjugate roots for root:
b = conjugateRoots(root,m);

% Minimal polynomium:
minPol = 1;
for i=1:length(b)
    minPol = minPol * (X+b(i));
end
 
% Substitute all exponential forms with polynomial form and reduce:
while degree(subs(minPol,X,1)) > m
    minPol = subs(minPol,E,P);
    minPol = expand(minPol);
end

% Modulo 2:
minPol = mod2partly(minPol);
end