function [] = tfgauss()
% TFGAUSS Trace une fonction gaussienne puis sa FFT
Np=128; 
n=linspace(0,Np-1,Np); %Construction de la Gaussienne 
sigma=4; 
nzero=Np/2-1; 
x=n-nzero; 
x2sig2=(x.*x)/sigma^2; 
gauss=(exp(-x2sig2)); 
fgauss=fftshift(fft(fftshift(gauss))); 
 
% Visualisez la Gaussienne et sa FFT 
figure 
subplot(2,1,1) 
plot(gauss) 
title('gauss'); 
subplot(2,1,2) 
plot(real(fgauss)) 
title('fgauss'); 

end