function [rmScore] = rmCorrelationMatch(imgA, imgB)
%
% HERE IS MY VERY OWN CORRELATION ROUTINE!! ENJOY!
%

[ROWS, COLS] = size(imgA);

aVec = double(reshape(imgA,ROWS*COLS,1));
bVec = double(reshape(imgB,ROWS*COLS,1));

rmCorr = corr(aVec, bVec);

rmScore = rmCorr;
end

