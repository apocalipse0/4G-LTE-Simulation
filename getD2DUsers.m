function [ d2dUsers ] = getD2DUsers( users )
%GETD2DUSERS Summary of this function goes here
%   Detailed explanation goes here
counter = 1;
for i = 1 : length(users)
    if(users(i).d2d == true)
        d2dUsers(counter) = users(i);
        counter = counter + 1;
    end
end

