

%%
% Bar Chart
%%

data = { 'dog', 'cat', 'dog', 'mouse', 'dog', 'mouse', 'cat'};

cData= categorical(data);

%summary(cData);

%figure(1);
%histogram(cData);



%%%
% Pie Chart
%%

figure(2);
pie(cData);

%%%
%  Scatter Chart
%%
figure(3);
x = [1:5:80];
m = 4;
b = 7;

y = m*x + b;

scatter(x,y);


%%%
% Line chart
%%
figure(4);
scatter(x,y);
hold on;
plot(x,y);

