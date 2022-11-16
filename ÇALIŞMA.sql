
select ÜretimPerformansı,ToplamDurmaSüresi,sum(ÜretilmesiGerekenMetraj) as Metraj
from Verimlilik,[Genel Durma],Üretim
where Verimlilik.ToplamÜretimID=Üretim.ToplamÜretimID  and Verimlilik.ToplamDurmaID=[Genel Durma].ToplamDurmaID 
group by ÜretimPerformansı,ToplamDurmaSüresi,Verimlilik.ToplamÜretimID
order by Metraj

-----------------------------------------------------------------------------

select AVG(ÜretilmesiGerekenMetraj) from Üretim group by ÜretilmesiGerekenMetraj having AVG(ÜretilmesiGerekenMetraj)>100

---------------------------------------------------------------------------------

select ÜretilmesiGerekenMetraj from Üretim where ÜretilmesiGerekenMetraj between 10000 and 99999 order by ÜretilmesiGerekenMetraj
