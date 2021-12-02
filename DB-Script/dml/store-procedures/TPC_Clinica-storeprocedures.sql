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