function [ RecPow ] = RecPowerNU_UL( x,y,bl )
%CALCSINR Summary of this function goes here
%   Detailed explanation goes here
%Funkcja zwraca moc odebrana od stacji bazowej przez uzytkownika normalnego
%w punkcie x,y
%bl to ilosc blokow w sygnale nadawanym

%Najpierw parametry
dist = [0, 0; x ,y];
d = pdist(dist,'euclidean');
ch = 2000000000;
%Moc stacji bazowej:
%Pbs=46; %moc stacji bazowej w dBm dla 10MHz!
Pbs = 10*log10(5*bl);
shdwng = normrnd(0,4);
 
pathloss=calcLosUrbanMicro(d); 

%SINR=(Pbs-pathloss-3)/noisevar; %Tu mam watpliwosci natury - skala db czy linowa?
RecPow=Pbs-pathloss-shdwng;
%temp=SINR/10;
%SINR=10^temp

end

