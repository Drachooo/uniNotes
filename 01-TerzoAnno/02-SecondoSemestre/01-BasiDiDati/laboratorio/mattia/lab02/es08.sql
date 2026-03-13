-- ESEGURE I SEGUENTI ESERCIZI USANDO LA PROPRIA BASE DI DATI DOVE STATE INSERITE LE TABELLE RELATIVE AI MUSEI, OPERE E MOSTRE
-- Esercizio 8: visualizzare le ore medie di apertura del museo ’Arena’ di ’Verona’

SELECT AVG(orarioChiusura::time - orarioApertura::time) AS aperturaMedia
FROM Orario
JOIN Museo ON(Orario.museo = Museo.nome AND Orario.città = Museo.città)
	WHERE Museo.nome = 'Arena' AND
		  Museo.città = 'Verona';