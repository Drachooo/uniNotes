-- SI VUOLE PROGETTARE IL SISTEMA INFORMATIVO PER LA GESTIONE DEI MUSEI DEL VENETO
/* Esercizio 6: nell’entità Mostra modificare l’attributo prezzo in prezzoIntero ed aggiungere l’attributo prezzoRidotto con valore di default 5. 
   Aggiungere il vincolo (di tabella o di attributo?) che garantisca che Mostra.prezzoRidotto sia minore di Mostra.prezzoIntero.
*/

ALTER TABLE Mostra 
RENAME COLUMN prezzo TO prezzoIntero;

ALTER TABLE Mostra
ADD COLUMN prezzoRidotto DECIMAL(10,2) DEFAULT 5.00;

ALTER TABLE Mostra
ADD CONSTRAINT chk_prezzi CHECK (prezzoRidotto < prezzoIntero);