function [ abTotal, a2Total, b2Total ] = rmCalculateTotals( xVector, yVector )
% calculates totals from x and y vectors
% a total is the sum of each x minus the x mean
[rowsX, colsX] = size(xVector);

total = rmGetLength(rowsX, colsX);

abTotals = zeros(total, 1);
a2Totals = zeros(total, 1);
b2Totals = zeros(total, 1);

xMean = rmMean(xVector);
yMean = rmMean(yVector);


for i = 1:1:total
    
    currX = xVector(i,1);
    currY = yVector(i,1);
    a = rmSub(currX, xMean);
    b = rmSub(currY, yMean);
    ab = rmMult(a,b);
    a2 = rmSquare(a);
    b2 = rmSquare(b);
    abTotals(i,1) = ab;
    a2Totals(i,1) = a2;
    b2Totals(i,1) = b2;
    
end

abTotal = rmVSum(abTotals);
a2Total = rmVSum(a2Totals);
b2Total = rmVSum(b2Totals);