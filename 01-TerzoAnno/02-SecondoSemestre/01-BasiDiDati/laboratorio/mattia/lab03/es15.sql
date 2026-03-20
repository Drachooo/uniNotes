/* Trovare i corsi di studi che nel 2010/2011 hanno erogato insegnamenti con un numero di crediti pari a 4 o 6 o 8 o 10 o 12 o un numero di crediti di laboratorio tra 10 e 15 escluso, riportando il nome del corso di studi e la sua durata. 
Si ricorda che i crediti di laboratorio sono rappresentati dall’attributo creditilab della tabella InsErogato */
SELECT DISTINCT CS.nome, CS.durataAnni
FROM CorsoStudi AS CS
JOIN InsErogato AS IE ON CS.id = IE.id_corsostudi
WHERE IE.annoaccademico = '2010/2011'
	AND IE.crediti IN (4.00, 6.00, 8.00, 10.00, 12.00)
	OR (IE.creditilab > 10.00 AND IE.creditilab < 15.00)