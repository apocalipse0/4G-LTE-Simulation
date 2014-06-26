function [ d2dUsers ] = findClosestNeighbour (d2dUsers)
    x = length(d2dUsers);
    i = 1;
    while (i < x)
     distance = 0;
     closestNeighbourId = 0;
        for j=(i+1):x
        tempDistance = calculateHypotenuse(d2dUsers(i).x-d2dUsers(j).x, d2dUsers(i).y-d2dUsers(j).y);
            if (tempDistance < distance || distance == 0)
                distance = tempDistance;
                closestNeighbourId = j;
            end
        end
        %swap closest user to next row 
        if (closestNeighbourId ~= 0)
            d2dUsers([i+1 closestNeighbourId]) = d2dUsers([closestNeighbourId  i+1]); 
        end
        i = i+2;%neighbours next to each other in new matrix
    end
end 