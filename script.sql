USE [master]
GO
/****** Object:  Database [MVeri]    Script Date: 3.11.2022 12:13:21 ******/
CREATE DATABASE [MVeri]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MVeri', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MVeri.mdf' , SIZE = 12288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MVeri_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MVeri_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MVeri] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MVeri].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MVeri] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MVeri] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MVeri] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MVeri] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MVeri] SET ARITHABORT OFF 
GO
ALTER DATABASE [MVeri] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MVeri] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MVeri] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MVeri] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MVeri] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MVeri] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MVeri] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MVeri] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MVeri] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MVeri] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MVeri] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MVeri] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MVeri] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MVeri] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MVeri] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MVeri] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MVeri] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MVeri] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MVeri] SET  MULTI_USER 
GO
ALTER DATABASE [MVeri] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MVeri] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MVeri] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MVeri] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MVeri] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MVeri] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MVeri] SET QUERY_STORE = OFF
GO
USE [MVeri]
GO
/****** Object:  Table [dbo].[Bekleme]    Script Date: 3.11.2022 12:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bekleme](
	[MamulBekleme] [smallint] NULL,
	[İsEmriBekleme] [smallint] NULL,
	[MakaraBekleme] [smallint] NULL,
	[EtiketBekleme] [smallint] NULL,
	[LabBekleme] [smallint] NULL,
	[SetUp] [smallint] NULL,
	[DiğerBekleme] [smallint] NULL,
	[ToplamBeklemeSüresi]  AS (((((([MamulBekleme]+[İsEmriBekleme])+[MakaraBekleme])+[EtiketBekleme])+[LabBekleme])+[SetUp])+[DiğerBekleme]),
	[BeklemeNot] [nvarchar](250) NULL,
	[ToplamBeklemeID] [smallint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Bekleme] PRIMARY KEY CLUSTERED 
(
	[ToplamBeklemeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genel]    Script Date: 3.11.2022 12:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genel](
	[OperasyonID] [smallint] IDENTITY(1,1) NOT NULL,
	[OperatörID] [smallint] NULL,
	[Vardiya] [nvarchar](2) NULL,
	[Tarih] [datetime] NULL,
	[VerimlilikID] [smallint] NULL,
 CONSTRAINT [PK_Genel] PRIMARY KEY CLUSTERED 
(
	[OperasyonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genel Durma]    Script Date: 3.11.2022 12:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genel Durma](
	[ToplamBeklemeID] [smallint] NULL,
	[ToplamArizaID] [smallint] NULL,
	[Diğer] [smallint] NULL,
	[ToplamDurmaSüresi] [smallint] NOT NULL,
	[DurmaNot] [nvarchar](250) NULL,
	[ToplamDurmaID] [smallint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Genel Durma] PRIMARY KEY CLUSTERED 
(
	[ToplamDurmaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Makine]    Script Date: 3.11.2022 12:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makine](
	[OperatörID] [smallint] NOT NULL,
	[MakineNo] [nvarchar](4) NOT NULL,
	[OperatörNo] [smallint] NOT NULL,
 CONSTRAINT [PK_Makine] PRIMARY KEY CLUSTERED 
(
	[OperatörID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Makine Arıza]    Script Date: 3.11.2022 12:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Makine Arıza](
	[ElektrikArizasi] [smallint] NULL,
	[MekanikAriza] [smallint] NULL,
	[ToplamArizaSüresi]  AS ([ElektrikArizasi]+[MekanikAriza]),
	[ElektrikArizasiNot] [nvarchar](250) NULL,
	[MekanikArizaNot] [nvarchar](250) NULL,
	[ToplamArizaID] [smallint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Makine Arıza] PRIMARY KEY CLUSTERED 
(
	[ToplamArizaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Üretim]    Script Date: 3.11.2022 12:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Üretim](
	[ÜretimMetraj] [int] NOT NULL,
	[HurdaMetraj] [int] NULL,
	[NetÜretimSüresi] [smallmoney] NULL,
	[MamulSayısı] [smallint] NOT NULL,
	[ToplamÜretimSüresi]  AS ([NetÜretimSüresi]+(15)*[MamulSayısı]),
	[ToplamÜretimID] [smallint] IDENTITY(1,1) NOT NULL,
	[ToplamMetraj]  AS ([ÜretimMetraj]+[HurdaMetraj]),
	[ÜretilmesiGerekenMetraj] [int] NULL,
 CONSTRAINT [PK_Üretim_1] PRIMARY KEY CLUSTERED 
(
	[ToplamÜretimID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Verimlilik]    Script Date: 3.11.2022 12:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Verimlilik](
	[ToplamDurmaID] [smallint] NULL,
	[ToplamÜretimID] [smallint] NULL,
	[KalanVardiyaSüresi] [smallint] NULL,
	[VerimlilikID] [smallint] IDENTITY(1,1) NOT NULL,
	[ÜretimPerformansı] [smallint] NULL,
 CONSTRAINT [PK_Verimlilik] PRIMARY KEY CLUSTERED 
(
	[VerimlilikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Genel]  WITH CHECK ADD  CONSTRAINT [FK_Genel_Makine] FOREIGN KEY([OperatörID])
REFERENCES [dbo].[Makine] ([OperatörID])
GO
ALTER TABLE [dbo].[Genel] CHECK CONSTRAINT [FK_Genel_Makine]
GO
ALTER TABLE [dbo].[Genel]  WITH CHECK ADD  CONSTRAINT [FK_Genel_Verimlilik] FOREIGN KEY([VerimlilikID])
REFERENCES [dbo].[Verimlilik] ([VerimlilikID])
GO
ALTER TABLE [dbo].[Genel] CHECK CONSTRAINT [FK_Genel_Verimlilik]
GO
ALTER TABLE [dbo].[Genel Durma]  WITH CHECK ADD  CONSTRAINT [FK_Genel Durma_Bekleme] FOREIGN KEY([ToplamBeklemeID])
REFERENCES [dbo].[Bekleme] ([ToplamBeklemeID])
GO
ALTER TABLE [dbo].[Genel Durma] CHECK CONSTRAINT [FK_Genel Durma_Bekleme]
GO
ALTER TABLE [dbo].[Genel Durma]  WITH CHECK ADD  CONSTRAINT [FK_Genel Durma_Makine Arıza] FOREIGN KEY([ToplamArizaID])
REFERENCES [dbo].[Makine Arıza] ([ToplamArizaID])
GO
ALTER TABLE [dbo].[Genel Durma] CHECK CONSTRAINT [FK_Genel Durma_Makine Arıza]
GO
ALTER TABLE [dbo].[Verimlilik]  WITH CHECK ADD  CONSTRAINT [FK_Verimlilik_Genel Durma] FOREIGN KEY([ToplamDurmaID])
REFERENCES [dbo].[Genel Durma] ([ToplamDurmaID])
GO
ALTER TABLE [dbo].[Verimlilik] CHECK CONSTRAINT [FK_Verimlilik_Genel Durma]
GO
ALTER TABLE [dbo].[Verimlilik]  WITH CHECK ADD  CONSTRAINT [FK_Verimlilik_Üretim] FOREIGN KEY([ToplamÜretimID])
REFERENCES [dbo].[Üretim] ([ToplamÜretimID])
GO
ALTER TABLE [dbo].[Verimlilik] CHECK CONSTRAINT [FK_Verimlilik_Üretim]
GO
USE [master]
GO
ALTER DATABASE [MVeri] SET  READ_WRITE 
GO
