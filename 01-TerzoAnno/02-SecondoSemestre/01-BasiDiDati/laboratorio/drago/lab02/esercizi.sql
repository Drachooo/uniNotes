
/*ESERCIZI LEZIONE 2 */


/* 
Esercizio 1
Visualizzare tutti i musei della città di Verona con il loro giorno di chiusura.
*/

SELECT nome, giornochiusura
FROM museo
WHERE citta = 'Verona'


/*
Esercizio 2
Visualizzare per ogni mostra che inizia con la lettera ’R’, una stringa composta dal titolo e dalla 
città in cui si svolge.
*/

SELECT titolo || ' ' || citta titolo_citta
FROM mostra
WHERE titolo LIKE 'R%'

/* 
Esercizio 3
Visualizzare il titolo di ogni mostra ancora in corso e quanti giorni rimane ancora aperta a partire 
dalla data corrente. Usare la costante CURRENT_DATE per avere la data corrente.
*/

SELECT titolo, fine - CURRENT_DATE giorni_ancora_aperti
FROM mostra
WHERE CURRENT_DATE > inizio AND CURRENT_DATE < fine

/*
Esercizio 4
Visualizzare per ogni museo l’orario di apertura e chiusura il martedì. 
Se per un museo il martedì è giorno di chiusura, non mostrare nulla.
*/

SELECT museo, orarioapertura, orariochiusura
FROM orario
WHERE giorno != 'MARTEDI'

/* 
Esercizio 5
Assicurarsi che almeno una mostra abbia il prezzo ridotto non valorizzato (NULL) usando eventualmente 
il comando UPDATE per modificare almeno una riga.
Visualizzare tutte le mostre che hanno prezzo ridotto non valorizzato usando prima l’espressione 
ERRATA ’prezzoRidotto = NULL’ e poi l’espressione corretta prezzoRidotto IS NULL.
*/

SELECT titolo, prezzoridotto
FROM mostra
WHERE prezzoridotto = NULL

SELECT titolo, prezzoridotto
FROM mostra
WHERE prezzoridotto IS NULL

/*
Esercizio 6
Visualizzare tutte le mostre non terminate in ordine di data inizio e, 
in caso di pari data inizio, data fine.
*/
-- Aggiunto una mostra che termina prima di CURRENT_DATE e una con inizio uguale ad un altra 
INSERT INTO mostra(titolo, inizio, fine, museo, citta, prezzointero, prezzoridotto)
VALUES ('Quei giovani ragazzi', '2025-02-04', '2025-08-08', 'Museo di Castelvecchio', 'Verona', 20, 5)

INSERT INTO mostra(titolo, inizio, fine, museo, citta, prezzointero, prezzoridotto)
VALUES ('I ragazzi della via Gluck', '2026-01-01', '2027-08-08', 'Museo di Castelvecchio', 'Verona', 12, 7)

SELECT *
FROM mostra
WHERE fine - CURRENT_DATE > 0
ORDER BY inizio, fine

/*
Esercizio 7
Visualizzare il numero totale di giorni di apertura del museo ’Arena’ di ’Verona’.
*/

SELECT museo, fine - inizio totale_giorni_apertura
FROM mostra
WHERE museo || ' ' || citta = 'Arena Verona'

/*
Esercizio 8
Visualizzare le ore medie di apertura del museo ’Arena’ di ’Verona’.
Suggerimento: convertire orarioapertura e orariochiusura usando ’::time’.
*/

SELECT AVG(orarioapertura::time) apertura_media, AVG(orariochiusura::time)
FROM orario
WHERE museo || ' ' || citta = 'arena verona'

/*
Esercizio 9
Indicare il numero di autori distinti presenti in tutti i musei.
*/

--aggiungo opera per avere confronto
INSERT INTO opera(nome, cognomeautore, nomeautore, museo, citta, epoca, anno)
VALUES('Cristo Morto', 'Mantegna', 'Andrea', 'Pinacoteca di Brera', 'Milano', 'Rinascimento', 1480)

SELECT COUNT(DISTINCT cognomeautore || ' ' || nomeautore) autori_distinti
FROM opera

-- uso l'operatore di aggregazione cosi conteggio cognome nome. 