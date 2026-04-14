/* Visualizzare l’identificatore, il nome e il discriminante degli insegnamenti erogati nel 2008/2009 che non sono moduli o unità logistiche e con peso maggiore di 9 crediti. 
Ordinare per nome */
SELECT I.id, I.nomeins, D.descrizione
FROM Discriminante AS D
JOIN InsErogato AS IE ON D.id = IE.id_discriminante
JOIN Insegn AS I ON IE.id_insegn = I.id
WHERE IE.annoaccademico = '2008/2009'
	AND IE.modulo = 0
	AND IE.crediti > 9.00
		ORDER BY D.nome;