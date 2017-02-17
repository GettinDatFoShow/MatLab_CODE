 
% define inputs for sin (x) in radians

NUM_PERIODS = 1;
SAMPLE_RATE= 0.001;


%
% sample points over single cycle
%
x = [ 1:SAMPLE_RATE:2*pi*NUM_PERIODS ];

%
% compute ground truth values of sin(x)
%
groundTruth = sin(x);

%
% largest term of Maclaurin series approximation
% Note:  x= 0... LARGEST_TERM
%

LARGEST_TERM = 1;

%
%  old code for approach where approximate value
%  of sin(x) was computed for individual data points
%
%[rows, cols] = size(x);
%
%approximation = zeros(1, cols);
%
%for i=1:1:cols,
%  approximation(1,i) = maclaurin_sin(x(1,i),LARGEST_TERM);
%end

approximation = maclaurin_sin(x, LARGEST_TERM);

handle1 = figure(1);

subplot(2,1,1)
hold on;
grid on;
title('sin(x)');
plot(x,groundTruth,'b');

subplot(2,1,2);
hold on;
grid on;
title('Maclaurin(sin(x))');
plot(x,approximation,'b');
disp('done');
