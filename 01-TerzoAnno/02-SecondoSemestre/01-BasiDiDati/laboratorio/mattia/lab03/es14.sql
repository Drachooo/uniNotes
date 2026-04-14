-- Trovare per ogni corso di studi della facoltà di Scienze Matematiche Fisiche e Naturali il numero di insegnamenti (esclusi i moduli e le unità logistiche) erogati nel 2009/2010
SELECT CS.nome, COUNT(IE.id) AS numeroInsegnamenti
FROM InsErogato AS IE
JOIN CorsoStudi AS CS ON IE.id_corsostudi = CS.id
JOIN Facolta AS F ON IE.id_facolta = F.id
JOIN CorsoInFacolta AS CF ON IE.id_corsostudi = CF.id_corsostudi
	AND IE.id_facolta = CF.id_facolta
WHERE IE.annoaccademico = '2009/2010'
	AND F.nome = 'Scienze matematiche fisiche e naturali'
	AND IE.modulo = 0
	AND IE.id_inserogato_padre IS NULL
		GROUP BY CS.nome;