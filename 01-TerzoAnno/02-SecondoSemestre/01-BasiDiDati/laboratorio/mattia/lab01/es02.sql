-- SI VUOLE PROGETTARE IL SISTEMA INFORMATIVO PER LA GESTIONE DEI MUSEI
/* Esercizio 2: inserire nell'entità Museo le seguenti tuple:
   - (Arena, Verona, Piazza Bra, 045 8003204, martedì, 20)
   - (CastelVecchio, Verona, Corso Castelvecchio, 045 594734, lunedì, 15)
*/

INSERT INTO Museo(nome, città, indirizzo, numeroTelefono, giornoChiusura, prezzo)
VALUES('Arena', 'Verona', 'Piazza Bra', '045 8003204', 'Martedì', 20.00),
      ('Castelvecchio', 'Verona', 'Corso Castelvecchio', '045 594734', 'Lunedì', 15.00);

-- SELECT * FROM Museo;