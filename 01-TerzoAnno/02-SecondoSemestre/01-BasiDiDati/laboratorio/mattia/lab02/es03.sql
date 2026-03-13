-- ESEGURE I SEGUENTI ESERCIZI USANDO LA PROPRIA BASE DI DATI DOVE STATE INSERITE LE TABELLE RELATIVE AI MUSEI, OPERE E MOSTRE
/* Esercizio 3: visualizzare il titolo di ogni mostra ancora in corso e quanti giorni rimane ancora aperta a partire dalla data corrente. 
Usare la costante CURRENT_DATE per avere la data corrente */

SELECT titolo, (fine - CURRENT_DATE) AS giorniRimanenti
FROM Mostra
WHERE inizio <= CURRENT_DATE AND fine >= CURRENT_DATE;
-- N.B. gli operatori logici si scrivono a parole (AND) e non in simboli (no & o &&)