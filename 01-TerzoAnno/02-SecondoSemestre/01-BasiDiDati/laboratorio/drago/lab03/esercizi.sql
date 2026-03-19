/*Visualizzare il nome degli insegnamenti offerti dal corso di laurea in 
Informatica nell’anno accademico 2009/2010.*/

SELECT DISTINCT I. nomeins
FROM CorsoStudi CS
  JOIN InsErogato IE ON CS.id = IE. id_corsostudi
  JOIN Insegn I ON IE. id_insegn = I.id
WHERE IE. annoaccademico = '2009/2010'
  AND CS. nome = 'Laurea in Informatica'


/*
Visualizzare, in ordine decrescente rispetto al cognome, tutti i docenti dell’ateneo 
coinvolti nella docenza di un insegnamento il cui nome contiene la sottostringa 
“Lingua”, riportando nome e cognome del docente
*/

SELECT DISTINCT P.Nome, P.Cognome
FROM persona P
JOIN Docenza D ON P.id = D.id_persona
JOIN InsErogato IE ON IE.id = D.id_inserogato
JOIN Insegn I ON IE. id_insegn = I.id	
WHERE I.nomeins LIKE '%Lingua%'
ORDER BY Cognome DESC;


/*
Visualizzare, per ciascun corso di studi della Facoltà di Economia, il numero di 
docenti che hanno tenuto insegnamenti nel 2006/2007, riportando il nome del 
corso e il numero richiesto.
*/

SELECT CS.nome , COUNT ( DISTINCT D.id_persona ) AS NumDoc
FROM CorsoStudi CS
JOIN InsErogato IE ON CS.id = IE.id_corsostudi
JOIN Docenza D ON IE.id = D.id_inserogato
JOIN CorsoInFacolta CSF ON CSF.id_corsostudi =CS.id
JOIN Facolta F ON CSF.id_facolta = F.id
WHERE IE.annoaccademico = '2006/2007'
AND F.nome = 'Economia'
GROUP BY CS.nome;



/* Esercizio 1 
Visualizzare il numero di corso studi presenti nella base di dati. 
Soluzione: ci sono 635 corsi di studio. 
*/
SELECT COUNT(id) as numeroCorsi
FROM corsoStudi

/*
Esercizio 2 
Visualizzare il nome, il codice, l’indirizzo e l’identificatore del preside di tutte le facoltà. 
Soluzione: ci sono 8 facoltà. 
*/

SELECT nome, codice, indirizzo, id_preside_persona
FROM facolta

/*
Esercizio 3 
Trovare per ogni corso di studi che ha erogato insegnamenti nel 2010/2011 il suo nome e il nome delle 
facoltà che lo gestiscono (si noti che un corso può essere gestito da più facoltà). Non usare la relazione 
diretta tra InsErogato e Facoltà. Porre i risultati in ordine di nome corso studi. 
Soluzione: ci sono 211 righe. Le 5 righe dalla X posizione sono:
*/

SELECT DISTINCT cs.nome, f.nome
FROM CorsoStudi cs
join corsoinfacolta cif on cs.id = cif.id_corsostudi 
join facolta f on f.id = cif.id_facolta
join inserogato ins on cs.id = ins.id_corsostudi
where ins.annoaccademico = '2010/2011'

/*
Esercizio 4  
Visualizzare il nome, il codice e l’abbreviazione di tutti i corsi di studio gestiti dalla facoltà di Medicina e 
Chirurgia. 
Soluzione: ci sono 236 righe.
*/

SELECT cs.nome, cs.codice, cs.abbreviazione
FROM corsoStudi cs
join corsoinfacolta cif on cs.id = cif.id_corsostudi
join facolta f on cif.id_facolta = f.id
where f.nome = 'Medicina e Chirurgia'


select *
from facolta

/*
Esercizio 5 
Visualizzare il codice, il nome e l’abbreviazione di tutti corsi di studio che nel nome contengono la 
sottostringa ’lingue’ (eseguire il confronto usando ILIKE invece di LIKE: in questo modo i caratteri 
maiuscolo e minuscolo non sono diversi). 
Soluzione: ci sono 16 righe. 
*/

SELECT cs.codice, cs.nome, cs.abbreviazione
FROM corsostudi cs
where nome ilike '%lingue%'

/*
Esercizio 6 
Visualizzare le sedi dei corsi di studi in un elenco senza duplicati. 
Soluzione: ci sono 48 righe.
*/

SELECT distinct cs.sede
FROM corsostudi cs


/*
Esercizio 7 
Visualizzare solo i moduli degli insegnamenti erogati nel 2010/2011 nei corsi di studi della facoltà di 
Economia. 
Si visualizzi il nome dell’insegnamento, il discriminante (attributo descrizione della tabella Discriminante), 
il nome del modulo e l’attributo modulo. 
Soluzione: ci sono 27 righe. 
*/

SELECT DISTINCT i.nomeins, d.descrizione, ins.nomemodulo, ins.modulo, f.nome
FROM insErogato ins
join insegn i on ins.id_insegn = i.id
join discriminante d on d.id = ins.id_discriminante
join corsoinfacolta cif on cif.id_corsostudi = ins.id_corsostudi
join facolta f on f.id = cif.id_facolta
where ins.annoaccademico = '2010/2011' and f.nome = 'Economia' and ins.modulo > 0

SELECT *
from inserogato



/*

Esercizio 8 
Visualizzare il nome e il discriminante (attributo descrizione della tabella Discriminante) degli 
insegnamenti erogati nel 2009/2010 che non sono moduli o unità logistiche e che hanno 3, 5 o 12 crediti. 
Si ordini il risultato per discriminante. 
Soluzione: ci sono 724 righe distinte. Le ultime 5 righe sono:  
*/


SELECT DISTINCT i.nomeins, d.descrizione
FROM insErogato ins
join discriminante d on d.id = ins.id_discriminante
join insegn i on i.id = ins.id_insegn 
where ins.annoaccademico = '2009/2010' 
	and ins.crediti IN (3, 5, 12) 
	and ins.modulo = 0 
order by d.descrizione


/*
Esercizio 9 
Visualizzare l’identificatore, il nome e il discriminante degli insegnamenti erogati nel 2008/2009 che non 
sono moduli o unità logistiche e con peso maggiore di 9 crediti. Ordinare per nome. 
*/