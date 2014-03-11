function [ errSynd ] = generateErrExpr( n, genPol )
% Returns the syndrome vectors, used in a Meggigt decoder for a 
% double-error correcting generator polynomium.
% errSynd = generateErrExpr( n, genPol )

% The degree of the generator polynomium is equal to the length of the
% syndrome vectors.
r = degree(genPol);
% Convert the generator polynomial to vector representation.
genVec = pol2polvec(genPol); 
% Calculate the parity check matrix
H = cyclgen(n, genVec,'system');

% Possible error vectors used in the Meggit decoder
e = eye(n);
e(:,n) = 1;

%Syndrome vector matrix
errSynd = zeros(n,r);
for i = 1:n
    % syndrome = e*H';
    errSynd(i,:) = mod(e(i,:)*H',2);
end

end
