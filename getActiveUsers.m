function [ activeUsers ] = getActiveUsers( users, numberOfActiveUsers , collision)
%GIVEBAND Finds active user id's
% users [matrix] -> array of the current UE holders with id's etc
% numberOfActiveUsers [int] -> number of users that are supposed to get band
% returns [vector] ID's of the active users

%We can control the number of the active users in a cell
activeUsers = zeros (numberOfActiveUsers, 1);

%Max user id is equal to the number of lines in the users array
maxId = length(users);
if (collision == 0)
    for i=1:numberOfActiveUsers
        activeUser = 0;
        %Find unique, non-zero id's
        while (activeUser == 0 || ismember(activeUser, activeUsers) ||  users(activeUser).head == 0 && users(activeUser).d2d == 1 )
        %Needs to be an equal-probability rand
        activeUser = floor(rand() * maxId);
        end
        activeUsers(i) = activeUser;
    end
else
    for i=1:numberOfActiveUsers
        activeUser = 0;
        %Find unique, non-zero id's
        while (activeUser == 0 || ismember(activeUser, activeUsers) || users(activeUser).d2d == 1 )
        %Needs to be an equal-probability rand
        activeUser = floor(rand() * maxId);
        end
        activeUsers(i) = activeUser;
    end
end