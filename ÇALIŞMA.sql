
select �retimPerformans�,ToplamDurmaS�resi,sum(�retilmesiGerekenMetraj) as Metraj
from Verimlilik,[Genel Durma],�retim
where Verimlilik.Toplam�retimID=�retim.Toplam�retimID  and Verimlilik.ToplamDurmaID=[Genel Durma].ToplamDurmaID 
group by �retimPerformans�,ToplamDurmaS�resi,Verimlilik.Toplam�retimID
order by Metraj

-----------------------------------------------------------------------------

select AVG(�retilmesiGerekenMetraj) from �retim group by �retilmesiGerekenMetraj having AVG(�retilmesiGerekenMetraj)>100

---------------------------------------------------------------------------------

select �retilmesiGerekenMetraj from �retim where �retilmesiGerekenMetraj between 10000 and 99999 order by �retilmesiGerekenMetraj
