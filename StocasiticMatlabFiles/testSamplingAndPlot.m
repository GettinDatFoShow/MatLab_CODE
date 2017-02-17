
% 
% x = ( 1: 1: 10 );
% y = 2*x;
%  
% fXY = 3*x + power(y,2);
% 
% plot3(x,y,fXY);
% grid on;

% populate array of raw frequency data in vector
%
%stick = [ 100 102 103 110 120 101];
stick = [ 100 100 100 100 100 100];
%%%%
% measure the size of the stick frequency vector
%%
[ROWS, COL] = size(stick);


total = sum(stick);

%%%%
% normalize stick breaks to interval [0,1] on real num line
%%
normalizedStick = stick/total;

%%%%
% How many trials will you simulate?
%%
NUM_TRIALS= 100;


%%%%
% allocat storage for simulated selections
% Note: we are taking a shortcut here by recording
%       the indeces as integers instead of cell array elements.
%       This is done because I want to histogram numbers.
%%
selections = zeros(1,NUM_TRIALS);


%%%%
% interate over trials
%%
for trial=1:1:NUM_TRIALS,
    
  sel= rand(1);

  lowerBound= 0;
  upperBound= 0;
  value = -1;

  %%%%
  % aculumate stick break weights to set upper/lower endpoints
  % for breaks along the stick
  %%
  for b=1:1:COL,

    lowerBound = upperBound;
 
    upperBound= upperBound + normalizedStick(b);
 
    %%%%
    % test if random toss of tape ball "lands" in a given
    % piece between "breaks" along the stick.
    %%%
    if ( (sel >= lowerBound) &&... 
       (sel < upperBound)...
       )
      value = b;
      break;
    
    end
 
  end
  
  %%%%
  % record the piece in which tape ball "lands"
  %%
  selections(trial) = value;
  
  %%%%
  % visualize the simulated observation
  %%
  msg = sprintf('coinFace= %d\n',value);
  disp(msg);
  
end

%%%%
% display statistics over all trials
%%
histogram(selections,COL);