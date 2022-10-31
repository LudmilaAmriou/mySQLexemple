SELECT AVG(NBRencontres) AS MoyenneRencontre
FROM
(
    	SELECT Stade, COUNT(numeroRencontre) NBRencontres
    	FROM Rencontre
    	Group BY Stade
   ) AS F