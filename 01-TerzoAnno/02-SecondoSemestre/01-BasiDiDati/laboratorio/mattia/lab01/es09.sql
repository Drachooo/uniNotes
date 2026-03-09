-- SI VUOLE PROGETTARE IL SISTEMA INFORMATIVO PER LA GESTIONE DEI MUSEI DEL VENETO
/* Esercizio 9: si assume che in ciascuna tabella della base di dati ci siano almeno 3 righe inserite.
   Implementare le chiavi esportate per ciascuna delle 4 politiche di reazione presentate nella pagina precedente (usare il comando DROP CONTRAINTS e ADD CONSTRAINTS per effettuare il cambio di politica). 
   Provare ad eseguire una cancellazione ed un aggiornamento dei valori riferiti (e dei valori non riferiti) per verificare il diverso comportamento del DBMS.
*/

DELETE FROM Museo 
WHERE nome = 'Arena';

UPDATE Museo
SET nome = 'Castelvecchio'
WHERE nome = 'CastelVecchio';

-- SELECT * FROM Museo;
-- SELECT * FROM Opera;