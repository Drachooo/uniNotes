/* Trovare per ogni corso di studi che ha erogato insegnamenti nel 2010/2011 il suo nome e il nome delle
facoltà che lo gestiscono (si noti che un corso può essere gestito da più facoltà). 
Non usare la relazione diretta tra InsErogato e Facoltà. 
Porre i risultati in ordine di nome corso studi */
SELECT DISTINCT CS.nome AS Corso, F.nome AS Facoltà
FROM CorsoStudi AS CS
JOIN CorsoInFacolta CF ON CS.id = CF.id_corsostudi
JOIN Facolta AS F ON F.id = CF.id_facolta
JOIN InsErogato AS IE ON CS.id = IE.id_corsostudi
WHERE IE.annoaccademico = '2010/2011'
	ORDER BY CS.nome;