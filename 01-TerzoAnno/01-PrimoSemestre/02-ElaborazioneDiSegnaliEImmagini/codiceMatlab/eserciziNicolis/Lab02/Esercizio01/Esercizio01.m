%------------------------------------------------------------------------------------
%------------------------------ESERCIZIO 1 - LABORATORIO 2---------------------------
%------------------------------Author: Mattia Nicolis--------------------------------
%------------------------------A.A. 2025-26------------------------------------------
%------------------------------------------------------------------------------------

%Prendete la foto di paperino oppure fatevi una foto al volto.
%Copiate questa foto nella directory di lavoro, e cricatela attraverso Matlab.
%Attraverso opportune indicizzazioni della matrice in cui è contenuta la foto, sosituite ai pixel che rappresentano gli occhi neri, facendo comparire una sorta di occhiali da sole.
%N.B. Ricordo che il valore nero si ottiene con una terna RGB = [0,0,0].
[imm, map] = imread('Paperino.jpg');
whos imm;
whos map;
imshow(imm);


%Ruotare l'immagine originale di 45° verso sinistra;
immRuotate45 = imrotate(imm, -45)



