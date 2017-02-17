
% Variance Maximum likelihood estimator tests
% @author Robert Morris - Delaware State University
% Data Analytics - Project 2 


% This Project Starts With a randomly generated 
% Population of weights for 100,000 individuals. 
% It then caluculates the mean and variance of the weights
% Each Graph/plot is explained, please Maximize figure after running for 
% Full effect.

clc; clear; close all

numPopulation= 1000000;
maxWeight= 300;
minWeight= 100;
populationWeights= zeros(1,numPopulation);



% randomly create population of ages


for i=1:1:numPopulation
    populationWeights(1,i) = randi([minWeight,maxWeight], 1);
end

meanWeight= mean(populationWeights); % find trandomly generated 
% Population of weights for 100,000 individuals. 
% It then caluculates the mean and variance of the weights
% In the overall population.
% Then it conducts a test of 10 different previously selected 
% sample sizes from the population. For each sample size, a 1000
% trials are conducted in which the program calculates the sample size 
% mean and variance, recording eahistogram(MLEVarsHisto, bins, 'facecolor', 'm');ch value during each trial.
% at the end of each trial the overall sample variance mean, sample 
% variance max outlier, and sample variance min outlier of the trials are recorded.
% After the trials are ran for each previously selected sample size, the results are 
% displayed in a figure for comparrison. The plot in the figure shows how the 
% sample variance numbers converge toward the overall population weight variance 
% as the sample size grows. he population mean weight.
weight= 0;
xtickangle(45);
for i=1:1:numPopulation
    weight= weight + (populationWeights(1,i) - meanWeight)^2;
end

weightVar= weight/numPopulation; % notice original variance calculation of size n


experiments=10;
sampleSize=100;
sampleXaxis = zeros(1,experiments);
actualWeightVars = zeros(1, experiments);
MLEVars = zeros(1, experiments);
sampleVars = zeros(1, experiments);
samples = zeros(1,sampleSize);
sampMeanWeight = 0;
sampleVariance = 0;
MLEVariance = 0;

for j=1:1:experiments % sample mean Finder
   
   for k=1:1:sampleSize
     whichPerson= randi(numPopulation-1,1) + 1; 
     samples(1,k) = populationWeights(1,whichPerson);
   end

   sampleMean= mean(samples);  % find the sample mean
   sampleWeight= 0;

   for l=1:1:sampleSize % sample Variance Finder
      sampleWeight = sampleWeight + (samples(1,l)-sampleMean)^2;
   end

   sampleVariance = (1/(sampleSize-1)) * sampleWeight; % sample variance calculation of size n-1
   MLEVariance = (1/(sampleSize)) * sampleWeight; % max likelihood sample calculation of size n
   SampleVars(1,j) = sampleVariance;
   MLEVars(1, j) = MLEVariance;
   actualWeightVars(1, j) = weightVar;
   sampleXaxis(1,j) = sampleSize;
   sampleSize = sampleSize * 2;
end   
   
fig = figure;
set(0, 'defaultfigureposition', [1300 10 900 600])
fig.NumberTitle = 'off';
fig.Name = 'Variance Maximum Likelihood Test';
hold on;

subplot(2,2,1);
x = linspace(1,10,10);
plot(x, SampleVars, 'b', x, MLEVars, 'g', x, actualWeightVars, 'r--', 'lineWidth', 2);
xticks([1,2,3,4,5,6,7,8,9,10]);
xticklabels({'100','200','400','800','1600','3200','6400','12800','25600', '51200'});
title('Variance Estimators Comparison');
xlabel('Variance Experiment Sample Sizes');
ylabel('Calculated Variance For Weights');
xtickangle(45);
legend('show');
legend({'Sample Variance', 'Variance MLE', 'Population Variance'});
lcn = 'northeast';

testMLEVarianceMax = zeros(1,experiments);
testMLEVarianceMin = zeros(1,experiments);
testMLEVarianceMean = zeros(1,experiments);
actualWeightVars = zeros(1, experiments);
sampleSize=10;

for n=1:1:experiments
    
   samples= zeros(1,sampleSize);
   numTrials=500;
   sampMeanWeight = 0;xtickangle(45);
   MLEVars = zeros(1, numTrials);
   MLEVarMax = 0;
   MLEVarMin = 0;
   MLEMean = 0;
   
   for j=1:1:numTrials % sample mean Finder

       for k=1:1:sampleSize
         whichPerson= randi(numPopulation-1,1) + 1; 
         samples(1,k) = populationWeights(1,whichPerson);
       end

       sampleMean= mean(samples);  % find the sample mean
       sampleWeight= 0;

       for l=1:1:sampleSize % sample Variance Finder
          sampleWeight = sampleWeight + (samples(1,l)-sampleMean)^2;
       end

       MLEVariance = (1/(sampleSize)) * sampleWeight; % sample variance calculation of size n-1 
       MLEVars(1,j) = MLEVariance;

   end
   
   MLEVarMax = max( MLEVars ); % max outlier of the sample variance
   MLEVarMin = min( MLEVars ); % min outlier of the sample variance
   MLEMean = mean( MLEVars ); % the average sample variance of the samples
   
   testMLEVarianceMax(1,n) = MLEVarMax;
   testMLEVarianceMin(1,n) = MLEVarMin;
   testMLEVarianceMean(1,n) = MLEMean;
   actualWeightVars(1,n) = weightVar;
   sampleSize = sampleSize*2;
   
end

subplot(2,2,2);
x = linspace(1,10,10);
plot(x, testMLEVarianceMax, 'b--', x, testMLEVarianceMin, 'g--', x, testMLEVarianceMean, 'c--*', x, actualWeightVars, 'r--', 'LineWidth',2);
xticks([1,2,3,4,5,6,7,8,9,10]);
xticklabels({'10','20','40','80','160','320','640','1280','2560', '5120'});
title('MLE Variance Convergence');
xlabel('Variance Sample Sizes');
ylabel('Calculated Variance For Weights');
xtickangle(45);
legend('show');
legend({'MLE Var Max', 'MLE Var Min', 'MLE Var Mean', 'Population Variance'});
lcn = 'northeast';


histoTestSize = 1000;
MLEVarsHisto = zeros(1, histoTestSize);
sampleSize = 5000;
samples = zeros(1,sampleSize);

for t=1:1:histoTestSize

   for p=1:1:sampleSize
     whichPerson= randi(numPopulation-1,1) + 1; 
     samples(1,p) = populationWeights(1,whichPerson);
   end

   sampleMean= mean(samples);  % find the sample mean
   sampleWeight= 0;

   for m=1:1:sampleSize % MLE Variance Helper
      sampleWeight = sampleWeight + (samples(1,m)-sampleMean)^2;
   end

   MLEVariance = (1/(sampleSize)) * sampleWeight; % max likelihood sample calculation of size n
   MLEVarsHisto(1, t) = MLEVariance;

end



SampleVarsHisto2 = zeros(1, histoTestSize);
sampleSize2 = 5000;
samples2 = zeros(1,sampleSize2);
sampleVariance2 = 0;

for t=1:1:histoTestSize

   for p=1:1:sampleSize2
     whichPerson= randi(numPopulation-1,1) + 1; 
     samples2(1,p) = populationWeights(1,whichPerson);
   end

   sampleMean= mean(samples2);  % find the sample mean
   sampleWeight= 0;

   for m=1:1:sampleSize2 % MLE Variance Helper
      sampleWeight = sampleWeight + (samples2(1,m)-sampleMean)^2;
   end

   sampleVariance2 = (1/(sampleSize2-1)) * sampleWeight; % max likelihood sample calculation of size n
   SampleVarsHisto2(1, t) = sampleVariance2;

end

    histoEffect = zeros(1,80);
    histoEffect2 = zeros(1,80);

for v = 1:1:80

    histoEffect(1, v) = weightVar;
    histoEffect2(1, v) = weightVar;
    
end

bins = 50;
binsH = 20;
subplot(2,2,3);
hold on;
histogram(MLEVarsHisto, bins, 'facecolor', 'm');
title('MLE Variance Distribution, 5k Sample Size Test ');
xlabel('MLE Variances ');
ylabel('Totals Calculated');
xtickangle(45);
histogram(histoEffect, binsH, 'facecolor', 'r', 'BinWidth', 2);

subplot(2,2,4);
hold on;
histogram(SampleVarsHisto2, bins, 'facecolor', 'g');
title('Sample Variance Distribution, 5k Sample Size Test ');
xlabel('Sample Variances ');
ylabel('Totals Calculated');
xtickangle(45);
histogram(histoEffect, binsH, 'facecolor', 'r', 'BinWidth', 2);


% plot(sampleXaxis, testSampleVarianceMin, 'g--');
% plot(sampleXaxis, actualWeightVars, 'r.');

