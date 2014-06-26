function [ users ] = calculateSinrDownlinkWithoutInter(users)

for i=1:length(users)
    if (users(i).nrOfBlocks == 0)
        users(i).sinr = 0;
    else
        if (users(i).d2d == 0)
            users(i).recievedPower = RecPowerNU(users(i).x, users(i).y, users(i).nrOfBlocks);
        elseif (users(i).d2d == 1 && users(i).head == 1)
             users(i).recievedPower = RecPowerD2DU(users(i).x, users(i).y, users(users(i).neighbor).x, users(users(i).neighbor).y, users(i).nrOfBlocks);
        end
    end
end