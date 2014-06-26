function [ SINR ] = calculateSINR(recPower, interferencePowerBS, interferencePowerD2D)
SINR = recPower/(interferencePowerBS+interferencePowerD2D + 4);