-- ESEGURE I SEGUENTI ESERCIZI USANDO LA PROPRIA BASE DI DATI DOVE STATE INSERITE LE TABELLE RELATIVE AI MUSEI, OPERE E MOSTRE
-- Esercizio 1: visualizzare tutti i musei della città di Verona con il loro giorno di chiusura

SELECT nome, giornoChiusura
FROM Museo
WHERE città = 'Verona';