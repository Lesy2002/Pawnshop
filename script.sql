USE [master]
GO
/****** Object:  Database [Pawnshop]    Script Date: 29.08.2022 18:59:54 ******/
CREATE DATABASE [Pawnshop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pawnshop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Pawnshop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Pawnshop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Pawnshop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Pawnshop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pawnshop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pawnshop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pawnshop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pawnshop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pawnshop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pawnshop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pawnshop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pawnshop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pawnshop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pawnshop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pawnshop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pawnshop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pawnshop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pawnshop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pawnshop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pawnshop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Pawnshop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pawnshop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pawnshop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pawnshop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pawnshop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pawnshop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pawnshop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pawnshop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Pawnshop] SET  MULTI_USER 
GO
ALTER DATABASE [Pawnshop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pawnshop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pawnshop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pawnshop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pawnshop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pawnshop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Pawnshop] SET QUERY_STORE = OFF
GO
USE [Pawnshop]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 29.08.2022 18:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[IdClient] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Telephone] [nvarchar](21) NULL,
	[PassportSeries] [nvarchar](10) NOT NULL,
	[PassportNumber] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[IdClient] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 29.08.2022 18:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[IdEmployee] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[IdEmployee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonthlyPaymentSchedule]    Script Date: 29.08.2022 18:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonthlyPaymentSchedule](
	[IdSchedule] [int] IDENTITY(1,1) NOT NULL,
	[Summa] [float] NOT NULL,
	[DueDate] [date] NULL,
	[ActualDueDate] [date] NULL,
	[IdEmployee] [int] NOT NULL,
	[IdStatus] [int] NOT NULL,
 CONSTRAINT [PK_MonthlyPaymentSchedule] PRIMARY KEY CLUSTERED 
(
	[IdSchedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 29.08.2022 18:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[IdProduct] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IdType] [int] NOT NULL,
	[DeliveryDate] [datetime] NULL,
	[EstimatedCost] [float] NOT NULL,
	[IdEmployee] [int] NOT NULL,
	[BailAmount] [float] NOT NULL,
	[RansomAmount] [float] NOT NULL,
	[IdClient] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[IdProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sold]    Script Date: 29.08.2022 18:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sold](
	[IdSold] [int] IDENTITY(1,1) NOT NULL,
	[DateOfSale] [date] NULL,
	[Price] [float] NOT NULL,
	[IdEmployee] [int] NOT NULL,
	[IdProduct] [int] NOT NULL,
 CONSTRAINT [PK_Sold] PRIMARY KEY CLUSTERED 
(
	[IdSold] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 29.08.2022 18:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[IdStatus] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[IdStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 29.08.2022 18:59:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[IdType] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[IdType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([IdEmployee], [LastName], [FirstName], [Patronymic], [Password], [Login]) VALUES (1, N'Мельникова', N'Валерия', NULL, N'1234', N'1234')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([IdStatus], [Title]) VALUES (1, N'Принят')
INSERT [dbo].[Status] ([IdStatus], [Title]) VALUES (2, N'Просрочен')
INSERT [dbo].[Status] ([IdStatus], [Title]) VALUES (3, N'Отменен')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
ALTER TABLE [dbo].[MonthlyPaymentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyPaymentSchedule_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([IdEmployee])
GO
ALTER TABLE [dbo].[MonthlyPaymentSchedule] CHECK CONSTRAINT [FK_MonthlyPaymentSchedule_Employee]
GO
ALTER TABLE [dbo].[MonthlyPaymentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_MonthlyPaymentSchedule_Status] FOREIGN KEY([IdStatus])
REFERENCES [dbo].[Status] ([IdStatus])
GO
ALTER TABLE [dbo].[MonthlyPaymentSchedule] CHECK CONSTRAINT [FK_MonthlyPaymentSchedule_Status]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Client] FOREIGN KEY([IdClient])
REFERENCES [dbo].[Client] ([IdClient])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Client]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([IdEmployee])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Employee]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Type] FOREIGN KEY([IdType])
REFERENCES [dbo].[Type] ([IdType])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Type]
GO
ALTER TABLE [dbo].[Sold]  WITH CHECK ADD  CONSTRAINT [FK_Sold_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([IdEmployee])
GO
ALTER TABLE [dbo].[Sold] CHECK CONSTRAINT [FK_Sold_Employee]
GO
ALTER TABLE [dbo].[Sold]  WITH CHECK ADD  CONSTRAINT [FK_Sold_Product] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[Product] ([IdProduct])
GO
ALTER TABLE [dbo].[Sold] CHECK CONSTRAINT [FK_Sold_Product]
GO
USE [master]
GO
ALTER DATABASE [Pawnshop] SET  READ_WRITE 
GO
