------ PROCEDIMIENTOS ALAMCENADOS DE INICIO DE SESION DE USUARIOS -------------


use Honda5


go
create procedure validar
	@cveUsuario nvarchar(25),
	@contrasena nvarchar(25)
as
begin
	select cveUsuario, contrasena from Usuario
	where cveUsuario=@cveUsuario and contrasena=@contrasena
end
go


insert into dbo.Usuario(cveUsuario, contrasena, idAgencia, nombre, apPaterno, apMaterno, ciudad) values ('usuario2', 'cve2', 'cibelesIR', 'maria', 'rosales', 'gomez', 'irapuato')
insert into dbo.Usuario(cveUsuario, contrasena, idAgencia, nombre, apPaterno, apMaterno, ciudad) values ('usuario1', 'cve1', 'diamanteCe', 'pepe', 'camargo', 'aldama', 'celaya')

insert into dbo.HTransacciones(codigoMov) values (3)

select * from Agencia

exec validar 'usuario2', 'cve2'

drop table Usuario

drop procedure validar


go
create procedure vali
	@cveUsuario nvarchar(25)
as
begin
	select cveUsuario from Usuario
	where cveUsuario=@cveUsuario
end
go




select cveUsuario from Usuario where cveUsuario='usuario1'

select * from Agencia




-------------------------------------------------------------------------------------------------------------------
---------------------- Procedimiento Almacenado de Ver Usuario  -------------------------------


go 
create procedure verAdministrador
as
	select * from Usuario
go



--------------------- Procedimiento Alamcenado de Buscar Usuario por nombre y apellidos ----------------------


go 
create procedure buscarUsu
	@nombre nvarchar(50),
	@apPaterno nvarchar(50),
	@apMaterno nvarchar(50)
as
begin
	select * from Usuario
	where nombreU like '%'+@nombre+'%' and apPaternoU like '%'+@apPaterno+'%' and apMaternoU like '%'+@apMaterno+'%'
end
go

DROP PROCEDURE buscarUsu

select * from Agencia

--------------------- Procedimiento Alamcenado de Buscar Usuario por ciudad ----------------------


go 
create procedure buscarUsuCiu
	@ciudad nvarchar(50)
as
begin
	select * from Usuario 
	where ciudadU like '%'+@ciudad+'%'
end
go

DROP PROCEDURE buscarUsuCiu

--------------------- Procedimiento Alamcenado de Buscar Usuario por ID Agencia ----------------------



go
create procedure buscarUsuAge
	@idAgencia int
as
begin
	select * from Usuario
	where idAgenciaU = @idAgencia
end
go


DROP PROCEDURE buscarUsuAge




---------------------------------- SP de Buscar Usuario de Ventas por Cve Usuario---------------------------------

go
create procedure buscarAsesorVentas
	@cveUsuario nvarchar(25)
as
select * from Usuario
where cveUsuario=@cveUsuario
go



---------------------------------- SP de Buscar Usuario de Ventas por Nombre ---------------------------------

go
create procedure buscarAsesorVentasNom
	@nombre nvarchar(50),
	@paterno nvarchar(50),
	@materno nvarchar(50)
as
select * from Usuario
where nombreU like '%'+@nombre+'%' and  apPaternoU like '%'+@paterno+'%' and  apMaternoU like '%'+@materno+'%'
go



drop procedure buscarAsesorVentasNom



------------------------------- SP de Modificar Asesor de Ventas --------------------------------------


go 
create procedure modificarAsesorVentas
	@cveUsuario nvarchar(25), 
	@idAgenciaU nvarchar(25),
	@nombreU nvarchar(50),
	@apPaternoU nvarchar(50),
	@apMaternoU nvarchar(50),
	@contrasena nvarchar (25),
	@cveHonda nvarchar(25),
	@calleU nvarchar(100),
	@coloniaU nvarchar(100),
	@cpU int,
	@municipioU nvarchar(50),
	@estadoU nvarchar(50),
	@ciudadU nvarchar(50),
	@fechaNacU nvarchar(10),
	@mailU nvarchar(50),
	@observaciones nvarchar(100),
	@puesto nvarchar(50),
	@sexoU int,
	@tel1U nvarchar(10),
	@tel2U nvarchar(10)
as
begin
	update Usuario set
	idAgenciaU=@idAgenciaU, nombreU=@nombreU, apPaternoU=@apPaternoU, apMaternoU=@apMaternoU, 
	contrasena=@contrasena, cveHonda=@cveHonda, calleU=@calleU, coloniaU=@coloniaU, cpU=@cpU, municipioU=@municipioU,
	estadoU=@estadoU, ciudadU=@ciudadU, fechaNacU=@fechaNacU, mailU=@mailU, observaciones=@observaciones,
	puestoU=@puesto, sexoU=@sexoU, tel1U=@tel1U, tel2U=@tel2U
	where cveUsuario=@cveUsuario
end
go



drop procedure modificarAsesorVentas


select * from Usuario