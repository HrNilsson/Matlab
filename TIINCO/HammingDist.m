function dist = HammingDist(G)
% Calculate the Hamming distance of a vector.
s = size(G);
dist = s(1);
for i = 1:s(1)
    if sum(G(i,:)) < dist
        dist = sum(G(i,:));
    end
end

end