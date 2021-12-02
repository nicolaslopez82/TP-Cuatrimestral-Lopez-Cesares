/****** Object:  Database [TPC-Clinica] ******/
CREATE DATABASE [TPC_Clinica]
GO
USE [TPC_Clinica]
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

/****** Object:  Table [dbo].[DiaSemana] ******/
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
 CONSTRAINT [PK_Especialidad] PRIMARY KEY CLUSTERED ([idEspecialidad] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Hora] ******/
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

/****** Object:  Table [dbo].[HorarioAtencion] ******/
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

/****** Object:  Table [dbo].[Medico] ******/
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
/****** Object:  Table [dbo].[Permisos] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[idUsuario] [int] NOT NULL,	
	[estado] [bit] NOT NULL,
CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED ([idUsuario] ASC)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoEmpleado] ******/
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