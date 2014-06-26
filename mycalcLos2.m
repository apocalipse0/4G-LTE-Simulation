function [ PL ] = mycalcLos2( d,ch )
%ISLOS Summary of this function goes here
%   Detailed explanation goes here

%Dokument Rep. ITU-R M.2135-1 33 str. 31

% Musimy policzyÄ Los

% Funckja przyjmuje jako argument odlegĹoĹÄ od stacji bazowej

% Zwraca wartoĹÄ Los

%%%%%%%%%%%%%%%%%%%%%%%%%
%WartoĹci staĹe
hbs = 24; %wysokoĹÄ stacji bazowej
fc = ch; %czÄstotliwoĹÄ Ĺrodkowa - tabela na stronie 14?
c = 300000000; %prÄdkoĹÄ ĹwiatĹa?!
hUT = 0.5; %wysokoĹÄ terminala

%Najpierw liczymy dbp, ktĂłre okreĹla wg jakiego wzoru liczymy LOS
dbp = 4*hbs*hUT*fc/c;

if (d>10 && d<dbp)  %zaleĹźnoĹÄ wziÄta z ostatniej kolumny tabeli
PL = 22.0*log10(d)+28.0+20*log10(fc) %Ĺrodkowa czÄĹÄ tabeli
else if (d>dbp && d<5000)
PL = 40.0*log10(d) + 7.8-18.0*log10(hbs)-18.0*log10(hUT)+2.0*log10(fc);
    else
PL=0   ;    
    end

end

