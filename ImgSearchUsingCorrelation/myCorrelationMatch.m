function [score, rmScore] = myCorrelationMatch(imgA, imgB)
%
%  write your correlation implementation
%
%  NO you cannot use MATLAB's correlation routine
%  the call to corr(.) is here as a benchmark
%  to show you this does really work
%
%  you may not use MATLAB's builtin routines
%  you must implement everything yourself.
%

[ROWS, COLS] = size(imgA);

aVec = double(reshape(imgA,ROWS*COLS,1));
bVec = double(reshape(imgB,ROWS*COLS,1));


rho = corr(aVec,bVec);
rmCorr = corr(aVec, bVec);

score = rho;
rmScore = rmCorr;
end