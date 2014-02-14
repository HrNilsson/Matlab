function H = Equivocation(Pch,Pi,unit)
% Calculate the Equivocation.
% H = Equivocation(Pch, Pi) returns the equivocation in bits.
% H = Equivocation(Pch, Pi, unit) returns the equivocation in the given unit.
% units: b = bits, n = natural, h = Hartley
% H(X|Y) = SUMij(P(xi,yj)*log2(1/P(xi|yj)));

if length(Pch) < 2
    error 'Pch must be a matrix.'
elseif length(Pi) < 2
    error 'Pi must be a vector.'
end

H = 0;
s = size(Pch);

switch nargin
    case 3
        Pback = PropBack(Pch,Pi);
        for i = 1:s(1)
            for j = 1:s(2)
                if Pback(i,j) ~= 0
                    H = H + Pi(i)*Pch(i,j)*Information(Pback(i,j),unit);
                end;
            end
        end
    case 2
        Pback = PropBack(Pch,Pi);
        for i = 1:s(1)
            for j = 1:s(2)
                if Pback(i,j) ~= 0
                    H = H + Pi(i)*Pch(i,j)*Information(Pback(i,j));
                end;
            end
        end
end