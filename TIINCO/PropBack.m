function P = PropBack(Pch,Pi)
% Calculate the backward/posteriori probability, given the forward and the 
% priori propabilities.
% P(xi|yj) = P(yj|xi)*P(xi)/P(yj)

s = size(Pch);
P = zeros(size(Pch));

switch nargin
    case 2
        Pout = PropOut(Pch,Pi);
        for j = 1:s(2)
            for i = 1:s(1)
                P(i,j) = Pch(i,j)*Pi(i)/Pout(j);
            end
        end
    otherwise
end

end