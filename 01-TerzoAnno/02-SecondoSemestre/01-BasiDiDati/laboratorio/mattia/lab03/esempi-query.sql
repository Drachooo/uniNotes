-- Visualizzare il nome degli insegnamenti offerti dal corso di Laurea in Informatica nell’anno accademico 2009/2010
SELECT DISTINCT I.nomeins
FROM CorsoStudi CS
JOIN Inserogato IE ON CS.id = IE.id_corsostudi
JOIN Insegn I ON IE.id_insegn = I.id
WHERE IE.annoaccademico = '2009/2010' AND
	CS.nome = 'Laurea in Informatica';

-- Visualizzare, in ordine decrescente rispetto al cognome, tutti i docenti dell’ateneo coinvolti nella docenza di un insegnamento il cui nome contiene la sottostringa “Lingua”, riportando nome e cognome del docente
SELECT DISTINCT P.Nome, p.Cognome
FROM Persona P
JOIN Docenza D ON P.id = D.id_persona
JOIN Inserogato IE ON IE.id = D.id_inserogato
JOIN Insegn I ON IE.id_insegn = I.id
WHERE I.nomeins LIKE '%Lingua%'
	ORDER BY Cognome DESC;

-- Visualizzare, per ciascun corso di studi della Facoltà di Economia, il numero di docenti che hanno tenuto insegnamenti nel 2006/2007, riportando il nome del corso e il numero richiesto
SELECT CS.nome , COUNT ( DISTINCT D.id_persona ) AS NumDoc
FROM CorsoStudi CS
JOIN InsErogato IE ON CS.id = IE.id_corsostudi
JOIN Docenza D ON IE.id = D.id_inserogato
JOIN CorsoInFacolta CSF ON CSF.id_corsostudi = CS.id
JOIN Facolta F ON CSF.id_facolta = F.id
WHERE IE.annoaccademico = '2006/2007'AND 
	F.nome = 'Economia'
		GROUP BY CS.nome;

-- Visualizzare, per ciascun docente che tiene più di un insegnamento (o modulo), il numero degli insegnamenti tenuti nel 2005/2006 e il numero totale di ore corrispondenti, riportando il nome e il cognome dei docenti e i conteggi richiesti
SELECT P.Nome , P.Cognome , COUNT( DISTINCT D.id_inserogato ) AS NumIns, SUM(D.orelez ) AS OreTotaliDocenza
FROM InsErogato IE
JOIN Docenza D ON IE.id = D.id_inserogato
JOIN Persona P ON P.id = D.id_persona
WHERE IE.annoaccademico = '2005/2006'
	GROUP BY P.id , P.Nome , P. Cognome
	HAVING COUNT( DISTINCT D. id_inserogato ) > 1;

-- Visualizzare il nome e il codice degli insegnamenti erogati nel 2010/2011 dalla facoltà di Scienze MM. FF. e NN.
SELECT DISTINCT I.nomeins, I.codiceins
FROM Insegn I
JOIN InsErogato IE ON I.id=IE.id_insegn
JOIN Facolta F ON F.id=IE.id_facolta
WHERE IE.annoaccademico = '2010/2011' AND 
	F.nome ='Scienze matematiche fisiche e naturali';

-- Visualizzare il nome e il quadrimestre/semestre degli insegnamenti erogati nel 2006/2007 del corso di studi con id=4, anche se l’insegnamento non ha un quadrimestre/semestre assegnato
SELECT DISTINCT I.nomeins, I.codiceins, PL.abbreviazione
FROM Insegn I
JOIN InsErogato IE ON I.id=IE. id_insegn
LEFT JOIN InsInPeriodo IP ON IE.id=IP. id_inserogato
LEFT JOIN PeriodoLez PL ON PL.id = IP. id_periodolez
WHERE IE. annoaccademico = '2006/2007' AND
	IE. id_corsostudi = 4;