-- SI VUOLE PROGETTARE IL SISTEMA INFORMATIVO PER LA GESTIONE DEI MUSEI DEL VENETO
-- Esercizio 4: provare ad inserire nella relazione Museo tuple che violino i vincoli specificati

-- Prova 1: violazione NOT NULL su giornoChiusura
INSERT INTO Museo(nome, città, giornoChiusura)
VALUES ('Museo Archeologico', 'Roma', NULL);

-- Prova 2: violazione della NOT NULL su prezzo
INSERT INTO Museo(nome, città, giornoChiusura, prezzo)
VALUES ('Museo Egizio', 'Torino', 'Lunedì', NULL);

-- Prova 3: violazione della PRIMARY KEY(nome, città)
INSERT INTO Museo(nome, città, giornoChiusura)
VALUES ('Museo Veronese', 'Verona', 'Martedì');

-- Prova 4: violazione di lunghezza massima di nome o città
INSERT INTO Museo(nome, città, giornoChiusura)
VALUES ('Museo Con Nome Molto Lungo Che Supera Trenta Caratteri', 'Milano', 'Mercoledì');

-- SELECT * FROM Museo;