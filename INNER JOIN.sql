select * from Verimlilik
select * from [Genel Durma]
select * from Üretim

--          INNER JOIN    

select [Genel Durma].ToplamDurmaID,Bekleme.ToplamBeklemeSüresi,[Makine Arýza].ToplamArizaSüresi
from (([Genel Durma] inner join Bekleme on [Genel Durma].ToplamBeklemeID=Bekleme.ToplamBeklemeID)
inner join [Makine Arýza] on [Genel Durma].ToplamArizaID=[Makine Arýza].ToplamArizaID);


select Verimlilik.VerimlilikID,[Genel Durma].ToplamDurmaSüresi,Üretim.ToplamÜretimSüresi
from ((Verimlilik inner join [Genel Durma] on Verimlilik.ToplamDurmaID=[Genel Durma].ToplamDurmaID)
inner join Üretim on Verimlilik.ToplamÜretimID=üretim.ToplamÜretimID);