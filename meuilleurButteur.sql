SELECT Nom ,NumeroJoueur, Buts
FROM (
SELECT Equipe, NumeroJoueur, Count(NumeroJoueur) AS Buts
FROM Marquer
GROUP BY NumeroJoueur,Equipe
ORDER BY Buts DESC

) AS f
JOIN Joueur j ON NumeroJoueur = Numero and j.Equipe = f.Equipe
limit 1 ;

