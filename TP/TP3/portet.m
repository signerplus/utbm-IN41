function [ x ] = portet( T,nbel,min,max )
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
    t1 = [min:1/nbel:-T/2-1/nbel];
    t2 = [-T/2:1/nbel:T/2];
    t3 = [T/2+1/nbel:1/nbel:max];
    x=[zeros(size(t1)), ones(size(t2)), zeros(size(t3))];
%    figure(1);
%    plot([t1 t2 t3],x);
%    grid;
%    axis([min-0.1 max+0.1 -0.05 1.05]);
end