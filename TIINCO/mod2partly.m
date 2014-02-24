function y = mod2partly(eq)
% Returns the input equation, where each element is modulo 2. Matlab mod
% function does not work if an element consist of 3 multiplicated symbolic
% values. This does. 
% y = mod2partly(eq)
% Only accepts a single equation. Not a vector.
a = strtrim(strsplit(char(eq),'+'));
y = 0;
for i=1:length(a)
    tmp = 1;
    
    b = strtrim(strsplit(char(a(i)),'*'));
    if length(b) == 3
        tmp = mod(sym(char(b(1)))*sym(char(b(2))),2);
        tmp = mod(sym(char(b(3)))*tmp,2);
    else
        for j=1:length(b)
            tmp = tmp*sym(char(b(j)));
        end
    end
    
    R = mod(sym(char(tmp)),2);
    y = y + R;
end
end