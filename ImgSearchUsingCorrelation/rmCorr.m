function [ rmCorr ] = rmCorr( xVector, yVector )
% the rmCorr function (short for ROBERT MORRIS Correlation) exceptions two
% n x 1 or 1 x n vectors and calculates there correlation using functions
% and formulas designed by Robert Morris. 

[ abT, a2T, b2T ] = rmCalculateTotals( xVector, yVector );

ab2T = rmMult(a2T, b2T);
denom = sqrt(ab2T);
rmCorr = rmMult(abT, (1/denom));

end

