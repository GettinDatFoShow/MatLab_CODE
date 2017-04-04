function [ confidenceInts ] = getConfidenceIntervals( estCenter, zValues, stanErr)
%  except an array of sample vaules and return an array of z scores.
%  

confidenceInts = zeros(9,4); % a, b for the specified zScore
percent = .1;

for i=1:1:9
    
    b = estCenter + (zValues(1,i)*(stanErr)); % positive margin of error
    a = estCenter - (zValues(1,i)*(stanErr)); % negative margin of error
    confidenceInts(i,1) = a;
    confidenceInts(i,2) = b;
    confidenceInts(i,3) = (zValues(1,i));
    confidenceInts(i,4) = percent;
    percent = percent +.1;
    
end


