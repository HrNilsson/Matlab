function [ codeVector ] = cyclicEncode( genPol, messageVector )
%   cyclicEncode Encodes messageVector using a cyclcic generator polynomial
%   genPol is a generator polynomial of sympolic variable X
%   messageVector a is binary vector
% 
%   codeVector is the encoded vector in binary for

r = degree(genPol);
k = numel(messageVector);
n = k + r;
genVec = pol2polvec(genPol);

[H,G] = cyclgen(n, genVec,'system');

codeVector = rem(messageVector * G,2);

end

