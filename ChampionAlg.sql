SELECT Sigle, max(Points) FROM (
	SELECT Sigle,
sum(
  CASE WHEN SIGLE=EQUIPEA AND BUTSEQUIPEA > BUTSEQUIPEB THEN 4
        WHEN SIGLE=EQUIPEB AND BUTSEQUIPEB > BUTSEQUIPEA THEN 4
        WHEN SIGLE=EQUIPEA AND BUTSEQUIPEA = BUTSEQUIPEB THEN 1
        WHEN SIGLE=EQUIPEB AND BUTSEQUIPEA = BUTSEQUIPEB THEN 1
        ELSE 0
	 END) AS Points
FROM Rencontre 
JOIN Equipe on EquipeA = Sigle or EquipeB = Sigle
GROUP BY Sigle
ORDER BY Points DESC
)