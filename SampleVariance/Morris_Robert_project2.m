
% estimatorSampleVarianceConsistencyTest 
% @author Robert Morris - Delaware State University
% Data Analytics - Project 2 


% This Project Starts With a randomly generated 
% Population of weights for 100,000 individuals. 
% It then caluculates the mean and variance of the weights
% In the overall population.
% Then it conducts a test of 10 different previously selected 
% sample sizes from the population. For each sample size, a 1000
% trials are conducted in which the program calculates the sample size 
% mean and variance, recording each value during each trial.
% at the end of each trial the overall sample variance mean, sample 
% variance max outlier, and sample variance min outlier of the trials are recorded.
% After the trials are ran for each previously selected sample size, the results are 
% displayed in a figure for comparrison. The plot in the figure shows how the 
% sample variance numbers converge toward the overall population weight variance 
% as the sample size grows.

clc; clear; close all

numPopulation= 100000;
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
% mean and variance, recording each value during each trial.
% at the end of each trial the overall sample variance mean, sample 
% variance max outlier, and sample variance min outlier of the trials are recorded.
% After the trials are ran for each previously selected sample size, the results are 
% displayed in a figure for comparrison. The plot in the figure shows how the 
% sample variance numbers converge toward the overall population weight variance 
% as the sample size grows. he population mean weight.
weight= 0;

for i=1:1:numPopulation
    weight= weight + (populationWeights(1,i) - meanWeight)^2;
end

weightVar= weight/numPopulation; % notice original variance calculation of size n
    
sampleSize=10;

% Test Sample Variance Varibles to show
% Convergence apon larger sample sizes
experiments=10;
sampleXaxis = zeros(1,experiments);
testSampleVarianceMax = zeros(1,experiments);
testSampleVarianceMin = zeros(1,experiments);
testSampleVarianceMean = zeros(1,experiments);
actualWeightVars = zeros(1, experiments);

for n=1:1:experiments
    
   samples= zeros(1,sampleSize);
   numTrials=100;
   sampMeanWeight = 0;
   sampleVars = zeros(1, numTrials);
   sampleVarMax = 0;
   sampleVarMin = 0;
   sampleVarMean = 0;
   
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

       sampleVariance = (1/(sampleSize-1)) * sampleWeight; % sample variance calculation of size n-1 
       sampleVars(1,j) = sampleVariance;

   end
   
   sampleVarMax = max( sampleVars ); % max outlier of the sample variance
   sampleVarMin = min( sampleVars ); % min outlier of the sample variance
   sampleVarMean = mean( sampleVars ); % the average sample variance of the samples
   
   testSampleVarianceMax(1,n) = sampleVarMax;
   testSampleVarianceMin(1,n) = sampleVarMin;
   testSampleVarianceMean(1,n) = sampleVarMean;
   actualWeightVars(1,n) = weightVar;
   sampleXaxis(1,n) = sampleSize;
   sampleSize = sampleSize*2;
   
end

fig = figure;
set(0, 'defaultfigureposition', [1300 10 900 600])
fig.NumberTitle = 'off';
fig.Name = 'Sample Variance Consistency Experment From Population Weights';

x = linspace(1,10,10);
plot(x, testSampleVarianceMax, 'b--', x, testSampleVarianceMin, 'g--', x, testSampleVarianceMean, 'c--*', x, actualWeightVars, 'r--', 'LineWidth',2);
xticks([1,2,3,4,5,6,7,8,9,10]);
xticklabels({'10','20','40','80','160','320','640','1280','2560', '5120'});
title('Sample Variation to Actual Variation Convergence');
xlabel('Variance Experiment Sample Sizes');
ylabel('Calculated Variance For Weights');
xtickangle(45);
legend('show');
legend({'Samp Var Max', 'Samp Var Min', 'Samp Var Mean', 'Pop Weight Variance'});
lcn = 'northeast';



% plot(sampleXaxis, testSampleVarianceMin, 'g--');
% plot(sampleXaxis, actualWeightVars, 'r.');

