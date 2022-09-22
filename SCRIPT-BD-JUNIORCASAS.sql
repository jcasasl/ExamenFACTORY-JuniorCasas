create database [ExamenJuniorCasas]
go
use [ExamenJuniorCasas]
go
CREATE TABLE [dbo].[PRODUCTO](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](100) NULL,
	[Descripcion] [varchar](100) NULL,
	[precio] [decimal](10, 2) NULL,
	[Stock] [int] NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 22/09/2022 17:09:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreCompleto] [varchar](100) NULL,
	[Correo] [varchar](100) NULL,
	[Clave] [varchar](100) NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTA]    Script Date: 22/09/2022 17:09:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTA](
	[IdVenta] [int] IDENTITY(1,1) NOT NULL,
	[TipoPago] [varchar](50) NULL,
	[NumeroDocumento] [varchar](50) NULL,
	[DocumentoCliente] [varchar](50) NULL,
	[NombreCliente] [varchar](100) NULL,
	[MontoPagoCon] [decimal](10, 2) NULL,
	[MontoCambio] [decimal](10, 2) NULL,
	[MontoSubTotal] [decimal](10, 2) NULL,
	[MontoIGV] [decimal](10, 2) NULL,
	[MontoTotal] [decimal](10, 2) NULL,
	[FechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] ON 
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [Descripcion], [precio], [Stock], [FechaRegistro]) VALUES (1, N'10101010', N'Mermelada Gloria selecta 550mg', CAST(5.00 AS Decimal(10, 2)), 10, CAST(N'2022-09-22T03:47:39.600' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [Descripcion], [precio], [Stock], [FechaRegistro]) VALUES (2, N'11111111', N'Aceite primor 1.8lts', CAST(6.20 AS Decimal(10, 2)), 39, CAST(N'2022-09-22T03:47:39.600' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [Descripcion], [precio], [Stock], [FechaRegistro]) VALUES (3, N'12121212', N'Atun Real Light', CAST(4.00 AS Decimal(10, 2)), 30, CAST(N'2022-09-22T03:47:39.600' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [Descripcion], [precio], [Stock], [FechaRegistro]) VALUES (4, N'13131313', N'Refresco zuko Naranja', CAST(1.20 AS Decimal(10, 2)), 49, CAST(N'2022-09-22T03:47:39.600' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [Descripcion], [precio], [Stock], [FechaRegistro]) VALUES (5, N'14141414', N'Mouse logitech g230', CAST(120.00 AS Decimal(10, 2)), 20, CAST(N'2022-09-22T03:47:39.600' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [Descripcion], [precio], [Stock], [FechaRegistro]) VALUES (6, N'15151515', N'Teclado', CAST(15.00 AS Decimal(10, 2)), 10, CAST(N'2022-09-22T15:23:09.087' AS DateTime))
GO
INSERT [dbo].[PRODUCTO] ([IdProducto], [Codigo], [Descripcion], [precio], [Stock], [FechaRegistro]) VALUES (7, N'16161616', N'Jabon bolivar', CAST(50.00 AS Decimal(10, 2)), 20, CAST(N'2022-09-22T16:26:23.127' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[PRODUCTO] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 
GO
INSERT [dbo].[USUARIO] ([IdUsuario], [NombreCompleto], [Correo], [Clave], [FechaRegistro]) VALUES (1, N'Junior Casas', N'Junior_upab@hotmail.com', N'123', CAST(N'2022-09-22T03:47:39.603' AS DateTime))
GO
INSERT [dbo].[USUARIO] ([IdUsuario], [NombreCompleto], [Correo], [Clave], [FechaRegistro]) VALUES (2, N'PruebaJunior', N'z@hotmail.com', N'1234', CAST(N'2022-09-22T17:07:25.807' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
SET IDENTITY_INSERT [dbo].[VENTA] ON 
GO
INSERT [dbo].[VENTA] ([IdVenta], [TipoPago], [NumeroDocumento], [DocumentoCliente], [NombreCliente], [MontoPagoCon], [MontoCambio], [MontoSubTotal], [MontoIGV], [MontoTotal], [FechaRegistro]) VALUES (1, N'Efectivo', N'000001', N'', N'', CAST(7.00 AS Decimal(10, 2)), CAST(0.20 AS Decimal(10, 2)), CAST(5.76 AS Decimal(10, 2)), CAST(1.04 AS Decimal(10, 2)), CAST(6.80 AS Decimal(10, 2)), CAST(N'2022-09-22T03:59:02.457' AS DateTime))
GO
INSERT [dbo].[VENTA] ([IdVenta], [TipoPago], [NumeroDocumento], [DocumentoCliente], [NombreCliente], [MontoPagoCon], [MontoCambio], [MontoSubTotal], [MontoIGV], [MontoTotal], [FechaRegistro]) VALUES (2, N'Efectivo', N'000002', N'46329931', N'Junior Casas', CAST(20.00 AS Decimal(10, 2)), CAST(10.80 AS Decimal(10, 2)), CAST(7.80 AS Decimal(10, 2)), CAST(1.40 AS Decimal(10, 2)), CAST(9.20 AS Decimal(10, 2)), CAST(N'2022-09-22T04:00:41.943' AS DateTime))
GO
INSERT [dbo].[VENTA] ([IdVenta], [TipoPago], [NumeroDocumento], [DocumentoCliente], [NombreCliente], [MontoPagoCon], [MontoCambio], [MontoSubTotal], [MontoIGV], [MontoTotal], [FechaRegistro]) VALUES (3, N'Efectivo', N'000003', N'', N'', CAST(47.60 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(40.34 AS Decimal(10, 2)), CAST(7.26 AS Decimal(10, 2)), CAST(47.60 AS Decimal(10, 2)), CAST(N'2022-09-22T14:20:20.090' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[VENTA] OFF
GO
ALTER TABLE [dbo].[PRODUCTO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
ALTER TABLE [dbo].[VENTA] ADD  DEFAULT (getdate()) FOR [FechaRegistro]
GO
/****** Object:  StoredProcedure [dbo].[sp_editar_producto]    Script Date: 22/09/2022 17:09:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_editar_producto]
(
@IdProducto int,
@Codigo varchar(100),
@Descripcion varchar(100),
@Precio decimal(10,2),
@Stock int
)
as
begin
	update PRODUCTO set 
	Codigo = @Codigo, 
	
	Descripcion = @Descripcion, 
	Precio = @Precio,
	Stock = @Stock
	
	where IdProducto = @IdProducto

end
GO
/****** Object:  StoredProcedure [dbo].[sp_guardar_producto]    Script Date: 22/09/2022 17:09:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_guardar_producto]
(
@Codigo varchar(100),
@Descripcion varchar(100),
@Precio decimal(10,2),
@Stock int
)
as
begin
	
	insert into PRODUCTO(Codigo,Descripcion,Precio,Stock) values
	(@Codigo,@Descripcion,@Precio,@Stock)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_guardar_usuario]    Script Date: 22/09/2022 17:09:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_guardar_usuario]
(
@Nombre varchar(100),
@Correo varchar(100),
@Clave varchar(100)
)
as
begin

	insert into USUARIO(NombreCompleto,Correo,clave) values
	(@Nombre,@Correo,@Clave)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_listar_producto]    Script Date: 22/09/2022 17:09:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  

CREATE procedure [dbo].[sp_listar_producto]  
as  
begin  
 select   
 p.IdProducto,  
 p.Codigo,  
 p.Descripcion,  
 p.precio,  
 p.Stock  
 from PRODUCTO p  
 order by p.IdProducto desc  
end  
  
GO
/****** Object:  StoredProcedure [dbo].[sp_listar_usuario]    Script Date: 22/09/2022 17:09:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_listar_usuario]  
as  
begin  
 select   
 u.IdUsuario,  
 u.NombreCompleto,  
 u.Correo,  
 u.Clave  
 from USUARIO u  
 order by u.IdUsuario desc  
end  
GO
