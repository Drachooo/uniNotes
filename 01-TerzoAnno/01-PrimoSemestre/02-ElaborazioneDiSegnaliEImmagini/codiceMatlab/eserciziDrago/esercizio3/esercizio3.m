% Creare una function chiamata Mymean che dato un vettore o una matrice in ingresso restituisca il valore medio. 
% Ricorda: la funzione Mymean deve essere definita in un file che si chiama Mymean.m e deve iniziare con la seguente riga: function [output] = Mymean (input) 
% Dove input e output sono rispettivamente l’ingresso e l’uscita della funzione
% In particolare, nel caso di vettori la funzione Mymean restituisce un singolo valore medio, mentre per le matrici un vettore riga contenente il valor medio di ogni colonna. 
% Controllare che la funzione dia il risultato atteso (confronto con il risultato della funzione mean di Matlab) con in ingresso un vettore riga, un vettore colonna e una matrice
% Esempio vec = [1:2:30]; vec_media = MYmean(vec);    media_Matlab = mean(vec);   confronto = [vec_media; media_Matlab]

clc

%A = randn(10)
A= [1:2:30]
risultato = Mymean(A)
vec_media = mean(A)
confronto = [risultato, vec_media]