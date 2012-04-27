function [ output_args ] = Untitled1( filename )
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here

size = wavread(filename,'size');
t = [0:size-1];

Fc=size(1)/2;
BP=3000;

w=2*pi*t;
Wn=[2*pi*(Fc-(BP/2)) 2*pi*(Fc+(BP/2))];

[yt, F,N] = wavread(filename);

yf = fftshift(fft(yt));

%Cr�ation du bruit avec y le signal cr�� pr�c�demment
bruit=(var(yt)).*randn(length(yt),1);
%Ajout du bruit au signal sonore
ytB=yt+bruit;

wavwrite(ytB,F,N,strcat('bruit_',filename));

yfB=fftshift(fft(ytB));

figure(1);

subplot(4,1,1);
plot(t,ytB,'r',t,yt,'b');
title('Signal temporel');
legend('signal+bruit','signal');
xlabel('t');
ylabel('Amplitude');

subplot(4,1,2);
plot(t,real(yfB),'r',t,real(yf),'b');
title('Transformée de Fourier du signal');
legend('signal+bruit','signal');
xlabel('f');
ylabel('Amplitude');

[D,C]=butter_asi(12,Wn,'bandpass','s');
HfButter=freqs_asi(D,C,w);
HfButter=abs(HfButter);
yfF=yfB.*HfButter';

subplot(4,1,3);
plot(t,real(yfB),'b',t,real(yfF),'r');
title('Signal filtré');
xlabel('f');
ylabel('Amplitude');
legend('signal + bruit','signal+filtre');


ytF = ifft(yfF);
wavwrite(ytF,F,N,strcat('filtre_',filename));

subplot (4,1,4);
plot(t,real(ytB),'r',t,real(ytF),'b');
title('Signal bruité et signal reconstitué');
legend('signal+bruit','signal');
xlabel('t');
ylabel('Amplitude');
