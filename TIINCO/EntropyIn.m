function H = EntropyIn(Pi,unit)
% Calculate the input/source entropy.
% I = EntropyIn(Pi) returns the entropy in bits.
% I = EntropyIn(Pi, unit) returns the entropy in the given unit.
% units: b = bits, n = natural, h = Hartley
% H(X) = SUMi(P(xi)*log(1/P(xi)))
H = 0;

switch nargin
    case 2
        if unit == 'b'
            for i = 1:length(Pi)
                if Pi(i) ~= 0
                    H = H + Pi(i)*log2(1/Pi(i));
                end
            end
        elseif unit == 'n'
            for i = 1:length(Pi)
                if Pi(i) ~= 0
                    H = H + Pi(i)*log(1/Pi(i));
                end
            end
        elseif unit == 'h'
            for i = 1:length(Pi)
                if Pi(i) ~= 0
                    H = H + Pi(i)*log10(1/Pi(i));
                end
            end
        else 
            error 'Unknow unit type.'
        end
    otherwise % Assuming unit is bits.
        for i = 1:length(Pi)
            if Pi(i) ~= 0
                H = H + Pi(i)*log2(1/Pi(i));
            end
        end
end
end