/* === Create Database ===*/
/****** Object:  Database [TPC-Clinica] ******/
CREATE DATABASE [TPC_Clinica]
GO
USE [TPC_Clinica]
GO

/* === Create Tables ===*/

/****** Object:  Table [dbo].[Usuario] ******/
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

/****** Object:  Table [dbo].[TipoUsuario] ******/
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
 CONSTRAINT [PK_TipoUsuario] PRIMARY KEY CLUSTERED 
([idTipoUsuario] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]

/****** Object:  Table [dbo].[Paciente] ******/
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

/****** Object:  Table [dbo].[Medico] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medico](
	[idMedico] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,	
	[estado] [bit] NULL,
 CONSTRAINT [PK_Medico] PRIMARY KEY CLUSTERED 
([idMedico] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MedicoEspecialidad] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MedicoEspecialidad](
	[idEspecialidad] [int] IDENTITY(1,1) NOT NULL,
	[idMedico] [int] NOT NULL	
 CONSTRAINT [PK_EspecialidadMedico] PRIMARY KEY CLUSTERED 
([idEspecialidad], [idMedico] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Especialidad] ******/
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
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED 
([idEspecialidad] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[HorarioDisponible] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorarioDisponible](
	[idHorarioDisponible] [int] IDENTITY(1,1) NOT NULL,
	[idMedico] [int] NOT NULL,	
	[fechaHorarioDisponible] [datetime] NULL,	
	[estado] [bit] NULL	
 CONSTRAINT [PK_HorarioAtencion] PRIMARY KEY CLUSTERED 
([idHorarioDisponible] ASC) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Reserva] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reserva](
	[idReserva] [int] IDENTITY(1,1) NOT NULL,
	[idHorarioDisponible] [int] NOT NULL,
	[idMedico] [int] NOT NULL,
	[idPaciente] [int] NOT NULL,
	[fechaCreacionReserva] [datetime] NULL,
	[observacion] [varchar](350) NULL,
	[estado] [char](1) NULL	
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
([idReserva] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Reserva] OFF

/* === Alter Tables ===*/

ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_TipoUsuario] FOREIGN KEY([idTipoUsuario])
REFERENCES [dbo].[TipoUsuario] ([idTipoUsuario])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_TipoUsuario]
GO

--

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

ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_HorarioDisponible] FOREIGN KEY([idHorarioDisponible])
REFERENCES [dbo].[HorarioDisponible] ([idHorarioDisponible])
GO

ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_HorarioDisponible]
GO

--

GO
ALTER TABLE [dbo].[HorarioDisponible]  WITH CHECK ADD  CONSTRAINT [FK_HorarioDisponible_Medico] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO

--

GO
ALTER TABLE [dbo].[Medico]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO

GO
ALTER TABLE [dbo].[Medico] CHECK CONSTRAINT [FK_Medico_Usuario]
GO

--

GO
ALTER TABLE [dbo].[MedicoEspecialidad]  WITH CHECK ADD  CONSTRAINT [FK_Medico_Especialidad] FOREIGN KEY([idMedico])
REFERENCES [dbo].[Medico] ([idMedico])
GO

GO
ALTER TABLE [dbo].[MedicoEspecialidad] CHECK CONSTRAINT [FK_Medico_Especialidad]
GO


GO
ALTER TABLE [dbo].[MedicoEspecialidad]  WITH CHECK ADD  CONSTRAINT [FK_Especialidad_Medico] FOREIGN KEY([idEspecialidad])
REFERENCES [dbo].[Especialidad] ([idEspecialidad])
GO

GO
ALTER TABLE [dbo].[MedicoEspecialidad] CHECK CONSTRAINT [FK_Especialidad_Medico]
GO
--

SET ANSI_PADDING OFF
GO