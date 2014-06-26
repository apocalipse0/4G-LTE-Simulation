function [ users ] = setD2DPairs( users )
%SETD2DPAIRS Sets D2D heads and assigns neighbor id's tp d2d users

d2dUsers = getD2DUsers(users);
d2dUsers = findClosestNeighbour(d2dUsers);

for i = 1 : 2 : length(d2dUsers)
    userId = d2dUsers(i).id;
    neighborId = d2dUsers(i+1).id;
    users(userId) = users(userId).setD2DProperties(true, neighborId);
    users(neighborId) = users(neighborId).setD2DProperties(false, userId);
end

