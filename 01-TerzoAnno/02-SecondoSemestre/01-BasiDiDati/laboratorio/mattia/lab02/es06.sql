-- ESEGURE I SEGUENTI ESERCIZI USANDO LA PROPRIA BASE DI DATI DOVE STATE INSERITE LE TABELLE RELATIVE AI MUSEI, OPERE E MOSTRE
-- Esercizio 6: visualizzare  tutte le mostre non terminate in ordine di data inizio e, in caso di pari data inizio, data fine

SELECT *
FROM Mostra
WHERE inizio <= CURRENT_DATE AND fine >= CURRENT_DATE
ORDER BY inizio, fine;