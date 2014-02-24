function H = parityMatrix(G, identitySide)
% Calculate the parity matrix given a generator matrix including the 
% identity matrix.
% parityMatrix(G, identitySide) returns the parity matrix
% parityMatrix(G) returns the parity matrix assuming the identity matrix is
% on the right side.
s = size(G);

switch nargin
    case 2
        if identitySide == 'r'
            P = G(:,1:s(2)-s(1));
        elseif identitySide == 'l'
            P = G(:,s(1)+1:s(2));
        end
    case 1
        P = G(:,1:s(2)-s(1));
end
H = [eye(length(P(1,:))) P'];
end