function edgeMap= computeEdges(Img, zScores, percent)

mask = [ -1/2 0 1/2];

MASK_SIZE= length(mask);

[ROWS, COLS] = size(Img);


ImgResult= zeros(ROWS,COLS,'uint8');
left= 0;
right= 0;
ctr = 0;

Imgd = double(Img);

for row=1:1:ROWS
   for col=1:1:(COLS-1)
       if (col==1)
           continue;
       end
       
       left= mask(1)*Imgd(row,col-1);
       ctr = mask(2) *Imgd(row,col);
       right= mask(3) *Imgd(row,col+1);
       
       ImgResult(row,col) =  uint8(left + ctr + right);
   end
end


edgeMap = ImgResult;

[EROWS, ECOLS] = size(edgeMap);

flatMap = reshape(edgeMap,EROWS*ECOLS,1);
mu= mean(flatMap);
stdErr= std(double(flatMap));

zScorePct= zScores(percent);

confA= mu - zScorePct * stdErr;
confB= mu + zScorePct * stdErr;

edgeMapMask= (edgeMap > confB);


edgeMap= double(edgeMapMask);
return;