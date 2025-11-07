%%
%%% ESERCIZIO 1
% Implementare a mano la cross correlazione 1D, partendo 
% dallo script sottostante
clear all
close all
clc

% Si vuole calcolare la cross correlazione 
% di questi due segnali (stessi segnali dell'esempio 1)

x1 = [1 1 1 1 1 1 1 1]; %box 
x2 = [1 2 3 4 5 6 7 8]; %triangolo

M = length(x1); % lunghezza primo segnale
N = length(x2); % lunghezza secondo segnale

% visualizzazione 
figure; set(gcf,'name','Segnali originali','IntegerHandle','off');
subplot(211); stem(x1); title('x1')
subplot(212); stem(x2); title('x2')


% DA COMPLETARE CON I PASSI MANCANTI:
% Opzione 1: creazione vettori con zero padding, calcolo cross correlazione
% Opzione 2: inizializzazione vettori, calcolo cross correlazione, shifting
% ....

%OPERAZIONE 1




clc
crossCorrelazione = zeros(1, N+M-1);

for index = 1:N+M-1

    primoVet = [zeros(1, N-1) x1 zeros(1,N-1)];
    secondoVet = [zeros(1, index-1) x2 zeros(1, N+M-1-index)];
    crossCorrelazione(index) = primoVet * secondoVet';
end
crossCorrelazione

%OPERAZIONE 2
%shifto circolarmente il secondo vettore
ciccio = [x2 zeros(1, N-1+M-1)];

for index = 1:N+M-1

    primoVet = [zeros(1, N-1) x1 zeros(1,N-1)];
    vettore = circshift(ciccio, index-1);
    crossCorrelazione(index) = primoVet * vettore';
end
crossCorrelazione

% Confrontare il vettore risultante col vettore ottenuto nell'esempio 1
