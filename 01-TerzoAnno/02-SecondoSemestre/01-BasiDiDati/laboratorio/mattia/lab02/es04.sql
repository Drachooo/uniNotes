-- ESEGURE I SEGUENTI ESERCIZI USANDO LA PROPRIA BASE DI DATI DOVE STATE INSERITE LE TABELLE RELATIVE AI MUSEI, OPERE E MOSTRE
/* Esercizio 4: visualizzare per ogni museo l’orario di apertura e chiusura il martedì. 
Se per un museo il martedì è giorno di chiusura, non mostrare nulla*/

SELECT museo, orarioApertura, orarioChiusura
FROM orario
JOIN Museo ON (Orario.museo = Museo.nome AND Orario.città = Museo.città)
	WHERE Orario.giorno = 'Martedì' AND Museo.giornoChiusura != 'Martedì';