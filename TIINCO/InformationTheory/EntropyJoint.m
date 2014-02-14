function H = EntropyJoint(Pch,Pi,unit)
% Calculate the joint entropy.
% H = EntropyJoint(Pch, Pi) returns the joint entropy in bits.
% H = EntropyJoint(Pch, Pi, unit) returns the joint entropy in the given unit.
% units: b = bits, n = natural, h = Hartley
% H(X|Y) = SUMij(P(xi,yj)*log2(P(xi)*P(yj)/P(xi,yj))) + SUMij(P(xi,yj)*log2(1/(P(xi)*P(yj))));

if length(Pch) < 2
    error 'Pch must be a matrix.'
elseif length(Pi) < 2
    error 'Pi must be a vector.'
end

H = 0;
s = size(Pch);

switch nargin
    case 3
        H = EntropyIn(Pi,unit) + EntropyNoise(Pch,Pi,unit);
    case 2
        H = EntropyIn(Pi) + EntropyNoise(Pch,Pi);
end