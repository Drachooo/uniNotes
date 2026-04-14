/* Esercizio 1: trovare identificatore, cognome e nome dei docenti che, nell’anno accademico 2010/2011, hanno tenuto un insegnamento (l’attributo da confrontare è nomeins) che non hanno tenuto nell’anno accademico precedente.
Ordinare la soluzione per identificatore */

SELECT DISTINCT P.id, P.cognome, P.nome
FROM Persona P
JOIN Docenza D ON P.id = D.id_persona
JOIN InsErogato IE ON D.id_inserogato = IE.id
JOIN Insegn I ON IE.id_insegn = I.id
WHERE IE.annoaccademico = '2010/2011' 
	AND I.nomeins NOT IN (
		SELECT I2.nomeins
		FROM Docenza AS D2
		JOIN InsErogato IE2 ON D2.id_inserogato = IE2.id
    	JOIN Insegn I2 ON IE2.id_insegn = I2.id
    		WHERE D2.id_persona = P.id 
      			AND IE2.annoaccademico = '2009/2010'
	)
		ORDER BY P.id;