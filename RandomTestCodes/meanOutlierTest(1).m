
NUM_VALUES = 100;

values= 1:1:NUM_VALUES;

%%
% compute sampleMean and sample median
%%
originalMean= mean(values);
theMedian = median(values);

valuesOther= 1:1:NUM_VALUES+1;

BIG_VALUE = 999999;
SMALL_VALUE= -200;

%%%
% set an outlier on the high side.
% compute sampleMean and sample Median
%%
valuesOther(1,NUM_VALUES+1) = BIG_VALUE;


otherMean = mean(valuesOther);
otherMedian = median(valuesOther);


%%%
% set an outlier on the low side
% compute sampleMean and sample Median
%%
valuesOther(1,NUM_VALUES+1) = SMALL_VALUE;


otherMeanAgain= mean(valuesOther);
otherMedianAgain = median(valuesOther);


