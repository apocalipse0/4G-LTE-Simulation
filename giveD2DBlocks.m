function [users] = giveD2DBlocks(d2dUsers, users)

nrOfBlocks = 50;
blocksPerUser = 10;

counter = 0;
i = 1;

%add resources to d2d users

while (counter <= nrOfBlocks)
    if (d2dUsers(i).head == true && d2dUsers(i).nrOfBlocks == 0)
        counter = counter + 1;
        while (mod(counter,blocksPerUser) ~= 0)
            d2dUsers(i) = d2dUsers(i).addBlock(counter);
            counter = counter + 1;
        end
        d2dUsers(i) = d2dUsers(i).addBlock(counter);
    end
    i = i + 1;
end

    %merge users & d2d users 
    for i=1:1:length(d2dUsers)
        users(d2dUsers(i).id) = d2dUsers(i);
    end
    
end