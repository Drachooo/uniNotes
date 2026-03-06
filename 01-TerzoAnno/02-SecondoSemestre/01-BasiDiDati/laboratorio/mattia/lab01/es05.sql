-- SI VUOLE PROGETTARE IL SISTEMA INFORMATIVO PER LA GESTIONE DEI MUSEI DEL VENETO
-- Esercizio 5: nell’entità Museo, aggiungere l’attributo sitoInternet e inserire gli opportuni valori

ALTER TABLE Museo
ADD COLUMN sitoInternet VARCHAR(40);

UPDATE Museo
SET sitoInternet = 'www.arena-verona.it'
WHERE nome = 'Arena';

UPDATE Museo
SET sitoInternet = 'www.castel-vecchio.it'
WHERE nome = 'Castelvecchio';

UPDATE Museo
SET sitoInternet = 'www.museo-veronese.it'
WHERE nome = 'Museo Veronese';

-- SELECT * FROM Museo;