function [meas] = getSensorMeasurements(mu, variance, samples)

measurements = samples;
sigma = sqrt(variance);

meas= normrnd(mu, sigma ,1, measurements);


