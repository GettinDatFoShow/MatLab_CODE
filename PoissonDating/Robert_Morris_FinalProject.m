%% I never figured out how to correctly account for the differences in the poison odds
%% I had a problem with correctly modeling how to increase the odds of getting
%% a date if Philbert recieved more than 1 phone number in one night. 
%% i tried to addjust the size of the stick based on the numbers philbert recieved, 
%% but when i got to that point, i wasnt sure how to pick a new random number to equate 
%% from the new smaller size of the stick. i do realize i have fully complete this project 
%% to the specifications, but if you do have a little extratime after grading to email 
%% me a hint or point me in the right possible direction, that would be great
%% thanks, and my email is Robert.dale.morris@gmail.com, have a great holiday!



% first set of trials do not include Philberts rate of recieving a phone
% number each night. This will be our starting point for testing. 

MONTH = 28; % 1 month trial
YEAR = 12; % year of trials


stick = [ 100, 100, 100, 100, 100, 100, 100, 100]; % populate array of raw feq data in vector
total = sum(stick); %find length of stic
normalizedStick = stick/total; % normalize stick
[ROWS,COL] = size(stick);

yearTotal = 0;
for month = 1:1:YEAR
   
    magicDateNumber = ceil(rand(1)*8);
    %poisson trails for dates from numbers
    selections = zeros(1,MONTH);
    for trial = 1:1:MONTH  
        lowerBound = 0;
        upperBound = 0;
        sel=rand(1);
        value = -1;
        % acumulate stick break weights to set upper/lower endpoints
        for b=1:1:COL 

            lowerBound = upperBound;

            upperBound= upperBound + normalizedStick(b);

            %%%%
            % test if random toss of tape ball "lands" in a given
            % piece between "breaks" along the stick.
            %%%
            if ( (sel >= lowerBound) &&... 
                (sel < upperBound))
                    value = b;
                break;

            end
        end
        selections(trial) = b;
    end

totalDatesNP = 0; % dates with poisson rate

for count = 1:1:MONTH
    
    if (selections(count) == magicDateNumber)
        totalDatesNP = totalDatesNP + 1;
    end
end

fprintf('Total Dates in Month "%d" with 1 number per night = %d \n', month, totalDatesNP);
yearTotal = yearTotal + totalDatesNP;
end

fprintf('Total Dates in 1 Year with 1 number per night = %d \n', yearTotal);
fprintf('Total Average dates per month in 1 year = %d \n', floor(yearTotal/12));

nightRate = 1; % phiberts nightly phone number average rate or mean
regNight = nightRate;                        % Philberts rate to recieve a phone number any given night
busyNight = nightRate + (nightRate * .20);  % 20% increase in rate to recieve a phone number on busier nights
slowNight = nightRate - (nightRate * .15);  % 15% decrrease in rate to recieve a phone number on slower nights
evenWeek = [ regNight, regNight, regNight, regNight, regNight, regNight, regNight ];
mon = slowNight;
tues = slowNight;
wed = regNight;
thurs = regNight;
fri = busyNight;
sat = busyNight;
sun = busyNight;
coupledWeek = [ mon, tues, wed, thurs, fri, sat, sun ];


% poisson testing without coupling 
yearTotal = 0;
poissRates = zeros(1,MONTH);

for month = 1:1:YEAR
    % non poisson trails for dates out from numbers
    selectionP = zeros(1, MONTH);
    
    counter = 1;
    for trial = 1:1:4    
        for day = 1:1:7
            sel=rand(1);
            value = -1;
            lambda = evenWeek(day);
            numbers = floor(poissrnd(lambda));
            poissRates(counter) = numbers;
            
            %reset stick according to lambda
            if (numbers > 0)
                magicDateNumber = ceil(rand(1)* (8/numbers));
                odds= 8/numbers;
                stick = zeros(1,ceil(odds));
                for s = 1:1:odds
                    stick(s)= 1/odds;
                end
                [ROWS, COL] = size(stick);
                % acumulate stick break weights to set upper/lower endpoints
                lowerBound = 0;
                upperBound = 0;
                for b=1:1:COL 

                    lowerBound = upperBound;

                    upperBound = upperBound + stick(b);

                    if ( (sel >= lowerBound) &&... 
                        (sel < upperBound))
                            value = b;
                        break;

                    end
                end
                
            else
                b = 0;
            end
            selectionsP(counter) = b;
            counter = counter + 1;
        end
    end

totalDatesP = 0; % dates with poisson rate

for count = 1:1:MONTH
    
    if (selectionsP(count) == magicDateNumber)
        totalDatesP = totalDatesP + 1;
    end
end

fprintf('Total Dates in Month "%d" with poisson rate per night = %d \n', month, totalDatesNP);
yearTotal = yearTotal + totalDatesP;
end

fprintf('Total Dates in 1 Year with poisson per night = %d \n', yearTotal);
fprintf('Total Average dates per month with poisson in 1 year = %d \n', floor(yearTotal/12));

yearTotal = 0;
poissCoupledRates = zeros(1,MONTH);

for month = 1:1:YEAR
    % poisson coupled trails for dates out from numbers
    selectionsPCR = zeros(1, MONTH);
    
    counter = 1;
    for trial = 1:1:4
        
        for day = 1:1:7
            sel=rand(1);
            value = -1;
            lambda = coupledWeek(day);
            numbers = floor(poissrnd(lambda));
            poissRates(counter) = numbers;
            
            %reset stick according to lambda
            if (numbers > 0)
                magicDateNumber = ceil(rand(1)* (8/numbers));
                odds= 8/numbers;
                stick = zeros(1,ceil(odds));
                for s = 1:1:odds
                    stick(s)= 1/odds;
                end
                [ROWS, COL] = size(stick);
                % acumulate stick break weights to set upper/lower endpoints
                lowerBound = 0;
                upperBound = 0;
                for b=1:1:COL 

                    lowerBound = upperBound;

                    upperBound = upperBound + stick(b);
                    if ( (sel >= lowerBound) &&... 
                        (sel < upperBound))
                            value = b;
                        break;

                    end
                end
                
                selectionsPCR(counter) = b;
                counter = counter + 1;
            else
                
                selectionsPCR(counter) = 0;
                counter = counter + 1;
            end
                
            
        end
    end

totalDatesPCR = 0; % dates with poisson coupled rate

for count = 1:1:MONTH
    
    if (selectionsPCR(count) == magicDateNumber)
        totalDatesPCR = totalDatesPCR + 1;
    end
end

fprintf('Total Dates in Month "%d" with poisson coupled rate per night = %d \n', month, totalDatesNP);
 yearTotal = yearTotal + totalDatesPCR;
end

fprintf('Total Dates in 1 Year with poisson coupled rate per night = %d \n', yearTotal);
fprintf('Total Average dates per month with poisson coupled in 1 year = %d \n', floor(yearTotal/12));



