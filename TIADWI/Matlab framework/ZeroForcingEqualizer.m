dim = 20; % Number of coefficients in the FIR filter
ceq = zeros(dim,dim); % Equalizer
delta = zeros(dim,1); % Delta vector
delta(floor(dim/2)) = 1;
numdelaytaps = 6; % Number of delay taps in channel

for i=1:numdelaytaps
ceq(i,1:i) = ones(1,i);
end
for i=numdelaytaps:dim
   ceq(i,i-(numdelaytaps-1):i) = ones(1,numdelaytaps);
end
x = inv(ceq)*delta

