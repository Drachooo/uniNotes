-- Visualizzare in ordine alfabetico di nome degli insegnamenti (esclusi i moduli e le unità logistiche) erogati nel 2010/2011 nel corso di studi in Informatica, riportando il nome, il discriminante, i crediti e gli anni di erogazione
SELECT DISTINCT I.nomeins, D.descrizione, IE.crediti, IE.annierogazione
FROM Insegn AS I
JOIN InsErogato AS IE ON I.id = IE.id_insegn
JOIN Discriminante AS D ON IE.id_discriminante = D.id
JOIN CorsoInFacolta AS CF ON IE.id_corsostudi = CF.id_corsostudi
JOIN CorsoStudi AS CS ON CF.id_corsostudi = CS.id
WHERE IE.annoaccademico = '2010/2011'
	AND CS.nome = 'Laurea in Informatica'
	AND IE.modulo = 0
		ORDER BY I.nomeins;