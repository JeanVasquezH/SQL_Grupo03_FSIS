USE [master]
GO
/****** Object:  Database [DeliciasGourmet]    Script Date: 13/06/24 22:15:45 ******/
CREATE DATABASE [DeliciasGourmet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DeliciasGourmet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\DeliciasGourmet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DeliciasGourmet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\DeliciasGourmet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DeliciasGourmet] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DeliciasGourmet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DeliciasGourmet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET ARITHABORT OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DeliciasGourmet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DeliciasGourmet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DeliciasGourmet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DeliciasGourmet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET RECOVERY FULL 
GO
ALTER DATABASE [DeliciasGourmet] SET  MULTI_USER 
GO
ALTER DATABASE [DeliciasGourmet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DeliciasGourmet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DeliciasGourmet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DeliciasGourmet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DeliciasGourmet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DeliciasGourmet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DeliciasGourmet', N'ON'
GO
ALTER DATABASE [DeliciasGourmet] SET QUERY_STORE = ON
GO
ALTER DATABASE [DeliciasGourmet] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DeliciasGourmet]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 13/06/24 22:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[ClienteId] [int] IDENTITY(1,1) NOT NULL,
	[dni] [varchar](10) NOT NULL,
	[nombre] [varchar](20) NOT NULL,
	[apellido] [varchar](20) NOT NULL,
	[direccion] [varchar](40) NOT NULL,
	[telefono] [varchar](9) NOT NULL,
	[correo] [varchar](30) NOT NULL,
	[contrasenia] [varchar](50) NOT NULL,
	[detalles] [varchar](100) NOT NULL,
 CONSTRAINT [cliente_pk] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[evento]    Script Date: 13/06/24 22:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[evento](
	[EventoId] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[ubicacion] [varchar](40) NOT NULL,
	[tipo_evento] [varchar](20) NOT NULL,
	[invitados] [int] NOT NULL,
	[especificaciones] [varchar](50) NOT NULL,
	[cliente_id] [int] NOT NULL,
 CONSTRAINT [evento_pk] PRIMARY KEY CLUSTERED 
(
	[EventoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura]    Script Date: 13/06/24 22:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura](
	[FacturaId] [int] IDENTITY(1,1) NOT NULL,
	[total] [real] NOT NULL,
	[metodo] [varchar](20) NOT NULL,
	[fecha_emision] [date] NOT NULL,
	[evento_id] [int] NOT NULL,
 CONSTRAINT [factura_pk] PRIMARY KEY CLUSTERED 
(
	[FacturaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[menu]    Script Date: 13/06/24 22:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[platos] [varchar](200) NOT NULL,
	[bebidas] [varchar](200) NOT NULL,
	[postres] [varchar](200) NOT NULL,
	[restricciones] [varchar](200) NOT NULL,
	[evento_id] [int] NOT NULL,
 CONSTRAINT [menu_pk] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recurso]    Script Date: 13/06/24 22:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recurso](
	[RecursosId] [int] IDENTITY(1,1) NOT NULL,
	[tipo_recurso] [varchar](20) NOT NULL,
	[descripcion] [varchar](200) NOT NULL,
	[cantidad] [int] NOT NULL,
	[evento_id] [int] NOT NULL,
 CONSTRAINT [recurso_pk] PRIMARY KEY CLUSTERED 
(
	[RecursosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_de_pago]    Script Date: 13/06/24 22:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_de_pago](
	[TipoDePagoId] [int] IDENTITY(1,1) NOT NULL,
	[tipo_de_pago] [varchar](20) NOT NULL,
 CONSTRAINT [tipo_de_pago_pk] PRIMARY KEY CLUSTERED 
(
	[TipoDePagoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_de_pago_por_factura]    Script Date: 13/06/24 22:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_de_pago_por_factura](
	[TipoPagoporFactura] [int] IDENTITY(1,1) NOT NULL,
	[monto] [real] NOT NULL,
	[fecha_pago] [date] NOT NULL,
	[factura_id] [int] NOT NULL,
	[tipo_de_pago_id] [int] NOT NULL,
 CONSTRAINT [tipo_de_pago_por_factura_pk] PRIMARY KEY CLUSTERED 
(
	[TipoPagoporFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 13/06/24 22:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[nombre_usuario] [varchar](20) NOT NULL,
	[contrasena] [varchar](30) NOT NULL,
	[rol] [varchar](20) NOT NULL,
 CONSTRAINT [usuario_pk] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios_por_evento]    Script Date: 13/06/24 22:15:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios_por_evento](
	[evento_id] [int] NOT NULL,
	[usuario_id] [int] NOT NULL,
	[confirmacion] [bit] NOT NULL,
 CONSTRAINT [usuarios_por_evento_pk] PRIMARY KEY CLUSTERED 
(
	[evento_id] ASC,
	[usuario_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[evento]  WITH CHECK ADD  CONSTRAINT [evento_cliente] FOREIGN KEY([cliente_id])
REFERENCES [dbo].[cliente] ([ClienteId])
GO
ALTER TABLE [dbo].[evento] CHECK CONSTRAINT [evento_cliente]
GO
ALTER TABLE [dbo].[factura]  WITH CHECK ADD  CONSTRAINT [factura_evento] FOREIGN KEY([evento_id])
REFERENCES [dbo].[evento] ([EventoId])
GO
ALTER TABLE [dbo].[factura] CHECK CONSTRAINT [factura_evento]
GO
ALTER TABLE [dbo].[menu]  WITH CHECK ADD  CONSTRAINT [menu_evento] FOREIGN KEY([evento_id])
REFERENCES [dbo].[evento] ([EventoId])
GO
ALTER TABLE [dbo].[menu] CHECK CONSTRAINT [menu_evento]
GO
ALTER TABLE [dbo].[recurso]  WITH CHECK ADD  CONSTRAINT [recurso_evento] FOREIGN KEY([evento_id])
REFERENCES [dbo].[evento] ([EventoId])
GO
ALTER TABLE [dbo].[recurso] CHECK CONSTRAINT [recurso_evento]
GO
ALTER TABLE [dbo].[tipo_de_pago_por_factura]  WITH CHECK ADD  CONSTRAINT [pago_factura] FOREIGN KEY([factura_id])
REFERENCES [dbo].[factura] ([FacturaId])
GO
ALTER TABLE [dbo].[tipo_de_pago_por_factura] CHECK CONSTRAINT [pago_factura]
GO
ALTER TABLE [dbo].[tipo_de_pago_por_factura]  WITH CHECK ADD  CONSTRAINT [tipo_de_pago_por_factura_tipo_de_pago] FOREIGN KEY([tipo_de_pago_id])
REFERENCES [dbo].[tipo_de_pago] ([TipoDePagoId])
GO
ALTER TABLE [dbo].[tipo_de_pago_por_factura] CHECK CONSTRAINT [tipo_de_pago_por_factura_tipo_de_pago]
GO
ALTER TABLE [dbo].[usuarios_por_evento]  WITH CHECK ADD  CONSTRAINT [usuarios_por_evento_evento] FOREIGN KEY([evento_id])
REFERENCES [dbo].[evento] ([EventoId])
GO
ALTER TABLE [dbo].[usuarios_por_evento] CHECK CONSTRAINT [usuarios_por_evento_evento]
GO
ALTER TABLE [dbo].[usuarios_por_evento]  WITH CHECK ADD  CONSTRAINT [usuarios_por_evento_usuario] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[usuario] ([UsuarioId])
GO
ALTER TABLE [dbo].[usuarios_por_evento] CHECK CONSTRAINT [usuarios_por_evento_usuario]
GO
USE [master]
GO
ALTER DATABASE [DeliciasGourmet] SET  READ_WRITE 
GO
