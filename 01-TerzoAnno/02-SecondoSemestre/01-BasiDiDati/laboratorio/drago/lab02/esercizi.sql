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

SELECT titolo || ' - ' || citta infoMostra
FROM mostra 
WHERE titolo LIKE 'I%'

select * from mostra


/*
Esercizio 3
Visualizzare il titolo di ogni mostra ancora in corso e quanti giorni rimane ancora aperta a partire dalla data
corrente. Usare la costante CURRENT_DATE per avere la data corrente.
*/

INSERT INTO mostra ( titolo, inizio, fine , museo, citta, prezzoIntero, prezzoRidotto)
VALUES ('Picasso: L''evoluzione', '2026-01-01', '2026-07-30', 'Museo di Castelvecchio', 'Verona', 15.00, 10.00);

SELECT titolo, fine - CURRENT_DATE giorni_apertura
FROM mostra
WHERE CURRENT_DATE between inizio and fine


/*
Esercizio 4
Visualizzare per ogni museo l’orario di apertura e chiusura il martedì. Se per un museo il martedì è giorno di chiusura, non mostrare nulla.
*/

select museo, orarioapertura, orariochiusura
FROM orario 
where giorno = 'MARTEDI'

select * 
from orario

INSERT INTO orario (progressivo, museo, citta, giorno, orarioapertura, orariochiusura) 
VALUES 
    (1, 'arena', 'verona', 'LUNEDI', '09:00:00', '19:00:00'),
    (2, 'arena', 'verona', 'MARTEDI', '09:00:00', '19:00:00'),
    (3, 'castelvecchio', 'verona', 'LUNEDI', '10:00:00', '18:00:00');

/*
Esercizio 5
Assicurarsi che almeno una mostra abbia il prezzo ridotto non valorizzato (NULL) usando eventualmente il comando UPDATE per modificare almeno una riga.
Visualizzare tutte le mostre che hanno prezzo ridotto non valorizzato usando prima l’espressione ERRATA ’prezzoRidotto = NULL’ e poi l’espressione corretta prezzoRidotto IS NULL.
*/

select titolo
from mostra
where prezzoridotto is null

select * 
from mostra

/*Update del prezzoridotto*/
update mostra
set prezzoridotto = NULL 
where museo = 'Arena'


/*
Esercizio 6
Visualizzare tutte le mostre non terminate in ordine di data inizio e, in caso di pari data inizio, data fine.
*/

select titolo, inizio, fine
from mostra
where CURRENT_DATE < fine
order by inizio

select *
from mostra

/* 
Esercizio 7
Visualizzare il numero totale di giorni di apertura del museo ’Arena’ di ’Verona’.
*/

SELECT COUNT(giorno) AS totale_giorni_apertura
FROM orario
WHERE museo = 'arena' AND citta = 'verona';

select *
from museo


/*
Esercizio 8
Visualizzare le ore medie di apertura del museo ’Arena’ di ’Verona’.
Suggerimento: convertire orarioapertura e orariochiusura usando ’::time’.
*/

SELECT AVG(orarioapertura::time) AS ore_medie_apertura
FROM orario
WHERE museo = 'arena' AND citta = 'verona';

/*
Esercizio 9
Indicare il numero di autori distinti presenti in tutti i musei.
*/

select count(distinct nomeautore) as numeroAutori
from opera

select * 
from opera