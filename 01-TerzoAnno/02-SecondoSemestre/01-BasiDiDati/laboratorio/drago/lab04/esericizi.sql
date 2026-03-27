/*
Trovare identificatore, cognome e nome dei docenti che, nell’anno accademico 2010/2011, 
hanno tenuto un insegnamento (l’attributo da confrontare è nomeins) che non hanno 
tenuto nell’anno accademico precedente. Ordinare la soluzione per identificatore
*/

SELECT distinct p.id, p.cognome, p.nome
FROM Persona p
JOIN Docenza d on p.id = d.id_persona
JOIN InsErogato ins on d.id_insErogato= ins.id
JOIN Insegn i on ins.id_insegn= i.id
WHERE ins.annoaccademico = '2010/2011' and 
	i.nomeins not in( 
		SELECT i2.nomeins
		FROM insegn i2 
		join insErogato ins2 on ins2.id_insegn = i2.id
		join docenza d2 on d2.id_inserogato = ins2.id
		where ins2.annoaccademico = '2009/2010' and d2.id_persona = p.id
	)
order by p.id
	
/*
Esercizio 2 
Trovare i corsi di studio che non sono gestiti dalla facoltà di “Medicina e Chirurgia” 
e che hanno insegnamenti erogati con moduli nel 2010/2011. 
Si visualizzi il nome del corso e il numero di insegnamenti erogati con 
moduli nel 2010/2011. 
*/

select cs.nome, count (distinct ins.id_insegn)
from corsostudi cs
join inserogato ins on cs.id = ins.id_corsostudi
join facolta f on f.id = ins.id_facolta
where f.nome != 'Medicina e Chirurgia' and ins.annoaccademico = '2010/2011' and ins.modulo > 0
group by cs.nome
order by cs.nome

select * 
from inserogato
