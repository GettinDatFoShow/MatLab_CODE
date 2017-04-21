%%%% THIS CODE PRODUCES 4 FIGURES. THE FIRST OF AN ASSUMED LOW EDGE PHOTO:
%%%% REDWAVES. THE SECOND OF THE EDGE COMPUTED PHOTOS FROM INCREASING
%%%% CONFIDENCE INTERVALS FROM THE REDWAVES PHOTO. THE THIRD IS THE ASSUMED HIGH EDGE PHOTO:
%%%% SQUARES. THE FINAL FIGURE IS OF THE EDGE COMPUTED PHOTOS FROM
%%%% INCREASING CONFIDENCE INTERVALS FROM THE SQUARES PHOTO. PLEASE
%%%% MAXIMIZE THE CONFIDENCE INTERVAL FIGURES TO GET THE FULL EFFECT. 
%%%%% KNOW BUG!!!!!!!!!! THERE IS ANOTHER FIGURE NAMED FIGURE 1 THAT POPS
%%%%% UP WITH AN EMPTY PLOT, I WAS UNABLE TO DEBUG WHERE THE CALL FOR THIS
%%%%% FIGURE WAS HAPPENING.
%%%%%
% Load Images
%
% Brighted Images
%
% Compute Horizontal Edge Map
%%
clc;
clear; 
close all;
hold on;
zScores = getZscores();
redwaves= 'redwaves.jpg';
squares= 'squares.jpg';

RW = imread(redwaves);
RWrgb = rgb2gray(RW);
SW = imread(squares);
SWrgb = rgb2gray(SW);

labels = [{'10%'}, {'20%'}, {'30%'} ,{'40%'} ,{'50%'}, {'60%'} ,{'70%'}, {'80%'} ,{'90%'}];

fig1 = figure;
fig1.NumberTitle = 'off';
fig1.Name = 'Redwaves Original Photo';
imshow(redwaves)

fig2 = figure;
fig2.NumberTitle = 'off';
fig2.Name = 'Redwaves Edges from Confidence Intervals';

for i=1:1:9
   
    edgeMapR = computeEdges(RWrgb, zScores, i);
    edgeMaps_redwaves = uint8(edgeMapR*255);
    subplot(3,3,i)
    imshow(edgeMaps_redwaves);
    title(labels(i));
    
end

fig3 = figure;
fig3.NumberTitle = 'off';
fig3.Name = 'Squares Original Photo';
imshow(squares);

fig4 = figure;
fig4.NumberTitle = 'off';
fig4.Name = 'Squares Edges from Confidence Intervals';

for i=1:1:9
    
    edgeMapS = computeEdges(SWrgb, zScores, i);
    edgeMaps_squares = uint8(edgeMapS*255);
    subplot(3,3,i);
    imshow(edgeMaps_squares);
    title(labels(i));
    
end
