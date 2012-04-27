function [ ] = exercicea( )
%EXA Summary of this function goes here
%   Detailed explanation goes here
t = 0:0.001:0.6;
x = sin (2*pi*50*t) +sin (2*pi*120*t);
plot(t,x);
xlabel('t');
ylabel('x(t)');
title('x en fonction de t');
end