function [ x ] = portef( f,nbel,min,max )
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
    t1 = [min:1/nbel:-2/f-1/nbel];
    t2 = [-2/f:1/nbel:2/f];
    t3 = [2/f+1/nbel:1/nbel:max];
    x=[zeros(size(t1)), ones(size(t2)), zeros(size(t3))];
%    figure(1);
%    plot([t1 t2 t3],x);
%    grid;
%    axis([min-1 max+1 -0.05 1.05]);
end