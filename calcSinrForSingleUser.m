function [sinr] = calcSinrForSingleUser (user)
    recPower = 0;
    if (user.nrOfBlocks ~= 0)
        recPower = RecPowerNU(user.x, user.y, user.nrOfBlocks);
    end
    noice_var = 4;
    sinr = recPower/ noice_var;
end
        