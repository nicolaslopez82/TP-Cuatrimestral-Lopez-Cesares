/****** Object:  Database [TPC-Clinica]    Script Date: 11/04/2021 00:11:40 a. m ******/
CREATE DATABASE [TPC_Clinica]
GO
USE [TPC_Clinica]
GO

/****** Object:  Table [dbo].[Reserva]    Script Date: 11/04/2021 00:11:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reserva](
	[idReserva] [int] IDENTITY(1,1) NOT NULL,
	[idMedico] [int] NOT NULL,
	[idPaciente] [int] NOT NULL,
	[fechaReserva] [datetime] NULL,
	[observacion] [varchar](350) NULL,
	[estado] [char](1) NULL,
	[hora] [varchar](6) NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
([idReserva] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[DiaSemana]    Script Date: 11/04/2021 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DiaSemana](
	[idDiaSemana] [int] IDENTITY(1,1) NOT NULL,
	[nombreDiaSemana] [varchar](50) NULL,
 CONSTRAINT [PK_DiaSemana] PRIMARY KEY CLUSTERED 
([idDiaSemana] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Usuario]    Script Date: 11/04/2021 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[idTipoUsuario] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](20) NULL,	
	[nroDocumento] [varchar](8) NULL,
	[estado] [bit] NULL,	
	[usuario] [varchar](50) NULL,
	[contrasenia] [varbinary](500) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
([idUsuario] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Especialidad]    Script Date: 11/04/2021 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Especialidad](
	[idEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](25) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED ([idEspecialidad] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Hora]    Script Date: 24/08/2018  11/04/2021 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hora](
	[idHora] [int] IDENTITY(1,1) NOT NULL,
	[hora] [varchar](6) NULL,
 CONSTRAINT [PK_Hora] PRIMARY KEY CLUSTERED 
([idHora] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[HorarioAtencion]    11/04/2021 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorarioAtencion](
	[idHorarioAtencion] [int] IDENTITY(1,1) NOT NULL,
	[idMedico] [int] NOT NULL,
	[idHoraInicio] [int] NOT NULL,
	[fecha] [datetime] NULL,
	[fechaFin] [date] NULL,
	[estado] [bit] NULL,
	[idDiaSemana] [int] NULL,
 CONSTRAINT [PK_HorarioAtencion] PRIMARY KEY CLUSTERED 
([idHorarioAtencion] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Medico]    Script Date: 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[idMedico] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idEspecialidad] [int] NOT NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
([idMedico] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Paciente]    Script Date: 11/04/2021 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paciente](
	[idPaciente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](20) NULL,	
	[edad] [int] NULL,
	[sexo] [char](1) NULL,
	[nroDocumento] [varchar](8) NULL,
	[direccion] [varchar](150) NULL,
	[telefono] [varchar](20) NULL,
	[estado] [bit] NULL,	
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
([idPaciente] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 11/04/2021 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[idUsuario] [int] NOT NULL,	
	[estado] [bit] NOT NULL,
CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED ([idUsuario] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 11/04/2021 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[idTipoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](25) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TipoEmpleado] PRIMARY KEY CLUSTERED 
([idTipoUsuario] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]



ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Medico]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Paciente]
GO

ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoUsuario] FOREIGN KEY([idTipoUsuario])
REFERENCES [dbo].[TipoUsuario] ([idTipoUsuario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoUsuario]
GO

ALTER TABLE [dbo].[HorarioAtencion]  WITH CHECK ADD  CONSTRAINT [FK_HorarioAtencion_DiaSemana] FOREIGN KEY([idDiaSemana])
REFERENCES [dbo].[DiaSemana] ([idDiaSemana])
GO

ALTER TABLE [dbo].[HorarioAtencion] CHECK CONSTRAINT [FK_HorarioAtencion_DiaSemana]
GO
ALTER TABLE [dbo].[HorarioAtencion]  WITH CHECK ADD  CONSTRAINT [FK_HorarioAtencion_Hora] FOREIGN KEY([idHoraInicio])
REFERENCES [dbo].[Hora] ([idHora])
GO
ALTER TABLE [dbo].[HorarioAtencion] CHECK CONSTRAINT [FK_HorarioAtencion_Hora]
GO
ALTER TABLE [dbo].[HorarioAtencion]  WITH CHECK ADD  CONSTRAINT [FK_HorarioAtencion_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[HorarioAtencion] CHECK CONSTRAINT [FK_HorarioAtencion_Medico]
GO

ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Medico_Usuario]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Especialidad] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[Especialidad] ([idEspecialidad])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Medico_Especialidad]
GO

SET ANSI_PADDING OFF
GO

-- ++++++++++++++++++++++++++++++++++++++ --

SET IDENTITY_INSERT [dbo].[TipoUsuario] ON 
INSERT [dbo].[TipoUsuario] ([idTipoUsuario], [descripcion], [estado]) VALUES (1, 'Administrador', 1)
INSERT [dbo].[TipoUsuario] ([idTipoUsuario], [descripcion], [estado]) VALUES (2, 'Recepcionista', 1)
INSERT [dbo].[TipoUsuario] ([idTipoUsuario], [descripcion], [estado]) VALUES (3, 'Medico', 1)
SET IDENTITY_INSERT [dbo].[TipoUsuario] OFF


SET IDENTITY_INSERT [dbo].[Usuario] ON 
INSERT [dbo].[Usuario] ([idUsuario], [idTipoUsuario], [nombre], [apellido], [nroDocumento], [estado], [usuario], [contrasenia]) VALUES (1, 1, 'Nicolas', 'Lopez', '28111999', 1, 'nlopez', ENCRYPTBYPASSPHRASE('utnclinica', 'admin'))
INSERT [dbo].[Usuario] ([idUsuario], [idTipoUsuario], [nombre], [apellido], [nroDocumento], [estado], [usuario], [contrasenia]) VALUES (2, 1, 'Maximo', 'Cesares', '30222333', 1, 'mcesares', ENCRYPTBYPASSPHRASE('utnclinica', 'admin'))
INSERT [dbo].[Usuario] ([idUsuario], [idTipoUsuario], [nombre], [apellido], [nroDocumento], [estado], [usuario], [contrasenia]) VALUES (3, 2, 'Juana', 'DeArco', '40777888', 1, 'jdarco', ENCRYPTBYPASSPHRASE('utnclinica', '45678'))
INSERT [dbo].[Usuario] ([idUsuario], [idTipoUsuario], [nombre], [apellido], [nroDocumento], [estado], [usuario], [contrasenia]) VALUES (4, 3, 'Sabrina', 'Xavier', '33987546', 1, 'sxavier', ENCRYPTBYPASSPHRASE('utnclinica', 'recep123'))
INSERT [dbo].[Usuario] ([idUsuario], [idTipoUsuario], [nombre], [apellido], [nroDocumento], [estado], [usuario], [contrasenia]) VALUES (5, 3, 'Damian', 'Altube', '33987654', 1, 'daltube', ENCRYPTBYPASSPHRASE('utnclinica', '98765'))
INSERT [dbo].[Usuario] ([idUsuario], [idTipoUsuario], [nombre], [apellido], [nroDocumento], [estado], [usuario], [contrasenia]) VALUES (6, 3, 'Hugo', 'Sicari', '12876345', 1, NULL, NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idTipoUsuario], [nombre], [apellido], [nroDocumento], [estado], [usuario], [contrasenia]) VALUES (7, 3, 'Graciela', 'Rosalin', '12756398', 1, 'grosalin', ENCRYPTBYPASSPHRASE('utnclinica', 'frutilla123'))
SET IDENTITY_INSERT [dbo].[Usuario] OFF

/****** Object:  StoredProcedure [dbo].[SP_AgregarUsuario]    Script Date: 11/04/2021 00:11:42 a. m. ******/
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

--DROP PROCEDURE [SP_AgregarUsuario];  

/****** Object:  StoredProcedure [dbo].[SP_ValidarUsuario]    Script Date: 11/04/2021 00:11:42 a. m. ******/
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

/****** Object:  StoredProcedure [dbo].[SP_BuscarUsuarioPorUsuario]    Script Date: 11/04/2021 00:11:42 a. m. ******/
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

/****** Object:  StoredProcedure [dbo].[SP_BuscarUsuarioPorDNI]    Script Date: 11/04/2021 00:11:42 a. m. ******/
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


/****** Object:  StoredProcedure [dbo].[SP_BuscarSiExisteUsuarioPorUsuario]    Script Date: 11/04/2021 00:11:42 a. m. ******/
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

-- DROP PROCEDURE [SP_BuscarSiExisteUsuarioPorUsuario];
=======
/****** Object:  Database [TPC-Clinica]    Script Date: 11/04/2021 00:11:40 a. m ******/
CREATE DATABASE [TPC_Clinica]
GO
USE [TPC_Clinica]
GO

/****** Object:  Table [dbo].[Reserva]    Script Date: 11/04/2021 00:11:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reserva](
	[idReserva] [int] IDENTITY(1,1) NOT NULL,
	[idMedico] [int] NOT NULL,
	[idPaciente] [int] NOT NULL,
	[fechaReserva] [datetime] NULL,
	[observacion] [varchar](350) NULL,
	[estado] [char](1) NULL,
	[hora] [varchar](6) NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
([idReserva] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[DiaSemana]    Script Date: 11/04/2021 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DiaSemana](
	[idDiaSemana] [int] IDENTITY(1,1) NOT NULL,
	[nombreDiaSemana] [varchar](50) NULL,
 CONSTRAINT [PK_DiaSemana] PRIMARY KEY CLUSTERED 
([idDiaSemana] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Usuario]    Script Date: 11/04/2021 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[idTipoUsuario] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](20) NULL,	
	[nroDocumento] [varchar](8) NULL,
	[estado] [bit] NULL,	
	[usuario] [varchar](50) NULL,
	[contrasenia] [varbinary](500) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
([idUsuario] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Especialidad]    Script Date: 11/04/2021 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Especialidad](
	[idEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](25) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED ([idEspecialidad] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Hora]    Script Date: 24/08/2018  11/04/2021 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hora](
	[idHora] [int] IDENTITY(1,1) NOT NULL,
	[hora] [varchar](6) NULL,
 CONSTRAINT [PK_Hora] PRIMARY KEY CLUSTERED 
([idHora] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[HorarioAtencion]    11/04/2021 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorarioAtencion](
	[idHorarioAtencion] [int] IDENTITY(1,1) NOT NULL,
	[idMedico] [int] NOT NULL,
	[idHoraInicio] [int] NOT NULL,
	[fecha] [datetime] NULL,
	[fechaFin] [date] NULL,
	[estado] [bit] NULL,
	[idDiaSemana] [int] NULL,
 CONSTRAINT [PK_HorarioAtencion] PRIMARY KEY CLUSTERED 
([idHorarioAtencion] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Medico]    Script Date: 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[idMedico] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idEspecialidad] [int] NOT NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
([idMedico] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Paciente]    Script Date: 11/04/2021 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paciente](
	[idPaciente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](20) NULL,	
	[edad] [int] NULL,
	[sexo] [char](1) NULL,
	[nroDocumento] [varchar](8) NULL,
	[direccion] [varchar](150) NULL,
	[telefono] [varchar](20) NULL,
	[estado] [bit] NULL,	
 CONSTRAINT [PK_Paciente] PRIMARY KEY CLUSTERED 
([idPaciente] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 11/04/2021 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[idUsuario] [int] NOT NULL,	
	[estado] [bit] NOT NULL,
CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED ([idUsuario] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpleado]    Script Date: 11/04/2021 00:11:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoUsuario](
	[idTipoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](25) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_TipoEmpleado] PRIMARY KEY CLUSTERED 
([idTipoUsuario] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]



ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Medico]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Paciente] FOREIGN KEY([idPaciente])
REFERENCES [dbo].[Paciente] ([idPaciente])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Paciente]
GO

ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoUsuario] FOREIGN KEY([idTipoUsuario])
REFERENCES [dbo].[TipoUsuario] ([idTipoUsuario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoUsuario]
GO

ALTER TABLE [dbo].[HorarioAtencion]  WITH CHECK ADD  CONSTRAINT [FK_HorarioAtencion_DiaSemana] FOREIGN KEY([idDiaSemana])
REFERENCES [dbo].[DiaSemana] ([idDiaSemana])
GO

ALTER TABLE [dbo].[HorarioAtencion] CHECK CONSTRAINT [FK_HorarioAtencion_DiaSemana]
GO
ALTER TABLE [dbo].[HorarioAtencion]  WITH CHECK ADD  CONSTRAINT [FK_HorarioAtencion_Hora] FOREIGN KEY([idHoraInicio])
REFERENCES [dbo].[Hora] ([idHora])
GO
ALTER TABLE [dbo].[HorarioAtencion] CHECK CONSTRAINT [FK_HorarioAtencion_Hora]
GO
ALTER TABLE [dbo].[HorarioAtencion]  WITH CHECK ADD  CONSTRAINT [FK_HorarioAtencion_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO
ALTER TABLE [dbo].[HorarioAtencion] CHECK CONSTRAINT [FK_HorarioAtencion_Medico]
GO

ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Medico_Usuario]
GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Especialidad] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[Especialidad] ([idEspecialidad])
GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Medico_Especialidad]
GO

SET ANSI_PADDING OFF
GO

-- ++++++++++++++++++++++++++++++++++++++ --

SET IDENTITY_INSERT [dbo].[TipoUsuario] ON 
INSERT [dbo].[TipoUsuario] ([idTipoUsuario], [descripcion], [estado]) VALUES (1, 'Administrador', 1)
INSERT [dbo].[TipoUsuario] ([idTipoUsuario], [descripcion], [estado]) VALUES (2, 'Recepcionista', 1)
INSERT [dbo].[TipoUsuario] ([idTipoUsuario], [descripcion], [estado]) VALUES (3, 'Medico', 1)
SET IDENTITY_INSERT [dbo].[TipoUsuario] OFF


SET IDENTITY_INSERT [dbo].[Usuario] ON 
INSERT [dbo].[Usuario] ([idUsuario], [idTipoUsuario], [nombre], [apellido], [nroDocumento], [estado], [usuario], [contrasenia]) VALUES (1, 1, 'Nicolas', 'Lopez', '28111999', 1, 'nlopez', ENCRYPTBYPASSPHRASE('utnclinica', 'admin'))
INSERT [dbo].[Usuario] ([idUsuario], [idTipoUsuario], [nombre], [apellido], [nroDocumento], [estado], [usuario], [contrasenia]) VALUES (2, 1, 'Maximo', 'Cesares', '30222333', 1, 'mcesares', ENCRYPTBYPASSPHRASE('utnclinica', 'admin'))
INSERT [dbo].[Usuario] ([idUsuario], [idTipoUsuario], [nombre], [apellido], [nroDocumento], [estado], [usuario], [contrasenia]) VALUES (3, 2, 'Juana', 'DeArco', '40777888', 1, 'jdarco', ENCRYPTBYPASSPHRASE('utnclinica', '45678'))
INSERT [dbo].[Usuario] ([idUsuario], [idTipoUsuario], [nombre], [apellido], [nroDocumento], [estado], [usuario], [contrasenia]) VALUES (4, 3, 'Sabrina', 'Xavier', '33987546', 1, 'sxavier', ENCRYPTBYPASSPHRASE('utnclinica', 'recep123'))
INSERT [dbo].[Usuario] ([idUsuario], [idTipoUsuario], [nombre], [apellido], [nroDocumento], [estado], [usuario], [contrasenia]) VALUES (5, 3, 'Damian', 'Altube', '33987654', 1, 'daltube', ENCRYPTBYPASSPHRASE('utnclinica', '98765'))
INSERT [dbo].[Usuario] ([idUsuario], [idTipoUsuario], [nombre], [apellido], [nroDocumento], [estado], [usuario], [contrasenia]) VALUES (6, 3, 'Hugo', 'Sicari', '12876345', 1, NULL, NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idTipoUsuario], [nombre], [apellido], [nroDocumento], [estado], [usuario], [contrasenia]) VALUES (7, 3, 'Graciela', 'Rosalin', '12756398', 1, 'grosalin', ENCRYPTBYPASSPHRASE('utnclinica', 'frutilla123'))
SET IDENTITY_INSERT [dbo].[Usuario] OFF

/****** Object:  StoredProcedure [dbo].[SP_AgregarUsuario]    Script Date: 11/04/2021 00:11:42 a. m. ******/
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

--DROP PROCEDURE [SP_AgregarUsuario];  

/****** Object:  StoredProcedure [dbo].[SP_ValidarUsuario]    Script Date: 11/04/2021 00:11:42 a. m. ******/
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

/****** Object:  StoredProcedure [dbo].[SP_BuscarUsuarioPorUsuario]    Script Date: 11/04/2021 00:11:42 a. m. ******/
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

/****** Object:  StoredProcedure [dbo].[SP_BuscarUsuarioPorDNI]    Script Date: 11/04/2021 00:11:42 a. m. ******/
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


/****** Object:  StoredProcedure [dbo].[SP_BuscarSiExisteUsuarioPorUsuario]    Script Date: 11/04/2021 00:11:42 a. m. ******/
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

-- DROP PROCEDURE [SP_BuscarSiExisteUsuarioPorUsuario];

-- EXECUTE SP_BuscarSiExisteUsuarioPorUsuario 'nlopez'