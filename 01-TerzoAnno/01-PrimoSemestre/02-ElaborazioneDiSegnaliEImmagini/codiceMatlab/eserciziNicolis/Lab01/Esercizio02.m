%---------Laboratorio 1 - esercizio 2--------------------------------
%---------Author: Mattia Nicolis-------------------------------------
%---------A.A. 2025-26-----------------------------------------------
%--------------------------------------------------------------------

%Generare un numero casuale con il comando randn (distrinuzione normale standard)
num_random = randn(1);

%Assegnare alla variabile y il valore 1 se tale numero è compreso tra -1 e 1 (media +- deviazione standard), 0 altrimenti
if num_random >= -1 && num_random <= 1
    y = 1;
else
    y = 0;
end

%Se ripeto il procedimento 10000 volte, quante volte il numero casuale cade nell'intervallo [-1 1]?
cont = 0;
for i = 1:10000
    num_random =  randn(1);
    if num_random >= -1 && num_random <= 1
        cont = cont + 1;
    end
end

cont;

%EXTRA: Provare a risolvere l'esercizio anche senza usare cicli (suggerimento: consultate l'help della funzione randn)
num_random = randn(10000, 1);
cont = sum(num_random >= -1 & num_random <= 1);
cont;