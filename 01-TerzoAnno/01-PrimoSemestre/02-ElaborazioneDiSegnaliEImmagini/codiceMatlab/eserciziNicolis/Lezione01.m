%---------Esercizio 1-----------------------------
%---------Autori: Mattia Nicolis, Matteo Drago----
%---------A.A. 2025-26----------------------------
%-------------------------------------------------
%Definire i seguenti vettori:
%A vettore riga che contiene i numeri pari da 2 a fino a 20
%B vettore riga con tutti i numeri da -22 a -13
%C vettore riga con 10 valori uguali a 0
%-------------------------------------------------


%Creo i tre vettori con i vari valori
A = 2:2:20;
B = -22:-13;
C = zeros(1, 10);

%Richiesta 1 - creare una matrice unica con i 3 vettori creati
MatX = [A; B; C];
%Richiesta 2 - calcolo la dimensione della matrice MatX e il numero di elementi nella matrice
dim = size(MatX);
number_elements1 = numel(MatX);
%number_elements2 = size(MatX, 2)

%Richiesta 3: Estrarre la sotto-matrice che contiene le prime due righe e le prime cinque colonne
matX = MatX(1:2, 1:5);

%Richiesta 4: la seconda colonna di Matx con il valore 31
MatX(:, 2) = [31];

%Richiesta 5: Creare uuna matrice MatY di numeri reali distribuiti in modo random (randn), con 4 righe e 10 colonne
MatY = randn(4, 10);

%Richiesta 6: Creare una matrice MatZ data dalla concatenzazione di MAtX, MatY e di nuovo MatX
MatZ = [MatX; MatY; MatX]

%Richiesta 7: Verificare le dimensioni di MatZ ed estrarre la diagonale
dimMatZ = size(MatZ);
trace_elements = diag(MatZ)