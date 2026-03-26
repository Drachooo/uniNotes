/* Esercizio 3: Trovare gli insegnamenti del corso di studi con id=4 che non sono mai stati offerti al secondo quadrimestre.
Per selezionare il secondo quadrimestre usare la condizione "abbreviazione LIKE '2%'" */

SELECT DISTINCT I.nomeins
FROM Insegn AS I
JOIN InsErogato AS IE ON I.id = IE.id_insegn
WHERE IE.id_corsostudi = 4
  AND I.id NOT IN (
    SELECT IE2.id_insegn
    FROM InsErogato AS IE2
    JOIN InsInPeriodo AS IIP ON IE2.id = IIP.id_inserogato
    JOIN PeriodoLez AS PL ON IIP.id_periodolez = PL.id
    WHERE IE2.id_corsostudi = 4
      AND PL.abbreviazione LIKE '2%'
  );