%Burel Matthieu
%Obert Christophe

%Fonction sinus cardinal

function y=sincard(x)   %Fonction qui permet de calculer le sinus cardinal
                        %Elle re�oit en entr�e : x appartenant � IR
                        %          et retourne : y appartenant � IR
                        %              tel que : y = sinc(x)


ind=find(x==0);         %On recherche l'indice pour lequel x = 0
x(ind)=1;               %Ainsi pour �viter la division par z�ro, on
                        %remplace la valeur de x � l'indice "ind" 
                        %car x(ind) = 0

y=sin(x)./x;            %On calcule le sinus cardinal : sinc(x) = sin(x)/x

y(ind)=1;               %On sait que :    lim   sinc(x) = 1     
                        %                 x->0
                        %Donc on sait que x(ind)=0 donc y(ind)=1
                        
%La fonction a donc calcul� le sinus cardinal y=sinc(x) en �vitant
%la division par 0