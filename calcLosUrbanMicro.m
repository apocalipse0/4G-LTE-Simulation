function [ pl ] = calcLosUrbanMicro(d)

hbs = 10; %wysokosc stacji bazowej
fc = 2.5 * 10^9; %czestotliwoc srodkowa - tabela na stronie 14?
hUT = 1.5; %wysokosc terminala
%shad = 3 %shadowing 3db
% Break point distance dpb= 4 h?BS h?UT fc/c,
c = 3 * 10^8; %predkosc swiatla
%dpb = 4* hbs * hUT * fc / c;

if (d >= 10 && d < 5000)
    pl = 40 * log10(d) + 7.8 - 18*log10(hbs) - 18*log10(hUT) + 2*log10(fc);
else
    pl = 0;
end