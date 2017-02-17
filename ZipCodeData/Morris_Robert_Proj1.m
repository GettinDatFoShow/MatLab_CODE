
% This program should produce a total of 6 different visualizations on two
% seperate figures. Figure 1 includes the 4 different bar charts of data comparrisons
% chosen from the IRS Data. Theses data points include: Earnings, Taxes
% Paid, Single Filed Returns, and the Jointly Filed Returns of 24 different
% zip codes within the city and surrounding areas of Charlotte, NC.
% The second figure includes two Pie Charts visualizations of the total
% Married Returns filed versus the Single Returns Filed in all of
% Charlotte, NC. 

% no extra steps need to be taken as program should run as is. 
%
% Developed, researched, and written by Robert Morris. 
% Finalized Date  (1/18/2017)

close
clear
data = csvread('charData.csv'); 
dataBounds = size(data);
rowsD = dataBounds(1);
columnsD = dataBounds(2);
charZipData = getCharZips(data, rowsD);


for c = 2:1:columnsD    % sumerizes data for each zip code
    charZipData = sumData(data, charZipData, rowsD, c);
end

zipBounds = size(charZipData);
rowsZD = zipBounds(1);
columnsZD = zipBounds(2);

zipC = 1;        % zip column 
sRetC = 2;       % single filed returns
jRetC = 3;       % married jointly filed returns
income = 4;      % salary plus wages 
taxPaid = 5;     % overall taxes paid

% Bar chart creation for sorted zip code data visualization
 
figure(1);
set(0, 'defaultfigureposition', [1300 5 900 900])

charZipData = sortByColumns( charZipData, rowsZD, income ); % sort by income
subplot(2,2,1)
createZBChart( charZipData, income, 1000, 'Salary and Wages in 10k', 'Charlotte Earnings by Zip Code')

charZipData = sortByColumns( charZipData, rowsZD, taxPaid ); % sort by taxes paid
subplot(2,2,2)
createZBChart( charZipData, taxPaid, 1000, 'Taxes Paid in 10k', 'Charlotte Tax Paid by Zip Code')

charZipData = sortByColumns( charZipData, rowsZD, sRetC ); % sort by singles returns
subplot(2,2,3)
createZBChart( charZipData, sRetC, 10, 'Returns Filed x 10','Single Filing Returns by Zip')

charZipData = sortByColumns( charZipData, rowsZD, jRetC ); % sort by joint returns
subplot(2,2,4)
createZBChart( charZipData, jRetC, 10, 'Returns Filed x 10','Jointly Filed Returns by Zip')

% Pie chart creation for Married versus Single tax returns

figure(2);
set(0, 'defaultfigureposition', [1300 10 900 600])

sumJoint = 0;
for i=1:1:rowsZD
    sumJoint = sumJoint + charZipData(i, jRetC);
end

sumSingle = 0;
for i=1:1:rowsZD
    sumSingle = sumSingle + charZipData(i, sRetC);
end

totalReturns = [sumJoint, sumSingle];

labels = {'Married Returns', 'Single Returns'};
explode = [0,1];
subplot(2,2,1)
pie(totalReturns, explode, labels);
title('Charlotte NC, Married to Single Tax filing')
subplot(2,2,2)
pie3(totalReturns, explode);
title('Married to Single by percentage')







