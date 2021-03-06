function [E V P] = gfPol2Table(primPoly)
% Returns a GF field table, represented in Exponential form (E), binary
% vector form(V), and Polynomial form (P).
% [E V P] = gfPoly2Table(primPoly)
% primPoly is in binary form in ascending order
% Ex: Pi(X) = 1 + X^2 + X^5 -> primPoly = [1 0 1 0 0 1]

m = length(primPoly)-1;

% Exponential form:
E = sym(zeros(2^m,1));
E(2) = sym(1);
E(3) = sym(sprintf('a'));
for i = 4:2^m
    E(i) = sym(sprintf('a^%d',i-2));
end

% Vector form:
V = zeros(2^m,m+1);
V(2,1) = 1;
primPoly(end) = 0;
for i=3:2^m
    V(i,:) = circshift(V(i-1,:),[1 1]);
    if V(i,end) == 1
        V(i,end) = 0;
        V(i,:) =  mod(V(i,:) + primPoly,2);
    end
end
V = V(:,1:m);

% Polynomial form:
a = E(2:m+1);
P = sym(zeros(2^m,1));
for i = 1:2^m
    temp = 0;
    for j = 1:m
        temp = temp + V(i,j)*a(j);
    end
    P(i) = temp;
end

% Ren� Nilsson - 10783