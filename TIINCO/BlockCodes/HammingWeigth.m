function weigth = HammingWeigth(G)
% Calculate the Hamming weigth of a vector.
% weigth = HammingWeigth(G)
s = size(G);
weigth = 0;

for i = 1:s(1)
    temp = 0;
    for j = 1:s(2)
       if G(i,j) ~= 0 
         temp = temp + 1;
       end
    end
    
    if temp == 0
        %The zero vector
    elseif temp < weigth
        weigth = temp;
    elseif weigth == 0 %First run goes here
        weigth = temp;
    end
end

end