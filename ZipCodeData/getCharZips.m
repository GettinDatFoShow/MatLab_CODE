function [ differentZips ] = getCharZips( dataArray, rowCount )
% returns a list of the unique zipcodes from the Charlotte Information
% given
differentZips = [dataArray(1,1); 0; 0; 0; 0];
previousZipIndex = 1;

for zipIndex = 2:1:rowCount
    
    if dataArray(zipIndex,1) == differentZips(previousZipIndex,1)
        % do nothing
    else
       previousZipIndex = previousZipIndex + 1;
       differentZips(previousZipIndex,1) = dataArray(zipIndex,1);
    end

end

