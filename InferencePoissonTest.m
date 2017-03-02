NUM_SAMPLES = 1000;
lambda = 10;

numCustomers = poissrnd(lambda, 1, NUM_SAMPLES);

sampleMean = mean(numCustomers);

numCustomersEst = poissrnd(sampleMean, 1, NUM_SAMPLES);

figure(1);
subplot(1,2,1)
hist(numCustomers);
title('dist of orginal measurements');

subplot(1,2,2);
hist(numCustomersEst);
title('dist using estimator');

avgDollarPerCust = 5;
dollarsPerDeltaT = 0;
totalRevenue = 0;

for i=1:1:NUM_SAMPLES

    dollarsPerDeltaT = numCustomersEst(1, i) * avgDollarPerCust;
    totalRevenue = totalRevenue + dollarsPerDeltaT;
    
end

display(done);
