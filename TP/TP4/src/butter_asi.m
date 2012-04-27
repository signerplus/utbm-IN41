function [b,a]=butter(n,wc,texte,texte2);

%BUTTER_ASI Butterworth digital and analog filter design.
%    [B,A] = BUTTER_ASI(N,Wn) designs an Nth order lowpass 
%    Butterworth filter and returns the filter coefficients in length 
%    N+1 vectors B (numerator) and A (denominator). The coefficients 
%    are listed in descending powers of p or z. 
%		For digital filtering, The cut-off frequency 
%    Wn must be 0.0 < Wn < 1.0, with 1.0 corresponding to 
%    half the sample rate.
%
%    Wn is a vector of pulsation i.e Wn=2*pi*fn
%
%    If Wn is a two-element vector, Wn = [W1 W2], BUTTER returns an 
%    order 2N bandpass filter with passband  W1 < W < W2.
%
%    [B,A] = BUTTER_ASI(N,Wn,'bandpass') designs a bandpass filter if Wn = [W1 W2]..
%    [B,A] = BUTTER_ASI(N,Wn,'high') designs a highpass filter.
%    [B,A] = BUTTER_ASI(N,Wn,'stop') is a bandstop filter if Wn = [W1 W2].
%    
%   
%	  BUTTER_ASI(N,Wn,'s'), BUTTER_ASI(N,Wn,'high','s') and BUTTER_ASI(N,Wn,'bandpass','s')
%    design analog Butterworth filters.  In this case, Wn can be bigger
%    than 1.0.
%   
%	16/03/2000   Alain Rakotomamonjy
%  20/05/2000   Alain Rakotomamonjy
%
%	 ASI Dept INSA de Rouen, Fr


%----processing left half plane pole



np=0:n-1;
T=2;
p=-sin( (2*np+1)*pi/2/n)+j*cos( (2*np+1)*pi/2/n);
prodp=prod(p);
a=[1 p(1)];

for i=1:n-1 % processing the normalised polynome
   a=conv(a,[1 p(i+1)]);
end;
a=abs((real((-1).^n*a/prodp)));
b=zeros(size(a));
b(length(b))=1.0;
b=b/a(1);
a=a/a(1);
if nargin==2
   texte='low';
end;
if nargin<4 & ~strcmp(texte,'s')
   wc=tan(wc*pi/T);    % prewarping pour les filtres numeriques 
end;
if length(wc)==1 & ~strcmp(texte,'high');
   wc= (wc*ones(size(a))).^(n:-1:0);  
   
     a=a./wc;
     b=b/a(1);
	  a=a/a(1);
   
end;
if strcmp(texte,'high');
   wc= (wc*ones(size(a))).^(n:-1:0);  
   a=a.*wc;
   b=fliplr(b);
   a=fliplr(a);
end;
if strcmp(texte,'bandpass');
   % c'est plus bourrin
   B=wc(2)-wc(1);
   wc=sqrt(wc(2)*wc(1));
   aux=zeros(1,2*n+1);
   aux1=[1 1];    % ca c'est pour construire le triangle de Blaise
   cnp=[1];
   for i=0:n
      if(i==0)
         aux2=a(length(a));
      else
         aux2=cnp.*a(length(a)-i)./B.^i;
	 aux3= wc*ones(size(aux2));
	 aux2=aux2.* aux3.^(2*(0:i));
      end;
      aux(n-i+1:2:n+i+1)=aux(n-i+1:2:n+i+1)+aux2;          
      cnp=conv(cnp,aux1); %update Pascal
   end
   a=aux;
   b=zeros(size(a));
   b(n+1)=1;	
end;

if nargin<4 & ~strcmp(texte,'s')  % transformation bilinéaire
 
	ni=1;
	vec=b;		% transformation du numérateur
	while(vec(ni)==0)
   	ni=ni+1;
	end;
	vec=fliplr(vec);
	n=length(vec)-ni;
	s=zeros(1,n+1);
	if n~=0
		for k=0:n
			aux=[1 -1];
			za=[1];
			for i= 1:k
   			za=conv(za,aux);
			end;
			aux1=[1 1];
			zb=[1];
			for i= 1:n-k
   			zb=conv(zb,aux1);
   		end;
         s=s+vec(k+1)*2^k/T^k*conv(za,zb);
       end;
	else
   	s=vec(1);
	end;
   sb=s;
   nnum=n;   
   % transformation du dénominateur

	vec=a;
	ni=1;
	while(vec(ni)==0)
   	ni=ni+1;
	end;
	vec=fliplr(vec);
	n=length(vec)-ni;

	s=zeros(1,n+1);
	if n~=0
		for k=0:n
			aux=[1 -1];
			za=[1];
			for i= 1:k
   			za=conv(za,aux);
			end;
			aux1=[1 1];
			zb=[1];
			for i= 1:n-k
   			zb=conv(zb,aux1);
   		end;
   		s=s+vec(k+1)*2^k/T^k*conv(za,zb);
		end;
	else
  	 s=vec(1)*[1 2 1];
	end;
aux1=[1 1];
zb=[1];
for i= 1:n-nnum
   zb=conv(zb,aux1);
end;  
sa=s;
b=conv(sb,zb); % on reajuste le degre du numerateur;
a=sa;
b=b/a(1);
a=a/a(1);
end;
   

