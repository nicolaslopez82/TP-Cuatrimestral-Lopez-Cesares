--///////////////////////////////////// USUARIOS ///////////////////////////////

/****** Object:  StoredProcedure [dbo].[SP_AgregarUsuario] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarUsuario]
@idTipoUsuario INT,
@nombre VARCHAR(50),
@apellido VARCHAR(20),
@nroDocumento VARCHAR(8),
@estado BIT,
@usuario VARCHAR(50),
@contrasenia VARCHAR(50),
@patron VARCHAR(50)
AS
BEGIN
INSERT INTO Usuario(idTipoUsuario, nombre, apellido, nroDocumento, estado, usuario, contrasenia) 
VALUES (@idTipoUsuario, @nombre, @apellido, @nroDocumento, @estado, @usuario, ENCRYPTBYPASSPHRASE(@Patron,@Contrasenia))
END
GO

-- EXECUTE SP_AgregarUsuario 3,'john','snow','12345',1,'jsnow','winter','utnclinica'
-- DROP PROCEDURE [SP_AgregarUsuario];  

/****** Object:  StoredProcedure [dbo].[SP_ActualizarDatosUsuario] ******/      
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ActualizarDatosUsuario]
(@prmIdUsuario int,
@prmNombre varchar(50),
@prmApellido varchar(20),
@prmNroDocumento varchar(8),
@prmUsuario varchar(50))
AS
	BEGIN
		update Usuario
		set Usuario.nombre = @prmNombre,
		Usuario.apellido = @prmApellido,		
		Usuario.nroDocumento = @prmNroDocumento		
		WHERE Usuario.idUsuario = @prmIdUsuario
	END
GO

/****** Object:  StoredProcedure [dbo].[SP_EliminarUsuario] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarUsuario]
(@prmIdUsuario int)
AS
	BEGIN
		UPDATE Usuario
		SET estado = 0
		WHERE idUsuario = @prmIdUsuario
	END
GO

-- DROP PROCEDURE [SP_ActualizarDatosUsuario];

/****** Object:  StoredProcedure [dbo].[SP_ValidarUsuario] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ValidarUsuario]
@usuario VARCHAR(50),
@contrasenia VARCHAR(50),
@patron VARCHAR(50)
AS
BEGIN
SELECT*FROM Usuario WHERE usuario=@usuario and CONVERT(VARCHAR(50),DECRYPTBYPASSPHRASE(@patron, contrasenia))=@contrasenia
END
GO

-- EXECUTE SP_ValidarUsuario 'jsnow','winter','utnclinica'

/****** Object:  StoredProcedure [dbo].[SP_BuscarUsuarioPorUsuario] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BuscarUsuarioPorUsuario]
(@prmUsuario varchar(50))
AS
	BEGIN
		SELECT U.idUsuario
			 , U.nombre
			 , U.apellido
			 , U.nroDocumento
			 , TU.descripcion
			 , U.usuario
		FROM Usuario U 
		INNER JOIN TipoUsuario TU ON (U.idTipoUsuario = TU.idTipoUsuario)
		WHERE U.usuario = @prmUsuario
	END
GO

/****** Object:  StoredProcedure [dbo].[SP_BuscarUsuarioPorDNI] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BuscarUsuarioPorDNI]
(@prmNroDocumento varchar(8))
AS
	BEGIN
		SELECT U.idUsuario
			 , U.nombre
			 , U.apellido
			 , U.nroDocumento
			 , TU.descripcion
			 , U.usuario
		FROM Usuario U 
		INNER JOIN TipoUsuario TU ON (U.idTipoUsuario = TU.idTipoUsuario)
		WHERE U.nroDocumento = @prmNroDocumento
	END
GO


/****** Object:  StoredProcedure [dbo].[SP_BuscarSiExisteUsuarioPorUsuario] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BuscarSiExisteUsuarioPorUsuario]
(@prmUsuario varchar(50))
AS
BEGIN   
      IF EXISTS(SELECT U.usuario
                        FROM [TPC_Clinica].[dbo].[Usuario] U
                        WHERE U.usuario = @prmUsuario)
		SELECT 1
      ELSE
		SELECT 0      
END
GO

/****** Object:  StoredProcedure [dbo].[SP_ListarUsuarios] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarUsuarios]
AS
BEGIN
	SELECT [idUsuario]
      ,[idTipoUsuario]
      ,[nombre]
      ,[apellido]
      ,[nroDocumento]      
      ,[usuario]      
	FROM [TPC_Clinica].[dbo].[Usuario]
	WHERE estado = 1
END
GO

--///////////////////////////////////// PACIENTES ///////////////////////////////

/****** Object:  StoredProcedure [dbo].[SP_ListarPacientes] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarPacientes]
AS
BEGIN
	SELECT 
	[idPaciente]
      ,[nombre]
      ,[apellido]
      ,[edad]
      ,[sexo]
      ,[nroDocumento]
      ,[direccion]
      ,[telefono]
      ,[estado]
	FROM [TPC_Clinica].[dbo].[Paciente]
	WHERE estado = 1
END
GO

/****** Object:  StoredProcedure [dbo].[SP_ActualizarDatosPaciente] ******/      
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ActualizarDatosPaciente]
(@prmIdPaciente int,
@prmNombre varchar(50),
@prmApellido varchar(20),
@prmEdad int,
@prmSexo char(1),
@prmNroDocumento varchar(8),
@prmDireccion varchar(150),
@prmTelefono varchar(20))
AS
	BEGIN
		update Paciente
		set Paciente.nombre = @prmNombre,
		Paciente.apellido = @prmApellido,
		Paciente.edad = @prmEdad,
		Paciente.sexo = @prmSexo,
		Paciente.nroDocumento = @prmNroDocumento,
		Paciente.direccion = @prmDireccion,
		Paciente.telefono = @prmTelefono	
		where Paciente.idPaciente = @prmIdPaciente
	END
GO


/****** Object:  StoredProcedure [dbo].[SP_EliminarPaciente] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarPaciente]
(@prmIdPaciente int)
AS
	BEGIN
		UPDATE Paciente
		SET estado = 0
		WHERE idPaciente = @prmIdPaciente
	END
GO

/****** Object:  StoredProcedure [dbo].[SP_RegistrarPaciente] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_RegistrarPaciente]
(
@prmNombres VARCHAR(50),
@prmApellido VARCHAR(50),
@prmEdad INT,
@prmSexo CHAR(1),
@prmNroDoc VARCHAR(8), 
@prmDireccion VARCHAR(150),
@prmTelefono VARCHAR(20),
@prmEstado bit
)
AS
	BEGIN
		INSERT INTO Paciente(nombre, apellido, edad, sexo, nroDocumento, direccion, telefono, estado)
		VALUES(@prmNombres, @prmApellido, @prmEdad, @prmSexo, @prmNroDoc, @prmDireccion, @prmTelefono, @prmEstado);
	END
GO

--///////////////////////////////////// ESPECIALIDAD ///////////////////////////////

/* Insertar desde aqui INICIO */
/****** Object:  StoredProcedure [dbo].[SP_ListarEspecialidad] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarEspecialidad]
AS 
BEGIN
	SELECT 	E.idEspecialidad,
			E.descripcion,
			E.estado
	
	FROM Especialidad AS E
	WHERE estado = 1

END
GO

/****** Object:  StoredProcedure [dbo].[SP_AgregarEspecialidad] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarEspecialidad]
(
@Descripcion VARCHAR(25)
)
AS
	BEGIN
		INSERT INTO Especialidad (descripcion, estado)
		VALUES (@Descripcion,1)
	END
GO

/****** Object:  StoredProcedure [dbo].[SP_EliminarEspecialidad] ******/
--Eliminar Especialidad (Baja logica dependiente del Trigger)
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarEspecialidad]
(
	@idEspecialidad int
)
AS 
BEGIN
 DELETE FROM Especialidad WHERE idEspecialidad = @idEspecialidad

END
GO
--drop PROCEDURE [SP_ElimiarEspecialidad]

/****** Object:  Trigger [dbo].[TR_BajaLogicaEspecialidad] ******/
--Trigger Delete Especialidad
GO
CREATE TRIGGER TR_BajaLogicaEspecialidad ON [dbo].[Especialidad]
INSTEAD of DELETE
AS 
BEGIN

DECLARE @idEspecialidadEntrante INT
SELECT @idEspecialidadEntrante = idEspecialidad FROM deleted

DECLARE @EstadoEntrante BIT
SELECT @EstadoEntrante = estado FROM Especialidad WHERE idEspecialidad = @idEspecialidadEntrante

	if(@EstadoEntrante = 0)
		BEGIN
			DELETE FROM Especialidad WHERE idEspecialidad = @idEspecialidadEntrante
		END
	ELSE
		BEGIN
			UPDATE Especialidad SET estado = 0 WHERE idEspecialidad = @idEspecialidadEntrante
		END
END
GO

/****** Object:  StoredProcedure [dbo].[SP_ModificarDescripcion] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ModificarDescripcion]
(
	@idEspecialidad INT,
	@DescripcionNew VARCHAR(25)
)
AS 
BEGIN
	UPDATE Especialidad SET descripcion = @DescripcionNew WHERE idEspecialidad = @idEspecialidad
END
GO

--///////////////////////////////////// MEDICOS ///////////////////////////////

/****** Object:  StoredProcedure [dbo].[SP_InsertarMedico] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertarMedico] 
(
@idUsuarioEntrante BIGINT,
@idEspecialidadEntrante BIGINT
)
AS
BEGIN

	IF(SELECT count(*) FROM Medico WHERE idUsuario = @idEspecialidadEntrante) > 0
		BEGIN
			PRINT 'Este usuario ya está registrado como medico'
		END
	ELSE
		BEGIN
			IF(SELECT count(*) FROM Usuario WHERE idUsuario = @idUsuarioEntrante) > 0
				BEGIN
						INSERT INTO Medico (idUsuario,estado)
						VALUES(@idUsuarioEntrante,1)

						DECLARE @idmediconuevo BIGINT
						SELECT @idmediconuevo = m.idMedico FROM Medico AS m WHERE m.idUsuario = @idUsuarioEntrante

						INSERT INTO MedicoEspecialidad(idEspecialidad,idMedico)
						VALUES(@idEspecialidadEntrante,@idmediconuevo)
				END
			ELSE
				BEGIN
					PRINT 'Usuario no registrado'
				END
		END
END

/****** Object:  StoredProcedure [dbo].[SP_EliminarMedico] ******/
-- Eliminar Medico o baja logica dependiente del Trigger.
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarMedico] 
(
@idMedicoEntrante BIGINT
)
AS
BEGIN
	IF(SELECT count(*) FROM Medico WHERE idMedico = @idMedicoEntrante) > 0
		BEGIN
			DELETE FROM Medico WHERE idMedico = @idMedicoEntrante
		END
	ELSE
		BEGIN
			PRINT 'Medico Inexistente'
		END
END


/****** Object:  Trigger [dbo].[TR_BajaLogicaMedico] ******/

--Trigger Delete Medico
/*
GO
CREATE TRIGGER TR_BajaLogicaMedico on Medico
INSTEAD of DELETE
AS
BEGIN
DECLARE @idMedicoEntrante BIGINT
SELECT @idMedicoEntrante = idMedico FROM deleted

DECLARE @EstadoEntrante BIT 
SELECT @EstadoEntrante = estado FROM Medico WHERE idMedico = @idMedicoEntrante

	if(@EstadoEntrante = 0)
		BEGIN
			DELETE FROM Medico WHERE idMedico = @idMedicoEntrante
		END
	ELSE
		BEGIN
			UPDATE Medico SET estado = 0 WHERE idMedico = @idMedicoEntrante
		END	
END
*/


/****** Object:  StoredProcedure [dbo].[SP_DarAltaMedico] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SP_DarAltaMedico]
(
	@idMedicoEntrante BIGINT
)
AS
BEGIN
	IF(SELECT count(*) FROM Medico WHERE idMedico = @idMedicoEntrante) > 0
		BEGIN
			UPDATE medico SET estado = 1 WHERE idMedico = @idMedicoEntrante
		END
	ELSE
		BEGIN
			PRINT 'Medico Inexistente'
		END
END

/****** Object:  StoredProcedure [dbo].[SP_ListaMedicos] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListaMedicos]
AS
	BEGIN
		SELECT 
		M.idMedico,
		U.apellido,
		U.nombre,
		U.nroDocumento,
		ME.idEspecialidad,
		E.descripcion
		
		FROM Medico AS M
		INNER JOIN MedicoEspecialidad AS ME ON ME.idMedico = M.idMedico
		INNER JOIN Usuario AS U ON U.idUsuario = M.idUsuario 
		INNER JOIN Especialidad as E ON E.idEspecialidad = ME.idEspecialidad
		WHERE M.estado = 1		
	END
GO

/****** Object:  StoredProcedure [dbo].[SP_ListaMedicosDadosDeBaja] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListaMedicosDadosDeBaja]
AS
	BEGIN
		SELECT 
		M.idMedico,
		U.apellido,
		U.nombre,
		U.nroDocumento,
		ME.idEspecialidad,
		E.descripcion
		
		FROM Medico AS M
		INNER JOIN MedicoEspecialidad AS ME ON ME.idMedico = M.idMedico
		INNER JOIN Usuario AS U ON U.idUsuario = M.idUsuario 
		inner join Especialidad AS E ON E.idEspecialidad = ME.idEspecialidad
		WHERE M.estado = 0
	END



--///////////////////// HORARIOS DISPONIBLES ///////////////////////////////////

/****** Object:  StoredProcedure [dbo].[SP_ListaHorarioDisponible] ******/
--Lista Horario Disponible por id de Medico
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListaHorarioDisponible]
(
	@idmedico BIGINT
)
AS
BEGIN

	SELECT idHorarioDisponible,
		   fechaHorarioDisponible
	FROM HorarioDisponible WHERE idMedico = @idmedico AND estado = 1

END

/****** Object:  StoredProcedure [dbo].[SP_BajaHorario] ******/
-- Dar de baja al horario disponible
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_BajaHorario]
(
	@idhorario BIGINT
)
AS
BEGIN
	UPDATE HorarioDisponible SET estado = 0 WHERE idHorarioDisponible = @idhorario 
END

/****** Object:  StoredProcedure [dbo].[SP_AltaHorario] ******/
-- Dar de Alta al Horario Disponible
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AltaHorario]
(
	@idhorario bigint
)
AS 
BEGIN
	UPDATE HorarioDisponible SET estado = 1 WHERE idHorarioDisponible = @idhorario 
END

/****** Object:  StoredProcedure [dbo].[SP_AgregarHorario] ******/
-- Agregar un Horario Disponible x id de Medico
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarHorario]
(
	@idmedico BIGINT,
	@horarionuevo DATETIME
)
AS 
BEGIN
	INSERT INTO HorarioDisponible (idMedico,fechaHorarioDisponible,estado)
	VALUES (@idmedico,@horarionuevo,1)
END

/****** Object:  StoredProcedure [dbo].[SP_GetHorario] ******/
-- Obtener Horario Disponible
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetHorario]
(
	@idhorario BIGINT
)
AS 
BEGIN
 SELECT fechaHorarioDisponible FROM HorarioDisponible WHERE idHorarioDisponible = @idhorario
END

--///////////////////////////////////// RESERVAS ///////////////////////////////

/****** Object:  StoredProcedure [dbo].[SP_AgregarReserva] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_AgregarReserva]
(
	@idmedico BIGINT,
	@idPaciente BIGINT,
	@idhorario BIGINT,
	@idobservacion VARCHAR(350)
)
AS 
BEGIN

INSERT INTO Reserva (idMedico,idHorarioDisponible,idPaciente,observacion,fechaCreacionReserva,estado)
VALUES (@idmedico,@idhorario,@idPaciente,@idobservacion,GETDATE(),1)
	EXEC SP_BajaHorario @idhorario
END

/****** Object:  StoredProcedure [dbo].[SP_EliminarReserva] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarReserva]
(
	@idReserva BIGINT
)
AS 
BEGIN

DECLARE @idHorario BIGINT
SELECT @idHorario = idHorarioDisponible FROM Reserva WHERE idReserva = @idReserva

DELETE FROM Reserva WHERE idReserva = @idReserva

EXEC SP_AltaHorario @idHorario

END


/****** Object:  StoredProcedure [dbo].[SP_ListaReserva] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListaReserva]
(
	@idMedico BIGINT
)
AS 
BEGIN

	SELECT 
		re.idReserva,
		re.observacion,
		re.fechaCreacionReserva,
		p.apellido,
		p.nombre,
		hd.fechaHorarioDisponible

	FROM Reserva AS Re 
	INNER JOIN Paciente AS p ON p.idPaciente =re.idPaciente
	INNER JOIN HorarioDisponible AS hd ON hd.idHorarioDisponible = re.idHorarioDisponible

END
GO

/* ============ SP de DropDownLists ================= */

/****** Object:  StoredProcedure [dbo].[SP_ListarMedicosPorEspecialidad] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarMedicosPorEspecialidad]
(
	@idEspecialidad BIGINT
)
AS 
BEGIN
	SELECT M.idMedico, 
		U.nombre, 
		U.apellido		
  FROM [dbo].[Especialidad] AS E
  INNER JOIN [dbo].[MedicoEspecialidad] AS ME
	ON ME.idEspecialidad = E.idEspecialidad
  INNER JOIN [dbo].[Medico] AS M
	ON M.idMedico = ME.idMedico
  INNER JOIN [dbo].[Usuario] AS U
	ON U.idUsuario = M.idUsuario  
	WHERE E.idEspecialidad = @idEspecialidad;

END
GO

/****** Object:  StoredProcedure [dbo].[SP_ListarHorariosDisponiblesPorMedico] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarHorariosDisponiblesPorMedico]
(
	@idMedico BIGINT
)
AS 
BEGIN
	SELECT 
		HD.idHorarioDisponible, 		
		HD.fechaHorarioDisponible
  FROM [dbo].[Medico] AS M	
  INNER JOIN [dbo].[HorarioDisponible] AS HD
	ON HD.idMedico = M.idMedico
	WHERE M.idMedico = @idMedico;
END
GO

/****** Object:  StoredProcedure [dbo].[SP_ListarHorariosDisponibles] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ListarHorariosDisponibles]
AS 
BEGIN
	SELECT 	
		HD.idHorarioDisponible, 		
		HD.idMedico, 
		M.idUsuario,
		U.idTipoUsuario,
		HD.fechaHorarioDisponible,
		HD.estado
	FROM [dbo].[HorarioDisponible] AS HD
	INNER JOIN [dbo].[Medico] AS M
		ON M.idMedico = HD.idMedico
	INNER JOIN [dbo].[Usuario] AS U
		ON U.idUsuario = M.idUsuario
	WHERE HD.estado = 1;
END
GO

--execute SP_ListarHorariosDisponibles
--drop procedure [SP_ListarHorariosDisponibles]