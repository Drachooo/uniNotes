-- ESEGURE I SEGUENTI ESERCIZI USANDO LA PROPRIA BASE DI DATI DOVE STATE INSERITE LE TABELLE RELATIVE AI MUSEI, OPERE E MOSTRE
-- Esercizio 9: indicare il numero di autori distinti presenti in tutti i musei

SELECT Museo.nome, COUNT(DISTINCT opera.cognomeAutore || ' - ' || opera.nomeAutore) AS numeroAutori
FROM Museo
JOIN Opera ON (Opera.museo = Museo.nome AND Opera.città = Museo.città)
	GROUP BY Museo.nome;
-- N.B. con DISTINCT non vengono contati i duplicati