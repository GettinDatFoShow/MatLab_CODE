clc; clear; close all


%%% ASSUMED VARIABLES
NUM_SAMPLES = 10000;
mu = 65;
variance = 400; 

%%% original population measurements of normal temperature distribution
Temperatures = getSensorMeasurements(mu, variance, NUM_SAMPLES);


%%%%%%%%%%% MOMENT ESTIMATORS %%%%%%%%%%%%%%%%%

%%% FIRST MOMENT - X BAR
sampleMean = mean(Temperatures);

%%% SECOND MOMENT CALCULATION = Samaple Variance
sampleTemps = 0;
for l=1:1:NUM_SAMPLES % sample Variance Finder
  sampleTemps = sampleTemps + (Temperatures(1,l)-sampleMean)^2;
end
SampleVariance = (1/(NUM_SAMPLES)) * sampleTemps;

%%% moment estimation for normal distribution
TemperaturesEst= getSensorMeasurements(sampleMean, SampleVariance, NUM_SAMPLES/10);
%%%%%%%%%% END MOMENT ESTIMATORS %%%%%%%%%%%%%%

fig = figure;
set(0, 'defaultfigureposition', [1300 10 900 600])
fig.NumberTitle = 'off';
fig.Name = 'Normal Dist Comparison with Method of Moments Estimators';
%%%% HISTOGRAM OF ORIGINAL POPULATION DATA FOR NORM DIST
subplot(2,1,1);
hist(Temperatures);
title('Norm Distribution of Original Measurements');
xlabel('Sensor Temperature Mesurements');
ylabel('# temp values recorded');
ytickangle(45);

%%%% HISTOGRAM OF MOMENT ESTIMATION DATA FOR NORM DIST
subplot(2,1,2);
hist(TemperaturesEst);
xlabel('Sensor Temperature Mesurements');
ylabel('# of temp values recorded');
title('Norm Distribution Using Moment Estimators');
ytickangle(45);

disp('done');

