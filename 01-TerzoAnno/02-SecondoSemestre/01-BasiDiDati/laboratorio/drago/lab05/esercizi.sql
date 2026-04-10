SELECT id , nomeins
FROM Insegn
WHERE nomeins ='Algoritmi'


CREATE INDEX nomeins_index ON insegn ( nomeins );
ANALYZE Insegn;
SELECT id, nomeins FROM Insegn WHERE nomeins ='Algoritmi'

DROP INDEX nomeins_index


SELECT DISTINCT I.nomeins
FROM CorsoStudi CS
JOIN InsErogato IE ON CS.id = IE.id_corsostudi
JOIN Insegn I ON I.id =IE.id_insegn
WHERE IE.annoaccademico = '2009/2010'
AND CS.nome = 'Laurea in Informatica';

CREATE INDEX cs_id ON CorsoStudi(id);
CREATE INDEX i_id ON Insegn(id);


SELECT DISTINCT I.nomeins
FROM CorsoStudi CS
JOIN InsErogato IE ON CS.id = IE.id_corsostudi
JOIN Insegn I ON I.id = IE.id_insegn
WHERE IE.annoaccademico = '2009/2010'
AND CS. nome = 'Laurea in Informatica'





/*Visualizzare in nomi dei corsi di studio che finiscono con la stringa 
’informatica’ senza considerare maiuscole/minuscole.
*/
EXPLAIN ANALYZE
SELECT cs.nome 
FROM corsostudi Cs 
WHERE nome ILIKE '%informatica';

CREATE INDEX idx_nome_rovesciato 
ON Corsostudi (REVERSE(LOWER(nome)) varchar_pattern_ops);

EXPLAIN ANALYZE 
SELECT nome 
FROM Corsostudi
WHERE REVERSE(LOWER(nome)) LIKE REVERSE('informatica') || '%';

\timing ON



/* Visualizzare in nomi degli insegnamenti che iniziano per ’Teoria...’*/
EXPLAIN ANALYZE
SELECT nomeins
FROM insegn
WHERE nomeins LIKE 'Teoria%'

CREATE INDEX idx_nomeins_inizio 
ON Insegn (nomeins varchar_pattern_ops);

EXPLAIN ANALYZE 
SELECT nomeins 
FROM Insegn 
WHERE nomeins LIKE 'Teoria%';


/* Trovare, per ogni insegnamento erogato dell’a.a. 2013/2014, il suo nome e id della facoltà che lo
gestisce usando la relazione assorbita con facoltà. */ 
EXPLAIN ANALYZE
SELECT i.nomeins, inse.id
FROM insegn i
JOIN inserogato inse on inse.id_insegn = i.id
WHERE inse.annoaccademico = '2013/2014'

CREATE INDEX idx_annoaccademico ON inserogato (annoaccademico);

DROP INDEX idx_annoaccademico

SELECT *
FROM INSEGN



/* Visualizzare il codice, il nome e l’abbreviazione di tutti corsi di studio che nel nome contengono la
sottostringa ’lingue’ (eseguire un test case-insensitive: usare ILIKE invece di LIKE).
*/
EXPLAIN ANALYZE
SELECT codice, nome, abbreviazione
FROM corsostudi 
WHERE nome ILIKE '%lingue%'

/* in questo caso non ha senso utilizzare gli indici perchè la tenica del 
b-tree non ottimizza la riceva */
