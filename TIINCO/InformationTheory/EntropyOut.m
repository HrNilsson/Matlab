function H = EntropyOut(Pch,Pi,unit)
% Calculate the output entropy.
% I = EntropyOut(Pch, Pi) returns the entropy in bits.
% I = EntropyOut(Pch, Pi, unit) returns the entropy in the given unit.
% units: b = bits, n = natural, h = Hartley
% H(Y) = SUMj(P(yj)*log(1/P(yj)))

H = 0;
s = size(Pch);

if length(Pch) < 2
    error 'Pch must be a matrix.'
elseif length(Pi) < 2
    error 'Pi must be a vector.'
end

switch nargin
    case 3
        Pout = PropOut(Pch,Pi);
        for j = 1:s(2)
            H = H + EntropyIn(Pout(j), unit);
        end
    case 2 % Assuming unit is bits.
        Pout = PropOut(Pch,Pi);
        for j = 1:s(2)
            H = H + EntropyIn(Pout(j));
        end
    otherwise
    error 'Arguments mismatch.'
end
end