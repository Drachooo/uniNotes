-- Trovare il massimo numero di crediti associato a un insegnamento fra quelli erogati nel 2010/2011
SELECT MAX(crediti)
FROM InsErogato AS IE
WHERE IE.annoaccademico = '2010/2011';