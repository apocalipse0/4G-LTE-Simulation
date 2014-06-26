function [ pl ] = calcNLosUrbanMicro (d)

fc = 2500000000; %czestotliwoc s
pl = 0;

if (d>10 && d<2000)  %zaleznosc wzieta z ostatniej kolumny tabeli
    pl = 36.7 * log10(d) + 22.7 + 26 * log10(fc);
end


