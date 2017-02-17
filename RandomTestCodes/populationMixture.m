

stick = [ 22, 17, 27, 34];

[ ROWS, NUM_GROUPS] = size(stick);

TOTAL= sum(stick);

stick = stick/TOTAL;

VETERAN= 1;
FAMILY = 2;
ADDICTED= 3;
FOSTER= 4;


NUM_TRIALS= 100000;

coinFlip = 0;
selection = 0;


theMus = [21, 35, 70, 75];
theSigmaSquares = [ 2*2, 4*4, 10*10, 5*5];

mu= 0;
sigma= 0;
sigmaSq= 0;

theAges = zeros(1,NUM_TRIALS);

for t=1:1:NUM_TRIALS,

  coinFlip = random('unif',0,1);
  
  lowEnd= 0;
  highEnd= lowEnd;
  
  
  for g=1:1:NUM_GROUPS,
      highEnd = lowEnd + stick(g);
      
      %% 
      % bounds check the uniform "coin"
      % against the normalized stick boundaries
      %%
      
      if (g ~= NUM_GROUPS)
         if (  (coinFlip >= lowEnd) &&...
            (coinFlip < highEnd)...
            )
           
            selection = g;
            break;
         end
      else
        % we are bounds checking last region
        % of the broken stick
        if (  (coinFlip >= lowEnd) &&...
            (coinFlip <= highEnd)...
            )
           selection = g;
           break;
        end  
      end
      
      lowEnd= highEnd;
  end
    
  mu = theMus(selection);
  sigmaSq= theSigmaSquares(selection);
  sigma = sqrt(sigmaSq);
  
  theAges(1,t) = normrnd(mu,sigma);
  
end

hist(theAges,5);
title('4-mixture Normal distribution');

