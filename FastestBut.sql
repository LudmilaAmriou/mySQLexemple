SELECT Joueur.Equipe,Nom, MinuteBut FROM Marquer JOIN JOUEUR ON Marquer.NumeroJoueur = Joueur.Numero and Joueur.Equipe = Marquer.Equipe
WHERE MinuteBut = (Select min(MinuteBut) FROM Marquer)
/* SINON 
ORDER BY MinuteBut 
 LIMIT 1 */	