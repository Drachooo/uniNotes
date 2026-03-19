/* Esercizio 1
Visualizzare tutti i musei della città di Verona con il loro giorno di chiusura.
*/

SELECT nome, giornochiusura, citta
FROM museo
WHERE citta = 'Verona'


/* Esercizio 2
Visualizzare per ogni mostra che inizia con la lettera ’R’, una stringa composta dal titolo e dalla città in cui
si svolge.
*/

SELECT titolo || ' - ' || citta as infoMostra
FROM mostra 
WHERE titolo LIKE 'I%'

select * from mostra


/*
Esercizio 3
Visualizzare il titolo di ogni mostra ancora in corso e quanti giorni rimane ancora aperta a partire dalla data
corrente. Usare la costante CURRENT_DATE per avere la data corrente.
*/

INSERT INTO mostra ( titolo, inizio, fine , museo, citta, prezzoIntero, prezzoRidotto)
VALUES ('Ricasso: L''evoluzione', '2026-01-01', '2026-07-30', 'Museo di Castelvecchio', 'Verona', 15.00, 10.00);

SELECT titolo, fine - CURRENT_DATE as ciccio
FROM mostra
WHERE CURRENT_DATE between inizio and fine


/*
Esercizio 4
Visualizzare per ogni museo l’orario di apertura e chiusura il martedì. Se per un museo il martedì è giorno di chiusura, non mostrare nulla.
*/