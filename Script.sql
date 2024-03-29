USE [master]
GO
/****** Object:  Database [ArendatorTOP]    Script Date: 28.04.2023 2:38:23 ******/
CREATE DATABASE [ArendatorTOP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ArendatorTOP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ArendatorTOP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ArendatorTOP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ArendatorTOP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ArendatorTOP] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ArendatorTOP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ArendatorTOP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ArendatorTOP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ArendatorTOP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ArendatorTOP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ArendatorTOP] SET ARITHABORT OFF 
GO
ALTER DATABASE [ArendatorTOP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ArendatorTOP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ArendatorTOP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ArendatorTOP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ArendatorTOP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ArendatorTOP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ArendatorTOP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ArendatorTOP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ArendatorTOP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ArendatorTOP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ArendatorTOP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ArendatorTOP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ArendatorTOP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ArendatorTOP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ArendatorTOP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ArendatorTOP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ArendatorTOP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ArendatorTOP] SET RECOVERY FULL 
GO
ALTER DATABASE [ArendatorTOP] SET  MULTI_USER 
GO
ALTER DATABASE [ArendatorTOP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ArendatorTOP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ArendatorTOP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ArendatorTOP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ArendatorTOP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ArendatorTOP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ArendatorTOP] SET QUERY_STORE = OFF
GO
USE [ArendatorTOP]
GO
/****** Object:  User [Arhangel0g0r0dec]    Script Date: 28.04.2023 2:38:23 ******/
CREATE USER [Arhangel0g0r0dec] FOR LOGIN [Arhangel0g0r0dec] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ObjectRent]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ObjectRent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdAppointment] [int] NOT NULL,
	[IdControl] [int] NULL,
	[Square] [float] NOT NULL,
	[PriceForOneMeter] [decimal](9, 0) NOT NULL,
	[IdFloor] [int] NOT NULL,
	[IdStatement] [int] NOT NULL,
	[Del] [bit] NULL,
 CONSTRAINT [PK_ObjectRent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rent]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmployee] [int] NOT NULL,
	[IdClient] [int] NOT NULL,
	[IdObjectRent] [int] NOT NULL,
	[IdTypeOfPayment] [int] NOT NULL,
	[OwnerOfObjectRent] [nvarchar](250) NOT NULL,
	[Deposit] [decimal](9, 3) NOT NULL,
	[Bet] [decimal](9, 3) NOT NULL,
	[DateStart] [date] NOT NULL,
	[DateEnd] [date] NOT NULL,
 CONSTRAINT [PK_Rent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Appointment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Patronimic] [nvarchar](50) NOT NULL,
	[PhoneNumber] [text] NOT NULL,
	[ContractNumber] [text] NOT NULL,
	[IdPost] [int] NOT NULL,
	[PhotoPath] [text] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Patronimic] [nvarchar](50) NOT NULL,
	[INN] [nvarchar](50) NOT NULL,
	[OGRN] [nvarchar](50) NOT NULL,
	[KPP] [nvarchar](50) NOT NULL,
	[Mail] [nvarchar](50) NULL,
	[PathToCopyPassport] [text] NOT NULL,
	[PathToCopyContractOfDirector] [text] NOT NULL,
	[PathToCopyCertificateOfRegistrationOfaLegalEntity] [text] NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
	[Home] [nvarchar](50) NOT NULL,
	[Domophone] [nvarchar](50) NOT NULL,
	[Floor] [nvarchar](50) NOT NULL,
	[Office] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](12) NOT NULL,
	[Del] [bit] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[First]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[First]
AS
SELECT        dbo.Appointment.Title AS Тип, dbo.Client.Surname AS [Фамилия клиента], dbo.Employee.Surname AS [Фамилия сотрудника], dbo.Client.INN AS ИНН, dbo.Rent.DateStart AS [Дата начала аренды], dbo.Rent.Bet AS Ставка, 
                         dbo.ObjectRent.Square AS Площадь, dbo.ObjectRent.PriceForOneMeter AS [Стоимость за один метр], dbo.ObjectRent.Floor AS Этаж
FROM            dbo.ObjectRent INNER JOIN
                         dbo.Rent ON dbo.ObjectRent.Id = dbo.Rent.IdObjectRent INNER JOIN
                         dbo.Employee ON dbo.Rent.IdEmployee = dbo.Employee.Id INNER JOIN
                         dbo.Client ON dbo.Rent.IdClient = dbo.Client.Id INNER JOIN
                         dbo.Appointment ON dbo.ObjectRent.IdAppointment = dbo.Appointment.Id
GO
/****** Object:  Table [dbo].[TypeOfReport]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeOfReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmployee] [int] NOT NULL,
	[IdTypeReport] [int] NOT NULL,
	[DateCreated] [date] NOT NULL,
	[TimeCreated] [time](7) NOT NULL,
	[PathToReport] [text] NOT NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Five]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Five]
AS
SELECT        TOP (100) PERCENT dbo.TypeOfReport.Title, dbo.Employee.Name, dbo.Employee.Patronimic, dbo.Report.DateCreated, dbo.Report.TimeCreated
FROM            dbo.Report INNER JOIN
                         dbo.TypeOfReport ON dbo.Report.IdTypeReport = dbo.TypeOfReport.Id INNER JOIN
                         dbo.Employee ON dbo.Report.IdEmployee = dbo.Employee.Id
WHERE        (dbo.TypeOfReport.Title = N'Прибыль и затраты фирмы')
ORDER BY dbo.Report.DateCreated, dbo.Report.TimeCreated DESC
GO
/****** Object:  Table [dbo].[Statement]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Statement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Appointment.Title AS Назначение, dbo.Statement.Title AS Состояние, dbo.ObjectRent.Square AS Площадь, dbo.ObjectRent.PriceForOneMeter AS Стоимость, dbo.ObjectRent.Floor AS Этаж
FROM            dbo.ObjectRent INNER JOIN
                         dbo.Statement ON dbo.ObjectRent.IdStatement = dbo.Statement.Id INNER JOIN
                         dbo.Appointment ON dbo.ObjectRent.IdAppointment = dbo.Appointment.Id
GROUP BY dbo.Statement.Title, dbo.ObjectRent.Square, dbo.ObjectRent.PriceForOneMeter, dbo.ObjectRent.Floor, dbo.Appointment.Title
HAVING        (dbo.Statement.Title = N'Сдается') OR
                         (dbo.Statement.Title = N'Готово к сдаче')
GO
/****** Object:  Table [dbo].[Application_Material]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application_Material](
	[IdApplication] [int] NOT NULL,
	[IdMaterial] [int] NOT NULL,
	[Count] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationToReception]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationToReception](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRecipient] [int] NULL,
	[IdCreator] [int] NULL,
	[DateFormed] [date] NOT NULL,
 CONSTRAINT [PK_ApplicationToReception] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Control]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Control](
	[Id] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IsOccupied] [bit] NOT NULL,
 CONSTRAINT [PK_Control] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DecommissionedMaterial]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DecommissionedMaterial](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMaterial] [int] NOT NULL,
	[IdEmployee] [int] NOT NULL,
	[PathToDocument16] [text] NOT NULL,
	[CountMat] [int] NOT NULL,
 CONSTRAINT [PK_DecommissionedMaterial] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Demonstration]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Demonstration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdClient] [int] NULL,
	[IdObjectRent] [int] NULL,
	[IdEmployee] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Patronimic] [nvarchar](50) NULL,
	[PhoneNumber] [text] NULL,
	[DateOfDemonstration] [date] NOT NULL,
	[TimeOfDemonstration] [time](7) NOT NULL,
	[IsOccupied] [bit] NULL,
 CONSTRAINT [PK_Demonstration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdTypeOfDocument] [int] NOT NULL,
	[NumDocument] [int] NOT NULL,
	[IdRent] [int] NOT NULL,
	[PathToDocument] [nvarchar](max) NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Floor]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Floor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FloorValue] [int] NOT NULL,
 CONSTRAINT [PK_Floor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormOfPayment]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormOfPayment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [text] NOT NULL,
 CONSTRAINT [PK_FormOfPayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[IdType] [int] NOT NULL,
	[Weight] [float] NULL,
	[Fragility] [bit] NULL,
	[Sizes] [nvarchar](50) NULL,
	[CountMat] [int] NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[IdSender] [int] NULL,
	[IdRecipient] [int] NULL,
	[ContentMessage] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhotoOR]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotoOR](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdObject] [int] NOT NULL,
	[Path] [text] NOT NULL,
 CONSTRAINT [PK_PhotoOR] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SentMaterials]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SentMaterials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdMaterial] [int] NOT NULL,
	[IdObjectRent] [int] NULL,
	[IdEmployee] [int] NULL,
	[PathToDocument13] [text] NULL,
	[Count] [int] NOT NULL,
	[DateSent] [date] NOT NULL,
 CONSTRAINT [PK_SentMaterials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronimic] [nvarchar](50) NOT NULL,
	[CompanyName] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](50) NOT NULL,
	[House] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Mail] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supply]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdSuppler] [int] NOT NULL,
	[IdApplicationOnReciption] [int] NOT NULL,
	[Formed] [bit] NOT NULL,
	[PathToDocument] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Supply] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplyMaterial]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplyMaterial](
	[IdSupply] [int] NOT NULL,
	[IdMaterial] [int] NOT NULL,
	[PriceDilivery] [decimal](18, 2) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Count] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfDocument]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfDocument](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [text] NOT NULL,
 CONSTRAINT [PK_TypeOfDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfMaterial]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfMaterial](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypeOfMaterial] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 28.04.2023 2:38:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ApplicationToReception] ON 

INSERT [dbo].[ApplicationToReception] ([Id], [IdRecipient], [IdCreator], [DateFormed]) VALUES (11, 2, 1, CAST(N'2012-12-12' AS Date))
INSERT [dbo].[ApplicationToReception] ([Id], [IdRecipient], [IdCreator], [DateFormed]) VALUES (12, 1, 2, CAST(N'2012-12-12' AS Date))
INSERT [dbo].[ApplicationToReception] ([Id], [IdRecipient], [IdCreator], [DateFormed]) VALUES (13, 3, 1, CAST(N'2013-11-13' AS Date))
INSERT [dbo].[ApplicationToReception] ([Id], [IdRecipient], [IdCreator], [DateFormed]) VALUES (14, 1, 2, CAST(N'2012-12-12' AS Date))
INSERT [dbo].[ApplicationToReception] ([Id], [IdRecipient], [IdCreator], [DateFormed]) VALUES (15, 2, 1, CAST(N'2016-12-14' AS Date))
INSERT [dbo].[ApplicationToReception] ([Id], [IdRecipient], [IdCreator], [DateFormed]) VALUES (16, 1, 2, CAST(N'2012-12-12' AS Date))
INSERT [dbo].[ApplicationToReception] ([Id], [IdRecipient], [IdCreator], [DateFormed]) VALUES (17, 2, 1, CAST(N'2012-12-12' AS Date))
SET IDENTITY_INSERT [dbo].[ApplicationToReception] OFF
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([Id], [Title]) VALUES (1, N'Павильон')
INSERT [dbo].[Appointment] ([Id], [Title]) VALUES (2, N'Торговое помещение(с торговым залом)')
INSERT [dbo].[Appointment] ([Id], [Title]) VALUES (3, N'Развлекательное(Игровая комната)')
INSERT [dbo].[Appointment] ([Id], [Title]) VALUES (4, N'Развлекательное(Кинотеатр)')
INSERT [dbo].[Appointment] ([Id], [Title]) VALUES (6, N'Общественное питание')
INSERT [dbo].[Appointment] ([Id], [Title]) VALUES (7, N'Масштабное стационарное помещение')
SET IDENTITY_INSERT [dbo].[Appointment] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [Name], [Surname], [Patronimic], [INN], [OGRN], [KPP], [Mail], [PathToCopyPassport], [PathToCopyContractOfDirector], [PathToCopyCertificateOfRegistrationOfaLegalEntity], [Street], [Home], [Domophone], [Floor], [Office], [PhoneNumber], [Del]) VALUES (9, N'Игор', N'Федорович', N'Романов', N'12355675574', N'32462562467', N'98765432454', NULL, N'ля', N'ля', N'ля', N'Волкова', N'33', N'4', N'3', N'4', N'+79864878363', 1)
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Patronimic], [INN], [OGRN], [KPP], [Mail], [PathToCopyPassport], [PathToCopyContractOfDirector], [PathToCopyCertificateOfRegistrationOfaLegalEntity], [Street], [Home], [Domophone], [Floor], [Office], [PhoneNumber], [Del]) VALUES (13, N'Андрей', N'Николаев', N'Александрович', N'7856е78456726', N'6316437247826', N'7346575743567', N'Ilya0907@mail.ru', N'Архив/Документы клиента/Свидетельства/638048980053417048.pdf', N'Архив/Документы клиента/Свидетельства/638048980053417048.pdf', N'Архив/Документы клиента/Свидетельства/638048980053417048.pdf', N'Ньютона', N'23', N'23', N'5', N'23', N'+79877678236', 0)
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Patronimic], [INN], [OGRN], [KPP], [Mail], [PathToCopyPassport], [PathToCopyContractOfDirector], [PathToCopyCertificateOfRegistrationOfaLegalEntity], [Street], [Home], [Domophone], [Floor], [Office], [PhoneNumber], [Del]) VALUES (17, N'Игорь', N'wrwg', N'ergwerg', N'ernener', N'erthe5h', N'45635635', N'356356', N'Архив/Документы клиента/Свидетельства/638055403639481631.pdf', N'Архив/Документы клиента/Свидетельства/638055403639481631.pdf', N'Архив/Документы клиента/Свидетельства/638055403639481631.pdf', N'ertbrthb', N'345', N'356', N'345y', N'345y', N'35635634', 1)
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Patronimic], [INN], [OGRN], [KPP], [Mail], [PathToCopyPassport], [PathToCopyContractOfDirector], [PathToCopyCertificateOfRegistrationOfaLegalEntity], [Street], [Home], [Domophone], [Floor], [Office], [PhoneNumber], [Del]) VALUES (24, N'Виктор', N'Никонов', N'Викторович', N'9087987', N'8797897987', N'87980798079087', N'98798709879087', N'Архив/Документы клиента/Паспорт/638132084212496803.pdf', N'Архив/Документы клиента/Доверенности/638132085213024932.pdf', N'Архив/Документы клиента/Свидетельства/638132084313154752.pdf', N'987987908709', N'77897987098', N'987980780979070', N'98790870987', N'987987980709', N'987987987987', 1)
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Patronimic], [INN], [OGRN], [KPP], [Mail], [PathToCopyPassport], [PathToCopyContractOfDirector], [PathToCopyCertificateOfRegistrationOfaLegalEntity], [Street], [Home], [Domophone], [Floor], [Office], [PhoneNumber], [Del]) VALUES (25, N'ee', N'erf', N'erf', N'erfe', N'erf', N'erf', N'erf', N'Архив/Документы клиента/Паспорт/638132102066359006.pdf', N'Архив/Документы клиента/Доверенности/638132102206236656.pdf', N'Архив/Документы клиента/Свидетельства/638132102131819152.pdf', N'erf', N'erf', N'erf', N'erf', N'erf', N'erf', 1)
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Patronimic], [INN], [OGRN], [KPP], [Mail], [PathToCopyPassport], [PathToCopyContractOfDirector], [PathToCopyCertificateOfRegistrationOfaLegalEntity], [Street], [Home], [Domophone], [Floor], [Office], [PhoneNumber], [Del]) VALUES (26, N'Роман', N'Васильков', N'Васильев', N'6252784628734629387', N'6252784628734629387', N'6252784628734629387', N'6252784628734629387@mail.ru', N'Архив/Документы клиента/Паспорт/638132106310568828.pdf', N'Архив/Документы клиента/Доверенности/638132106593012845.pdf', N'Архив/Документы клиента/Свидетельства/638132106406633936.pdf', N'Попова', N'212', N'12', N'2', N'12', N'+79889779878', NULL)
INSERT [dbo].[Client] ([Id], [Name], [Surname], [Patronimic], [INN], [OGRN], [KPP], [Mail], [PathToCopyPassport], [PathToCopyContractOfDirector], [PathToCopyCertificateOfRegistrationOfaLegalEntity], [Street], [Home], [Domophone], [Floor], [Office], [PhoneNumber], [Del]) VALUES (27, N'гфкп', N'шшгргш', N'гшргщшр', N'гшршгщ', N'ргшршгщ', N'рщшгршгр', N'шгршгр', N'Архив/Документы клиента/Паспорт/638145236972854225.pdf', N'', N'Архив/Документы клиента/Свидетельства/638145237104763894.pdf', N'рщшг', N'шгргшр', N'гшргш', N'гршгщ', N'ршгршгщ', N'гршгщ', NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (1, N'btnSchema1', 1)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (2, N'btnSchema2', 1)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (3, N'btnSchema3', 1)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (4, N'btnSchema4', 1)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (5, N'btnSchema5', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (6, N'btnSchema6', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (7, N'btnSchema7', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (8, N'btnSchema8', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (9, N'btnSchema9', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (10, N'btnSchema10', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (11, N'btnSchema11', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (12, N'btnSchema12', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (13, N'btnSchema13', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (14, N'btnSchema14', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (15, N'btnSchema15', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (16, N'btnSchema16', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (17, N'btnSchema17', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (18, N'btnSchema18', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (19, N'btnSchema19', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (20, N'btnSchema20', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (21, N'btnSchema21', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (22, N'btnSchema22', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (23, N'btnSchema23', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (24, N'btnSchema24', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (25, N'btnSchema25', 0)
INSERT [dbo].[Control] ([Id], [Title], [IsOccupied]) VALUES (26, N'btnSchema26', 0)
GO
SET IDENTITY_INSERT [dbo].[Demonstration] ON 

INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6115, 13, 4, 1, N'Андрей', N'Николаев', N'Александрович', N'+79877678236', CAST(N'2023-02-02' AS Date), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6116, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6117, 13, 4, 2, N'Андрей', N'Николаев', N'Александрович', N'+79877678236', CAST(N'2023-02-02' AS Date), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-12' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-12' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-12' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-12' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-12' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-12' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6127, 13, 6, 2, N'Андрей', N'Николаев', N'Александрович', N'+79877678236', CAST(N'2023-02-11' AS Date), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-11' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-11' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-11' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-11' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-11' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-10' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-10' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-10' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6136, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-10' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6137, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-10' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6138, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-10' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6139, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-09' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-09' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6141, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-09' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6142, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-09' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6143, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-09' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6144, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-09' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6145, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-08' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6146, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-08' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-08' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6148, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-08' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6149, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-08' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-08' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6151, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6152, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6153, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6154, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6155, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6156, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6157, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6158, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6159, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6160, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6161, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6162, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6163, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6165, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6166, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6167, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6168, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6169, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6171, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6172, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6173, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6174, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6175, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6176, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6177, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6178, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6179, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6181, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-13' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6182, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-13' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6183, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-13' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6184, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-13' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6185, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-13' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6186, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-13' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6187, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-14' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6188, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-14' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6189, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-14' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6190, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-14' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6191, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-14' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6192, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-14' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6848, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-16' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6849, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-16' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-16' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6851, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-16' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6852, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-16' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6853, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-16' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6854, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-15' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6855, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-15' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6856, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-15' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6857, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-15' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6858, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-15' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6859, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-15' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6860, 9, 6, 2, N'Игор', N'Федорович', N'Романов', N'+79864878363', CAST(N'2023-02-20' AS Date), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6861, 17, 7, 1, N'Игорь', N'wrwg', N'ergwerg', N'35635634', CAST(N'2023-02-20' AS Date), CAST(N'13:00:00' AS Time), 1)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6862, 9, 6, 1, N'Игор', N'Федорович', N'Романов', N'+79864878363', CAST(N'2023-02-20' AS Date), CAST(N'14:00:00' AS Time), 1)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6863, 9, 4, 1, N'Игор', N'Федорович', N'Романов', N'+79864878363', CAST(N'2023-02-20' AS Date), CAST(N'15:00:00' AS Time), 1)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6864, 9, 6, 1, N'Игор', N'Федорович', N'Романов', N'+79864878363', CAST(N'2023-02-20' AS Date), CAST(N'16:00:00' AS Time), 1)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6865, 13, 6, 1, N'Андрей', N'Николаев', N'Александрович', N'+79877678236', CAST(N'2023-02-20' AS Date), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6866, 24, 7, 1, N'Виктор', N'Никонов', N'Викторович', N'987987987987', CAST(N'2023-02-19' AS Date), CAST(N'12:00:00' AS Time), 1)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6867, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-19' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6868, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-19' AS Date), CAST(N'14:00:00' AS Time), 0)
GO
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6869, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-19' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6870, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-19' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6871, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-19' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6872, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-18' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6873, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-18' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6874, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-18' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6875, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-18' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6876, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-18' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6877, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-18' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6878, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-17' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6879, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-17' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6880, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-17' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6881, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-17' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6882, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-17' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6883, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-17' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6884, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-22' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6885, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-22' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6886, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-22' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6887, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-22' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6888, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-22' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6889, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-22' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6890, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-21' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6891, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-21' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6892, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-21' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6893, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-21' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6894, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-21' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6895, 9, 6, 2, N'Игор', N'Федорович', N'Романов', N'+79864878363', CAST(N'2023-02-21' AS Date), CAST(N'17:00:00' AS Time), 1)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6896, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-24' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6897, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-24' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6898, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-24' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6899, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-24' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-24' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6901, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-24' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6902, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-23' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6903, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-23' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6904, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-23' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6905, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-23' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6906, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-23' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6907, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-23' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6908, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-25' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6909, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-25' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6910, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-25' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6911, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-25' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6912, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-25' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6913, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-25' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6914, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-27' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6915, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-27' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6916, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-27' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6917, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-27' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6918, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-27' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6919, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-27' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6920, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-26' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6921, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-26' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6922, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-26' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6923, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-26' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6924, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-26' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6925, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-26' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6926, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-28' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6927, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-28' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6928, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-28' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6929, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-28' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6930, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-28' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6931, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-02-28' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6932, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6933, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6934, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6935, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6936, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6937, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6938, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6939, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6940, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6941, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6942, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6943, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6944, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6945, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6946, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6947, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6948, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6949, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6950, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6951, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6952, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6953, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6954, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6955, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6956, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6957, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6958, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6959, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6960, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6961, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6962, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6963, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6964, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6965, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6966, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6967, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6968, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
GO
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6969, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6970, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6971, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6972, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6973, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6974, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6975, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6976, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6977, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6978, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6979, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6980, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6981, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6982, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6983, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6984, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6985, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6986, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6987, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6988, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6989, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6990, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6991, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6992, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6993, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6994, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6995, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6996, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6997, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6998, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (6999, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7001, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7002, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7003, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7004, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7005, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7006, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7007, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7008, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7009, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7010, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7011, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7012, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7013, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7014, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7015, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7016, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7017, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7018, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7019, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7020, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7021, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7022, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7023, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7024, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7025, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7026, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7027, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7028, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7029, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7030, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7031, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7032, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7033, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7034, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7035, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7036, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7037, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7038, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7039, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7040, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7041, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7042, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7043, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7044, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7045, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7046, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7047, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7048, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7049, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7050, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7051, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7052, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7053, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7054, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7055, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7056, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7057, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7058, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7059, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7060, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7061, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7062, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7063, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7064, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7065, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7066, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7067, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7068, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
GO
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7069, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7070, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7071, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7072, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7073, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7074, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7075, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7076, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7077, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7078, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7079, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7080, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7081, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7082, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7083, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7084, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7085, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7086, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7087, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7088, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7089, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7090, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7091, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7092, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7093, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7094, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7095, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7096, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7097, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7098, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7099, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7116, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7119, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7120, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7130, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7132, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7133, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7134, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7136, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7137, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7138, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7139, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7141, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7142, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7143, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7144, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7145, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7146, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7147, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7148, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7149, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7151, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7152, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7153, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7154, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7155, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7156, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7157, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7158, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7159, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7160, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7161, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7162, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7163, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7165, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7166, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7167, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7168, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
GO
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7169, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7171, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7172, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7173, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7174, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7175, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7176, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7177, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7178, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7179, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7181, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7182, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7183, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7184, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7185, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7186, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7187, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7188, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7189, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7190, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7191, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7192, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7193, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7194, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7195, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7196, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7197, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7198, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7199, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7200, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7201, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7202, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7203, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7205, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7206, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7207, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7208, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7209, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7210, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7211, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7212, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7213, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7214, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7215, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7216, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7217, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7218, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7219, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7220, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7221, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7222, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7223, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7224, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7225, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7226, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7227, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7228, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7229, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7230, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7231, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7232, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7233, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7234, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7235, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7236, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7237, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7238, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7239, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7240, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7241, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7242, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7243, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7244, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7245, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7246, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7247, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7248, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7249, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7250, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7251, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7252, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7253, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7254, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7255, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7256, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7257, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7258, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7259, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7260, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7261, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7262, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7263, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7264, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7265, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7266, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7267, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7268, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
GO
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7269, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7270, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7271, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7272, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7273, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7274, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7275, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7276, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7277, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7278, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7279, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7280, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7281, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7282, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7283, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7284, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7285, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7286, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7287, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7288, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7289, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7290, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7291, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7292, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7293, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7294, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7295, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7296, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7297, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7298, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7299, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7300, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7301, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7302, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7303, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7304, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7305, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7306, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7307, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7308, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7309, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7310, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7311, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7312, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7313, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7314, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7315, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7316, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7317, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7318, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7319, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7320, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7321, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7322, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7323, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7324, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7325, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7326, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7327, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7328, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7329, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7330, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7331, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7332, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7333, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7334, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7335, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7336, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7337, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7338, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7339, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7340, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7341, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7342, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7343, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7344, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7345, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7346, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7347, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7348, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7349, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7350, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7351, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7353, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7354, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7355, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7356, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7357, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7358, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7359, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7360, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7361, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7362, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7363, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7364, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7365, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7366, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7367, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7368, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
GO
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7369, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7370, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7371, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7372, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7373, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7374, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7375, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7376, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7377, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7378, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7379, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7380, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7381, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7382, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7383, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7384, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7385, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7386, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7387, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7388, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7389, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7390, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7391, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7392, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7393, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7394, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7395, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7396, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7397, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7398, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7399, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7400, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7401, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7402, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7403, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7404, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7405, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7406, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7407, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7408, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7409, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7410, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7411, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7412, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7413, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7414, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7415, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7416, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7417, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7418, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7419, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7420, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7421, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7422, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7423, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7424, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7425, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7426, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7427, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7428, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7429, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7430, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7431, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7432, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7433, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7434, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7435, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7436, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7437, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7438, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7439, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7440, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7441, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7442, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7443, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7444, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7445, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7446, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7447, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7448, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7449, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7450, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7451, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7452, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7453, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7454, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7455, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7456, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7457, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7458, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7459, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7460, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7461, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7462, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7463, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7464, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7465, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7466, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7467, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7468, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
GO
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7469, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7470, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7471, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7472, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7473, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7474, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7475, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7476, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7477, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7478, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7479, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7480, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7481, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7482, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7483, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7484, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7485, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7486, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7487, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7488, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7489, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7490, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7491, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7492, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7493, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7494, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7495, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7496, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7497, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7498, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7499, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7500, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7501, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7502, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7503, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7504, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7505, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7506, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7507, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7508, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7509, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7510, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7511, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7512, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7513, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7514, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7515, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7516, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7517, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7518, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7519, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7520, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7521, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7522, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7523, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7524, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7525, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7526, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7527, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7528, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7529, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7530, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7531, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7532, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7533, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7534, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7535, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7536, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7537, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7538, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7539, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7540, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7541, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7542, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7543, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7544, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7545, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7546, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7547, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7548, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7549, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7550, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7551, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7552, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7553, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7554, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7555, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7556, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7557, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7558, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7559, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7560, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7561, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7562, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7563, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7564, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7565, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7566, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7567, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7568, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
GO
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7569, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7570, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7571, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7572, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7573, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7574, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7575, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7576, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7577, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7578, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7579, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7580, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7581, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7582, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7583, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7584, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7585, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7586, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7587, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7588, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7589, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7590, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7591, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7592, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7593, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7594, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7595, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7596, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7597, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7598, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7599, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7600, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7601, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7602, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7603, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7604, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7605, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7606, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7607, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7608, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7609, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7610, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7611, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7612, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7613, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7614, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7615, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7616, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7617, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7618, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7619, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7620, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7621, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7622, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7623, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7624, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7625, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7626, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7627, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7628, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7629, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7630, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7631, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7632, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7633, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7634, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7635, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7636, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7637, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7638, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7639, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7640, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7641, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7642, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7643, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7644, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7645, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7646, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7647, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7648, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7649, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7650, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7651, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7652, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7653, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7654, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7655, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7656, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7657, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7658, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7659, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7660, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7661, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7662, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7663, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7664, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7665, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7666, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7667, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7668, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
GO
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7669, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7670, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7671, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7672, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7673, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7674, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7675, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7676, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7677, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7678, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7679, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7680, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7681, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7682, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7683, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7684, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7685, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7686, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7687, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7688, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7689, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7690, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7691, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7692, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7693, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7694, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7695, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7696, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7697, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7698, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7699, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7700, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7701, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7702, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7703, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7704, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7705, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7706, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7707, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7708, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7709, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7710, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7711, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7712, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7713, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7714, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7715, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7716, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7717, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7718, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7719, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7720, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7721, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7722, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7723, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7724, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7725, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7726, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7727, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7728, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7729, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7730, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-18' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7731, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-18' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7732, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-18' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7733, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-18' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7734, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-18' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7735, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-18' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7736, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-17' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7737, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-17' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7738, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-17' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7739, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-17' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7740, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-17' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7741, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-17' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7742, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-16' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7743, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-16' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7744, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-16' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7745, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-16' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7746, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-16' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7747, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-16' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7748, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-15' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7749, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-15' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7750, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-15' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7751, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-15' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7752, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-15' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7753, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-15' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7754, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-14' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7755, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-14' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7756, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-14' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7757, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-14' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7758, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-14' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7759, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-14' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7760, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-13' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7761, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-13' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7762, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-13' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7763, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-13' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7764, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-13' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7765, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-13' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7766, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-12' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7767, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-12' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7768, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-12' AS Date), CAST(N'14:00:00' AS Time), 0)
GO
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7769, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-12' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7770, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-12' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7771, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-12' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7772, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-11' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7773, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-11' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7774, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-11' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7775, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-11' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7776, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-11' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7777, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-11' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7778, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-10' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7779, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-10' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7780, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-10' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7781, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-10' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7782, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-10' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7783, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-10' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7784, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-09' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7785, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-09' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7786, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-09' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7787, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-09' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7788, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-09' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7789, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-09' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7790, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-08' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7791, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-08' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7792, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-08' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7793, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-08' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7794, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-08' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7795, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-08' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7796, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-21' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7797, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-21' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7798, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-21' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7799, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-21' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-21' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7801, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-21' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7802, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-20' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7803, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-20' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7804, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-20' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7805, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-20' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7806, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-20' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7807, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-20' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7808, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-19' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7809, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-19' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7810, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-19' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7811, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-19' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7812, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-19' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (7813, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-19' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8730, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-22' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8731, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-22' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8732, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-22' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8733, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-22' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8734, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-22' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8735, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-22' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8736, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-04' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8737, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-04' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8738, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-04' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8739, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-04' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8740, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-04' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8741, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-04' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8742, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-03' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8743, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-03' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8744, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-03' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8745, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-03' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8746, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-03' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8747, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-03' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8748, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-02' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8749, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-02' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8750, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-02' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8751, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-02' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8752, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-02' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8753, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-02' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8754, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-01' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8755, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-01' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8756, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-01' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8757, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-01' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8758, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-01' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8759, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-01' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8760, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-31' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8761, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-31' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8762, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-31' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8763, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-31' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8764, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-31' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8765, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-31' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8766, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-30' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8767, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-30' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8768, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-30' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8769, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-30' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8770, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-30' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8771, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-30' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8772, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-29' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8773, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-29' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8774, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-29' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8775, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-29' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8776, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-29' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8777, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-29' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8778, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-28' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8779, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-28' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8780, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-28' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8781, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-28' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8782, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-28' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8783, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-28' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8784, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-27' AS Date), CAST(N'12:00:00' AS Time), 0)
GO
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8785, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-27' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8786, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-27' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8787, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-27' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8788, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-27' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8789, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-27' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8790, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-26' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8791, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-26' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8792, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-26' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8793, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-26' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8794, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-26' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8795, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-26' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8796, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-25' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8797, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-25' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8798, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-25' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8799, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-25' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8800, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-25' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8801, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-25' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8802, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-24' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8803, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-24' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8804, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-24' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8805, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-24' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8806, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-24' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8807, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-24' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8808, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-23' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8809, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-23' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8810, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-23' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8811, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-23' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8812, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-23' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8813, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-23' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8814, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-07' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8815, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-07' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8816, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-07' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8817, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-07' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8818, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-07' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8819, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-07' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8820, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-06' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8821, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-06' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8822, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-06' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8823, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-06' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8824, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-06' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8825, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-06' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8826, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-05' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8827, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-05' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8828, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-05' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8829, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-05' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8830, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-05' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8831, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-05' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8832, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-11' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8833, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-11' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8834, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-11' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8835, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-11' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8836, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-11' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8837, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-11' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8838, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-10' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8839, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-10' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8840, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-10' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8841, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-10' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8842, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-10' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8843, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-10' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8844, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-09' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8845, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-09' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8846, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-09' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8847, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-09' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8848, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-09' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8849, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-09' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8850, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-08' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8851, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-08' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8852, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-08' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8853, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-08' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8854, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-08' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8855, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-08' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8856, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-23' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8857, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-23' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8858, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-23' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8859, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-23' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8860, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-23' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8861, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-23' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8862, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-22' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8863, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-22' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8864, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-22' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8865, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-22' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8866, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-22' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8867, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-22' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8868, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-21' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8869, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-21' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8870, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-21' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8871, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-21' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8872, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-21' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8873, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-21' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8874, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-20' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8875, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-20' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8876, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-20' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8877, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-20' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8878, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-20' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8879, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-20' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8880, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-19' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8881, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-19' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8882, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-19' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8883, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-19' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8884, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-19' AS Date), CAST(N'16:00:00' AS Time), 0)
GO
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8885, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-19' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8886, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-18' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8887, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-18' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8888, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-18' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8889, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-18' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8890, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-18' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8891, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-18' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8892, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-17' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8893, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-17' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8894, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-17' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8895, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-17' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8896, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-17' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8897, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-17' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8898, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-16' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8899, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-16' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8900, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-16' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8901, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-16' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8902, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-16' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8903, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-16' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8904, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-15' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8905, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-15' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8906, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-15' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8907, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-15' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8908, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-15' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8909, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-15' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8910, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-14' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8911, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-14' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8912, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-14' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8913, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-14' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8914, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-14' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8915, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-14' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8916, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-13' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8917, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-13' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8918, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-13' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8919, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-13' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8920, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-13' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8921, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-13' AS Date), CAST(N'17:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8922, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-12' AS Date), CAST(N'12:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8923, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-12' AS Date), CAST(N'13:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8924, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-12' AS Date), CAST(N'14:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8925, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-12' AS Date), CAST(N'15:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8926, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-12' AS Date), CAST(N'16:00:00' AS Time), 0)
INSERT [dbo].[Demonstration] ([Id], [IdClient], [IdObjectRent], [IdEmployee], [Name], [Surname], [Patronimic], [PhoneNumber], [DateOfDemonstration], [TimeOfDemonstration], [IsOccupied]) VALUES (8927, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2023-04-12' AS Date), CAST(N'17:00:00' AS Time), 0)
SET IDENTITY_INSERT [dbo].[Demonstration] OFF
GO
SET IDENTITY_INSERT [dbo].[Document] ON 

INSERT [dbo].[Document] ([Id], [IdTypeOfDocument], [NumDocument], [IdRent], [PathToDocument]) VALUES (2, 1, 1, 17, NULL)
INSERT [dbo].[Document] ([Id], [IdTypeOfDocument], [NumDocument], [IdRent], [PathToDocument]) VALUES (3, 1, 1, 51, NULL)
INSERT [dbo].[Document] ([Id], [IdTypeOfDocument], [NumDocument], [IdRent], [PathToDocument]) VALUES (4, 1, 1, 52, NULL)
INSERT [dbo].[Document] ([Id], [IdTypeOfDocument], [NumDocument], [IdRent], [PathToDocument]) VALUES (5, 1, 1, 53, NULL)
INSERT [dbo].[Document] ([Id], [IdTypeOfDocument], [NumDocument], [IdRent], [PathToDocument]) VALUES (6, 1, 1, 54, NULL)
INSERT [dbo].[Document] ([Id], [IdTypeOfDocument], [NumDocument], [IdRent], [PathToDocument]) VALUES (7, 1, 1, 55, NULL)
INSERT [dbo].[Document] ([Id], [IdTypeOfDocument], [NumDocument], [IdRent], [PathToDocument]) VALUES (8, 1, 1, 56, NULL)
INSERT [dbo].[Document] ([Id], [IdTypeOfDocument], [NumDocument], [IdRent], [PathToDocument]) VALUES (9, 1, 1, 57, NULL)
INSERT [dbo].[Document] ([Id], [IdTypeOfDocument], [NumDocument], [IdRent], [PathToDocument]) VALUES (10, 1, 1, 58, NULL)
INSERT [dbo].[Document] ([Id], [IdTypeOfDocument], [NumDocument], [IdRent], [PathToDocument]) VALUES (11, 1, 1, 60, NULL)
INSERT [dbo].[Document] ([Id], [IdTypeOfDocument], [NumDocument], [IdRent], [PathToDocument]) VALUES (12, 1, 1, 61, NULL)
INSERT [dbo].[Document] ([Id], [IdTypeOfDocument], [NumDocument], [IdRent], [PathToDocument]) VALUES (13, 1, 1, 62, NULL)
INSERT [dbo].[Document] ([Id], [IdTypeOfDocument], [NumDocument], [IdRent], [PathToDocument]) VALUES (14, 1, 1, 63, NULL)
INSERT [dbo].[Document] ([Id], [IdTypeOfDocument], [NumDocument], [IdRent], [PathToDocument]) VALUES (15, 1, 1, 64, NULL)
SET IDENTITY_INSERT [dbo].[Document] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [Surname], [Patronimic], [PhoneNumber], [ContractNumber], [IdPost], [PhotoPath]) VALUES (1, N'Илья', N'Николаев', N'Александрович', N'+79878837434', N'12', 1, N'Архив\иконки\Admin.jpeg')
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [Patronimic], [PhoneNumber], [ContractNumber], [IdPost], [PhotoPath]) VALUES (2, N'Владимир', N'Лекасов', N'Викторович', N'+79878787323', N'11', 3, N'Архив\иконки\Cass.png')
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [Patronimic], [PhoneNumber], [ContractNumber], [IdPost], [PhotoPath]) VALUES (3, N'Вася', N'Лаков', N'Павлович', N'+79876432343', N'13', 1, N'Архив\иконки\Manager.jpg')
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [Patronimic], [PhoneNumber], [ContractNumber], [IdPost], [PhotoPath]) VALUES (4, N'Андрей', N'Петров', N'Петрович', N'+79874563423', N'14', 3, N'Архив\иконки\Manager.jpg')
INSERT [dbo].[Employee] ([Id], [Name], [Surname], [Patronimic], [PhoneNumber], [ContractNumber], [IdPost], [PhotoPath]) VALUES (5, N'Витя', N'Лоскутов', N'Ломбертович', N'+79878989769', N'1', 2, N'Архив\иконки\Manager.jpg')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Floor] ON 

INSERT [dbo].[Floor] ([Id], [FloorValue]) VALUES (1, 1)
INSERT [dbo].[Floor] ([Id], [FloorValue]) VALUES (2, 2)
INSERT [dbo].[Floor] ([Id], [FloorValue]) VALUES (3, 3)
SET IDENTITY_INSERT [dbo].[Floor] OFF
GO
SET IDENTITY_INSERT [dbo].[FormOfPayment] ON 

INSERT [dbo].[FormOfPayment] ([Id], [Title]) VALUES (1, N'Процент от выручки')
INSERT [dbo].[FormOfPayment] ([Id], [Title]) VALUES (2, N'Тыс. рублей за кв.метр')
INSERT [dbo].[FormOfPayment] ([Id], [Title]) VALUES (3, N'Тыс. рублей за месяц')
SET IDENTITY_INSERT [dbo].[FormOfPayment] OFF
GO
SET IDENTITY_INSERT [dbo].[Materials] ON 

INSERT [dbo].[Materials] ([Id], [Title], [IdType], [Weight], [Fragility], [Sizes], [CountMat]) VALUES (1, N'Синяя маслянная краска', 1, 2000, 0, N'30-30-30', 9)
INSERT [dbo].[Materials] ([Id], [Title], [IdType], [Weight], [Fragility], [Sizes], [CountMat]) VALUES (2, N'Цемент', 2, 50000, 0, N'100-100-100', 8)
INSERT [dbo].[Materials] ([Id], [Title], [IdType], [Weight], [Fragility], [Sizes], [CountMat]) VALUES (3, N'Шторы', 3, 2000, 0, N'30-50-5', 12)
INSERT [dbo].[Materials] ([Id], [Title], [IdType], [Weight], [Fragility], [Sizes], [CountMat]) VALUES (4, N'Стол приемочный', 4, 100000, 0, N'300-100-120', 2)
INSERT [dbo].[Materials] ([Id], [Title], [IdType], [Weight], [Fragility], [Sizes], [CountMat]) VALUES (5, N'Лампочки', 5, 30000, 1, N'10-5-5', 25)
INSERT [dbo].[Materials] ([Id], [Title], [IdType], [Weight], [Fragility], [Sizes], [CountMat]) VALUES (7, N'Красная', 1, 2000, 0, N'30-30-30', 25)
INSERT [dbo].[Materials] ([Id], [Title], [IdType], [Weight], [Fragility], [Sizes], [CountMat]) VALUES (8, N'Черная краска', 1, 2000, 0, N'30:30:30', 10)
INSERT [dbo].[Materials] ([Id], [Title], [IdType], [Weight], [Fragility], [Sizes], [CountMat]) VALUES (9, N'Краска синяя', 1, 2000, 0, N'30:30:30', 20)
SET IDENTITY_INSERT [dbo].[Materials] OFF
GO
INSERT [dbo].[Message] ([IdSender], [IdRecipient], [ContentMessage]) VALUES (1, 2, N'Добавлена заявка на закупку с товаром')
INSERT [dbo].[Message] ([IdSender], [IdRecipient], [ContentMessage]) VALUES (2, 1, N'Создана заявка на материал')
INSERT [dbo].[Message] ([IdSender], [IdRecipient], [ContentMessage]) VALUES (1, 5, N'Создан отчет на проверку!')
INSERT [dbo].[Message] ([IdSender], [IdRecipient], [ContentMessage]) VALUES (1, 2, N'Создана заявка на материал')
INSERT [dbo].[Message] ([IdSender], [IdRecipient], [ContentMessage]) VALUES (2, 5, N'Создан отчет на проверку!')
GO
SET IDENTITY_INSERT [dbo].[ObjectRent] ON 

INSERT [dbo].[ObjectRent] ([Id], [IdAppointment], [IdControl], [Square], [PriceForOneMeter], [IdFloor], [IdStatement], [Del]) VALUES (2, 1, 3, 15, CAST(500 AS Decimal(9, 0)), 1, 4, 1)
INSERT [dbo].[ObjectRent] ([Id], [IdAppointment], [IdControl], [Square], [PriceForOneMeter], [IdFloor], [IdStatement], [Del]) VALUES (4, 6, 2, 100, CAST(1100 AS Decimal(9, 0)), 1, 1, 1)
INSERT [dbo].[ObjectRent] ([Id], [IdAppointment], [IdControl], [Square], [PriceForOneMeter], [IdFloor], [IdStatement], [Del]) VALUES (6, 2, 1, 40, CAST(600 AS Decimal(9, 0)), 1, 4, 0)
INSERT [dbo].[ObjectRent] ([Id], [IdAppointment], [IdControl], [Square], [PriceForOneMeter], [IdFloor], [IdStatement], [Del]) VALUES (7, 1, 4, 17, CAST(1000 AS Decimal(9, 0)), 1, 4, 0)
SET IDENTITY_INSERT [dbo].[ObjectRent] OFF
GO
SET IDENTITY_INSERT [dbo].[PhotoOR] ON 

INSERT [dbo].[PhotoOR] ([Id], [IdObject], [Path]) VALUES (2, 2, N'Архив\Помещения\2.jpg')
INSERT [dbo].[PhotoOR] ([Id], [IdObject], [Path]) VALUES (5, 2, N'Архив\Помещения\3.jpg')
INSERT [dbo].[PhotoOR] ([Id], [IdObject], [Path]) VALUES (6, 2, N'Архив\Помещения\4.jpg')
INSERT [dbo].[PhotoOR] ([Id], [IdObject], [Path]) VALUES (12, 4, N'Архив\Помещения\7.jpg')
INSERT [dbo].[PhotoOR] ([Id], [IdObject], [Path]) VALUES (13, 4, N'Архив\Помещения\9.jpg')
INSERT [dbo].[PhotoOR] ([Id], [IdObject], [Path]) VALUES (14, 4, N'Архив\Помещения\10.jpg')
INSERT [dbo].[PhotoOR] ([Id], [IdObject], [Path]) VALUES (15, 6, N'Архив\Помещения\11.jpg')
INSERT [dbo].[PhotoOR] ([Id], [IdObject], [Path]) VALUES (17, 6, N'Архив\Помещения\12.jpg')
INSERT [dbo].[PhotoOR] ([Id], [IdObject], [Path]) VALUES (18, 6, N'Архив\Помещения\13.jpg')
INSERT [dbo].[PhotoOR] ([Id], [IdObject], [Path]) VALUES (21, 7, N'Архив\Помещения\14.jpg')
INSERT [dbo].[PhotoOR] ([Id], [IdObject], [Path]) VALUES (23, 7, N'Архив\Помещения\15.jpg')
INSERT [dbo].[PhotoOR] ([Id], [IdObject], [Path]) VALUES (24, 7, N'Архив\Помещения\17.jpg')
INSERT [dbo].[PhotoOR] ([Id], [IdObject], [Path]) VALUES (25, 7, N'Архив\Помещения\166.jpg')
SET IDENTITY_INSERT [dbo].[PhotoOR] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([Id], [Title]) VALUES (1, N'Менеджер')
INSERT [dbo].[Post] ([Id], [Title]) VALUES (2, N'Директор')
INSERT [dbo].[Post] ([Id], [Title]) VALUES (3, N'Сотрудник call-центра')
INSERT [dbo].[Post] ([Id], [Title]) VALUES (4, N'Кладовщик')
INSERT [dbo].[Post] ([Id], [Title]) VALUES (5, N'Менеджер по закупкам')
INSERT [dbo].[Post] ([Id], [Title]) VALUES (6, N'Бухгалтер')
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Rent] ON 

INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (17, 1, 13, 4, 1, N'йцкмйц', CAST(123412.000 AS Decimal(9, 3)), CAST(12342.000 AS Decimal(9, 3)), CAST(N'2023-12-21' AS Date), CAST(N'2025-12-21' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (18, 2, 17, 6, 2, N'цукпцумк', CAST(120023.000 AS Decimal(9, 3)), CAST(120023.000 AS Decimal(9, 3)), CAST(N'2012-11-22' AS Date), CAST(N'2019-11-22' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (23, 1, 9, 7, 1, N'qwefqwf', CAST(12343.000 AS Decimal(9, 3)), CAST(12342.000 AS Decimal(9, 3)), CAST(N'2022-12-12' AS Date), CAST(N'2023-12-12' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (48, 2, 13, 7, 1, N'qwrvwerv', CAST(10000.000 AS Decimal(9, 3)), CAST(12000.000 AS Decimal(9, 3)), CAST(N'2012-12-12' AS Date), CAST(N'2012-12-12' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (49, 2, 9, 7, 1, N'qqrwvqw', CAST(10000.000 AS Decimal(9, 3)), CAST(12000.000 AS Decimal(9, 3)), CAST(N'2012-12-12' AS Date), CAST(N'2012-12-12' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (50, 2, 13, 4, 1, N'evevt', CAST(1000.000 AS Decimal(9, 3)), CAST(1200.000 AS Decimal(9, 3)), CAST(N'2012-12-12' AS Date), CAST(N'2013-12-12' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (51, 5, 9, 6, 1, N'ООО ПСК РИТМ', CAST(24000.000 AS Decimal(9, 3)), CAST(28800.000 AS Decimal(9, 3)), CAST(N'2023-04-03' AS Date), CAST(N'2023-04-22' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (52, 5, 9, 7, 2, N'ООО ПСК РИТМ', CAST(8500.000 AS Decimal(9, 3)), CAST(10200.000 AS Decimal(9, 3)), CAST(N'2023-04-22' AS Date), CAST(N'2023-04-30' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (53, 5, 9, 7, 2, N'ООО ПСК РИТМ', CAST(8500.000 AS Decimal(9, 3)), CAST(10200.000 AS Decimal(9, 3)), CAST(N'2023-04-04' AS Date), CAST(N'2023-04-29' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (54, 5, 9, 7, 2, N'ООО ПСК РИТМ', CAST(8500.000 AS Decimal(9, 3)), CAST(10200.000 AS Decimal(9, 3)), CAST(N'2023-04-13' AS Date), CAST(N'2023-04-16' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (55, 5, 9, 7, 2, N'ООО ПСК РИТМ', CAST(8500.000 AS Decimal(9, 3)), CAST(10200.000 AS Decimal(9, 3)), CAST(N'2023-04-03' AS Date), CAST(N'2023-04-23' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (56, 5, 13, 6, 3, N'ООО ПСК РИТМ', CAST(24000.000 AS Decimal(9, 3)), CAST(28800.000 AS Decimal(9, 3)), CAST(N'2023-04-03' AS Date), CAST(N'2024-04-03' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (57, 5, 9, 7, 2, N'ООО ПСК РИТМ', CAST(8500.000 AS Decimal(9, 3)), CAST(10200.000 AS Decimal(9, 3)), CAST(N'2023-04-12' AS Date), CAST(N'2023-04-30' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (58, 5, 9, 7, 1, N'ООО ПСК РИТМ', CAST(8500.000 AS Decimal(9, 3)), CAST(10200.000 AS Decimal(9, 3)), CAST(N'2023-04-11' AS Date), CAST(N'2023-04-30' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (59, 5, 9, 7, 1, N'ООО ПСК РИТМ', CAST(8500.000 AS Decimal(9, 3)), CAST(10200.000 AS Decimal(9, 3)), CAST(N'2023-04-11' AS Date), CAST(N'2023-04-30' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (60, 5, 9, 7, 2, N'ООО ПСК РИТМ', CAST(8500.000 AS Decimal(9, 3)), CAST(10200.000 AS Decimal(9, 3)), CAST(N'2023-03-27' AS Date), CAST(N'2023-04-30' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (61, 5, 9, 7, 2, N'ООО ПСК РИТМ', CAST(8500.000 AS Decimal(9, 3)), CAST(10200.000 AS Decimal(9, 3)), CAST(N'2023-04-04' AS Date), CAST(N'2023-04-30' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (62, 5, 9, 7, 3, N'ООО ПСК РИТМ', CAST(8500.000 AS Decimal(9, 3)), CAST(10200.000 AS Decimal(9, 3)), CAST(N'2023-04-05' AS Date), CAST(N'2023-04-30' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (63, 5, 9, 7, 2, N'ООО ПСК РИТМ', CAST(8500.000 AS Decimal(9, 3)), CAST(10200.000 AS Decimal(9, 3)), CAST(N'2023-04-11' AS Date), CAST(N'2023-05-07' AS Date))
INSERT [dbo].[Rent] ([Id], [IdEmployee], [IdClient], [IdObjectRent], [IdTypeOfPayment], [OwnerOfObjectRent], [Deposit], [Bet], [DateStart], [DateEnd]) VALUES (64, 5, 9, 7, 2, N'ООО ПСК РИТМ', CAST(8500.000 AS Decimal(9, 3)), CAST(10200.000 AS Decimal(9, 3)), CAST(N'2023-03-31' AS Date), CAST(N'2023-05-01' AS Date))
SET IDENTITY_INSERT [dbo].[Rent] OFF
GO
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([Id], [IdEmployee], [IdTypeReport], [DateCreated], [TimeCreated], [PathToReport]) VALUES (1, 1, 1, CAST(N'2012-12-12' AS Date), CAST(N'12:00:00' AS Time), N'цкмцкум')
INSERT [dbo].[Report] ([Id], [IdEmployee], [IdTypeReport], [DateCreated], [TimeCreated], [PathToReport]) VALUES (2, 2, 2, CAST(N'2023-01-12' AS Date), CAST(N'16:00:00' AS Time), N'укмукм')
SET IDENTITY_INSERT [dbo].[Report] OFF
GO
SET IDENTITY_INSERT [dbo].[Statement] ON 

INSERT [dbo].[Statement] ([Id], [Title]) VALUES (1, N'Сдается')
INSERT [dbo].[Statement] ([Id], [Title]) VALUES (2, N'В ремонте')
INSERT [dbo].[Statement] ([Id], [Title]) VALUES (3, N'Непригодно для сдачи')
INSERT [dbo].[Statement] ([Id], [Title]) VALUES (4, N'Готово к сдаче')
SET IDENTITY_INSERT [dbo].[Statement] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([Id], [Surname], [Name], [Patronimic], [CompanyName], [Country], [City], [Street], [House], [PhoneNumber], [Mail]) VALUES (1, N'Васильков', N'Вася', N'Викторович', N'Василек', N'Россия', N'Калининград', N'ПетраВеликого', N'23', N'+78988927924', N'Vasiliy@mail.ru')
INSERT [dbo].[Supplier] ([Id], [Surname], [Name], [Patronimic], [CompanyName], [Country], [City], [Street], [House], [PhoneNumber], [Mail]) VALUES (3, N'Громов', N'Роман', N'Евгеньевич', N'Ромашка', N'Россия', N'Москва', N'ул.Летняя', N'44', N'+79878998732', N'Dogo@mail.ru')
INSERT [dbo].[Supplier] ([Id], [Surname], [Name], [Patronimic], [CompanyName], [Country], [City], [Street], [House], [PhoneNumber], [Mail]) VALUES (4, N'Хромов', N'Георгий', N'Витальевич', N'Петушок', N'Россия', N'Санкт-Петербург', N'ул.Регулярная', N'34', N'+79879879087', N'ScobyDoo@mail.ru')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[Supply] ON 

INSERT [dbo].[Supply] ([Id], [IdSuppler], [IdApplicationOnReciption], [Formed], [PathToDocument]) VALUES (2, 1, 11, 1, N'efwefrw')
INSERT [dbo].[Supply] ([Id], [IdSuppler], [IdApplicationOnReciption], [Formed], [PathToDocument]) VALUES (5, 3, 12, 0, N'qrfweef')
INSERT [dbo].[Supply] ([Id], [IdSuppler], [IdApplicationOnReciption], [Formed], [PathToDocument]) VALUES (6, 4, 13, 1, N'wervwer')
SET IDENTITY_INSERT [dbo].[Supply] OFF
GO
INSERT [dbo].[SupplyMaterial] ([IdSupply], [IdMaterial], [PriceDilivery], [Price], [Count]) VALUES (2, 1, CAST(1500.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[SupplyMaterial] ([IdSupply], [IdMaterial], [PriceDilivery], [Price], [Count]) VALUES (5, 2, CAST(1200.00 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[SupplyMaterial] ([IdSupply], [IdMaterial], [PriceDilivery], [Price], [Count]) VALUES (6, 3, CAST(2000.00 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), 15)
INSERT [dbo].[SupplyMaterial] ([IdSupply], [IdMaterial], [PriceDilivery], [Price], [Count]) VALUES (2, 1, CAST(1200.00 AS Decimal(18, 2)), CAST(400.00 AS Decimal(18, 2)), 5)
GO
SET IDENTITY_INSERT [dbo].[TypeOfDocument] ON 

INSERT [dbo].[TypeOfDocument] ([Id], [Title]) VALUES (1, N'Договор')
INSERT [dbo].[TypeOfDocument] ([Id], [Title]) VALUES (2, N'Допсоглашение')
INSERT [dbo].[TypeOfDocument] ([Id], [Title]) VALUES (3, N'Соглашение на расторжение договора')
SET IDENTITY_INSERT [dbo].[TypeOfDocument] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfMaterial] ON 

INSERT [dbo].[TypeOfMaterial] ([Id], [Title]) VALUES (1, N'Краска')
INSERT [dbo].[TypeOfMaterial] ([Id], [Title]) VALUES (2, N'Стройматериал')
INSERT [dbo].[TypeOfMaterial] ([Id], [Title]) VALUES (3, N'Ткань')
INSERT [dbo].[TypeOfMaterial] ([Id], [Title]) VALUES (4, N'Мебель')
INSERT [dbo].[TypeOfMaterial] ([Id], [Title]) VALUES (5, N'Электрика')
SET IDENTITY_INSERT [dbo].[TypeOfMaterial] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfReport] ON 

INSERT [dbo].[TypeOfReport] ([Id], [Title]) VALUES (1, N'Экономическая эффективность торгового помещения')
INSERT [dbo].[TypeOfReport] ([Id], [Title]) VALUES (2, N'Прибыль и затраты фирмы')
SET IDENTITY_INSERT [dbo].[TypeOfReport] OFF
GO
INSERT [dbo].[User] ([Id], [Login], [Password]) VALUES (1, N'111', N'111')
INSERT [dbo].[User] ([Id], [Login], [Password]) VALUES (2, N'222', N'222')
INSERT [dbo].[User] ([Id], [Login], [Password]) VALUES (3, N'333', N'333')
INSERT [dbo].[User] ([Id], [Login], [Password]) VALUES (4, N'444', N'444')
INSERT [dbo].[User] ([Id], [Login], [Password]) VALUES (5, N'555', N'555')
GO
ALTER TABLE [dbo].[Application_Material]  WITH CHECK ADD  CONSTRAINT [FK_Application_Material_ApplicationToReception] FOREIGN KEY([IdApplication])
REFERENCES [dbo].[ApplicationToReception] ([Id])
GO
ALTER TABLE [dbo].[Application_Material] CHECK CONSTRAINT [FK_Application_Material_ApplicationToReception]
GO
ALTER TABLE [dbo].[Application_Material]  WITH CHECK ADD  CONSTRAINT [FK_Application_Material_Materials] FOREIGN KEY([IdMaterial])
REFERENCES [dbo].[Materials] ([Id])
GO
ALTER TABLE [dbo].[Application_Material] CHECK CONSTRAINT [FK_Application_Material_Materials]
GO
ALTER TABLE [dbo].[ApplicationToReception]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationToReception_Employee] FOREIGN KEY([IdCreator])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[ApplicationToReception] CHECK CONSTRAINT [FK_ApplicationToReception_Employee]
GO
ALTER TABLE [dbo].[ApplicationToReception]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationToReception_Employee1] FOREIGN KEY([IdRecipient])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[ApplicationToReception] CHECK CONSTRAINT [FK_ApplicationToReception_Employee1]
GO
ALTER TABLE [dbo].[DecommissionedMaterial]  WITH CHECK ADD  CONSTRAINT [FK_DecommissionedMaterial_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DecommissionedMaterial] CHECK CONSTRAINT [FK_DecommissionedMaterial_Employee]
GO
ALTER TABLE [dbo].[DecommissionedMaterial]  WITH CHECK ADD  CONSTRAINT [FK_DecommissionedMaterial_Materials] FOREIGN KEY([IdMaterial])
REFERENCES [dbo].[Materials] ([Id])
GO
ALTER TABLE [dbo].[DecommissionedMaterial] CHECK CONSTRAINT [FK_DecommissionedMaterial_Materials]
GO
ALTER TABLE [dbo].[Demonstration]  WITH CHECK ADD  CONSTRAINT [FK_Demonstration_Client] FOREIGN KEY([IdClient])
REFERENCES [dbo].[Client] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Demonstration] CHECK CONSTRAINT [FK_Demonstration_Client]
GO
ALTER TABLE [dbo].[Demonstration]  WITH CHECK ADD  CONSTRAINT [FK_Demonstration_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Demonstration] CHECK CONSTRAINT [FK_Demonstration_Employee]
GO
ALTER TABLE [dbo].[Demonstration]  WITH CHECK ADD  CONSTRAINT [FK_Demonstration_ObjectRent] FOREIGN KEY([IdObjectRent])
REFERENCES [dbo].[ObjectRent] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Demonstration] CHECK CONSTRAINT [FK_Demonstration_ObjectRent]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Rent] FOREIGN KEY([IdRent])
REFERENCES [dbo].[Rent] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Rent]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_TypeOfDocument] FOREIGN KEY([IdTypeOfDocument])
REFERENCES [dbo].[TypeOfDocument] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_TypeOfDocument]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Post] FOREIGN KEY([IdPost])
REFERENCES [dbo].[Post] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Post]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_TypeOfMaterial] FOREIGN KEY([IdType])
REFERENCES [dbo].[TypeOfMaterial] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_TypeOfMaterial]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Employee] FOREIGN KEY([IdSender])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Employee]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_Employee1] FOREIGN KEY([IdRecipient])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_Employee1]
GO
ALTER TABLE [dbo].[ObjectRent]  WITH CHECK ADD  CONSTRAINT [FK_ObjectRent_Appointment] FOREIGN KEY([IdAppointment])
REFERENCES [dbo].[Appointment] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObjectRent] CHECK CONSTRAINT [FK_ObjectRent_Appointment]
GO
ALTER TABLE [dbo].[ObjectRent]  WITH CHECK ADD  CONSTRAINT [FK_ObjectRent_Control] FOREIGN KEY([IdControl])
REFERENCES [dbo].[Control] ([Id])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ObjectRent] CHECK CONSTRAINT [FK_ObjectRent_Control]
GO
ALTER TABLE [dbo].[ObjectRent]  WITH CHECK ADD  CONSTRAINT [FK_ObjectRent_Floor] FOREIGN KEY([IdFloor])
REFERENCES [dbo].[Floor] ([Id])
GO
ALTER TABLE [dbo].[ObjectRent] CHECK CONSTRAINT [FK_ObjectRent_Floor]
GO
ALTER TABLE [dbo].[ObjectRent]  WITH CHECK ADD  CONSTRAINT [FK_ObjectRent_Statement] FOREIGN KEY([IdStatement])
REFERENCES [dbo].[Statement] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ObjectRent] CHECK CONSTRAINT [FK_ObjectRent_Statement]
GO
ALTER TABLE [dbo].[PhotoOR]  WITH CHECK ADD  CONSTRAINT [FK_PhotoOR_ObjectRent] FOREIGN KEY([IdObject])
REFERENCES [dbo].[ObjectRent] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhotoOR] CHECK CONSTRAINT [FK_PhotoOR_ObjectRent]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Client] FOREIGN KEY([IdClient])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_Client]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_Employee]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_FormOfPayment] FOREIGN KEY([IdTypeOfPayment])
REFERENCES [dbo].[FormOfPayment] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_FormOfPayment]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FK_Rent_ObjectRent] FOREIGN KEY([IdObjectRent])
REFERENCES [dbo].[ObjectRent] ([Id])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FK_Rent_ObjectRent]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_Employee]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_TypeOfReport] FOREIGN KEY([IdTypeReport])
REFERENCES [dbo].[TypeOfReport] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_TypeOfReport]
GO
ALTER TABLE [dbo].[SentMaterials]  WITH CHECK ADD  CONSTRAINT [FK_SentMaterials_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SentMaterials] CHECK CONSTRAINT [FK_SentMaterials_Employee]
GO
ALTER TABLE [dbo].[SentMaterials]  WITH CHECK ADD  CONSTRAINT [FK_SentMaterials_Materials] FOREIGN KEY([IdMaterial])
REFERENCES [dbo].[Materials] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SentMaterials] CHECK CONSTRAINT [FK_SentMaterials_Materials]
GO
ALTER TABLE [dbo].[SentMaterials]  WITH CHECK ADD  CONSTRAINT [FK_SentMaterials_ObjectRent] FOREIGN KEY([IdObjectRent])
REFERENCES [dbo].[ObjectRent] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SentMaterials] CHECK CONSTRAINT [FK_SentMaterials_ObjectRent]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_Supply_ApplicationToReception] FOREIGN KEY([IdApplicationOnReciption])
REFERENCES [dbo].[ApplicationToReception] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_Supply_ApplicationToReception]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_Supply_Supplier] FOREIGN KEY([IdSuppler])
REFERENCES [dbo].[Supplier] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_Supply_Supplier]
GO
ALTER TABLE [dbo].[SupplyMaterial]  WITH CHECK ADD  CONSTRAINT [FK_SupplyMaterial_Materials] FOREIGN KEY([IdMaterial])
REFERENCES [dbo].[Materials] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SupplyMaterial] CHECK CONSTRAINT [FK_SupplyMaterial_Materials]
GO
ALTER TABLE [dbo].[SupplyMaterial]  WITH CHECK ADD  CONSTRAINT [FK_SupplyMaterial_Supply] FOREIGN KEY([IdSupply])
REFERENCES [dbo].[Supply] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SupplyMaterial] CHECK CONSTRAINT [FK_SupplyMaterial_Supply]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Employee1] FOREIGN KEY([Id])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Employee1]
GO
/****** Object:  StoredProcedure [dbo].[Add_Material_For_PalanColor]    Script Date: 28.04.2023 2:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Add_Material_For_PalanColor] 
	@name NVARCHAR(20),
	@IdType INT,
	@Weight FLOAT,
	@Fragility BIT,
	@Sizes TEXT,
	@CountMat INT
AS
INSERT INTO Materials(Title, IdType, Weight, Fragility, Sizes, CountMat)
VALUES(@name, @IdType, @Weight, @Fragility, @Sizes, @CountMat)
GO
/****** Object:  StoredProcedure [dbo].[GetPriceStats]    Script Date: 28.04.2023 2:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPriceStats]
    @minSquare MONEY OUTPUT,
    @maxSquare MONEY OUTPUT
AS
SELECT @minSquare = MIN(Square),  @maxSquare = MAX(Square)
FROM ObjectRent
GO
/****** Object:  StoredProcedure [dbo].[GetPriceStatsForOneMetter]    Script Date: 28.04.2023 2:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPriceStatsForOneMetter]
    @minPrice MONEY OUTPUT,
    @maxPrice MONEY OUTPUT

AS
SELECT @minPrice = MIN(PriceForOneMeter),  @maxPrice = MAX(PriceForOneMeter)
FROM ObjectRent
GO
/****** Object:  StoredProcedure [dbo].[GetTitleMaterial]    Script Date: 28.04.2023 2:38:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTitleMaterial] AS

SELECT Materials.Title, CountMat FROM Materials WHERE CountMat < 10 AND IdType = 1
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[18] 4[25] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ObjectRent"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Rent"
            Begin Extent = 
               Top = 6
               Left = 261
               Bottom = 136
               Right = 457
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 495
               Bottom = 136
               Right = 674
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Client"
            Begin Extent = 
               Top = 6
               Left = 712
               Bottom = 136
               Right = 1073
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Appointment"
            Begin Extent = 
               Top = 6
               Left = 1111
               Bottom = 102
               Right = 1285
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 2220
         Width = 2145
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'First'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'     Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'First'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'First'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Report"
            Begin Extent = 
               Top = 212
               Left = 240
               Bottom = 342
               Right = 414
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TypeOfReport"
            Begin Extent = 
               Top = 224
               Left = 478
               Bottom = 320
               Right = 652
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 207
               Left = 0
               Bottom = 351
               Right = 179
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1950
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Five'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Five'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[51] 4[16] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -480
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Statement"
            Begin Extent = 
               Top = 823
               Left = 292
               Bottom = 919
               Right = 466
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Appointment"
            Begin Extent = 
               Top = 691
               Left = 275
               Bottom = 787
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ObjectRent"
            Begin Extent = 
               Top = 692
               Left = 31
               Bottom = 924
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 17
         Width = 284
         Width = 1500
         Width = 2820
         Width = 1500
         Width = 1500
         Width = 1830
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [ArendatorTOP] SET  READ_WRITE 
GO
