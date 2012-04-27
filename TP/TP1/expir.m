function [ ] = expir( )
%EXPKR Trace la représentation exponentielle d'un nombre complexe puis sa
%partie imaginaire et réelle


Np=128;                 
n=linspace(0,Np-1,Np);   % creation d’un vecteur qui varie lineairement 
freq=0.05; 
expo=exp(j*n*2*pi*freq);   % = sin(n*2*freq) + i * cos(n*2*freq) 
fs=1; 
figure; 
subplot(1,3,1); 
plot(expo);               % l'axis x est les reels et y les imaginaires 
axis([-1 1 -1 1]); 
title('exp(j*n*2*freq)'); 
 
subplot(1,3,2); 
plot(real(expo));                
title('real exp(j*n*2*freq)'); 
 
subplot(1,3,3); 
plot(imag(expo));                
title('imag exp(j*n*2*freq)'); 
end