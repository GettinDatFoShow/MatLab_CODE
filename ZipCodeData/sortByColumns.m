function [ sortedData ] = sortByColumns( zipArray, rowsTotal, columnIndex)
% Excepts a zip code array and sorts the array based on the column given in
% descending order. (largest to smallest) then returns the sorted array.

cI = columnIndex;
range = rowsTotal;
sortedData = [0; 0; 0; 0; 0];
ascendingSort = sortrows(zipArray, cI);     % function sorts array in ascending order

%   loop need to resort the array into descending order 

for i = 1:1:range
    
    newI = range + 1 - i;
    
    for k = 1:1:5 
        sortedData(i, k) = ascendingSort(newI, k);
    end
    
end

