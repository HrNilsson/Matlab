function y = gfWrapExpr(x,m)
% Returns the "wrapped" symbols/elements of a GF field.
% y = gfWrap(x,m)
% x is the expression to be wrapped. m depends on the GF field: GF(2^m)
%
% Ex: GF(2^3) (0,1,a,a^2,a^3,a^4,a^5,a^6)
% gfWrap(a^9 + a^13 + 1,3) = a^2

tmp = strtrim(strsplit(char(x),'+'));

y = 0;
for i=1:length(tmp)
   y = y + gfWrap(sym(tmp(i)),m);
end

end