/* Trovare per ogni periodo di lezione del 2010/2011 la cui descrizione inizia con ’I semestre’ o ’Primo semestre’ il numero di occorrenze di insegnamento allocate in quel periodo. 
Si visualizzi quindi: l’abbreviazione, il discriminante, inizio, fine e il conteggio richiesto ordinati rispetto all’inizio e fine */
SELECT PL.abbreviazione, PD.descrizione, PD.inizio, PD.fine, COUNT(IP.id_inserogato) AS numInsegmanenti
FROM PeriodoDid AS PD
JOIN PeriodoLez AS PL ON PD.id = PL.id
JOIN InsInPeriodo AS IP ON PL.id = IP.id_periodolez
WHERE PD.annoaccademico = '2010/2011'
	AND (PD.descrizione LIKE 'I semestre%' OR PD.descrizione LIKE 'Primo semestre%')
		GROUP BY PL.abbreviazione, PD.descrizione, PD.inizio, PD.fine
			ORDER BY PD.inizio, PD.fine;