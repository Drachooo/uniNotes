/* Visualizzare solo i moduli degli insegnamenti erogati nel 2010/2011 nei corsi di studi della facoltà di Economia.
Si visualizzi il nome dell’insegnamento, il discriminante (attributo descrizione della tabella Discriminante), il nome del modulo e l’attributo modulo */
SELECT DISTINCT I.nomeins, D.descrizione, IE.modulo, IE.nomemodulo
FROM Insegn AS I
JOIN InsErogato AS IE ON I.id = IE.id_insegn
JOIN Discriminante AS D ON D.id = IE.id_discriminante
JOIN CorsoInFacolta CF ON CF.id_corsostudi = IE.id_corsostudi
JOIN Facolta as F ON F.id = CF.id_facolta
WHERE IE.annoaccademico = '2010/2011' AND
	F.nome = 'Economia' AND IE.modulo > 0;