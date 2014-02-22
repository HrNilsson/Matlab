function polvec = pol2polvec(Pol,n)
% Returns the polynomial representation of a symbolic polynomial as a vector.
% The polynomial vector is ascending(left to rigth).
% polvec = pol2polvec(Pol) returns a polynomial vector.
% polvec = pol2polvec(Pol,n) returns a vector of length n, if
% n > length(pol2polvec(Pol))

switch(nargin)
    case 2
        polvec = rot90(sym2poly(Pol),2);
        polvec = [polvec zeros(1,n-length(polvec))];
        
    case 1
        polvec = rot90(sym2poly(Pol),2);
end