NUM_HOURS = 8;
NUM_DAYS = 500;
%
% Customers per hour
%
R1 = 10; 
%
% price of lemonade
FIXED_PRICE = 2.00; % lemonaid price

FIX_TOTAL_EXPECTED_REV = 0;

PriceDecreasePercent = .1; % percent decrease once the price hits 15 % increase

rateByHour = [ R1, R1, R1, R1, R1, R1, R1, R1,];

priceByHour= [FIXED_PRICE FIXED_PRICE FIXED_PRICE FIXED_PRICE ...
              FIXED_PRICE FIXED_PRICE FIXED_PRICE FIXED_PRICE];

y = 0;
%
% simulate over some number of days of operation
% 
for day = 1:1:NUM_DAYS
    %
    % simulate a day's worth of business
    %
    dayRev = 0;
    for hour=1:1:NUM_HOURS
        
        lambda = rateByHour(hour);
        
        numCustomersInHour = poissrnd(lambda);

        price = priceByHour(hour);
        
        oneHoursRevenue = numCustomersInHour * price;
        dayRev = dayRev + oneHoursRevenue;
        msg = sprintf('revenue(day=%d, hour=%d, custs=%d)= %.2f',...
                         day,hour,numCustomersInHour,oneHoursRevenue);
        disp(msg);
    end
    y = [y, dayRev];
    
    
end
fig = figure();
set(fig, 'color', 'white')
grid on 
xlabel('Days')
ylabel('Price')
hold on
x = 0:NUM_DAYS;
plot(x, y,'r-','lineWidth', 2);


%
% Dynamic Pricing Model
%

%
% new lamba rates
%
DYN_PRICE = 2;
lambda = 10;
DYN_PERCENT = .1; % Dynamic price increase rate
INC_PRICE = .05; % incremental value 
incRevPerHour = [ 0 0 0 0 0 0 0 0 ];
DYN_Price_Per_Hour = [ 0 0 0 0 0 0 0 0 ];
DYN_Cust_Per_Hour = [ 0 0 0 0 0 0 0 0 ];
deValueLimit = ((DYN_PRICE*.15)*10);
price = 0;
DYN_Y = 0;

for day = 1:1:NUM_DAYS
    DYN_Day_Rev = 0;
    for hour = 1:1:8
        %
        % simulate a day's worth of business with dynamic pricing
        %
         decPercent = 0; % decremental percentage reset
         incChange = 0; % incremental percentage reset
         numCustomersInHour = poissrnd(lambda); % get the number of customers in an hour
         percentChange = (numCustomersInHour/lambda)-1; % set the percentage increase in customers value for calculation 
         DYN_Cust_Per_Hour(hour) = numCustomersInHour;% save customer per hour value

         if (percentChange > DYN_PERCENT) % check to see if customer percent increase in larger than the dynamic price increase percent
             incChange = floor(percentChange/DYN_PERCENT); % calculate the incremental change as multiple from of the dynamic price increase percent
             if (incChange > deValueLimit) % check to see if the price increment limit ( percent before 10 percent loss in customer purchases)
                decPercent = floor(incChange / deValueLimit)*.1; % set loss percent total
             end
             incChange = incChange * (INC_PRICE); % calculate the price increase from Dynamic set price and incremental change percentage
         end
         DYN_Cust_Per_Hour(hour) = numCustomersInHour; % save numb of customers
         price = DYN_PRICE + incChange; % calculate actual price or particulare hour in question
         DYN_Price_Per_Hour(hour) = price; % save price
         numCustomersInHour = round(numCustomersInHour-(decPercent*numCustomersInHour)); % caluclate actual number of customers in hour
         hourRev = (price)*(numCustomersInHour); % calculate hour revenue
         incRevPerHour(hour) = hourRev; % save the Revenue
         DYN_Day_Rev = DYN_Day_Rev + hourRev;
        FIX_TOTAL_EXPECTED_REV = FIX_TOTAL_EXPECTED_REV + oneHoursRevenue;
        msg = sprintf('DYNAMIC_revenue(day=%d, hour=%d, custs=%d)= %.2f',...
                         day, hour ,numCustomersInHour,hourRev);
        disp(msg);
        
    end
    DYN_Y = [DYN_Y, DYN_Day_Rev];
end
plot(x, DYN_Y,'g-', 'lineWidth', 2);

DYN_PRICE = 2;
DYN_PERCENT = .2; % Dynamic price increase rate
INC_PRICE = .30; % incremental value 
DYN_Y = 0;

for day = 1:1:NUM_DAYS
    DYN_Day_Rev = 0;
    for hour = 1:1:8
        %
        % simulate a day's worth of business with dynamic pricing
        %
         decPercent = 0; % decremental percentage reset
         incChange = 0; % incremental percentage reset
         numCustomersInHour = poissrnd(lambda); % get the number of customers in an hour
         percentChange = (numCustomersInHour/lambda)-1; % set the percentage increase in customers value for calculation 
         DYN_Cust_Per_Hour(hour) = numCustomersInHour;% save customer per hour value

         if (percentChange > DYN_PERCENT) % check to see if customer percent increase in larger than the dynamic price increase percent
             incChange = floor(percentChange/DYN_PERCENT); % calculate the incremental change as multiple from of the dynamic price increase percent
             if (incChange > deValueLimit) % check to see if the price increment limit ( percent before 10 percent loss in customer purchases)
                decPercent = floor(incChange / deValueLimit)*.1; % set loss percent total
             end
             incChange = incChange * (INC_PRICE); % calculate the price increase from Dynamic set price and incremental change percentage
         end
         DYN_Cust_Per_Hour(hour) = numCustomersInHour; % save numb of customers
         price = DYN_PRICE + incChange; % calculate actual price or particulare hour in question
         DYN_Price_Per_Hour(hour) = price; % save price
         numCustomersInHour = round(numCustomersInHour-(decPercent*numCustomersInHour)); % caluclate actual number of customers in hour
         hourRev = (price)*(numCustomersInHour); % calculate hour revenue
         incRevPerHour(hour) = hourRev; % save the Revenue
         DYN_Day_Rev = DYN_Day_Rev + hourRev;
        FIX_TOTAL_EXPECTED_REV = FIX_TOTAL_EXPECTED_REV + oneHoursRevenue;
        msg = sprintf('DYNAMIC_revenue(day=%d, hour=%d, custs=%d)= %.2f',...
                         day, hour ,numCustomersInHour,hourRev);
        disp(msg);
        
    end
    DYN_Y = [DYN_Y, DYN_Day_Rev];
end

plot(x, DYN_Y,'b-', 'lineWidth', 2);

legend('Flat Rate', 'Dynamic Rate .05 per 10%', 'Dynamic Rate .30 per 20%');

