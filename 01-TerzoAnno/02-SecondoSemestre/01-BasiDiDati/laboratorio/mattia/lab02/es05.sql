-- ESEGURE I SEGUENTI ESERCIZI USANDO LA PROPRIA BASE DI DATI DOVE STATE INSERITE LE TABELLE RELATIVE AI MUSEI, OPERE E MOSTRE
/* Esercizio 5: assicurarsi che almeno una mostra abbia il prezzo ridotto non valorizzato (NULL) usando eventualmente il
comando UPDATE per modificare almeno una riga.
Visualizzare tutte le mostre che hanno prezzo ridotto non valorizzato usando prima l’espressione ERRATA ’prezzoRidotto = NULL’ e poi l’espressione corretta prezzoRidotto IS NULL*/

-- Controllo che ci sia almeno una tupla NULL di prezzoRidotto con comando NULL sbagliato
SELECT *
FROM Mostra
WHERE prezzoRidotto NULL;

-- Controllo che ci sia almeno una tupla NULL di prezzoRidotto
SELECT *
FROM Mostra
WHERE prezzoRidotto IS NULL;