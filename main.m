%Create a table of 100 users (UE's) in 5000 m range cell
%And 0.5 chance for being in D2D
clear
users = createUsers( 100, 5000, 0.4 );

%Selects D2D heads and assigns D2D neighbors
users = setD2DPairs( users );

%Current bandwidth is 1 channel * 50 blocks
bandWidth = 50;

%Generate 10 users that will be transmitting
activeUserIDs = getActiveUsers(users, 10 ,1);
activeUsers_noInterference = getActiveUsers(users, 10, 0);

users_noInteference = giveResourceBlocks(bandWidth, users, activeUsers_noInterference);
users_noInteference = calculateSinrDownlinkWithoutInter(users_noInteference);

%Assign resource blocks fairly between users
users = giveResourceBlocks(bandWidth, users, activeUserIDs);

hugo = giveD2DBlocks(getD2DUsers(users), users);

usersDL = calculateSinrDownlinkInterference(hugo);

usersUL = calculateSinrUplinkInterference(hugo);

sumSINRDL = 0;
sumSINRUL = 0;
sumThrDL = 0;
sumThrUL = 0;
sumSINRnoIntDL = 0;
sumSINRnoIntUL = 0;
sumThrDL_NO = 0;
sumThrUL_NO = 0;

nrOfUsers = length(usersDL);

for i = 1: nrOfUsers
    if (users_noInteference(i).nrOfBlocks ~= 0 && users_noInteference(i).recievedPower~=0)
            temp = db2pow(users_noInteference(i).recievedPower-30);
            users_noInteference(i).sinr = pow2db(temp) + 30;
            users_noInteference(i).throughput = log2(1 + temp);
            sumThrDL_NO = sumThrDL_NO + users_noInteference(i).throughput*10^10*120;
    end
    
    if (usersDL(i).nrOfBlocks ~= 0 && usersDL(i).recievedPower~=0)
        if (usersDL(i).interferencePowerD2D ~= 0 || usersDL(i).interferencePowerBS ~= 0)
            temp1 = db2pow(usersDL(i).recievedPower-30) / (db2pow(usersDL(i).interferencePowerD2D-30) + db2pow(usersDL(i).interferencePowerBS-30));
        else
            temp1 = db2pow(usersDL(i).recievedPower-30);
        end
            usersDL(i).sinr = pow2db(temp1) + 30;
            usersDL(i).throughput = log2(1 + temp1);
            sumThrDL = sumThrDL + usersDL(i).throughput*10^10*120;
    end    
    
    if (usersUL(i).nrOfBlocks ~= 0 && usersUL(i).recievedPower~=0)
        if (usersUL(i).interferencePowerD2D ~= 0 || usersUL(i).interferencePowerBS ~= 0)
            temp3 = db2pow(usersUL(i).recievedPower-30)/ (db2pow(usersUL(i).interferencePowerD2D-30) + db2pow(usersUL(i).interferencePowerBS-30));
        else
            temp3 = db2pow(usersUL(i).recievedPower-30);
        end
            usersUL(i).sinr = pow2db(temp3) + 30;
            usersUL(i).throughput = log2(1 + temp3);
            sumThrUL = sumThrUL + usersUL(i).throughput*10^10*120;
    end
      
    
end
%for i = 1: nrOfUsers
%    usersUL(i) = usersUL(i).calculateSINR();
%    usersUL(i) = usersUL(i).calculateThroughput();
%    sumSINRUL = sumSINRUL + usersUL(i).sinr;
%    sumThrUL = sumThrUL + usersUL(i).throughput;
%end

%Average SINR for downlink resources
avgSINRDL = sumSINRDL / nrOfUsers;

%Average SINR for uplink resources
avgSINRUL = sumSINRUL / nrOfUsers;

%no interference case (comment previous 4 lines) 
%activeUserIDs = getActiveUsers( users, 10 ,0);
%users = giveResourceBlocks(bandWidth, users, activeUserIDs);
%new = calculateSinrDownlinkWithoutInter(users);
