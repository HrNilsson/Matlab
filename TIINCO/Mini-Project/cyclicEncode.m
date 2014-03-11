function [ codeVector ] = cyclicEncode( genPol, messageVector )
% Returns a code vector, given a meassage vector and a cyclic generator
% polynomium.
% genPol is a generator polynomial in polynomial form.
% messageVector a is in binary form.
% codeVector is the encoded vector in binary for

r = degree(genPol);
k = numel(messageVector);
n = k + r;
% Convert the generator polynomium to vector form.
genVec = pol2polvec(genPol);
% Calculate the generator matrix in systematic form.
[H,G] = cyclgen(n, genVec,'system');
% Encode the meassage vector.
codeVector = rem(messageVector * G,2);

end

