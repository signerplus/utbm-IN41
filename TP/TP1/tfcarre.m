function [ output_args ] = tfcarre( input_args )
%TFCARRE Trace la fft d'un produit de convolution de deux fonctions porte
%puis trace le produit de deux fft de fonctions carrés
t = 0:0.01:5;
y = square(2*pi*t); 
z=abs(fftshift(fft(y)));
subplot(2,1,1);
plot(abs(fft(conv(y,y))));
title('FFT de la convolution de 2 portes');
subplot(2,1,2);
plot(z.*z);
title('produit du produit de 2 fft de fonctions carré');
