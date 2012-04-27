function [ ] = convcarre( )
%CONVCARRE Trace le produit de convolution de deux fonctions carrés

t = 0:0.01:5;
y = square(2*pi*t); 
plot(abs(conv(y,y)));
title('produit de convolution de fonction carre');
end