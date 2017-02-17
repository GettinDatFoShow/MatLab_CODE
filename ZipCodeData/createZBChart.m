function createZBChart( zipCodesData, columnInterested, division, stringName, stitle )

cI = columnInterested;
zipArray = [];
bounds = size( zipCodesData );
rows = bounds(1);


for i = 1:1:rows
    
    zipArray(i) = zipCodesData(i,1);
    yAxis(i) = zipCodesData(i, cI);
    
end

zipArray = string(zipArray);


barh(yAxis./division,'g');
numTicks = 1:24;
L = get(gca, 'YLim');
set(gca, 'YTick', numTicks);
set(gca, 'YTickLabelMode', 'manual', 'YTickLabel', zipArray);
ylabel('Charlotte Zip Codes');
xlabel(stringName);
title(stitle);

