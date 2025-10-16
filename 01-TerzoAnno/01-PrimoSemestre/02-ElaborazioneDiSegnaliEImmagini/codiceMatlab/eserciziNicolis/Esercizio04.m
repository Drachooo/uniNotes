%--------------------------------------------------------------------
%---------Laboratorio 1 - esercizio 2--------------------------------
%---------Author: Mattia Nicolis-------------------------------------
%---------A.A. 2025-26-----------------------------------------------
%--------------------------------------------------------------------

%Inizializzare due vettori v1 e v2 con i valori [0 0] e [1 1] rispettivamente
v1 = [0, 0];
v2 = [1, 1];

%Assumendo che i due numeri contenuti in un vettore siano coordinate (x,y) in un piano cartesiano, calcolare la distanza euclidea tra v1 e v2 (Comandi utili: sum, sqrt)
distance_euclidea = sqrt(sum((v1 - v2).^2));

%Ripetere l'esercizio inizializzando v1 con [2; 0] e v2 con [0; 2]
v1 = [2; 0];
v2 = [0; 2];
distance_euclidea = sqrt(sum((v1 - v2).^2));

%Domanda: E' importante che i vettori siano definiti in riga o in colonna?
%No, ma l'importante è che il entrambe sia vettori colonna o vettori riga