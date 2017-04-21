function [ vSum ] = rmVSum( vectorX )
% takes a n x 1 or 1 x n vector and returns a sum of all the contents

vSum = 0;
[rows, cols] = size(vectorX);

if cols == 1 
    
    loopVar = rows;
    choice = 1;
    
elseif rows == 1
    
    loopVar = cols;
    choice = 2;
    
end
    
if choice == 1
    
    for i=1:1:loopVar
    
        vSum = rmSum(vSum, vectorX(i, 1));
        
    end
    
elseif choice == 2
    
    for i=1:1:loopVar
        
        vSum = rmSum(vSum, vectorX(1, i));
        
    end
    
end

