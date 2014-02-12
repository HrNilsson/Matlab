function P = PropOut(Pch,Pi)
% Calculate the output probability, given the forward and the priori 
% propabilities.
% P = PropOut(Pch, Pi);
% P(yj) = SUMi(P(yj|xi)*P(xi))

P = zeros(1,length(Pch));

switch nargin
    case 2
        for j = 1:length(Pch)
            for i = 1:length(Pi)
                P(j) = P(j) + Pch(i,j)*Pi(i);
            end
        end
    otherwise
    error 'Argument mismatch.'
end

end