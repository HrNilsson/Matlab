function b = conjugateRoots(root,m)
% Returns all the conjugated roots, given one root.
% b = conjugateRoots(root,m).
% m depends on the GF(2^m).
b = sym(zeros(1,m));
b(1) = root;
i = 1;
b(i+1) = b(1)^(2^i);
b(i+1) = gfWrap(b(i+1),m);

w1 = 1;
while w1
    i = i+1;
    b(i+1) = b(1)^(2^i);
    b(i+1) = gfWrap(b(i+1),m);
    if b(i+1) == root
       w1 = 0;
    end
end
b = b(:,1:end-1);
end