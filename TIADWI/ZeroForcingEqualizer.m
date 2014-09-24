dim = 20;
ceq = zeros(dim,dim);
delta = zeros(dim,1);
delta(floor(dim/2)) = 1;
numdelaytaps = 6;

for i=1:numdelaytaps
ceq(i,1:i) = ones(1,i);
end
for i=numdelaytaps:dim
   ceq(i,i-(numdelaytaps-1):i) = ones(1,numdelaytaps);
end
x = inv(ceq)*delta
%%

