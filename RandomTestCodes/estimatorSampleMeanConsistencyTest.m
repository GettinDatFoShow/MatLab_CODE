% estimatorSampleMeanConsistencyTest

% 1. initialize the population
% 2. compute the population mean "true Param"
% 3. loop [100 times, 1000 times, ...ect]
% 4.   take a sample size
% 5.   record that sample
% 6.   compute the sample mean
% 7.   record sample mean
% 8.   Histogram (of recorde sample mean)


NUM_MEMBERS= 10000;
MAX_AGE= 70;

populationAge= zeros(1,NUM_MEMBERS);


%%%%
% randomly create population of ages
%%
for i=1:1:NUM_MEMBERS
    populationAge(1,i) = randi(MAX_AGE,1);
end

populationMean= mean(populationAge);

SAMPLE_SIZE=1000;

theSamples= zeros(1,SAMPLE_SIZE);

NUM_TRIALS=1000;

sampleMean = 0;

theXBars= zeros(1,NUM_TRIALS);
thePopMeans = zeros(1,NUM_TRIALS);
trials= 1:1:NUM_TRIALS;

for t=1:1:NUM_TRIALS
    
   for s=1:1:SAMPLE_SIZE
     whichPerson= randi(NUM_MEMBERS-1,1) + 1; 
   
     theSamples(1,s) = populationAge(1,whichPerson);
   end

   sampleMean= mean(theSamples);

   theXBars(1,t) = sampleMean;
   thePopMeans(1,t)= populationMean;
%   msg = sprintf('true mean= %f  sample mean= %f',...
%          populationMean, sampleMean);
      
%   disp(msg);
end

figure(4);
histogram(theXBars);
% plot(trials,theXBars,'b');
% hold on;
% plot(trials,thePopMeans,'g');
% title('sample mean and pop mean');