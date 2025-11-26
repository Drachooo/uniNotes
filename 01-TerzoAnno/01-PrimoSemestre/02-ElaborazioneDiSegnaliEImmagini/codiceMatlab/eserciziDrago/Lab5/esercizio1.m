%% Esercizio 1
% Analizzare tramite la Trasformata di Fourier Discreta  un segnale BOX
%   - Creare un'onda rettangolare di 1 secondo con una frequenza di 
%     campionamento di 500 Hz e una lunghezza di 0.2 s 
%     (funzione rectpuls – si veda l’help)
%   - Calcolare la DFT e visualizzarne lo spettro di ampiezza e di fase 
%     (con riordinamento)
%   - Controllare che il risultato ottenuto per lo spettro di ampiezza 
%     corrisponda a quanto spiegato in teoria
%
% (se si vuole): Provare ad effettuare la stessa analisi su un segnale audio 
% registrato direttamente in MATLAB, della durata di 4 secondi
% (si veda la seconda lezione)

% Funzione BoX

clear all
close all


%x1 = [ 1 1 1 1 1 1 1 1]; % segnale box
mu_s = 500;            % frequenza di campionamento (Hz)
dt = 1 / mu_s;         % passo temporale
t = -0.5 : dt : 0.5;   % 1 secondo totale: da -0.5 s a 0.5 s
N = length(t);  % numero di campioni


width = 0.2;           % durata del rettangolo (0.2 s)

f = rectpuls(t, width);

figure
subplot(221)
plot(t,f,'-b.','MarkerSize',9)
xlabel ('tempo (sec.)')
ylabel ('f(t)')
title('Segnale rettangolaer campionato a 500Hz');


F = fft(f);           % Fast Fourier Transform è l'implementazione della DFT
Fs_shift = fftshift(F);
mu_sampling = mu_s/N; % passo
%mu = 0:mu_sampling:mu_s-mu_sampling; % campioni nello spazio delle frequenze

% Eseguo operazione di centratura dello spettro e visualizzo spettro centrato
%Fs = fftshift(F); % centratura 
mu_max = mu_s/2;  % frequenza di Nyquist ? 
mu = -mu_max:mu_sampling:mu_max-mu_sampling; % nuovo vettore frequenze 

%% Spettro in ampiezza
subplot(223)
stem(mu, abs(Fs_shift), 'filled')
xlabel("frequenza [Hz]")
ylabel("|F(μ)|")
title("Spettro di ampiezza (centrato)")
grid on

%% Spettro di fase
subplot(224)
stem(mu, angle(Fs_shift), 'filled')
xlabel("frequenza [Hz]")
ylabel("fase [rad]")
title("Spettro di fase (centrato)")
grid on


% Fissare la frequenza di campionamento e la lunghezza del box
% Generare il vettore dei tempi: 
%    - 1 secondo di lunghezza, centrato nello zero
%    - il deltaT si ricava dalla frequenza di campionamento
% Utilizzare rectpuls
% 
% ...

%Freuenza campionamento
Fs = 500; 
dt = 1 / Fs;       % passo temporale

% vettore dei tempi lungo 1 secondo, centrato nello zero
t = -0.5 : dt : 0.5;

% larghezza del box
width = 0.2;

% generazione del segnale tramite rectpuls
f = rectpuls(t, width);

% grafico del segnale
figure
plot(t, f, '-b.')
xlabel('tempo [s]')
ylabel('ampiezza')
title('Segnale BOX generato con rectpuls')
grid on


