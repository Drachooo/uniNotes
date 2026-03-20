-- Trovare, per ogni anno accademico, il massimo e il minimo numero di crediti erogati tra gli insegnamenti dell’anno
SELECT annoaccademico, MAX(crediti), MIN(crediti)
FROM InsErogato
GROUP BY annoaccademico;