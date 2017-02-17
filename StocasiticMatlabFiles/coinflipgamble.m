pHeads = 0.33;
pTails = 0.5;

NUM_GAMES = 100000
 4 ;

sel = 0;
coinVal = -1;
playerWager = 2;
playerWinnings = 0;
houseWager = 4;

for g=1:1:NUM_GAMES
    sel = rand(1);

   % 
   % check heads region of "stick"
   
        if ( ( sel >= 0 ) &&...
            ( sel <= pHeads )...
            )
        coinVal = 1;
        else
            coinVal = 0;
        end
        
        if (coinVal == 1 ) % we have heads
            playerWinnings= playerWinnings + houseWager;
        else % we have a tails
            playerWinnings= playerWinnings - playerWager;
        end
        
        
end
    
avgWinnings = playerWinnings/NUM_GAMES;
msg = fprintf('average over %d games is $%.2f  per game.', NUM_GAMES, avgWinnings);