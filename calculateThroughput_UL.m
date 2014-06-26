function [ currentSINR ] = calculateThroughput_UL(users)

recPower = 0;
interferencePowerD2D = 0;
interferenctPowerBS = 0;

for i=1:length(users)
    if (users(i).nrOfBlocks == 0)
        users(i).throughput = 0;
    else
        if (users(i).d2d == 0)
            recPower = RecPowerNU_UL(users(i).x, users(i).y, users(i).nrOfBlocks); %Zmiana na nowa funkcje dla mocy UL
            usedBlocks = users(i).blocks;
            %count intereference from d2d
            for j=1:length(users)
                if (users(i).id ~= users(j).id && users(j).nrOfBlocks ~= 0)
                    tempVector = users(j).blocks;
                    interferenceCounter = 0;
                    for k=1:length(usedBlocks)
                        if (ismember(usedBlocks(k),tempVector))
                            interferenceCounter = interferenceCounter + 1;
                        end
                    end
                    if (interferenceCounter ~= 0)
                      interferencePowerD2D = interferencePowerD2D + RecPowerD2DU(users(i).x, users(i).y, users(j).x, users(j).y, interferenceCounter);
                    end
                end
            end
        elseif (users(i).d2d == 1 && users(i).head == 1)
            recPower = RecPowerD2DU(users(i).x, users(i).y, users(users(i).neighbor).x, users(users(i).neighbor).y, users(i).nrOfBlocks);
            usedBlocks = users(i).blocks;
              %count intereference from d2d
            for j=1:length(users)
                if (users(i).id ~= users(j).id && users(j).nrOfBlocks ~= 0)
                    tempVector = users(j).blocks;
                    interferenceCounter = 0;
                    for k=1:length(usedBlocks)
                        if (ismember(usedBlocks(k),tempVector))
                            interferenceCounter = interferenceCounter + 1;
                        end
                    end
                    if (interferenceCounter ~= 0)
                      interferencePowerD2D = interferencePowerD2D + RecPowerD2DU(users(i).x, users(i).y, users(j).x, users(j).y, interferenceCounter);
                    end
                end
            end
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %Blok do liczenia interferencji od uzytkownika normalnego w UL
            
            for g=1:length(users)
                  if (users(g).d2d==0 && users(i).id ~= users(g).id && users(g).nrOfBlocks ~= 0)
                     tempVector = users(g).blocks;
                     interferenceCounter = 0;
                     for k=1:length(usedBlocks)
                            if (ismember(usedBlocks(k),tempVector))
                             interferenceCounter = interferenceCounter + 1;
                            end
                     end
                     if (interferenceCounter ~= 0)
                       interferencePowerBS = interferencePowerBS + RecPowerD2DU(users(i).x, users(i).y, users(g).x, users(g).y, interferenceCounter);
                     end
                  end
              end
            
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            currentSINR = calculateSINR(recPower, interferencePowerBS,  interferencePowerD2D);
        end
    end

end

end
