function [ RecPow ] = RecPowerD2DU( x,y,x1,y1,bl )
%CALCSINR Summary of this function goes here
%   Detailed explanation goes here
%Funkcja zwraca moc odebrana od stacji bazowej przez uzytkownika normalnego
%w punkcie x,y
%bl to ilosc blokow w sygnale nadawanym

%Najpierw parametry
dist=[x1,y1;x,y];
d=pdist(dist,'euclidean');
ch=2000000000;
%Moc stacji bazowej:
%Pbs=46; %moc stacji bazowej w dBm dla 10MHz!
Put=10*log10(5*bl);
shdwng=0.5;%zakladam randomowy na betona
 
pathloss=mycalcLos2(d,ch);

%SINR=(Pbs-pathloss-3)/noisevar; %Tu mam watpliwosci natury - skala db czy linowa?
RecPow=Put-pathloss-shdwng;
%temp=SINR/10;
%SINR=10^temp

end

