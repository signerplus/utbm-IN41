function [ output_args ] = butter( ordre )
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
%D�finitions
Fs=512;
f=linspace((-Fs/2),(Fs/2),Fs);
Fc=20;
BP=5;
Wn=[2*pi*(Fc-(BP/2)) 2*pi*(Fc+(BP/2))];
w=2*pi*f;
%Cr�ation du filtre de Butterworth analogique de type I en fonction des informations pr�c�dentes
[D,C]=butter_asi(ordre/2,Wn,'bandpass','s');
HfButter=freqs_asi(D,C,w);
HfButter = abs(HfButter);
x = xt(f);
xf = fftshift(fft(x));
yf = xf.*HfButter;
yt = ifft(yf);
yt = abs(yt);
plot (f,yt,'b',f,x,'r')
title('Filtre de Butterworth')
switch ordre                           
    case 8, legend('Fc=20Hz, BP=5Hz, ordre 8')          
    case 16, legend('Fc=20Hz, BP=5Hz, ordre 16')         
    case 24, legend('Fc=20Hz, BP=5Hz, ordre 24')         
end
end