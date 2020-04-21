use Honda5


----- CONSULTA FINAL PARA SOLO MOSTRAR SIN DUPLICIDAD -------------------------------------------------

select * from Cliente
where 'jose luis'  in (select nombreC from Cliente where 'hernandez' in 
(select apPaternoC from Cliente where 'soriano' in (select apMaternoC from Cliente where mailC in 
(select mailC from Cliente group by nombreC, apPaternoC, apMaternoC, mailC having COUNT(*) < 2 ))))
and nombreC like '%jose luis%' and apPaternoC like '%hernandez%' and apMaternoC like '%soriano%'
or mailC != null

--------------------------------------------------------------------------------------------------------

select * from Cliente c where  numCliente in(select  MAX(numCliente) from Cliente where nombreC = 'ALDO HUGO')  and apPaternoC='' and apMaternoC='NULL'


select * from Cliente where nombreC = 'ELITE MOTORS, S. A. DE C. V.                      '


select count(*), nombreC, apPaternoC, apMaternoC,  mailC, coloniaC
from dbo.Cliente 
group by nombreC, apPaternoC, apMaternoC, mailC, coloniaC
having count(*) > 1 order by count(*)

--308 356-341     581		60611

--Campos duplicados:   http://social.msdn.microsoft.com/Forums/es-ES/a7cd6b25-21d0-433d-8aca-596959a439fa/consulta-sql-para-detectar-duplicados
select Cliente.*, count(Cliente)
from dbo.Cliente
group by Cliente
having count(Cliente) > 1

--53443
select * from Cliente order by nombreC where numCliente='43060'   

select * from Cliente where numCliente='29412'

select * from Cliente c where  numCliente in(select  MAX(numCliente) from Cliente where nombreC = 'ALDO HUGO') 



delete from Cliente
truncate table Cliente where nombreC in (select nombreC from Cliente group by nombreC having count(*) > 1)
and apPaternoC in (select apPaternoC from Cliente group by apPaternoC having count(*) > 1)
and apMaternoC in (select apMaternoC from Cliente group by apMaternoC having count(*) > 1) 
and mailC in (select mailC from Cliente group by mailC having count(*) > 1)



if (@nombre  in (select nombreC from Cliente) and @apPaterno  in (select apPaternoC from Cliente) and @apMaterno in (select apMaternoC from Cliente) and @numCliente > (select  MAX(numCliente) from Cliente))


if (@numCliente in(select  MAX(numCliente) from Cliente where @nombre  in (select nombreC from Cliente) and @apPaterno  in (select apPaternoC from Cliente) and @apMaterno in (select apMaternoC from Cliente)))




select fechaNac from Prospectos

-------------------------------------------------------------------------------------------------------------

select * from Autos order by numFactura


select * from Cliente where nombreC='ABIGAIL DE JESUS GONZALEZ MONTECINOS              '




select count(*), c.nombreC, c.apPaternoC, c.apMaternoC,  c.mailC
from dbo.Cliente c 
group by c.nombreC, c.apPaternoC, c.apMaternoC,  c.mailC 
having count(*) > 1 order by count(*)



select c.nombreC, c.apPaternoC, c.apMaternoC,  c.mailC, a.* from Cliente c, Autos a
where nombreC = 'ELITE MOTORS, S. A. DE C. V.                      '
and c.numCliente=a.numClienteA order by a.numClienteA


select * from Cliente 
where nombreC in (select nombreC from Cliente group by nombreC having COUNT(*) < 2)
and apPaternoC in (select apPaternoC from Cliente group by apPaternoC having COUNT(*) < 2)
and apMaternoC in (select apMaternoC from Cliente group by apMaternoC having COUNT(*) < 2)
and mailC in (select mailC from Cliente group by mailC having COUNT(*) < 2)


select * from Cliente
where nombreC in (select nombreC from Cliente where apPaternoC in 
(select apPaternoC from Cliente where apMaternoC in (select apMaternoC from Cliente where mailC in 
(select mailC from Cliente group by nombreC, apPaternoC, apMaternoC, mailC having COUNT(*) < 2 ))))
