function [sinmean,sinmin,sinmax,sindev,sinmed] = sinus(frequency)
% SINUS Trace la fonction sinus, puis renvoie la moyenne, la médiane le minimum et le maximum   
    t= 0:9999;
    tg=t/200;
    f=sin(2*pi*tg*frequency);
    plot(t,f);
    sinmean = mean(f);
    sinmin = min(f);
    sinmax = max(f);
    sindev = std(f);
    sinmed = median(f);
end