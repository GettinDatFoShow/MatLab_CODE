function [ est ] = seriesExpansion( x, y, n )
%SERIESEXPANSION mclaurin series expansion formula for e^x
% y being the previous term 

est = y + (x.^n)./factorial(n);


end

