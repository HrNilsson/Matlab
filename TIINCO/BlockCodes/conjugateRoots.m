function b = conjugateRoots(root,m)
syms x;
b = sym(zeros(m,1));
b(1) = root;
i = 1;
b(i+1) = b(1)^(2^i);
if degree(b(i+1)) > 2^m-2
    b(i+1) = b(i+1)/x^(2^m-1);
end

while b(i+1) ~= root
    i = i+1;
    b(i+1) = b(1)^(2^i);
    while degree(b(i+1)) > 2^m-2
        b(i+1) = b(i+1)/x^(2^m-1);
    end
end
b = b(1:end-1,:);
end