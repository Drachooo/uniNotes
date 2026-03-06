-- SI VUOLE PROGETTARE IL SISTEMA INFORMATIVO PER LA GESTIONE DEI MUSEI
-- Esercizio 3: popolare le tabelle Opera e Mostra con almeno altre tre tuple ciascuna

INSERT INTO Opera(nome, cognomeAutore, nomeAutore, museo, città, epoca, anno)
VALUES
('Statua del Gladiatore', 'Rossi', 'Mario', 'Arena', 'Verona', 'Romano', 50),
('Affresco Imperiale', 'Bianchi', 'Luigi', 'Arena', 'Verona', 'Romano', 120),
('Madonna con Bambino', 'Verdi', 'Giovanni', 'Castelvecchio', 'Verona', 'Rinascimento', 1450),
('Ritratto di Nobildonna', 'Neri', 'Paolo', 'Castelvecchio', 'Verona', 'Barocco', 1620),
('Paesaggio Veneto', 'Gialli', 'Andrea', 'Castelvecchio', 'Verona', 'Ottocento', 1875);

INSERT INTO Mostra(titolo, inizio, fine, museo, città, prezzo)
VALUES
('Arte Romana a Verona', '2026-04-01', '2026-06-30', 'Arena', 'Verona', 12.00),
('I Gladiatori dell''Impero', '2026-07-10', '2026-09-15', 'Arena', 'Verona', 15.00),
('Capolavori del Rinascimento', '2026-03-15', '2026-05-30', 'Castelvecchio', 'Verona', 10.00),
('Pittura Barocca Italiana', '2026-06-01', '2026-08-31', 'Castelvecchio', 'Verona', 11.50),
('Artisti Veneti dell''Ottocento', '2026-09-20', '2026-12-10', 'Castelvecchio', 'Verona', 9.00);

-- SELECT * FROM Museo;
-- SELECT * FROM Opera;
-- SELECT * FROM Mostra;