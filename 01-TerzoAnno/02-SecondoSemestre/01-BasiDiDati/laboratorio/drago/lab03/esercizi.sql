

/* 
ESERCIZI LAB 3
*/

/* 
Esercizio 1
Visualizzare il numero di corso studi presenti nella base di dati.
Soluzione: ci sono 635 corsi di studio.
*/

SELECT COUNT(corsostudi) numero_corso_studi
FROM corsostudi

/*
Esercizio 2
Visualizzare il nome, il codice, l’indirizzo e l’identificatore del preside di tutte le facoltà.
Soluzione: ci sono 8 facoltà.
*/

SELECT nome, codice, indirizzo, id_preside_persona
FROM facolta

/*
Esercizio 3
Trovare per ogni corso di studi che ha erogato insegnamenti nel 2010/2011 il suo nome e 
il nome delle facoltà che lo gestiscono (si noti che un corso può essere gestito da più facoltà). 
Non usare la relazione diretta tra InsErogato e Facoltà. Porre i risultati in ordine di nome corso studi.
Soluzione: ci sono 211 righe. Le 5 righe dalla X posizione sono:
nome | nome
-- -----------------------------------------------+----------------------------------------
Corso di Perfezionamento IN Traumatologia dentale | Medicina e Chirurgia
Laurea IN Beni culturali | Lettere e filosofia
Laurea IN Bioinformatica | Scienze matematiche fisiche e naturali
Laurea IN Bioinformatica (ordinamento fino ALL’a.a. 2008/09) | Scienze matematiche fisiche e naturali
Laurea IN Biotecnologie | Scienze matematiche fisiche e naturali
*/

SELECT DISTINCT cs.nome, f.nome 
FROM corsostudi cs
	JOIN corsoinfacolta CF ON CF.id_corsostudi = cs.id
	JOIN facolta f ON f.id = CF.id_facolta 
	JOIN inserogato ins ON ins.id_corsostudi = cs.id
WHERE ins.annoaccademico = '2010/2011'
ORDER BY cs.nome

/*
Esercizio 4
Visualizzare il nome, il codice e l’abbreviazione di tutti i corsi di studio gestiti 
dalla facoltà di Medicina e Chirurgia.
Soluzione: ci sono 236 righe.
*/

SELECT cs.nome, cs.codice, cs.abbreviazione
FROM corsostudi cs
	JOIN corsoinfacolta CF ON CF.id_corsostudi = cs.id
	JOIN facolta f ON f.id = CF.id_facolta
WHERE f.nome = 'Medicina e Chirurgia'

/*
Esercizio 5
Visualizzare il codice, il nome e l’abbreviazione di tutti corsi di studio che nel nome 
contengono la sottostringa ’lingue’ (eseguire il confronto usando ILIKE invece di LIKE: 
in questo modo i caratteri maiuscolo e minuscolo non sono diversi).
Soluzione: ci sono 16 righe.
*/

SELECT cs.codice, cs.nome, cs.abbreviazione
FROM corsostudi cs 
WHERE cs.nome ILIKE '%lingue%'

/*
Esercizio 6
Visualizzare le sedi dei corsi di studi in un elenco senza duplicati.
Soluzione: ci sono 48 righe.
*/

SELECT DISTINCT sede
FROM corsostudi

/* 
Esercizio 7
Visualizzare solo i moduli degli insegnamenti erogati nel 2010/2011 nei corsi di studi 
della facoltà di Economia.
Si visualizzi il nome dell’insegnamento, il discriminante 
(attributo descrizione della tabella Discriminante), il nome del modulo e l’attributo modulo.
Soluzione: ci sono 27 righe.
*/

SELECT i.nomeins, d.descrizione, ins.modulo, ins.nomemodulo
FROM inserogato ins
	JOIN corsoinfacolta cf ON cf.id_corsostudi = ins.id_corsostudi
	JOIN facolta f ON f.id = cf.id_facolta
	JOIN insegn i ON i.id = ins.id_insegn
	JOIN discriminante d ON d.id = ins.id_discriminante 
WHERE ins.annoaccademico = '2010/2011' AND f.nome = 'Economia' AND ins.modulo > 0
/* 
importante non perdersi i collegamenti tra corsoinfacolta e facolta. Se collego tutto per inserogato 
quel collegamento viene completamente perso 
*/


/*
Esercizio 8
Visualizzare il nome e il discriminante (attributo descrizione della tabella Discriminante) 
degli insegnamenti erogati nel 2009/2010 che non sono moduli e che hanno 3, 5 o 12 crediti. 
Si ordini il risultato per discriminante.
Soluzione: ci sono 724 righe distinte. Le ultime 5 righe sono:
nomeins | discriminante
-- ----------------------------------+---------------
Prova finale | CInt
Laboratorio di composizione italiana | Cognomi A-K
Biologia | Cognomi A-L
Laboratorio di composizione italiana | Cognomi L-Z
Biologia | Cognomi M-Z
*/

SELECT DISTINCT i.nomeins, d.descrizione, ins.modulo
FROM inserogato ins
	JOIN discriminante d ON d.id = ins.id_discriminante 
	JOIN insegn i ON i.id = ins.id_insegn 
WHERE ins.annoaccademico = '2009/2010' AND ins.modulo = 0 AND (ins.crediti = 3 or ins.crediti = 5 or ins.crediti = 12)
ORDER BY d.descrizione

--altrimenti si poteva utilizzare (per i crediti) ins.crediti IN (3, 5, 12)

/*
Esercizio 9
Visualizzare l’identificatore, il nome e il discriminante degli insegnamenti erogati nel 2008/2009 
che non sono moduli o unità logistiche e con peso maggiore di 9 crediti. Ordinare per nome.
Soluzione: ci sono 1218 righe. Le 5 righe dalla MXXIII riga sono:
id | nomeins | discriminante
-- ---+----------------------------------------+-------------------
39872 | Storia del diritto medievale e moderno | Matricole pari
44440 | Storia del diritto medievale e moderno | Matricole dispari
39724 | Storia del diritto medievale e moderno | Matricole pari
44428 | Storia del diritto medievale e moderno | Matricole dispari
44441 | Storia del diritto medievale e moderno | Matricole dispari
*/

SELECT ins.id, i.nomeins, d.descrizione
FROM inserogato ins
	JOIN discriminante d ON d.id = ins.id_discriminante
	JOIN insegn i ON i.id = ins.id_insegn
WHERE ins.annoaccademico = '2008/2009' AND ins.modulo = 0 AND ins.crediti > 9
ORDER BY i.nomeins

/*
Esercizio 10
Visualizzare in ordine alfabetico di nome degli insegnamenti 
(esclusi i moduli e le unità logistiche) erogati nel 2010/2011 nel corso di studi in Informatica, 
riportando il nome, il discriminante, i crediti e gli anni di erogazione.
Soluzione: ci sono 26 righe.
*/

SELECT DISTINCT i.nomeins, d.descrizione, ins.crediti, ins.annoaccademico
FROM inserogato ins
	JOIN corsostudi cs ON cs.id = ins.id_corsostudi
	JOIN insegn i ON i.id = ins.id_insegn
	JOIN discriminante d ON d.id = ins.id_discriminante
WHERE ins.annoaccademico = '2010/2011' AND cs.nome LIKE '%Informatica' AND ins.modulo = 0
ORDER BY i.nomeins ASC 

SELECT *
FROM corsostudi

/*
Esercizio 11
Trovare il massimo numero di crediti associato a un insegnamento fra quelli erogati nel 2010/2011.
Soluzione: 180
*/

SELECT max(ins.crediti) credito_massimo
FROM inserogato ins
WHERE ins.annoaccademico = '2010/2011'

/*
Esercizio 12
Trovare, per ogni anno accademico, il massimo e il minimo numero di crediti erogati tra 
gli insegnamenti dell’anno.
Soluzione: ci sono 16 righe.
*/

SELECT ins.annoaccademico, MAX(ins.crediti) massimo_credito, MIN(ins.crediti) minimo_crediti
FROM inserogato ins
GROUP BY ins.annoaccademico

/*
Esercizio 13
Trovare, per ogni anno accademico e per ogni corso di studi la somma dei crediti erogati 
(esclusi i moduli e le unità logistiche: vedi nota sopra) e il massimo e minimo numero di crediti degli 
insegnamenti erogati sempre escludendo i moduli e le unità logistiche.
Soluzione: ci sono 1587 righe. Le riga relativa alla "Scuola di Specializzazione in Urologia 
(Vecchio ordinamento)" nell’anno 2011/2012 ha valori 52.00, 10.00 e 162.00.
*/

SELECT ins.annoaccademico, cs.nome, SUM(ins.crediti), MAX(ins.crediti), MIN(ins.crediti)
FROM inserogato ins
	JOIN corsostudi cs ON cs.id = ins.id_corsostudi
WHERE ins.modulo = 0
GROUP BY ins.annoaccademico, cs.nome
ORDER BY cs.nome
--ordinamento fatto solo per trovare la query della soluzione 

/*
Esercizio 14
Trovare per ogni corso di studi della facoltà di Scienze Matematiche Fisiche e Naturali 
il numero di insegnamenti (esclusi i moduli e le unità logistiche) erogati nel 2009/2010.
Soluzione: ci sono 19 righe.
*/

SELECT cs.nome, f.nome, COUNT(ins.id)
FROM inserogato ins
	JOIN corsostudi cs ON cs.id = ins.id_corsostudi
    JOIN CorsoInFacolta cif ON cs.id = cif.id_corsostudi 
    JOIN facolta f ON f.id = cif.id_facolta
WHERE ins.modulo = 0 AND ins.annoaccademico = '2009/2010' AND f.nome ILIKE 'Scienze Matematiche Fisiche e Naturali'
GROUP BY cs.nome, f.nome

SELECT *
FROM facolta

/*
Esercizio 15
Trovare i corsi di studi che nel 2010/2011 hanno erogato insegnamenti con un numero di crediti 
pari a 4 o 6 o 8 o 10 o 12 o un numero di crediti di laboratorio tra 10 e 15 escluso, 
riportando il nome del corso di studi e la sua durata. Si ricorda che i crediti di laboratorio sono 
rappresentati dall’attributo creditilab della tabella InsErogato.
Soluzione: ci sono 197 righe.
*/

SELECT DISTINCT cs.nome, cs.durataAnni
FROM inserogato ins
	JOIN corsostudi cs ON cs.id = ins.id_corsostudi
WHERE ins.annoaccademico = '2010/2011' AND (ins.crediti IN(4,6,8,10,12) OR (ins.creditilab >= 10 AND 
	ins.creditilab < 15))


/*
Esercizio 16
Trovare nome, cognome dei docenti che nell’anno accademico 2010/2011 erano docenti in almeno 
due corsi di studio (vale a dire erano docenti in almeno due insegnamenti o moduli A e B 
dove A è del corso C1 e B è del corso C2 con C1 <> C2).
La soluzione ha 839 righe. Se si ordina la risposta per un opportuno attributo, 
le 5 righe a partire dalla 50-esima sono:
id | nome | cognome
-----+------------+---------
268 | Paolo | Roffia
269 | Andrea | Lionzo
270 | Corrado | Corsi
278 | Alessandro | Lai
280 | Giuseppe | Ceriani
*/

SELECT p.nome, p.cognome
FROM inserogato ins
	JOIN docenza dc ON dc.id_inserogato = ins.id
	JOIN persona p ON p.id = dc.id_persona
WHERE ins.annoaccademico = '2010/2011'
GROUP BY p.id, p.nome, p.cognome
HAVING COUNT(DISTINCT ins.id_corsostudi) >= 2


/*
Esercizio 17
Trovare per ogni periodo di lezione del 2010/2011 la cui descrizione inizia con ’I semestre’ o
’Primo semestre’ il numero di occorrenze di insegnamento allocate in quel periodo. 
Si visualizzi quindi: l’abbreviazione, il discriminante, inizio, fine e 
il conteggio richiesto ordinati rispetto all’inizio e fine.
La soluzione ha 3 righe:
abbreviazione | discriminante | inizio | fine | insprimosem
---------------+----------------+--------------+--------------+-------------
Primo semestre | eco | 2010 -10 -04 | 2010 -12 -22 | 104
Primo semestre | Primo semestre | 2010 -10 -04 | 2011 -01 -22 | 124
I semestre | I semestre | 2010 -10 -04 | 2011 -01 -31 | 159
*/

SELECT pl.abbreviazione, pd.discriminante, pd.annoaccademico, pd.inizio, pd.fine, COUNT(IIP.id_inserogato)
FROM periododid pd
	JOIN PeriodoLez pl ON PD.id = pl.id
	JOIN InsInPeriodo IIP ON pl.id = IIP.id_periodolez
WHERE pd.annoaccademico = '2010/2011' 
	AND (pd.descrizione LIKE 'I semestre%' OR pd.descrizione LIKE 'Primo semestre')
GROUP BY pd.id, pl.abbreviazione
ORDER BY inizio, fine

SELECT *
FROM periododid

/*
Esercizio 18
Trovare per ogni segreteria che serve almeno un corso di studi il numero di corsi di studi serviti, 
riportando il nome della struttura, il suo numero di fax e il conteggio richiesto.
La soluzione ha 42 righe.
*/