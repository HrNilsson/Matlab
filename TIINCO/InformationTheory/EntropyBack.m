function H = EntropyBack(Pch,Pi,unit)
% Calculate the posteriori entropies. (Backward entropies) 
% I = EntropyBack(Pch, Pi) returns the entropy in bits.
% I = EntropyBack(Pch, Pi, unit) returns the entropy in the given unit.
% units: b = bits, n = natural, h = Hartley
% H(xi|Y) = SUM(P(xi|yj)*I(xi|yj)), P(xi|yj) = P(yj|xi)*P(xi)/P(yj)

s = size(Pch);
H = zeros(1,s(1));

if length(Pch) < 2
    error 'Pch must be a matrix.'
end

switch nargin
    case 3
        Pback = PropBack(Pch,Pi);
        for i = 1:s(1)
            for j = 1:s(2)
                H(i) = H(i) + Pback(j,i)*Information(Pback(j,i),unit);
            end 
        end
    case 2 % Assuming unit is bits.
        Pback = PropBack(Pch,Pi);
        for i = 1:s(1)
            for j = 1:s(2)
                H(i) = H(i) + Pback(j,i)*Information(Pback(j,i));
            end 
        end
    otherwise
    error 'Arguments mismatch.'
end
end