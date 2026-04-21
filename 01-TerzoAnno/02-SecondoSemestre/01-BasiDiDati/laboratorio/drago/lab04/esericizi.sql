/*

	ESERCIZI lab 04

*/

/*
Esercizio 1
Trovare identificatore, cognome e nome dei docenti che, nell’anno accademico 2010/2011, hanno tenuto
un insegnamento (l’attributo da confrontare è nomeins) che non hanno tenuto nell’anno accademico
precedente. Ordinare la soluzione per identificatore.
La soluzione ha 1031 righe. Le 5 a partire dalla XX riga sono:
id | cognome | nome
-----+------------+-------------
140 | Ferrarini | Roberto
142 | Combi | Carlo
168 | Rossignoli | Cecilia
173 | Manca | Vincenzo
184 | Bonacina | Maria Paola
*/

SELECT DISTINCT p.id, p.cognome, p.nome
FROM persona p
	JOIN docenza dc ON dc.id_persona = p.id
	JOIN inserogato ins ON ins.id = dc.id_inserogato
	JOIN insegn i ON i.id = ins.id_insegn
WHERE ins.annoaccademico = '2010/2011' AND NOT EXISTS (
	SELECT 1
	FROM docenza dc2 
		JOIN inserogato ins2 ON ins2.id = dc2.id_inserogato
		JOIN insegn i2 ON i2.id = ins2.id_insegn
	WHERE ins2.annoaccademico = '2009/2010' AND i2.nomeins = i.nomeins AND dc2.id_persona = p.id
)
ORDER BY p.id


/*
Esercizio 2
Trovare i corsi di studio che non sono gestiti dalla facoltà di “Medicina e Chirurgia” e che hanno
insegnamenti
erogati con moduli nel 2010/2011. Si visualizzi il nome del corso e il numero di insegnamenti erogati con
moduli nel 2010/2011.
Soluzione: ci sono 33 righe. Le prime 5 ordinate rispetto al nome sono:
nome | numinsegn
--------------------------+-----------
Laurea IN Beni culturali | 5
Laurea IN Bioinformatica | 4
Laurea IN Biotecnologie | 12
Laurea IN Filosofia | 8
Laurea IN Informatica | 2
*/

SELECT cs.nome, COUNT(ins.id) numinsegn
FROM corsostudi cs
	JOIN inserogato ins ON ins.id_corsostudi = cs.id
WHERE cs.id NOT IN (
	SELECT cif.id_corsostudi
	FROM corsoinfacolta cif
		JOIN facolta f ON f.id = cif.id_facolta
	WHERE f.nome = 'Medicina e Chirurgia'
)
AND ins.annoaccademico = '2010/2011' AND ins.hamoduli = '1'
GROUP BY (cs.nome)
ORDER BY cs.nome


/*
Esercizio 3
Trovare gli insegnamenti del corso di studi con id=4 che non sono mai stati offerti al secondo
quadrimestre.
Per selezionare il secondo quadrimestre usare la condizione "abbreviazione LIKE '2%'".
La soluzione ha 14 righe.
*/

SELECT DISTINCT i.id, i.nomeins
FROM inserogato ins
	JOIN insegn i ON i.id = ins.id_insegn
WHERE ins.id_corsostudi = 4 
  AND NOT EXISTS (
	-- Verifico che non esista un'erogazione dello STESSO insegnamento 
	-- per lo STESSO corso di studi nel 2° quadrimestre
	SELECT 1
	FROM inserogato ins2
		JOIN insinperiodo iip ON iip.id_inserogato = ins2.id
		JOIN periodolez pl ON pl.id = iip.id_periodolez
	WHERE ins2.id_insegn = i.id               -- <-- Deve essere la stessa materia
	  AND ins2.id_corsostudi = 4              -- <-- Deve essere nello stesso corso
	  AND pl.abbreviazione LIKE '2%'
);

/*
Esercizio 4
Trovare il nome dei corsi di studio che non hanno mai erogato insegnamenti che contengono nel nome
la stringa ’matematica’ (usare ILIKE invece di LIKE per rendere il test non sensibile alle
maiuscole/minuscole (case-insensitive)).
La soluzione ha 572 righe.
*/

SELECT *
FROM corsostudi cs
	JOIN inserogato ins ON ins.corsostudi = cs.id
	JOIN insegn i ON i.id = ins.insegn
WHERE i.nome <>

SELECT i2.id
FROM insegn i2
WHERE i2.nome iLIKE '%matematica%'
