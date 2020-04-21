---------------------------------- SP's para mandar E-MAILs -------------------------------------------
use Honda5

go
create procedure mail
as
begin
 select mailP from Prospectos where idProspecto=1 or idProspecto= 2 or idProspecto=3
end
go


drop procedure mail

------------------------------------------------------------------------------------------------------------
-------------------------- SP para mandar mail por cumpleaños a Prospecto ----------------------------------


go 
create procedure mailFechaP
	@mes nvarchar(2),
	@idAgenciaP int
as
begin
	select p.mailP from Prospectos p where SUBSTRING (fechaNac,6,2) = @mes
	and p.idProspecto not in (select d.idPArco from DerechosArco d where d.recibeCorreos=0) 
	and p.idAgenciaP=@idAgenciaP
end
go	


exec mailFechaP '06', 10118  --3420


select idProspecto, nombreP, fechaNac  from Prospectos where  fechaNac like '%11-[^00]%'


select SUBSTRING (fechaNac,9,2), fechaNac from Prospectos
select SUBSTRING ('2013-11-01',6,2)
select SUBSTRING ('2013-11-01',1,4)


select idProspecto, nombreP, fechaNac from Prospectos 
where SUBSTRING (fechaNac,6,2) = 11 and idProspecto not in (select idPArco from DerechosArco where recibeCorreos=0)

drop procedure mailFechaP

--------------------------------------------------------------------------------------------


select d.fechaAtencion, d.idPArco, d.recibeCorreos from DerechosArco d 
where d.fechaAtencion=(select MAX(fechaAtencion) from DerechosArco where recibeCorreos=0 ) 


select d.idPArco, d.fechaAtencion, d.recibeCorreos from DerechosArco d order by d.fechaAtencion desc

 
 
 select p.mailP, d.idPArco, d.fechaAtencion, d.recibeCorreos from Prospectos p, DerechosArco d 
 where p.idProspecto=d.idPArco and d.recibeCorreos!=1  
 
 
 SELECT distinct idPArco from DerechosArco order by fechaAtencion desc
 

drop procedure mailFechaP


------------------------------------------------------------------------------------------------------
SELECT  DISTINCT  
idPArco,fechaAtencion
FROM  
DerechosArco
WHERE  
idPArco
In  (  
SELECT  idPArco  FROM  DerechosArco  As  Tmp  GROUP  BY  idPArco  HAVING  Count>  1)  and  fecha>='01/04/2012'
ORDER  BY  
idfactura
--------------------------------------------------------------------------------------------------------------


SELECT  DISTINCT  idPArco, fechaAtencion
FROM  DerechosArco
WHERE  idPArco In(SELECT  idPArco  
					FROM  DerechosArco  
					As  Tmp  
					GROUP  BY  idPArco) and recibeCorreos = 1
					




------------------------------------------------------------------------------------------------------------
-------------------------- SP para mandar mail por cumpleaños a Cliete -------------------------------------

go 
create procedure mailFechaC
	@mesC nvarchar(2),
	@idAgenciaP int
as
begin
	select mailC from Cliente where SUBSTRING (fechaNacC,6,2) = @mesC
	and numCliente not in (select d.idCArco from DerechosArco d where d.recibeCorreos=0) 
	and idAgenciaC=@idAgenciaP
end
go	


select mailC, fechaNacC from Cliente where SUBSTRING (fechaNacC,6,2) = 12
	and numCliente not in (select d.idCArco from DerechosArco d where d.recibeCorreos=0) 
	and idAgenciaC=10117


exec mailFechaC '12', 10117

drop procedure mailFechaC


----------------------------------------------------------------------------------------------------------------------------------
go
create procedure email
	@fecha nvarchar(10),
	@apro nvarchar(2)	
as
begin
	select mailP, fechaNac from Prospectos where @fecha like @apro;
end
go


select mailP, fechaNac from Prospectos where fechaNac like '%06%';



-------------------------------------------------------------------------------------------------------------
-------------------------- Escoger caracteristicas del carro para mandar e-mail -----------------------------


go
create procedure mailAuto
	@colorExt nvarchar(25),
	@colorInt nvarchar(25),
	@depA nvarchar(20),
	@lineaA nvarchar(50),
	@modeloA int,
	@cilindrada int,
	@aseguradora nvarchar(10),
	@colorExt1 bit,
	@colorInt1 bit,
	@depA1 bit,
	@lineaA1 bit,
	@modeloA1 bit,
	@cilindrada1 bit,
	@aseguradora1 bit,
	@idAgenciaC int
as
begin
set nocount on declare @sql nvarchar(max)
set nocount on declare @donde nvarchar(max)
set nocount on declare @donde2 nvarchar(max)
set @sql='select c.mailC'
set @donde=' where c.numCliente=a.numClienteA
			and c.numCliente not in (select d.idCArco from DerechosArco d where d.recibeCorreos=0) '

set @donde2=' '

	if @colorExt1 = 1
		begin 
			set @donde=@donde+ 'and a.colorExt =''' + @colorExt+''''
		end
	
	if @colorInt1 = 1
		begin
			set @donde=@donde+ 'and a.colorInt =''' + @colorInt+''''
		end
		
	if @depA1 = 1
		begin
			set @donde=@donde+ 'and a.dep ='''+ @depA+''''
		end
		
	if @lineaA1 = 1
		begin
			set @donde=@donde+ 'and a.linea =''' + @lineaA+''''
		end
		
	if @modeloA1 = 1
		begin
			set @donde=@donde+ 'and a.modelo='''+ @modeloA+''''
		end
	
	if @cilindrada1 = 1
		begin
			set @donde=@donde+ 'and a.cilindrada ='''+  @cilindrada+''''
		end
		
	if @aseguradora1 = 1
		begin
			set @donde=@donde+ 'and a.aseguradora ='''+ @aseguradora+''''
		end
		
	if @idAgenciaC = 10053
		begin
			set @donde2=@donde2+'and c.idAgenciaC =10053 '
		end
		
	if @idAgenciaC = 10117
		begin
			set @donde2=@donde2+'and c.idAgenciaC =10117 '
		end
		
	if @idAgenciaC = 10118
		begin
			set @donde2=@donde2+'and c.idAgenciaC =10118 '
		end
		
	if @idAgenciaC = 10116
		begin
			set @donde2=@donde2+'and c.idAgenciaC =10116 '
		end
		
	if @idAgenciaC = 11111
		begin
			set @donde2=@donde2+'and c.idAgenciaC =11111 '
		end
		
set @sql=@sql+ ' from Autos a, Cliente c  '+ @donde + @donde2
end
exec (@sql)
go
	
	
exec mailAuto 'negro','','','',0,0,'', 
1,'','','','','','',11111


------- Consulta valida derechos arco
select c.numCliente, p.mailP from Prospectos p, Cliente c, Autos a where p.idProspecto=c.idProspecto and c.numSerie=a.numSerie
and a.colorExt='negro'
and p.idProspecto  in (select d.idPArco from DerechosArco d where d.recibeCorreos=1) 
or c.idProspecto in (select p.idProspecto from Prospectos where p.idProspecto not in(select d.idPArco from DerechosArco d))
-------------------------------------

drop procedure mailAuto


select * from Autos a, Cliente c where a.numSerie=C.numSerie

select p.mailP from Prospectos p, Autos a, Cliente c 
where p.idProspecto=c.idProspecto and c.numSerie=a.numSerie and 'amarillo'= a.colorExt 



-------------------------------------------------------------------------------------------------------------
-------------------------- Escoger caracteristicas de Servicio para mandar e-mail -----------------------------


go
create procedure mailServicio
	@tipoOS1 bit, 
	@fechaCierreO1 bit, 
	@horaCierreO1 bit, 
	@estatusO1 bit, 
    @subtipoOS1 bit, 
    @fechaAberturaO1 bit, 
    @horaAberturaO1 bit,
    @kilometraje1 bit, 
	@nivelCombustible1 bit, 
    @fechaAbertura1 bit, 
    @horaAbertura1 bit, 
    @fechaInicioReparos1 bit, 
    @horaInicioReparos1 bit, 
    @fechaCompromiso1 bit,
    @horaCompromiso1 bit, 
    @fechaInicioProg1 bit, 
    @horaInicioProg1 bit, 
    @fechaTerminoProg1 bit, 
    @horaTerminoProg1 bit, 
    @fechaCierre1 bit,
    @horaCierre1 bit, 
    @estatus1 bit, 
    @campania1 bit,
    
    @tipoOS nvarchar(1), 
	@fechaCierreO nvarchar(10), 
	@horaCierreO nvarchar(5), 
	@estatusO nvarchar(1), 
    @subtipoOS nvarchar(1), 
    @fechaAberturaO nvarchar(10), 
    @horaAberturaO nvarchar(5),
    @kilometraje int, 
	@nivelCombustible int, 
    @fechaAbertura nvarchar(10), 
    @horaAbertura nvarchar(5), 
    @fechaInicioReparos nvarchar(10), 
    @horaInicioReparos nvarchar(5), 
    @fechaCompromiso nvarchar(10),
    @horaCompromiso nvarchar(5), 
    @fechaInicioProg nvarchar(10), 
    @horaInicioProg nvarchar(5), 
    @fechaTerminoProg nvarchar(10), 
    @horaTerminoProg nvarchar(5), 
    @fechaCierre nvarchar(10),
    @horaCierre nvarchar(5), 
    @estatus nvarchar(1), 
    @campania int,
    @idAgenciaC int
as
begin
set nocount on declare @sql nvarchar(max)
set nocount on declare @donde nvarchar(max)
set nocount on declare @donde2 nvarchar(max)
set @sql='select c.mailC'
set @donde=' where c.numCliente=pr.cliente and pr.nrPreorden=o.nrPreorden '
set @donde2=' '

	if @tipoOS1 = 1
		begin 
			set @donde=@donde+ 'and o.tipoOS =''' + @tipoOS+''''
		end
	
	if @fechaCierreO1 = 1
		begin
			set @donde=@donde+ 'and o.fechaCierreOS =''' + @fechaCierreO+''''
		end
		
	if @horaCierreO1 = 1
		begin
			set @donde=@donde+ 'and o.horaCierreOS ='''+ @horaCierreO+''''
		end
		
	if @estatusO1 = 1
		begin
			set @donde=@donde+ 'and o.estatusOS =''' + @estatusO+''''
		end
		
	if @subtipoOS1 = 1
		begin
			set @donde=@donde+ 'and o.subtipoOS='''+ @subtipoOS+''''
		end
	
	if @fechaAberturaO1 = 1
		begin
			set @donde=@donde+ 'and o.fechaAberturaOS ='''+  @fechaAberturaO+''''
		end
		
	if @horaAberturaO1 = 1
		begin
			set @donde=@donde+ 'and o.horaAberturaOS ='''+ @horaAberturaO+''''
		end
		
		
	if @kilometraje1 = 1
		begin
			set @donde=@donde+ 'and pr.kilometrajePr ='''+ @kilometraje+''''
		end 
		
	if @nivelCombustible1 = 1
		begin
			set @donde=@donde+ 'and pr.nivelCombustiblePr ='''+ @nivelCombustible+''''
		end 
		
    if @fechaAbertura1 = 1
		begin
			set @donde=@donde+ 'and pr.fechaAberturaPr =''' + @fechaAbertura+''''
		end 
		
    if @horaAbertura1 = 1
		begin
			set @donde=@donde+ 'and pr.horaAberturaPr =''' + @horaAbertura+''''
		end 
		
    if @fechaInicioReparos1 = 1
		begin
			set @donde=@donde+ 'and pr.fechaInicioReparosPr=''' +@fechaInicioReparos+''''
		end 
		
    if @horaInicioReparos1 = 1
		begin
			set @donde=@donde+ 'and pr.horaInicioReparosPr=''' + @horaInicioReparos+''''
		end 
		
    if @fechaCompromiso1 = 1
		begin
			set @donde=@donde+ 'and pr.fechaCompromisoPr=''' + @fechaCompromiso+''''
		end
		
    if @horaCompromiso1 = 1
		begin
			set @donde=@donde+ 'and pr.horaCompromisoPr=''' + @horaCompromiso+''''
		end 
		
    if @fechaInicioProg1 = 1
		begin
			set @donde=@donde+'and pr.fechaInicioProgPr=''' + @fechaInicioProg+''''
		end 
		
    if @horaInicioProg1 = 1
		begin
			set @donde=@donde+'and pr.horaInicioProgPr=''' + @horaInicioProg+''''
		end 
		
    if @fechaTerminoProg1 = 1
		begin
			set @donde=@donde+'and pr.fechaTerminoProgPr=''' + @fechaTerminoProg+''''
		end 
		
    if @horaTerminoProg1 = 1
		begin
			set @donde=@donde+'and pr.horaTerminoProgPr='''+ @horaTerminoProg+''''
		end 
		
    if @fechaCierre1 = 1
		begin
			set @donde=@donde+'and pr.fechaCierrePr='''+ @fechaCierre+''''
		end
		
    if @horaCierre1 = 1
		begin
			set @donde=@donde+'and pr.horaCierrePr='''+@horaCierre+''''
		end
		 
    if @estatus1 = 1
		begin
			set @donde=@donde+'and pr.estatusPr='''+@estatus+''''
		end 
		
    if @campania1 = 1
		begin
			set @donde=@donde+'and pr.campaniaPr='''+@campania+''''
		end
		
	if @idAgenciaC = 10053
		begin
			set @donde2=@donde2+'and C.idAgenciaC =10053 '
		end
		
	if @idAgenciaC = 10117
		begin
			set @donde2=@donde2+'and C.idAgenciaC =10117 '
		end
		
	if @idAgenciaC = 10118
		begin
			set @donde2=@donde2+'and C.idAgenciaC =10118 '
		end
		
	if @idAgenciaC = 10116
		begin
			set @donde2=@donde2+'and C.idAgenciaC =10116 '
		end
		
	if @idAgenciaC = 11111
		begin
			set @donde2=@donde2+'and C.idAgenciaC =11111 '
		end
		
set @sql=@sql+ ' from Cliente c, Preorden pr, Orden_Servicios o  '+ @donde + 'and c.numCliente in (select d.idCArco from DerechosArco d where d.recibeCorreos=0) '+@donde2
end
exec (@sql)
go


exec mailServicio 1,'','','','','','','','','', '','','','','','','','','','','','','',
l,'','','','','','',0,0,'','','','','','','','','','','','','',0,10053


drop procedure mailServicio

------- Consulta valida derechos arco
select c.numCliente, p.mailP from Prospectos p, Cliente c, Preorden pr, Orden_Servicios o 
where p.idProspecto=c.idProspecto and c.numCliente=pr.cliente and pr.nrPreorden=o.nrPreorden and o.tipoOS='l'
and p.idProspecto  in (select d.idPArco from DerechosArco d where d.recibeCorreos=1) 
or c.idProspecto in (select p.idProspecto from Prospectos where p.idProspecto not in(select d.idPArco from DerechosArco d))

-------------------------------------

    
    
select * from DerechosArco

select * from Prospectos

select * from Orden_Servicios

select * from Preorden

select * from Cliente