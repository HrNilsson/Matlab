function I = Information(Pi,unit)
% Information
% Calculate the information of a given probability.
% I = Information(Pi) returns the information in bits.
% I = Information(Pi, unit) returns the information in the unit.
% units: b = bits, n = natural, h = Hartley
%
% If Pi is a vector I will be an equally sized vector.
% I = log(1/P(xi))

I = zeros(size(Pi));

switch nargin
    case 2
        switch unit
            case 'b'
                for i= 1:length(Pi)
                    I(i) = log2(1/Pi(i));
                end
            case 'n'
                for i= 1:length(Pi)
                    I(i) = log(1/Pi(i));
                end
            case 'h'
                for i= 1:length(Pi)
                    I(i) = log10(1/Pi(i));
                end
            otherwise
        end
    otherwise % Assuming unit is bits.
        for i= 1:length(Pi)
            I(i) = log2(1/Pi(i));
        end
end

end