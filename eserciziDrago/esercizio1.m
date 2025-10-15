% Definire i seguenti tre vettori: A vettore riga che contiene i numeri pari da 2 fino a 20
% B vettore riga con tutti i numeri da -22 a -13
% C vettore riga con 10 valori uguali a 0. 
% A partire da questi, effettuare le seguenti operazioni
% Creare una matrice MatX dove le righe sono 
% costituite da A, B e C (in questo ordine) 
% Verificare e salvare le dimensioni di MatX e il numero di elementi

% Estrarre la sotto-matrice che contiene le prime due righe e le prime cinque colonne. Sostituire la seconda colonna di MatX con il valore 31. Creare una matrice MatY di numeri reali distribuiti in modo random (randn), con 4 righe e 10 colonne. Creare una matrice MatZ data dalla concatenazione  di MatX, MatY e di nuovo MatX. Verificare le dimensioni di MatZ ed estrarre la diagonale.



clc     %pulisce il terminale prima di stampare

A = 2:2:20 % start:step:end (inizio da 2, salto di 2, finisco a 20)

B = -22: -13
C = zeros(1, 10) %zero in 1 riga e 10 colonne

MatX = [A;B;C]

righe = size(MatX, 1)
colonne = size(MatX, 2)
numElem = righe * colonne

% Estrarre la sotto-matrice che contiene le prime due righe e le prime cinque colonne
sottomatrice = MatX(1:2, 1:5)

% Sostituire la seconda colonna di MatX con il valore 31
MatX(:, 2) = [31]

% Creare una matrice MatY di numeri reali distribuiti in modo random (randn), con 4 righe e 10 colonne
MatY = randn(4, 10)

%Creare una matrice MatZ data dalla concatenazione  di MatX, MatY e di nuovo MatX. Verificare le dimensioni di MatZ ed estrarre la diagonale
MatZ = [MatX; MatY; MatX]

dimensioneZ = size(MatZ)
diagonale = diag(MatZ)