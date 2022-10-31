SELECT *, 
CASE 
	  WHEN ButsEquipeA > butsEquipeB THEN EquipeA
      WHEN ButsEquipeB > butsEquipeA THEN EquipeB
      ELSE 'Match Null'
END AS Winner FROM Rencontre 
WHERE EquipeA = 'MCA'AND EquipeB = 'JSK' OR EquipeA = 'JSK' AND EquipeB = 'MCA'
ORDER BY DateRencontre limit 1
