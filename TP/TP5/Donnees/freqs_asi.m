function [h,ww] = freqs(b,a,w)
%FREQS Laplace-transform (s-domain) frequency response.  
%   H = FREQS_ASI(B,A,W) returns the complex frequency response vector H 
%   of the filter B/A:
%                        nb-1      nb-2
%   	       B(s)   b(1)s  +  b(2)s   + ... +  b(nb)
%     H(s) = ---- = --------------------------------
%                        na-1      na-2
%        	 A(s)   a(1)s  +  a(2)s   + ... +  a(na)
%
%   given the numerator and denominator coefficients in vectors B and A. 
%   The frequency response is evaluated at the points specified in 
%   vector W.  The magnitude and phase can be graphed by calling
%   FREQS(B,A,W) with no output arguments.
%
%	 W must be a vector of pulsation.
%
%		24/03/2000 A. Rakotomamonjy
%
%		Dpt ASI INSA de Rouen


if nargin == 2,
    w = 200;
end
if length(w) == 1,
    wlen = w;
    w_long = freqint(b,a,wlen);
    % need to interpolate long frequency vector:
    xi = linspace(1,length(w_long),wlen).';
    w = 10.^interp1(1:length(w_long),log10(w_long),xi,'linear');
end

s = j*w;
hh = polyval(b,s) ./ polyval(a,s);

if nargout == 0,
    newplot;
    mag = abs(hh);   phase = angle(hh)*180/pi;
    subplot(211),loglog(w,mag),set(gca,'xgrid','on','ygrid','on') 
    set(gca,'xlim',[w(1) w(length(w))])
    xlabel('Frequency (radians)')
    ylabel('Magnitude')
    ax = gca;
    subplot(212), semilogx(w,phase),set(gca,'xgrid','on','ygrid','on') 
    set(gca,'xlim',[w(1) w(length(w))])
    xlabel('Frequency (radians)')
    ylabel('Phase (degrees)')
    axes(ax)
elseif nargout == 1,
    h = hh;
elseif nargout == 2,
    h = hh;
    ww = w;
end

