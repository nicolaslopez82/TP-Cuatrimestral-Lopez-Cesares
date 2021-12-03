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

SET IDENTITY_INSERT [dbo].[Paciente] ON
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('Eddard', 'Stark', 30, 'M', '12345678', 'Winterfell 1234', '1512354378', 1)
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('Robert', 'Baratheon', 40, 'M', '22345678', 'Kinglanding 1234', '1512445678', 1)
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('Jaime', 'Lannister', 30, 'M', '32345678', 'Lannister 1234', '1522345678', 1)
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('Daenerys', ' Targaryen', 28, 'F', '42345678', ' Targaryen 1234', '1515874678', 1)
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('Sansa', 'Stark', 14, 'F', '52345678', 'Winterfell 1324', '15198675678', 1)
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('Arya', 'Stark', 16, 'F', '62345678', 'Winterfell 4321', '1512452378', 1)
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('Jeor', 'Mormont', 30, 'M', '72345678', 'Mormont 1234', '1517855678', 1)
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('Margaery', 'Tyrell', 27, 'F', '82345678', 'Tyrell 1234', '1519355678', 1)
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('Tywin Lannister', 'apellido', 32, 'M', '92345678', 'Lannister 5555', '1512343338', 1)
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('Tommen Baratheon', 'apellido', 55, 'M', '11345611', 'Baratheon 4444', '1511239998', 1)
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('John', 'Snow', 33, 'M', '22345622', 'Targaryen Winterfell 1234', '153237678', 1)
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('Roose', 'Bolton', 26, 'M', '33345633', 'Bolton 1234', '1512985648', 1)
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('Tommen', 'Baratheon', 26, 'M', '33355633', 'Baratheon 1234', '1512973448', 1)
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('Robb', 'Stark', 34, 'M', '99945633', 'Winterfell 1234', '1512167648', 1)
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('Khal', 'Drogo', 37, 'M', '36645633', 'Dothraki 1234', '1512985999', 1)
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('Melisandre', 'Bruja', 99, 'F', '77745633', 'Brujas 1234', '1512985888', 1)
INSERT [dbo].[Paciente] ( [nombre], [apellido], [edad], [sexo], [nroDocumento], [direccion], [telefono], [estado]) VALUES ('Tyrion', 'Lannister', 31, 'M', '87645633', 'Lannister 5555', '1512985777', 1)
SET IDENTITY_INSERT [dbo].[Paciente] OFF
 