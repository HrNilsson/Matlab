function dist = HammingWeigth(G)
% Calculate the Hamming weigth of a vector.
s = size(G);
dist = 0;
temp = 0;
for i = 1:s(1)
    for j = 1:s(2)
       if G(i,j) ~= 0 
         temp = temp + 1;
       end
    end
    
    if temp == 0
        %The zero vector
    elseif temp < dist
        dist = temp;
    elseif dist == 0 %First run goes here
        dist = temp;
    end
end

end