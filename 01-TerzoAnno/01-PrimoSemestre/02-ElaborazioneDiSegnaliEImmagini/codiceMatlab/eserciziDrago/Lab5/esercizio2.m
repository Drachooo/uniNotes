%% Esercizio 2
% Verificare il fenomeno dell'aliasing.
% In particolare: 
% - partire dal segnale sinusoidale sin(2*pi*fsig*t), dove fsig = 10 è la
%   frequenza del segnale
% - campionare un secondo di segnale ad una determinata frequenza ed effettuare
%   l'analisi di Fourier
% - Provare con le seguenti frequenze: 
%  [200, 100, 40, 30, 20, 15, 10]
% Per quali di queste avviene il fenomeno dell'aliasing?
% E' corretto rispetto alla teoria?


clear all
close all
clc


f= sin(2*pi*fsig*t)
fsig = 10 %frequenza segnale

figure
subplot(221)
plot(t,f,'-b.','MarkerSize',9)
xlabel ('tempo (sec.)')
ylabel ('f(t)')
title('Segnale rettangolaer campionato a 500Hz');

% creo il segnale campionato con frequenza Fs
% Suggerimento:
% Fisso Fs
% Calcolo DeltaT (1/Fs)
% Creo un vettore t per i tempi (1 secondo) con passo DeltaT
% creo il segnale con fsig = 10
% y = sin(2*pi*fsig*t);

% ...


