function [ meanX ] = rmMean( vectorX )
% finds the mean of a n x 1 or 1 x n vector 

[rows, cols] = size(vectorX);

if cols == 1 
    
    total = rows;
    
elseif rows == 1
    
    total = cols;
        
end

vSum = rmVSum( vectorX );

meanX = vSum/total;

end

