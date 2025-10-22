%--------------------------------------------------------------------
%---------Laboratorio 1 - esercizio 3--------------------------------
%---------Author: Mattia Nicolis-------------------------------------
%---------A.A. 2025-26-----------------------------------------------
%--------------------------------------------------------------------

%Creare una function chiamata Mymean che dato un vettore o una matrice in ingresso restituisca il valore medio
vet = [1:2:30];
vec_media = MYmean(vet);
media_Matlab = mean(vet);
confronto = [vec_media; media_Matlab];