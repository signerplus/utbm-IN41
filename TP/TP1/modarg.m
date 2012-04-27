function [mod, arg] = modarg(z)
 x = real(z);
 y = imag(z);
 mod = sqrt(x.^2+y.^2);
 arg = atan(y/x);