function [ ] = extrap0( fe,dt,nbel,min,max,extrapaccuracy )
%UNTITLED1 Summary of this function goes here
%   Detailed explanation goes here

ti = [min:1/fe:max];
tr = ti;

tsi = [min:1/(extrapaccuracy*fe):max];
tsr = [min:1/(extrapaccuracy*fe):max];

xi = idealsampling(fe,min,max);
xr = realsampling(fe,dt,nbel,min,max);

xsi = length(tsr);
xsr = length(tsr);

k=1;
l=1;
for i = ti
    if (l ~= size(xi))
        for j = 0:(extrapaccuracy-1)
          xsi(j+k) = xi(l);
          xsr(j+k) = xr(l);
        end
    else
        xsi(k) = xi(l);
        xsr(k) = xr(l);
    end
    k = k+extrapaccuracy;
    l = l+1;
end
figure(1);
subplot(2,1,1)
plot(tsr,xsr)
title('Echantillonage Reel')
grid
axis([min max -2 11]);
subplot(2,1,2)
plot(tsi,xsi)
title('Echantillonage ideal')
grid
axis([min max -2 11]);
end