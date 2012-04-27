function [ x ] = idealsampling(fe,min,max)
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
f0 = 10;
t=[min:1/fe:max];
x = f0*sincard(pi*f0*t);
plot(t,x);
end