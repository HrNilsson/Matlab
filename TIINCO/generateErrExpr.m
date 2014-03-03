function [ errSynd ] = generateErrExpr( n, genPol )

n = 15;
r = degree(genPol);

genVec = pol2polvec(genPol);

[H,G] = cyclgen(n, genVec,'system');

% Possible error vectors
e = eye(n);
e(:,n) = 1;

errSynd = zeros(n,r);

for i = 1:n
   
    errSynd(i,:) = mod(e(i,:)*H',2); % page 55 (33)
   
end

end
