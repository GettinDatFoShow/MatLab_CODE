function [ summerizedData ] = sumData( dataArray, zipArray, rowCount, columnNum )

% summerizes data for zip codes given with multiple entries and returns array.

cn = columnNum; 
range = rowCount;
dataSum = 0;
curZip = zipArray(1,1);
czIndex = 1;

for i = 1:1:range
    
    if dataArray(i,1) == curZip
        dataSum = dataSum + dataArray(i, cn);
    else
        zipArray(czIndex, cn) = dataSum;
        curZip = dataArray(i,1);
        dataSum = dataArray(i, cn);
        czIndex = czIndex + 1;
    end
    
    if i == range
        zipArray(czIndex, cn) = dataSum;
    end
    
    summerizedData = zipArray;
end