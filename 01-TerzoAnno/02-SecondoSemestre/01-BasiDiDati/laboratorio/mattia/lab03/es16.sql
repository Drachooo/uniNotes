-- Trovare nome, cognome dei docenti che nell’anno accademico 2010/2011 erano docenti in almeno due corsi di studio (vale a dire erano docenti in almeno due insegnamenti o moduli A e B dove A è del corso C1 e B è del corso C2 con C1 <> C2)
SELECT P.nome, P.cognome
FROM Persona AS P
JOIN Docenza AS D ON P.id = D.id_persona
JOIN InsErogato AS IE ON IE.id = D.id_inserogato
WHERE IE.annoaccademico = '2010/2011'
	GROUP BY P.id, P.nome, P.cognome
		HAVING COUNT(DISTINCT IE.id_corsostudi) >= 2
			ORDER BY P.id;
