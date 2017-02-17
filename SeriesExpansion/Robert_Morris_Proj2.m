
% This matlab assignment plots the e^x function and then shows how the plot
% approximates the function closer and closer as the mclaurin series is expanded out order by order, that
% is, when a new weight is added. 
% SET UP GRAPH 
fig = figure();
set(fig, 'color', 'white')
x = -4:0.1:4; % x vector
y = exp(x); % e^x 
plot(x,y, 'lineWidth', 4) % plot function 
grid on 
xlabel('x')
ylabel('y')
hold on
yEstimate = 0*y; 
N = 1; % first order
for n = 0:N
    yEstimate = seriesExpansion(x, yEstimate, n); % series expansion, adding terms through the loops
end
plot(x, yEstimate, 'g--', 'LineWidth', 2) % plot new approximation

yEstimate = 0*y;
N = N + 1; % second order
for n = 0:N
    yEstimate = seriesExpansion(x, yEstimate, n); % series expansion, adding terms through the loops
end
plot(x, yEstimate, 'c--', 'LineWidth', 2) % plot new approximation

yEstimate = 0*y;
N = N + 1; % third order
for n = 0:N
    yEstimate = seriesExpansion(x, yEstimate, n); % series expansion, adding terms through the loops
end
plot(x, yEstimate, 'y--', 'LineWidth', 2) % plot new approximation

yEstimate = 0*y;
N = N + 1; % forth order
for n = 0:N
    yEstimate = seriesExpansion(x, yEstimate, n); % series expansion, adding terms through the loops
end
plot(x, yEstimate, 'm--', 'LineWidth', 2) % plot new approximation

yEstimate = 0*y;
N = N + 1; % fifth order
for n = 0:N
    yEstimate = seriesExpansion(x, yEstimate, n); % series expansion, adding terms through the loops
end
plot(x, yEstimate, 'r--', 'LineWidth', 2) % plot new approximation

yEstimate = 0*y;
N = N + 1; % sixth order
for n = 0:N
    yEstimate = seriesExpansion(x, yEstimate, n); % series expansion, adding terms through the loops
end
plot(x, yEstimate, 'g*', 'LineWidth', 1) % plot new approximation
legend('e^x', 'Series Expansion 1st Order', 'Series Expansion 2nd Order', 'Series Expansion 3rd Order', 'Series Expansion 4th Order', 'Series Expansion 5th Order', 'Series Expansion 6th order' )

