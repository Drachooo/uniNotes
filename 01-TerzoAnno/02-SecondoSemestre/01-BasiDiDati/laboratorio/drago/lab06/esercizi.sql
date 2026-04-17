
/*
Esercizio 1
Si assume che la tabella Museo possa essere aggiornata da applicazioni diverse, non sincronizzate fra
loro. Scrivere una transazione che aggiunga un museo e dimostrare cosa succede se due applicazioni
aggiungono lo stesso museo nello stesso istante usando lo schema della transazione proposta.
*/

START TRANSACTION;
INSERT INTO museo(nome, citta, indirizzo, numerotelefono, giornochiusura, prezzo, sitointernet)
VALUES ('Luca', 'Verona', 'via Pascolini', '331 1029485', 'GIOVEDI', '55.34','www.ciaociao.it');
COMMIT;

START TRANSACTION;
INSERT INTO museo(nome, citta, indirizzo, numerotelefono, giornochiusura, prezzo, sitointernet)
VALUES ('Luci', 'Padova', 'via Pascolini', '331 1029485', 'GIOVEDI', '12.50','www.ciaociao.it');
COMMIT;

ROLLBACK

/* 
Lanciando 2 transizioni nello stesso istante la prima viene salvata. Con la seconda il database blocca
l'operazione e lancia un errore
*/

DELETE FROM museo WHERE nome = 'Luci'

SELECT *
FROM museo

/*
Esercizio 2
Si assuma che una transazione deve visualizzare i prezzi dei musei di Verona che hanno parte
decimale diversa da 0 e, poi, aggiornare tali prezzi del 10% arrotondando alla seconda cifra decimale.
L’altra transazione (concorrente) deve aggiornare il prezzo dei musei di Verona aumentandoli del 10%
e arrotondando alla seconda cifra decimale.
*/
START TRANSACTION;
SELECT prezzo
FROM museo
WHERE prezzo != FLOOR(prezzo);
COMMIT;

START TRANSACTION;
UPDATE museo
SET prezzo = ROUND(prezzo * 1.10, 2)
WHERE prezzo != FLOOR(prezzo);
COMMIT;

SELECT *
FROM museo



/*
Esercizio 3
In una transazione si deve inserire una nuova mostra al museo di Castelvecchio di Verona con prezzo
d’ingresso a 40 euro e prezzo ridotto a 20. Nell’altra transazione (concorrente) si deve calcolare il
prezzo medio delle mostre di Verona prima considerando solo i prezzi ordinari e, in un’interrogazione
separata, considerando solo i prezzi ridotti.
*/

START TRANSACTION;
INSERT INTO mostra(titolo, inizio, fine, museo, citta, prezzointero, prezzoridotto)
VALUES('Il Bisbetico Domato', '2026-12-23', '2028-10-22', 'Museo di Castelvecchio', 'Verona', 40.00, 20.00);
COMMIT;

START TRANSACTION;
SELECT AVG(prezzointero) prezzo_medio_intero
FROM mostra
WHERE citta = 'Verona' AND prezzointero;

SELECT AVG(prezzoridotto) prezzo_medio_ridotto
FROM mostra
WHERE citta = 'Verona' AND prezzoridotto
COMMIT;

--da sistemare questo ultimo

SELECT *
FROM mostra