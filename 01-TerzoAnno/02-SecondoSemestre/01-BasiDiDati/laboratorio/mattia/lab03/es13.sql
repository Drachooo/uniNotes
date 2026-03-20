-- Trovare, per ogni anno accademico e per ogni corso di studi la somma dei crediti erogati (esclusi i moduli e le unità logistiche: vedi nota sopra) e il massimo e minimo numero di crediti degli insegnamenti erogati sempre escludendo i moduli e le unità logistiche
SELECT IE.annoaccademico, CS.nome, MAX(crediti), MIN(crediti), SUM(crediti)
FROM InsErogato AS IE
JOIN CorsoStudi AS CS ON CS.id = IE.id_corsostudi
WHERE IE.modulo = 0
	AND IE.id_inserogato_padre IS NULL
		GROUP BY IE.annoaccademico, CS.nome;