function [ bandArray ] = createBand( bandStart, bandEnd, channelWidth )
%CREATEBAND this method creates band array for a BTS
%bandStart [number] - lower bound of the frequency band
%bandEnd [number] - higher bound of the frequency band
%bandchannelWidth [number] - width of a single resource block band
%returns [matrix]
channelsNumber = floor( ( bandEnd - bandStart ) / channelWidth );
bandArray = zeros(2, channelsNumber);
for i=1:channelsNumber
    bandArray(1, i) = bandStart + channelWidth * (i-1);
    bandArray(2, i) = bandStart + channelWidth * i;
end
%Each column represents a resource block
%First row is the lower frequency bound of the block
%Second row is the higher frequency bound of the block
end

