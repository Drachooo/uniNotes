%% Esercizio 2
% Implementazione manuale della cross-correlazione 2D
% Calcolare manualmente la cross correlazione 2D tra le 
% matrici X1 e X2. Confrontare con il risultato del comando matlab
% xcorr2(X1,X2)
%
% Suggerimento: usare la versione più ottimizzata:
% si fa zero padding della matrice immagine (la matrice più
% grande) e si fa scorrere il kernel
% 

clear all
close all

X1 =[1     2     5     2     5;
     3     4     5     4     2;
     5     2     3     2     2;
     2     3     2     4     2;
     3     4     2     2     3];
     
     
X2 =[3     3     2;
     2     3     4;
     4     5     4];

 
[R1, C1] = size(X1);
[R2, C2] = size(X2);

R1
R2
% ...

%operazione 1, creare matrici con 0 padding, 
matrice = zeros(R2+R1-1, C2+C1-1)
for index = 1:R1+R2-1
    for jndex = 1:C1+C2-1
        if (index>=2 && jndex >=2 && index <=R2 && jndex <= C2)
            matrice(index, jndex) = X1(index-2, jndex-2)
        end
    end
end



