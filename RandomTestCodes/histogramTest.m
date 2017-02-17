

A= 3;
B= 15;
MU_EXP= 10;
MU_NORM= 5;
SIGMA=20;

NUM_SAMPLES= 100000;

theDataUnif = unifrnd(A,B,1,NUM_SAMPLES);

theDataExp= exprnd(MU_EXP,1,NUM_SAMPLES);

theDataNorm= normrnd(MU_NORM,SIGMA,1,NUM_SAMPLES);

NUM_BINS= 40;
hist(theDataNorm,NUM_BINS);
