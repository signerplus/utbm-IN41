function [ ] = exo( )
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here
ordres = [8,16,24];
j=0
%for i = 1:3
for i = 1:2:5
    j=j+1;
    subplot(3,2,i);
    cheby(ordres(j));
    axis([-50 50 -1 1]);
end
j = 0;
for i = 2:2:6
    j = j+1;
    subplot(3,2,i);
    butter(ordres(j));
    axis([-50 50 -1 1]);
end