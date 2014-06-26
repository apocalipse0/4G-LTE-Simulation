function [ channelIndex ] = getChannel( bandArray, isD2D )
%GIVEBAND Method for distributing band to LTE UEs

%channel spread
spread = 1;

%if channelIndex stays at 0, it means no resource given
channelIndex = 0;

channelsNumber = length(bandArray);

%broaden the spread if d2d, as it needs 5 channels
if isD2D
    spread = 5;
end

for i = 1 : channelsNumber
    occupied = false;
    for j = 1 : spread
        if ( i + j - 1 > channelsNumber ) || ( bandArray(i + j - 1) ~= 0 )
            occupied = true;
            break;
        end
    end
    if occupied == false
        channelIndex = i;
        break;
    end
end
        
end

