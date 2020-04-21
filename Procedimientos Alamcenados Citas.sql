use Honda5



------------------------------ P. A. de Insertar Citas--------------------------------------------

go 
create procedure insertCitas
	@idProspecto int,
	@cartaRecor nvarchar (100),
	@fecha nvarchar(10),
	@hora nvarchar(5)
as
begin
	insert into dbo.Citas (idPCitas, cartaRecor, fechaCita, horaCita)
	values(@idProspecto, @cartaRecor, @fecha, @hora)
end
go

drop procedure insertCitas

-------------------------- P. A. de Borrar Citas -----------------------------------------------------


go 
create procedure borrarCitas
	@idProspecto int,
	@cartaRecor nvarchar (100),
	@fecha nvarchar (10),
	@hora nvarchar(5)
as
begin
	delete from dbo.Citas
	where idPCitas=@idProspecto
end


drop procedure borrarCitas


----------------------------- P. A. de Consultar Citas----------------------------------


go 
create procedure consultarCita
as
begin
	select c.idPCitas, c.cartaRecor, c.fechaCita, c.horaCita, p.nombreP, p.apPaternoP, p.apMaternoP from Citas c, Prospectos p 
	where c.idPCitas=p.idProspecto
end


drop procedure consultarCita

exec consultarCita 1



drop procedure consultarCita


--------------------------- P. A. de Cosultar Citas por Prospecto-------------------------


go 
create procedure consultarCitaP
	@idProspecto int
as
begin
	select c.idPCitas, c.cartaRecor, c.fechaCita, c.horaCita, p.nombreP, p.apPaternoP, p.apMaternoP from Citas c, Prospectos p 
	where c.idPCitas in(select p.idProspecto from Prospectos where c.idPCitas=@idProspecto)
	
end
go


drop procedure consultarCitaP



---------------------------- P. A. de ¿?----------------------------


go
create procedure llaves
	@idProspecto int
as 
begin
select p.idProspecto from Prospectos as p where p.idProspecto=@idProspecto 
end


go 
create procedure mostrar
	@idProspecto int,
	@cartaRecor nvarchar (100),
	@fecha nvarchar(10),
	@hora nvarchar(5)
as
begin
select idPCitas, cartaRecor from Citas
end


drop procedure mostrar





---------------------- SP Buscar Cita con ID para modificar ------------------


go
 create procedure buscarCita
	@idP int
as
begin
	select * from Citas
	where idPCitas=@idP
end
go

drop procedure buscarCita



------------------------ SP de Modificar Citas ----------------------------------


go 
create procedure modificarCita
	@idProspecto int,
	@cartaRecor nvarchar (100),
	@fecha nvarchar(10),
	@hora nvarchar(5)
as
begin
	update Citas set
	idPCitas=@idProspecto, cartaRecor=@cartaRecor, fechaCita=@fecha, horaCita=@hora
	where idPCitas = @idProspecto
end
go

drop procedure modificarCita