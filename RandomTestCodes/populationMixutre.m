
stick = [ 22, 17, 27, 34 ];

total = sum(stick);

stick = stick/total; 

numTrials = 1000;
numGroups = 4;
coinFlip = 0;
veterans = 1;
family = 2;
addicted = 3;
foster = 4;

[rows, numElements] = size(stick);

for t=1:1:numTrials
   
    coinFlip = random( 'uniform', 0, 1);
    lowEnd = 0;
    
    for g=1:1:numGroups
       
        lowEnd = 0;
        highEnd = lowEnd + stick(g);
        
        if ( g ~= numGroups ) 
            if ( coinFLip >= lowEnd ) &&...
               ( coinFlip < highEnd )    
                selection = g;
            break;
            end
        else
            selection = g;
            lowEnd = highEnd;
            break;
        end
        breatk;
    end
    
end

