% Corso di Elaborazione dei Segnali e Immagini
% Docente: Manuele Bicego 
% Lezione 4: Esercizi principali 


%% Esercizio 1
% Matching 2D
% Usare la cross correlazione 2D per trovare la posizione del template 
% nell'immagine
% In particolare si richiede di calcolare di quanto (righe-colonne) 
% il template è stato traslato rispetto all’angolo in alto a sinistra 
% dell’immagine
%
% Suggerimento: calcolare la cross correlazione (xcorr2) tra l'immagine 
% e il template (kernel), estrarre le coordinate del massimo e 
% recuperare la posizione del kernel
% 
% Controllare anche l'help della funzione xcorr2

clear all
close all

% Template: una croce
template = 0.2*ones(55);
template(29:31,15:45) = 0.6;
template(15:45,29:31) = 0.6;


% Immagine: si posiziona il template con un offset 
immagine = 0.2*ones(111);
offset = [10 40];
immagine(offset(1):offset(1)+size(template,1)-1,offset(2):offset(2)+size(template,2)-1) = template;

figure
imshow(template,[])
title('Template')

figure
imshow(immagine,[])
title('Immagine')


correlazione = xcorr2(immagine, template)
cc = max(correlazione(:))

[r, c] = find(correlazione == cc)

riga = r - 55 +1
colonna = c - 55 +1