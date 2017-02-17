
NUM_VALUES = 100;

values = 1:1:NUM_VALUES;

orginalMean = mean(values);

valuesOther = 1:1:NUM_VALUES+1;

BIG_VALUE = 999999;

valuesOther(NUM_VALUES+1) = BIG_VALUE;

meanOutlier = mean(valuesOther);