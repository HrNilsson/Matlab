function d = degree(eq)

a = strtrim(strsplit(char(eq),'+'));
d = 0;
for i=1:length(a)
    f = strsplit(char(a(i)),'^');
    if length(f) == 2
        if d < double(sym(f(2)))
            d = double(sym(f(2)));
        end
    end
end
end