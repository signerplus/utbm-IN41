function [ x ] = xt( t )
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
%t=linspace((-2/fs),(2/fs),1/fs);
x1 = sin(2*pi()*5*t);
x2 = sin(2*pi()*4*5*t);
x3 = sin(2*pi()*7*5*t);
x = x1 + x2 + x3;
%plot(t,x)