function [ results ] = testConIntervals( originalIntervals, theValues, total)
 % here i will compare the sample results verse the confidence intervals,
 % and see how the percentages hold up.
 
 
 results = zeros(9, 4);
 
 for test =1:1:9
     counter = 0; 
     for i = 1:1:total
        value = theValues(i,1);
        a = originalIntervals(test,1); % low interval bound
        b = originalIntervals(test,2); % high interval bound
        if (value >= a)
            if (value <= b)
                counter = counter + 1;
            end
        end
     end   
     percentage = (counter/total); % home many fell withing the interval/total, 
     results(test, 1) = percentage; % calculated percentage
     results(test, 2) = originalIntervals(test,4); % expected percentage
     results(test, 3) = counter;
     results(test, 4) = string(originalIntervals(test,4)*100);
 end
 
end

