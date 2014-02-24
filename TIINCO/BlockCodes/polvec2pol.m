function pol = polvec2pol(PolVec)
% Returns the symbolic polynomial representation of a polynomial vector.
% Assuming the PolVec is ascending(left to rigth).
pol = poly2sym(rot90(PolVec,2));

end