/* Visualizzare il nome e il discriminante (attributo descrizione della tabella Discriminante) degli insegnamenti erogati nel 2009/2010 che non sono moduli o unità logistiche e che hanno 3, 5 o 12 crediti.
Si ordini il risultato per discriminante */
SELECT DISTINCT I.nomeins, D.descrizione
FROM Insegn AS I
JOIN InsErogato AS IE ON I.id = IE.id_insegn
JOIN Discriminante AS D ON D.id = IE.id_discriminante
WHERE IE.annoaccademico = '2009/2010' 
	AND IE.modulo = 0
	AND (IE.crediti = 3.00 OR IE.crediti = 5.00 OR IE.crediti = 12.00)
		ORDER BY D.descrizione;