function [ ] = tfsin( )
%TFSIN Trace les fonctions cos et cos^2 puis leur fft

Np = 128;
n=linspace(0,Np-1,Np);
freq=0.2; 
fx=linspace(-0.5,0.5,Np);
fs=1; 

%Etude du cosinus et du cosinus^2 
cosinus=cos(2*pi*n*freq/fs); 
fcosinus=fft(cosinus);  
cosinus2=cos(2*pi*n*freq/fs).*cos(2*pi*n*freq/fs); 
fcosinus2=fft(cosinus2); 
 
%On trace les resultats 
subplot(2,2,1)         % Definit le nombre de fenetres verticales/horizontales 
plot(cosinus)          % Trace la courbe "en continue" 
title('cosinus'); 
subplot(2,2,2) 
plot(fx,fftshift(real(fcosinus))); 
title('fft cosinus'); 
axis([-0.5 0.5 0 60]) 
 
subplot(2,2,3) 
plot(cosinus2) 
title('cosinus2'); 
subplot(2,2,4) 
plot(fx,fftshift(real(fcosinus2))); 
title('fft cosinus2'); 
axis([-0.5 0.5 0 60]) 
end