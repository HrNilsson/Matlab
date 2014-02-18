function eq = parityEq(G)
% Calculate the parity check equations given a generator matrix
% parityEq(G) returns the parity matrix
[k,n] = size(G);
m = sym(zeros(1,n));
c = sym(zeros(1,k));

for i = 1:n
   c(i) = sym(sprintf('c%d',i-1)); 
end

for i = 1:k
   m(i) = sym(sprintf('m%d',i-1)); 
end

for i = 1:n
    temp = 0;
    for j =1:k
        temp = temp + G(j,i)*m(j);
    end
    eq(i) = c(i) == temp;
end
eq = rot90(eq,3);

end