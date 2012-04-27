function [ ] = realsig( )
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
f0 = 10;
t=[-2:0.001:2];
x = f0*sincard(pi*f0*t);
plot(t,x);
end