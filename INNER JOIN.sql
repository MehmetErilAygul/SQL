select * from Verimlilik
select * from [Genel Durma]
select * from �retim

--          INNER JOIN    

select [Genel Durma].ToplamDurmaID,Bekleme.ToplamBeklemeS�resi,[Makine Ar�za].ToplamArizaS�resi
from (([Genel Durma] inner join Bekleme on [Genel Durma].ToplamBeklemeID=Bekleme.ToplamBeklemeID)
inner join [Makine Ar�za] on [Genel Durma].ToplamArizaID=[Makine Ar�za].ToplamArizaID);


select Verimlilik.VerimlilikID,[Genel Durma].ToplamDurmaS�resi,�retim.Toplam�retimS�resi
from ((Verimlilik inner join [Genel Durma] on Verimlilik.ToplamDurmaID=[Genel Durma].ToplamDurmaID)
inner join �retim on Verimlilik.Toplam�retimID=�retim.Toplam�retimID);