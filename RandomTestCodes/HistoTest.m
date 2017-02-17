A= 3;
B = 15;
muExp = 10;
muNorm = 5;
sigma = 20;

numSamples=10000;

theDataUnif = unifrnd(A, B, 1, numSamples);

theDataExp = exprnd(muExp, 1, numSamples);

theDataNrm = normrnd(muNorm, sigma, 1, numSamples);

numBins=40;

hist(theDataNrm, numBins);