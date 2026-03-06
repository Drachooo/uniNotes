-- SI VUOLE PROGETTARE IL SISTEMA INFORMATIVO PER LA GESTIONE DEI MUSEI DEL VENETO
-- Esercizio 8: nell’entità Mostra aggiornare il prezzoRidotto aumentandolo di 1€ per quelle mostre che hanno prezzoIntero inferiore a 15€

UPDATE Mostra
SET prezzoRidotto = prezzoRidotto + 1
WHERE prezzoIntero < 15.00;

-- SELECT * FROM Mostra;