function [ ] = zt( f,nbel,min,max )
%ZT Summary of this function goes here
%   Detailed explanation goes here
t=[min:1/nbel:max];
x=plancherela(f,nbel,min,max);
x=x*f;
x=fftshift(x);
x=ifft(x);
x=abs(x);
plot(t,x)
grid
axis([min-1 max+1 -1.05 1.05])