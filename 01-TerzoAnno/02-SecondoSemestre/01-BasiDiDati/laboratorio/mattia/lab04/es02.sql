/* Esercizio 2: trovare i corsi di studio che non sono gestiti dalla facoltà di “Medicina e Chirurgia” e che hanno insegnamenti erogati con moduli nel 2010/2011. 
Si visualizzi il nome del corso e il numero di insegnamenti erogati con moduli nel 2010/2011 */

SELECT CS.nome, COUNT(DISTINCT IE.id_insegn) AS numInsegn
FROM CorsoStudi AS CS
JOIN CorsoInFacolta AS CF ON CS.id = CF.id_corsostudi
JOIN Facolta AS F ON CF.id_facolta = F.id
JOIN InsErogato AS IE ON CS.id = IE.id_corsostudi
	AND IE.id_facolta = F.id
		WHERE F.nome <> 'Medicina e Chirurgia'
			AND IE.annoaccademico = '2010/2011'
			AND IE.modulo > 0
				GROUP BY CS.id, CS.nome
				HAVING COUNT(DISTINCT IE.id_insegn) > 0
					ORDER BY CS.nome;