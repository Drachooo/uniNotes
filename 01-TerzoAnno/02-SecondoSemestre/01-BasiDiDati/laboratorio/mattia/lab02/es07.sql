-- ESEGURE I SEGUENTI ESERCIZI USANDO LA PROPRIA BASE DI DATI DOVE STATE INSERITE LE TABELLE RELATIVE AI MUSEI, OPERE E MOSTRE
-- Esercizio 7: visualizzare il numero totale di giorni di apertura del museo ’Arena’ di ’Verona’

SELECT COUNT(*)
FROM Orario
JOIN Museo ON (Orario.museo = Museo.nome AND Orario.città = Museo.città)
	WHERE Museo.nome = 'Arena' AND
		  Museo.città = 'Verona';