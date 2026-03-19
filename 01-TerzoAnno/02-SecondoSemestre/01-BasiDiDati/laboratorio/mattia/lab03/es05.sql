/* Visualizzare il codice, il nome e l’abbreviazione di tutti corsi di studio che nel nome contengono la
sottostringa ’lingue’ (eseguire il confronto usando ILIKE invece di LIKE: in questo modo i caratteri
maiuscolo e minuscolo non sono diversi) */
SELECT nome, codice, abbreviazione
FROM CorsoStudi
WHERE nome ILIKE '%lingue%'; 