function H = EntropyNoise(Pch,Pi,unit)
% Calculate the noise entropy.
% I = EntropyNoise(Pch, Pi) returns the entropy in bits.
% I = EntropyNoise(Pch, Pi, unit) returns the entropy in the given unit.
% units: b = bits, n = natural, h = Hartley
% H(Y|X) = SUMij(P(xi,yj)*log(1/P(yj|xi)))

H = 0;
s = size(Pch);

if length(Pch) < 2
    error 'Pch must be a matrix.'
elseif length(Pi) < 2
    error 'Pi must be a vector.'
end

switch nargin
    case 3
        for j = 1:s(2)
            for i = 1:s(1)
                H = H + Pi(i)*EntropyIn(Pch(i,j), unit);
            end 
        end
    case 2 % Assuming unit is bits.
        for j = 1:s(2)
            for i = 1:s(1)
                H = H + Pi(i)*EntropyIn(Pch(i,j));
            end
        end
    otherwise
    error 'Arguments mismatch.'
end
end