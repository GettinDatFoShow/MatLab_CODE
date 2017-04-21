clc;
clear; 
close all;
hold on;
%%%
% set names of query image and target image
%%
QUERY_IMAGE_NAME='HarryWilliamsCroppedHead.jpg';
IMAGE_NAME='HarryWilliamsBigCheck.jpg';


%%
% if SHOW_CROP_SEARCH set to true, every update
% in crop search will be visualized
%
% if set to false, will not show updates
% thus running much faster
%%%
% SHOW_CROP_SEARCH= true;
SHOW_CROP_SEARCH= false;

I= imread(IMAGE_NAME);
Igray = rgb2gray(I);

Iq= imread(QUERY_IMAGE_NAME);
Iqgray= rgb2gray(Iq);



CROP_ROWS= size(Iq,1);
CROP_COLS= size(Iq,2);



IMG_ROWS = size(I,1);
IMG_COLS = size(I,2);


%%%%%
% if XSHIFT set to 1 this is pixel by pixel updates
% if YSHIFT set to 1 this is pixel by pixel updates
%
% if XSHIFT set to CROP_COLS this is tesselated along X
% if YSHIFT set to CROP_COLS this is tesselated along Y
%%
% XSHIFT= 3;
% YSHIFT= 3;

% initialize position vector used to display
% the cropping rectangle
%
% [ x y with height]

pos = [0 0 0 0];

%%%
% initialize variables used to track the
% location where cropping achieves its
% maximum score
%%
maxCorrScore= -1000;%initialize to large neg value so always find a max
maxXCorr= -1;       %initialize to invalid x-coordinate to make fail stop
maxYCorr= -1;       %initialize to invalid y-coordinate to make fial stop

% rmMaxCorrScore= -1000;%initialize to large neg value so always find a max
% rmMaxXCorr= -1;       %initialize to invalid x-coordinate to make fail stop
% rmMaxYCorr= -1;       %initialize to invalid y-coordinate to make fial stop

currCorrScore= maxCorrScore;  %set in search, but must still intialize

xyTimeResCorr = zeros(10, 6);

for res=1:10
    % resolution changing starts here, also I reset the max corr score
    % along with the x and y values. Tic starts the timer. Once the search
    % is finished, the times and values are recorded at the end of the
    % for loop.
    
    XSHIFT = res;
    YSHIFT = res;
    xyTimeResCorr(res,1) = res;
    xyTimeResCorr(res,2) = res;
    rmMaxCorrScore= -1000;
    rmMaxXCorr= -1;
    rmMaxYCorr= -1;
    tic
    
    for y=1:YSHIFT:IMG_ROWS-CROP_ROWS
       showedMiddle= false;
       for x=1:XSHIFT:IMG_COLS-CROP_COLS

          % note the crop window returns region of image one pixel
          % wider and one pixel taller so we specify (CROP_COLS-1)
          % and (CROP_ROWS-1) here so that cropped region is same
          % size as query image

          Ic = imcrop(I,[x y (CROP_COLS-1)  (CROP_ROWS-1)]); 

          if (SHOW_CROP_SEARCH) 
    %         figure(2);
    %         imshow(Ic);
            title('crop window');   

            figure(1);

    %         update image, can't assume it is clean
            imshow(I);

            pos = [x y CROP_COLS CROP_ROWS];

    %         set position vector for crop rectangle
    %         then draw it on orignal image
            rectangle('Position',pos,'edgecolor','r','linewidth',3);
            title('original image');

    %         force display of user interface
            drawnow;

          end

        %%
        % to simplify the match score, we will do it with grayscale
        % images instead of color, thus freeing us from having to
        % deal with three color planes (red, green, blue).
        %%
        IcGrayScale = rgb2gray(Ic);
        IqGrayScale = rgb2gray(Iq);

        %%%
        % compute the correlation match score
        %%
%         [currCorrScore, rmCurrCorrScore] = myCorrelationMatch(IcGrayScale, IqGrayScale);
        rmCurrCorrScore = rmCorrelationMatch(IcGrayScale, IqGrayScale);
        
        %%%
        % If you get a bigger correlaton score, record
        % the (x,y) coordinates of upper left corner
        %%
        
%         if (currCorrScore > maxCorrScore) 
%           maxCorrScore= currCorrScore;
%           maxXCorr= x;
%           maxYCorr= y;
%         end
        
        %%%
        % If Robert Morris gets a bigger correlaton score, record
        % the (x,y) coordinates of upper left corner
        %%
        if (rmCurrCorrScore > rmMaxCorrScore) 
          rmMaxCorrScore= rmCurrCorrScore;
          rmMaxXCorr= x;
          rmMaxYCorr= y;
        end



       end
    end
    xyTimeResCorr(res,3) = toc;
    sprintf('Round: %d , finished.', res);
    sprintf('Max Corr Found: %f', rmMaxCorrScore);
    xyTimeResCorr(res,4) = rmMaxCorrScore;
    xyTimeResCorr(res,5) = rmMaxXCorr;
    xyTimeResCorr(res,6) = rmMaxYCorr;
end

ResX = xyTimeResCorr(1:1:10,1);
ResY = xyTimeResCorr(1:1:10,2);
Time = xyTimeResCorr(1:1:10,3);
MaxScore = xyTimeResCorr(1:1:10,4);
MaxX = xyTimeResCorr(1:1:10,5);
MaxY = xyTimeResCorr(1:1:10,6);
T=table(ResX, ResY, Time, MaxScore, MaxX, MaxY);

rmMaxX = xyTimeResCorr(1,5);
rmMaxY = xyTimeResCorr(1,6);

subplot(2,2,1)
    plot(xyTimeResCorr(2:1:10,1), xyTimeResCorr(2:1:10, 4))
    title('Resolution Effect On Score(Match)');
    xlabel('Resolution');
    ylabel('Score');
subplot(2,2,2)
    plot(xyTimeResCorr(2:1:10,1), xyTimeResCorr(2:1:10, 3))
    title('Resolution Effect On Time');
    xlabel('Resolution');
    ylabel('Time');
subplot(2,2,3)
    imshow(Iq)
    title('Cropped Image');
subplot(2,2,4)
%     disp('RMs best match found');
    imshow(I)
    title('Image searched');
    pos= [ rmMaxXCorr rmMaxYCorr CROP_COLS CROP_ROWS];
    rectangle('Position',pos,'edgecolor','r','linewidth',3);
 disp(T)
% disp('original best match found...');
% imshow(I);
% pos= [ maxXCorr maxYCorr CROP_COLS CROP_ROWS];
% rectangle('Position',pos,'edgecolor','r','linewidth',3);

% disp('Robert Morris- best match found...');
% imshow(I);
% pos= [ rmMaxXCorr rmMaxYCorr CROP_COLS CROP_ROWS];
% rectangle('Position',pos,'edgecolor','r','linewidth',3);

disp('done');
