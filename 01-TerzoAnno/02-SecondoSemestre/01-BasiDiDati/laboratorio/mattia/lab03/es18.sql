-- Trovare per ogni segreteria che serve almeno un corso di studi il numero di corsi di studi serviti, riportando il nome della struttura, il suo numero di fax e il conteggio richiesto
SELECT SS.nomestruttura, SS.fax, COUNT(DISTINCT CS.id) AS numeroCorsi
FROM StrutturaServizio AS SS
JOIN CorsoStudi AS CS ON SS.id = CS.id_segreteria
GROUP BY SS.nomestruttura, SS.fax;