-- Visualizzare il nome, il codice e l’abbreviazione di tutti i corsi di studio gestiti dalla facoltà di Medicina e Chirurgia
SELECT CS.nome, CS.codice, CS.abbreviazione
FROM CorsoStudi AS CS
JOIN CorsoInFacolta AS CF ON CS.id = CF.id_corsostudi
JOIN Facolta AS F ON F.id = CF.id_facolta
WHERE F.nome = 'Medicina e Chirurgia';