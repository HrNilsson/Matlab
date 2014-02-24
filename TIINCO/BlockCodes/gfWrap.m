function y = gfWrap(x,m)
% Returns the "wrapped" symbol/element of a GF field.
% y = gfWrap(x,m)
% x is the expression to be wrapped. m depends on the GF field: GF(2^m)
%
% Ex: GF(2^3) (0,1,a,a^2,a^3,a^4,a^5,a^6)
% gfWrap(a^9,3) = a^2
a = symvar(x);
while degree(x) > 2^m-2
    x = x/a^(2^m-1);
end
y = x;
end