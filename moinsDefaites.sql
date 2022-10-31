SELECT Sigle, NomEqp,Couleurs, wilaya ,min(Point) As Nbdefaite from(
select Sigle, NomEqp,Couleurs, wilaya,
    sum(
        Case when sigle=EquipeA and ButsEquipeA<ButsEquipeB then 1
         when sigle=EquipeB and ButsEquipeB<ButsEquipeA then 1
        else 0
    end) AS Point
From rencontre join Equipe 
group by sigle
) 
