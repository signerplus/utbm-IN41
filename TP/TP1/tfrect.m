function [ ] = tfrect( )
%TFRECT Trace la fonction rectangle puis sa fft


t = 0:0.01:5;
y = square(2*pi*t); 
subplot(2,1,1);
plot(t,y);
title('fonction rectangle');
z=abs(fftshift(fft(y)));
subplot(2,1,2)
plot(t,z)
axis([0 5 -100 400]); % echelle du graph
title('FFT de la fonction carre');
end