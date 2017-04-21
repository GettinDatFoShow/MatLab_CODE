% author Robert Morris / Dr. Holness
% this sampling test was merged with my main project in this file. I built
% the rest of the testing right on top. click run and enjoy
clc;
clear; 
close all;
%%
%  Useful constants
%%
NUM_HIST_BINS= 40;

% size of each sample
SAMPLE_SIZE= 100;

%
% Ground Truth 
%
% mu:  population mean
% 
% sigmaSq: population variance
%
MU= 57;
SIGMA= 15;
SIGMA_SQ= power(SIGMA,2);


MU_HAT_FIGURE=1;
SIGMA_SQ_FIGURE=2;

% the number of times sampled will be
% taken
TIME_INSTANTS= 400;

muHatValues = zeros(TIME_INSTANTS,1);
sigmaSqHatValues = zeros(TIME_INSTANTS,1);

centerMuHatValues = 0;
centerSigmaSqHatValues = 0;

%
%  Generate SAMPLE_SIZE many samples at time
%
%  t(1):  X(1,1), ..., X(1,SAMPLE_SIZE)
%
%  t(2):  X(2,1), ..., X(2,SAMPLE_SIZE)
%   .
%   .
%   .
%  t(m):  X(m,1), ..., X(m,SAMPLE_SIZE)
%
%  where m= SAMPLE_SIZE
%
%  For each of m-many rounds, compute the
%  estimator muHat and sigmaSqHat, 
%  then display the sampling disribution

for t=1:1:TIME_INSTANTS
    
  % take a smample ant time instant, t
  X = generateNormalSamples(MU,SIGMA_SQ, SAMPLE_SIZE);
    
  %compute MLE estimate for mu
  muHat = (1/SAMPLE_SIZE) * sum(X);
  
  %compute MLE estimate for sigmaSq
  sigmaSqHat = (1/SAMPLE_SIZE) * sum( power((X- muHat),2) );
  
  %record the MLE estimators
  muHatValues(t,1) = muHat;
  sigmaSqHatValues(t,1) = sigmaSqHat;
  
end

muHatCenter = mean(muHatValues);
muHatStdErr = sqrt(var(muHatValues));
sigmaSqHatCenter = mean(sigmaSqHatValues);
sigmaSqHatStdErr = sqrt(var(sigmaSqHatValues));
zScores = getZscores();

muConIntervals = getConfidenceIntervals( muHatCenter, zScores, muHatStdErr); % ground truth parameters
sigConIntervals = getConfidenceIntervals( sigmaSqHatCenter, zScores, sigmaSqHatStdErr); % ground truth parameters

intervalTest = testConIntervals( muConIntervals, muHatValues, 400); % test how the samples hold up to the ground truth parameters
intervalTest2 = testConIntervals( sigConIntervals, sigmaSqHatValues, 400); % test how the samples hold up to the ground truth parameters


muTText = 'sampling dist for $$\hat{\mu}$$';
muXText = '$$\hat{\mu}$$ values';
muYText = 'frequency';


msg = sprintf('muHatCenter= %f  muHatStdErr=%f',muHatCenter,muHatStdErr);
disp(msg);

sigmaSqTText= 'sampling dist for $$\hat{\sigma}^{2}$$';
sigmaSqXText= '$$\hat{\sigma}^{2}$$ values';
sigmaSqYText= 'frequency';

msg = sprintf('sigmaSqHatCenter=%f  sigmaSqHatStdErr=%f',sigmaSqHatCenter,sigmaSqHatStdErr);
disp(msg);
fprintf('\n');
fprintf('Calculations for muHat Confidence Intervals \n');
fprintf('------------------------------------------- \n');

for i=1:1:9
    msg = sprintf('Expected Confidence Interval=%.2f',intervalTest(i,2));
    disp(msg);
    msg = sprintf('Calculated Confidence Interval=%.4f',intervalTest(i,1));
    disp(msg);
    msg = sprintf('Total=%.1f  Out of 400 trials, Sample Size = 100',intervalTest(i,3));
    disp(msg);
    fprintf('- \n');
end

fprintf('Calculations for sigmaSqrHat Confidence Intervals \n');
fprintf('------------------------------------------- \n');

for i=1:1:9
    
    msg = sprintf('Expected Confidence Interval=%.2f',intervalTest2(i,2));
    disp(msg);
    msg = sprintf('Calculated Confidence Interval=%.4f',intervalTest2(i,1));
    disp(msg);
    msg = sprintf('Total=%.0f  Out of 400 trials, Sample Size = 100',intervalTest2(i,3));
    disp(msg);
    fprintf('- \n');
    
end

x = 1:1:9;

fig = figure;
set(0, 'defaultfigureposition', [1300 10 900 600])
fig.NumberTitle = 'off';
fig.Name = 'Confidence Intervals & Ground Truth Comparison';
hold on;

subplot(2,2,1)

    plot(x, intervalTest(1:1:9, 2), 'r-', x, intervalTest(1:1:9, 1), 'b+-');
    xticks(1:1:9);
    xticklabels({'10%', '20%', '30%', '40%', '50%', '60%', '70%', '80%', '90%' });
    title('muHat Confidence Interval Test');
    xlabel('Percentage Expected');
    ylabel('Percentage Calculated');
    xtickangle(45);
    legend('show');
    legend({'Expected Percentage', 'Calculated Percentage'});
    
subplot(2,2,2)

    plot(x, intervalTest2(1:1:9,2), 'r-', x, intervalTest2(1:1:9,1), 'b+-');
    xticks(1:1:9);
    xticklabels({'10%', '20%', '30%', '40%', '50%', '60%', '70%', '80%', '90%' });
    title('sigmaSqHat Confidence Interval Test');
    xlabel('Percentage Expected');
    ylabel('Percentage Calculated');
    xtickangle(45);
    legend('show');
    legend({'Expected Percentage', 'Calculated Percentage'});
    
subplot(2,2,3)

    [ muHatCenter2, muHatStdErr2]= visualizeSamplingDistribution(muHatValues,muTText,muXText,muYText,MU_HAT_FIGURE);

subplot(2,2,4)

    [sigmaSqHatCenter2, sigmaSqHatStdErr2]= visualizeSamplingDistribution(sigmaSqHatValues,sigmaSqTText,sigmaSqXText,sigmaSqYText,SIGMA_SQ_FIGURE);


