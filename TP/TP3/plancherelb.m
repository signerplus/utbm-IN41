function [ ] = plancherelb( f,nbel,min,max )
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
t=[min:1/nbel:max-1/nbel];
x=abs(ifft(fftshift(plancherela(1/f,nbel,min,max)*nbel)));
plot(t,x)
grid
axis([-20 20 0  1.2]) 
