function [ pl ] = isLosUrbanMicro (d)
pl = 0;
PLOS = min(18/d,1) * (1-(exp(-d/36))) + exp(-d/36)
    
    if PLOS >= 0.5 
        pl = calcLosUrbanMicro(d);
    else 
        pl = calcNLosUrbanMicro(d);
end
    