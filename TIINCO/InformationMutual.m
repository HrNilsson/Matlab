function I = InformationMutual(Pch,Pi,unit)
% Calculate the mutual information.
% I = InformationMutual(Pch, Pi) returns the mutual information in bits.
% I = InformationMutual(Pch, Pi, unit) returns the mutual information in 
% the given unit.
% units: b = bits, n = natural, h = Hartley
% I(X,Y) = SUMij(P(xi,yj)*log(P(xi|yj)/P(xi))) = H(X)-H(X|Y) = H(Y)-H(Y|X)

if length(Pch) < 2
    error 'Pch must be a matrix.'
elseif length(Pi) < 2
    error 'Pi must be a vector.'
end
switch nargin
    case 3
        I = EntropyOut(Pch,Pi,unit) - EntropyNoise(Pch,Pi,unit);
    case 2
        I = EntropyOut(Pch,Pi) - EntropyNoise(Pch,Pi);

end