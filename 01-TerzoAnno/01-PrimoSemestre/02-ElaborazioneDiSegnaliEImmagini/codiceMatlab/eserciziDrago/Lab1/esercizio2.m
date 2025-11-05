% Generare un numero casuale con il comando randn (distribuzione normale standard)
% Assegnare alla variabile y il valore 1 se tale numero e' compreso tra -1 e 1 (media +- deviazione standard), 0 altrimenti.
% Se ripeto il procedimento 10000 volte, quante volte il numero casuale cade nell'intervallo [-1 1]?
% EXTRA: Provare a risolvere l'esercizio anche senza usare cicli (suggerimento: consultate l'help della funzione randn)


clc

% Generare un numero casuale con il comando randn (distribuzione normale standard)
casuale = randn


% Assegnare alla variabile y il valore 1 se tale numero e' compreso tra -1 e 1 (media +- deviazione standard), 0 altrimenti.
if(casuale > -1 & casuale<1)
    y = 1
else
    y = 0
end

% Se ripeto il procedimento 10000 volte, quante volte il numero casuale cade nell'intervallo [-1 1]?
y = 0
for i=1:10000
    casuale = randn
    if(casuale > -1 & casuale<1)
        y = y + 1
    end
end



% EXTRA: Provare a risolvere l'esercizio anche senza usare cicli (suggerimento: consultate l'help della funzione randn)

% crea matrice 100x100 di numeri random
matriceRand = randn(100)

x = 0; %creo variabile contatore
x= sum(matriceRand(:)>-1 & matriceRand(:)<1)
