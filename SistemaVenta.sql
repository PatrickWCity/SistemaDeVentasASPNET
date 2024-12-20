Create Database [SistemaVenta]
go
USE [SistemaVenta]
GO
/****** Object:  User [prueba]    Script Date: 12/7/2017 3:45:03 AM ******/
CREATE USER [prueba] FOR LOGIN [prueba] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_owner', @membername = N'prueba'
GO
sys.sp_addrolemember @rolename = N'db_ddladmin', @membername = N'prueba'
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'prueba'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'prueba'
GO
/****** Object:  Table [dbo].[Accesos_usuarios]    Script Date: 12/7/2017 3:45:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accesos_usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[id_url] [int] NULL,
 CONSTRAINT [PK_Accesos_usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 12/7/2017 3:45:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[descripcion] [text] NOT NULL,
 CONSTRAINT [PK_categoria] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 12/7/2017 3:45:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[apPaterno] [varchar](60) NOT NULL,
	[apMaterno] [varchar](60) NULL,
	[direccion] [varchar](255) NOT NULL,
	[telefono] [varchar](20) NOT NULL,
	[rut] [varchar](10) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 12/7/2017 3:45:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[idDetalle] [int] IDENTITY(1,1) NOT NULL,
	[numFactura] [int] NOT NULL,
	[idVenta] [int] NOT NULL,
	[subTotal] [int] NOT NULL,
	[idProducto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
 CONSTRAINT [PK_detalleVenta] PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC,
	[numFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 12/7/2017 3:45:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[numFactura] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[IVA] [int] NOT NULL,
	[total] [int] NOT NULL,
	[numPago] [int] NOT NULL,
	[descuento] [int] NULL,
 CONSTRAINT [PK_factura] PRIMARY KEY CLUSTERED 
(
	[numFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModoPago]    Script Date: 12/7/2017 3:45:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModoPago](
	[numPago] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](60) NOT NULL,
	[otroDetalles] [nvarchar](255) NULL,
 CONSTRAINT [PK_modoPago] PRIMARY KEY CLUSTERED 
(
	[numPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 12/7/2017 3:45:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[descripcion] [text] NULL,
	[precioUnitario] [int] NOT NULL,
	[url_imagen] [varchar](255) NULL,
	[idCategoria] [int] NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urls]    Script Date: 12/7/2017 3:45:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urls](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[controller] [varchar](500) NULL,
	[action] [varchar](500) NULL,
	[nombre] [varchar](500) NULL,
 CONSTRAINT [PK_Urls] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 12/7/2017 3:45:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](500) NULL,
	[password] [varchar](500) NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 12/7/2017 3:45:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[idVendedor] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](60) NOT NULL,
	[apPaterno] [varchar](60) NOT NULL,
	[apMaterno] [varchar](60) NULL,
	[rut] [varchar](10) NULL,
	[telefono] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_vendedor] PRIMARY KEY CLUSTERED 
(
	[idVendedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 12/7/2017 3:45:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[total] [int] NOT NULL,
	[idCliente] [int] NOT NULL,
	[idVendedor] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[descuento] [int] NULL,
	[IVA] [int] NOT NULL,
 CONSTRAINT [PK_venta] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([idCategoria], [nombre], [descripcion]) VALUES (1, N'Camera Digitales', N'Una cámara fotográfica o cámara de fotos es un dispositivo utilizado para capturar imágenes o fotografías.')
INSERT [dbo].[Categoria] ([idCategoria], [nombre], [descripcion]) VALUES (2, N'Laptops y Notebooks', N'Una computadora portátil, ordenador portátil o computador portátil, es un dispositivo informático que se puede mover o transportar con relativa facilidad.')
INSERT [dbo].[Categoria] ([idCategoria], [nombre], [descripcion]) VALUES (3, N' Televisión', N'La televisión es un sistema para la transmisión y recepción de imágenes y sonido que simulan movimiento, a distancia que emplea un mecanismo de difusión.')
INSERT [dbo].[Categoria] ([idCategoria], [nombre], [descripcion]) VALUES (4, N'Video Juegos', N'Un videojuego o juego de video es un juego electrónico en el que una o más personas interactúan, por medio de un controlador, con un dispositivo que muestra imágenes de vídeo.')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([idCliente], [nombre], [apPaterno], [apMaterno], [direccion], [telefono], [rut]) VALUES (1, N'Vicente', N'Castro', N'Catalan', N'Mi Casa Linda 1234', N'78694354', N'19932555-8')
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apPaterno], [apMaterno], [direccion], [telefono], [rut]) VALUES (2, N'Fabio', N'Carcamo', N'Ibanez', N'Mi Hogar 4234', N'97858548', N'19485029-8')
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apPaterno], [apMaterno], [direccion], [telefono], [rut]) VALUES (3, N'Alvaro', N'Rodriguez', N'Acevedo', N'La Casa, Mikasa 1313', N'97845654', N'18053187-4')
INSERT [dbo].[Cliente] ([idCliente], [nombre], [apPaterno], [apMaterno], [direccion], [telefono], [rut]) VALUES (4, N'Jorge', N'Fierro', N'Muñoz', N'Mi Casa en la cuarda 9453', N'79585343', N'17432441-4')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[DetalleVenta] ON 

INSERT [dbo].[DetalleVenta] ([idDetalle], [numFactura], [idVenta], [subTotal], [idProducto], [cantidad]) VALUES (1, 1, 2, 500000, 10, 2)
SET IDENTITY_INSERT [dbo].[DetalleVenta] OFF
SET IDENTITY_INSERT [dbo].[Factura] ON 

INSERT [dbo].[Factura] ([numFactura], [fecha], [IVA], [total], [numPago], [descuento]) VALUES (1, CAST(N'2017-12-12' AS Date), 0, 500000, 1, 0)
SET IDENTITY_INSERT [dbo].[Factura] OFF
SET IDENTITY_INSERT [dbo].[ModoPago] ON 

INSERT [dbo].[ModoPago] ([numPago], [nombre], [otroDetalles]) VALUES (1, N'PayPal', N'tu nuevo modo de pagos online seguros en Chile.')
INSERT [dbo].[ModoPago] ([numPago], [nombre], [otroDetalles]) VALUES (2, N'Bitcoin', N'El bitcoin ​ es una criptomoneda concebida en 2009.')
INSERT [dbo].[ModoPago] ([numPago], [nombre], [otroDetalles]) VALUES (3, N'CuentaRUT', N'cuenta vista podrás administrar tu dinero. Conoce los beneficios de esta cuenta bancaria.')
INSERT [dbo].[ModoPago] ([numPago], [nombre], [otroDetalles]) VALUES (4, N'Amex', N'una opcion')
INSERT [dbo].[ModoPago] ([numPago], [nombre], [otroDetalles]) VALUES (5, N'Discover', N'otra opcion')
INSERT [dbo].[ModoPago] ([numPago], [nombre], [otroDetalles]) VALUES (6, N'Visa', N'mejor opcion')
INSERT [dbo].[ModoPago] ([numPago], [nombre], [otroDetalles]) VALUES (7, N'MasterCard', N'tambien es buena')
SET IDENTITY_INSERT [dbo].[ModoPago] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([idProducto], [nombre], [descripcion], [precioUnitario], [url_imagen], [idCategoria]) VALUES (2, N'Cámara Digital Lumix Dmc-zs50', N'La LUMIX ZS50 pone la acción justo frente a usted. La lente Leica DC Vario-Elmar de 24mm cuenta con Zoom óptico 30x de manera que usted siempre tendrá una vista detallada de aquello que le interese.', 250000, N'https://http2.mlstatic.com/camara-digital-lumix-dmc-zs50-video-fhd-121mp-D_NQ_NP_837312-MLC25813906888_072017-F.jpg', 1)
INSERT [dbo].[Producto] ([idProducto], [nombre], [descripcion], [precioUnitario], [url_imagen], [idCategoria]) VALUES (3, N'Sony - A6000 - Cámara Digital', N' Crea imágenes de sorprendente belleza con el sensor de imagen APS-C de 24,3 megapíxeles efectivos desarrollado recientemente por Sony.', 350000, N'https://www.bhphotovideo.com/images/images1000x1000/sony_ilce6000l_b_alpha_a6000_mirrorless_digital_1029860.jpg', 1)
INSERT [dbo].[Producto] ([idProducto], [nombre], [descripcion], [precioUnitario], [url_imagen], [idCategoria]) VALUES (4, N'Cámara Digital Lumix Dmc-ts30', N'La DMC-TS30 es a prueba de golpes de hasta una altura de 1.5m según el estándar de prueba "MIL-STD 810F Method 516.5-Shock". Te permite hacer tomas activas mientras te mueves alrededor con la cámara en mano', 120000, N'https://http2.mlstatic.com/D_Q_NP_833298-MLA26232692169_102017-Q.jpg', 1)
INSERT [dbo].[Producto] ([idProducto], [nombre], [descripcion], [precioUnitario], [url_imagen], [idCategoria]) VALUES (5, N'Nikon D3400 Lente 18-55mm', N'Las fotos y los videos capturados con la D3400 y un magnífico lente NIKKOR son tan llamativos y realistas como los momentos que conservan. Dispare en luz extremadamente baja sin dificultades. Congele la acción inmediatamente. Cree retratos con tonos de piel naturales y ricos y hermosos fondos difuminados. Las fotos que comparta asombrarán a todos, incluso a usted mismo.', 395000, N'http://keyassets.timeincuk.net/inspirewp/live/wp-content/uploads/sites/13/2014/04/Nikon_D5300_product_shot_13.jpg', 1)
INSERT [dbo].[Producto] ([idProducto], [nombre], [descripcion], [precioUnitario], [url_imagen], [idCategoria]) VALUES (6, N'Acer Nitro 515-51-565s Nvidia 15,6 Hd', N'Procesador: Intel Core i5 7300HQ (Quad-core / 2500 MHz - 3500 MHz)
RAM: 8GB DDR4 (2400 MHz)
Pantalla: LED 15.6" (1920x1080)
Bateria: 4 celdas (3220 mAh)
Almacenamiento: HDD 1TB (5400rpm)
Tarjetas de video:
Intel HD Graphics 630 (Integrada)
NVIDIA GeForce GTX 1050 (4GB)', 600000, N'https://www.spdigital.cl/img/products/new_web/1506375651963-38014866_3447485630.jpg', 2)
INSERT [dbo].[Producto] ([idProducto], [nombre], [descripcion], [precioUnitario], [url_imagen], [idCategoria]) VALUES (7, N'Macbook Air 13.3/1.8/8gb/128gb Mqd32ci/a', N'La MacBook Air es delgada y ligera, pero también duradera; por eso puedes llevarla a cualquier lugar. Con procesadores Intel de quinta generación, 8 GB de memoria estándar y el rápido almacenamiento SSD basado en PCIe, tiene una potencia más que suficiente para realizar tareas diarias, como revisar el correo electrónico, navegar por Internet, organizar y editar fotos, y realizar videollamadas con FaceTime HD. Y con una batería que dura hasta 12 horas, la MacBook Air irá contigo y permanecerá a tu lado todo el día.', 600000, N'http://www.prophone.cl/wp-content/uploads/2017/09/macbokkairiri.png', 2)
INSERT [dbo].[Producto] ([idProducto], [nombre], [descripcion], [precioUnitario], [url_imagen], [idCategoria]) VALUES (8, N'Notebook Lenovo Ideapad I7-7500u 4gb 1tb 15.6 Nvidia 2gb W10', N'Cuando se trata de pantallas bonitas, el Lenovo Ideapad 510 está a la altura. Mire sus juegos moverse en alta resolución, relájese y disfrute de una película, o simplemente haga chats de vídeo - el 510 le proporcionará toda la intensidad que necesita.', 390000, N'https://www.notebookcheck.net/fileadmin/Notebooks/Lenovo/IdeaPad_510-15IKB_80SV00G4GE/4zu3_Lenovo_Ideapad_15IKB.jpg', 2)
INSERT [dbo].[Producto] ([idProducto], [nombre], [descripcion], [precioUnitario], [url_imagen], [idCategoria]) VALUES (9, N'Sony - 55x725e Ultra Hd 4k Alto Rango Dinámico Smart-tv', N'El televisor compatible con el alto rango dinámico (HDR) cambiará tu forma de ver televisión. En conjunto con la resolución Ultra HD 4K, el contenido de video HDR ofrece un detalle, color y contraste excepcionales, con una amplia gama de brillo, mucho mayor que otros formatos de video. ', 700000, N'https://clsonyb2c.vteximg.com.br/arquivos/ids/176335-1000-1000/KD-55X725E-Silver.jpg', 3)
INSERT [dbo].[Producto] ([idProducto], [nombre], [descripcion], [precioUnitario], [url_imagen], [idCategoria]) VALUES (10, N'Smart Tv 40 Samsung Led - Full Hd', N'Disfrute un nivel mayor de realismo en el entretenimiento en el hogar como nunca lo ha hecho antes. Gracias a una resolución dos veces más alta que los TVs HD estándar, su TV FHD de Samsung ofrece una experiencia de visualización asombrosa que lo lleva más allá de la pantalla hacia un mundo de inmersión total.', 250000, N'https://tz.jumia.is/O_Qre6s1p_xMNOOtWfhAOwYSiig=/fit-in/500x500/filters:fill(white)/product/11/221/1.jpg', 3)
INSERT [dbo].[Producto] ([idProducto], [nombre], [descripcion], [precioUnitario], [url_imagen], [idCategoria]) VALUES (11, N'Haier LE32B9000 32 HD Ready', N'Su TV tiene clase. El marco tiene solamente algunos milímetros de espesor de modo que cabe perfectamente en su habitación. Es tan elegante como un cuadro y fácil de colgar en la pared.
', 125000, N'https://n1.sdlcdn.com/imgs/b/x/g/Haier-LE32B9000-81-cm-32-SDL247175200-1-6a63e.jpg', 3)
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([id], [email], [password]) VALUES (1, N'Patrick.Ciudad@correoaiep.cl', N'123456')
INSERT [dbo].[Usuarios] ([id], [email], [password]) VALUES (2, N'Simon.Plaza@correoaiep.cl', N'123456')
INSERT [dbo].[Usuarios] ([id], [email], [password]) VALUES (3, N'Nestor.Leyton@correoaiep.cl', N'123456')
INSERT [dbo].[Usuarios] ([id], [email], [password]) VALUES (4, N'Vicente.Castro@correoaiep.cl', N'123456')
INSERT [dbo].[Usuarios] ([id], [email], [password]) VALUES (5, N'Fabio.Carcamo@correoaiep.cl', N'123456')
INSERT [dbo].[Usuarios] ([id], [email], [password]) VALUES (6, N'Alvaro.Rodriguez@correoaiep.cl', N'123456')
INSERT [dbo].[Usuarios] ([id], [email], [password]) VALUES (7, N'Jorge.Fierromu@correoaiep.cl', N'123456')
INSERT [dbo].[Usuarios] ([id], [email], [password]) VALUES (1002, N'123@fsf.xcom', N'fsd')
INSERT [dbo].[Usuarios] ([id], [email], [password]) VALUES (1003, N'pat@gmail.com', N'12345')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
SET IDENTITY_INSERT [dbo].[Vendedor] ON 

INSERT [dbo].[Vendedor] ([idVendedor], [nombre], [apPaterno], [apMaterno], [rut], [telefono]) VALUES (1, N'Patrick', N'Ciudad', N'Iturra', N'19313621-4', N'93557050')
INSERT [dbo].[Vendedor] ([idVendedor], [nombre], [apPaterno], [apMaterno], [rut], [telefono]) VALUES (2, N'Simon', N'Plaza', N'Gutierrez', N'19793519-7', N'99887766')
INSERT [dbo].[Vendedor] ([idVendedor], [nombre], [apPaterno], [apMaterno], [rut], [telefono]) VALUES (3, N'Nestor', N'Leyton', N'Latorre', N'19612321-4', N'98768943')
SET IDENTITY_INSERT [dbo].[Vendedor] OFF
SET IDENTITY_INSERT [dbo].[Venta] ON 

INSERT [dbo].[Venta] ([idVenta], [total], [idCliente], [idVendedor], [fecha], [descuento], [IVA]) VALUES (2, 500000, 1, 1, CAST(N'2017-12-12' AS Date), 0, 0)
SET IDENTITY_INSERT [dbo].[Venta] OFF
ALTER TABLE [dbo].[Accesos_usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Accesos_usuarios_Urls] FOREIGN KEY([id_url])
REFERENCES [dbo].[Urls] ([id])
GO
ALTER TABLE [dbo].[Accesos_usuarios] CHECK CONSTRAINT [FK_Accesos_usuarios_Urls]
GO
ALTER TABLE [dbo].[Accesos_usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Accesos_usuarios_Usuarios] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
ALTER TABLE [dbo].[Accesos_usuarios] CHECK CONSTRAINT [FK_Accesos_usuarios_Usuarios]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_detalleFa_idPed] FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_detalleFa_idPed]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_detalleFactura_factura] FOREIGN KEY([numFactura])
REFERENCES [dbo].[Factura] ([numFactura])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_detalleFactura_factura]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_detalleFactura_producto] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Producto] ([idProducto])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_detalleFactura_producto]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_factura_modoPago] FOREIGN KEY([numPago])
REFERENCES [dbo].[ModoPago] ([numPago])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_factura_modoPago]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_producto_idCate] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_producto_idCate]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_cliente] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Cliente] ([idCliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_venta_cliente]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_venta_vendedor] FOREIGN KEY([idVendedor])
REFERENCES [dbo].[Vendedor] ([idVendedor])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_venta_vendedor]
GO
