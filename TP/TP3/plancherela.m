function [ x2 ] = plancherela( f,nbel,min,max )
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
t=[min:1/nbel:max-1/nbel];
x=portet(1/f,nbel,min,max); %Formation d'une porte temporelle
x2 = fftshift(fft(x)); %FFT de celle ci
y=portef(f,nbel,min,max); %Formation du filtre
x2=times(x2,y); % Application du filtre 
x2=abs(x2); %Calcul de l'amplitude
%figure(1);
%plot(t,x2);
%grid;
%axis([min-1 max+1 -0.1 6.1])
end