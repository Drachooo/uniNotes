-- ESEGURE I SEGUENTI ESERCIZI USANDO LA PROPRIA BASE DI DATI DOVE STATE INSERITE LE TABELLE RELATIVE AI MUSEI, OPERE E MOSTRE
-- Esercizio 2: visualizzare per ogni mostra che iniza con la lettera 'R', una stringa composta dal titolo e dalla città in cui si svolge

-- Versione con comando LIKE 
SELECT titolo || ' - ' || città AS InfoMostra
FROM Mostra
WHERE titolo LIKE 'R%';

-- Versione con comando SIMILAR TO
SELECT titolo || ' - ' || città AS InfoMostra
FROM Mostra
WHERE titolo SIMILAR TO '[R]%';