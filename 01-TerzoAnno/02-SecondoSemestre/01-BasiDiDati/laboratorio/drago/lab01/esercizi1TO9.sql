create table Opera(
nome varchar (30),
cognomeAutore varchar (20),
nomeAutore varchar (20),
museo varchar (30),
citta varchar (20),
epoca varchar,
anno integer,
PRIMARY KEY(nome, cognomeAutore, nomeAutore),
FOREIGN KEY(museo, citta)
	REFERENCES Museo(nome, citta)
)



create table Museo(
nome varchar (30) DEFAULT 'MuseoVeronese',
citta varchar(20) DEFAULT 'Verona',
indirizzo varchar (100),
numeroTelefono varchar (12) NOT NULL,
giornoChiusura giornoSettimana NOT NULL ,
prezzo decimal NOT NULL DEFAULT '10',
primary key (nome, citta)
)


create table Mostra( 
titolo varchar (30),
inizio DATE, 
fine DATE NOT NULL, 
museo varchar (30),
citta varchar (20),
prezzo integer,
primary key (titolo, inizio),
FOREIGN KEY (museo, citta)
	REFERENCES Museo(nome, citta)
)


create table Orario( 
progressivo integer, 
museo varchar (30) NOT NULL,
citta varchar (20) NOT NULL,
giorno giornoSettimana NOT NULL,  
orarioApertura TIME WITH TIME ZONE DEFAULT '09:00 CET',
orarioChiusura TIME WITH TIME ZONE DEFAULT '19:00 CET',
primary key(progressivo),
FOREIGN KEY(museo, citta)
	REFERENCES Museo(nome, citta)
)

CREATE DOMAIN giornoSettimana AS CHARACTER (9)
CHECK (VALUE IN ('LUNEDI', 'MARTEDI', 'MERCOLEDI', 'GIOVEDI', 'VENERDI', 'SABATO', 'DOMENICA'));

/*
Esercizio 2 
Inserire nell’entità Museo le seguenti tuple:
*/

INSERT INTO Museo ( nome, citta, indirizzo, numeroTelefono, giornoChiusura, prezzo)
VALUES('Arena', 'Verona', 'piazza Bra', '045 8003204', 'MARTEDI', 20) 


INSERT INTO Museo ( nome, citta, indirizzo, numeroTelefono, giornoChiusura, prezzo)
VALUES('CastelVecchio', 'Verona', 'Corso Castelvecchio', '045 594734', 'LUNEDI', 15); 



/*
Esercizio 3 
Popolare le tabelle Opera e Mostra con almeno altre tre tuple ciascuna. 
*/
INSERT INTO Opera(nome, cognomeAutore, nomeAutore, museo, citta, epoca, anno)
VALUES('Statua di Gladiatore', 'Ignoto', 'Ignoto', 'Arena', 'Verona', 'Epoca Romana', 50),
('Ritratto di Fanciullo', 'Caroto', 'Giovan Francesco', 'Museo di Castelvecchio', 'Verona', 'Rinascimento', 1520),
('Sacra Famiglia', 'Mantegna', 'Andrea', 'Museo di Castelvecchio', 'Verona', 'Rinascimento', 1495);

INSERT INTO Mostra (titolo, inizio, fine, museo, citta, prezzo)
VALUES 
    ('I Romani a Verona', '2026-05-01', '2026-08-31', 'Arena', 'Verona', 15),
    ('Il Rinascimento Nascosto', '2026-09-15', '2027-01-10', 'Museo di Castelvecchio', 'Verona', 12),
    ('Gladiatori: Miti e Realtà', '2026-04-10', '2026-07-20', 'Arena', 'Verona', 18);



--seleziono tutti gli attributi da opera
SELECT * from Museo



/* 
Esercizio 4
Provare ad inserire nella relazione Museo tuple che violino i vincoli specificati. 
*/ 
INSERT INTO Museo (nome, citta, indirizzo, numerotelefono, giornochiusura, prezzo) 
VALUES ('Arena', 'Verona', 'piazza Bra', '111222333', 'LUNEDI', 20);


/*
Esercizio 5 
Nell’entità Museo, aggiungere l’attributo sitoInternet e inserire gli opportuni valori.
*/

ALTER TABLE Museo ADD COLUMN sitoInternet varchar (40);
UPDATE Museo SET sitoInternet = 'www.ciao.it' WHERE citta = 'Verona'

/*
Esercizio 6 
Nell’entità Mostra modificare l’attributo prezzo in prezzoIntero ed aggiungere l’attributo 
prezzoRidotto con valore di default 5. Aggiungere il vincolo (di tabella o di attributo?) 
che garantisca che Mostra.prezzoRidotto sia minore di Mostra.prezzoIntero.
*/

ALTER TABLE Mostra RENAME COLUMN prezzo TO prezzoIntero;
ALTER TABLE Mostra ADD COLUMN prezzoRidotto integer DEFAULT '5';
ALTER TABLE Mostra ADD CONSTRAINT chk_prezzo_corretto CHECK (prezzoRidotto < prezzoIntero);



/*
Esercizio 7 
Nell’entità Museo aggiornare il prezzo aggiungendo 1 Euro alle tuple esistenti. 
*/
UPDATE Museo SET prezzo = prezzo + 1 WHERE citta = 'Verona'


/*
Esercizio 8 
Nell’entità Mostra aggiornare il prezzoRidotto aumentandolo di 1 Euro per quelle 
mostre che hanno prezzoIntero inferiore a 15 Euro.
*/

UPDATE Mostra SET prezzoRidotto = prezzoRidotto + 1 WHERE prezzoIntero < 15

SELECT * FROM Mostra


/*
Esercizio 9 
Si assume che in ciascuna tabella della base di dati ci siano almeno 3 righe inserite. 
Implementare le chiavi esportate per ciascuna delle 4 politiche di reazione presentate 
nella pagina precedente (usare il comando DROP CONTRAINTS e ADD CONSTRAINTS 
per effettuare il cambio di politica). Provare ad eseguire una cancellazione ed un 
aggiornamento dei valori riferiti (e dei valori non riferiti) per verificare il diverso 
comportamento del DBMS.
*/

