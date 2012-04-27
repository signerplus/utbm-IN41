function [ ] = filtre( T,nbel,min,max )
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
    t = [min:1/nbel:max];
    x = sinc(pi*1/T*t); % Signal temporel
    y = portet(T,nbel,min,max);
    x = times(x,y);
    figure(1);
    plot(t,x);
    grid;
end