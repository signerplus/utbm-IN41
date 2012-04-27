function [] = soundgen( )
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
lambda=3000; % Parametre (1000 ou 2000)
Fe=8000; % Freq. echantillonnage
F0=1000; % Freq. de depart
T=2; % Duree d'observation
it=(0:Fe*T-1)/Fe; % Vecteur temps
theta=2*pi*F0*it+pi*lambda*(it .^2);
x=cos(theta);
soundsc(x,Fe) % Ecoute
end