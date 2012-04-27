function [ x ] = realsampling(fe,dt,nbel,min,max)
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
f0 = 10;
t=[min:1/fe:max];
x = length((max-min)*fe);
j=1;
for i = t
    ts=[i:dt/nbel:i+dt];
    xs=f0*sincard(pi*f0*ts);
    x(j) = mean(xs);
    j=j+1;
end

plot(t,x);
end