-- SI VUOLE PROGETTARE IL SISTEMA INFORMATIVO PER LA GESTIONE DEI MUSEI DEL VENETO
-- Esercizio 1: scrivere il codice PostgreSQL che generi tutte le tabelle

CREATE TABLE Museo(
	nome VARCHAR(30) DEFAULT 'Museo Veronese',
	città VARCHAR(20) DEFAULT 'Verona',
	indirizzo TEXT,
	numeroTelefono VARCHAR(20),
	giornoChiusura VARCHAR(10) NOT NULL,
	prezzo DECIMAL(10,2) DEFAULT 10.00 NOT NULL,
	PRIMARY KEY(nome, città)
);

CREATE TABLE Mostra(
	titolo VARCHAR(30),
	inizio DATE,
	fine DATE NOT NULL,
	museo VARCHAR(30),
	città VARCHAR(20),
	prezzo DECIMAL(10,2),
	PRIMARY KEY(titolo, inizio),
	FOREIGN KEY(museo, città) 
		REFERENCES Museo(nome, città)
			ON DELETE SET NULL
                  ON UPDATE CASCADE
);

CREATE TABLE Opera(
	nome VARCHAR(30),
	cognomeAutore VARCHAR(20),
	nomeAutore VARCHAR(20),
	museo VARCHAR(30) NOT NULL,
	città VARCHAR(20) NOT NULL,
	epoca VARCHAR(50),
	anno SMALLINT CHECK(anno > 0 AND anno <= 2100),
	PRIMARY KEY(nome, cognomeAutore, nomeAutore),
	FOREIGN KEY(museo, città)
		REFERENCES Museo(nome, città)
			ON DELETE SET NULL
                  ON UPDATE CASCADE
);

CREATE DOMAIN giorni_settimana AS VARCHAR(9) 
	CHECK(VALUE IN('Lunedì', 'Martedì', 'Mercoledì', 'Giovedì', 'Venerdì', 'Sabato', 'Domenica'));

CREATE TABLE Orario(
	progressivo INTEGER PRIMARY KEY,
	museo VARCHAR(30) NOT NULL,
	città VARCHAR(20) NOT NULL,
	giorno giorni_settimana NOT NULL,
	orarioApertura TIME WITH TIME ZONE DEFAULT '09:00Z',
	orarioChiusura TIME WITH TIME ZONE DEFAULT '19:00Z',
      FOREIGN KEY(museo, città)
		REFERENCES Museo(nome, città)
			ON DELETE SET NULL
                  ON UPDATE CASCADE
);