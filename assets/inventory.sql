USE [master]
GO
/****** Object:  Database [InventoryDB]    Script Date: 5/23/2015 1:19:56 PM ******/
CREATE DATABASE [InventoryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InventoryDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\InventoryDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'InventoryDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\InventoryDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [InventoryDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InventoryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InventoryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InventoryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InventoryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InventoryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InventoryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [InventoryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InventoryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InventoryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InventoryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InventoryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InventoryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InventoryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InventoryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InventoryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InventoryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [InventoryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InventoryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InventoryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InventoryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InventoryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InventoryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InventoryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InventoryDB] SET RECOVERY FULL 
GO
ALTER DATABASE [InventoryDB] SET  MULTI_USER 
GO
ALTER DATABASE [InventoryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InventoryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InventoryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InventoryDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [InventoryDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'InventoryDB', N'ON'
GO
USE [InventoryDB]
GO
/****** Object:  Table [dbo].[tblComputer]    Script Date: 5/23/2015 1:19:56 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComputer](
	[ID] [uniqueidentifier] NOT NULL,
	[ManufacturerID] [uniqueidentifier] NOT NULL,
	[EmployeeID] [uniqueidentifier] NOT NULL,
	[SerialNumber] [nvarchar](7) NOT NULL,
	[Processor] [nvarchar](50) NOT NULL,
	[RAM] [nvarchar](50) NOT NULL,
	[HardDrive] [nvarchar](50) NOT NULL,
	[OperatingSystem] [nvarchar](50) NOT NULL,
	[TypeID] [uniqueidentifier] NOT NULL,
	[LocationID] [uniqueidentifier] NULL,
 CONSTRAINT [PrimaryKey_7fa4cf7c-e306-48d2-8b65-8657480fb780] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblComputerType]    Script Date: 5/23/2015 1:19:56 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblComputerType](
	[ID] [uniqueidentifier] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
 CONSTRAINT [PrimaryKey_34dc9ff5-c689-496b-83b6-c79eee61e797] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDepartment]    Script Date: 5/23/2015 1:19:56 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartment](
	[ID] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[LocationID] [uniqueidentifier] NULL,
 CONSTRAINT [PrimaryKey_1a823bb9-be3f-4e1b-9323-91a30a979945] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 5/23/2015 1:19:56 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[ID] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DepartmentID] [uniqueidentifier] NULL,
 CONSTRAINT [PrimaryKey_502383af-8015-4ed8-a3b6-691140757739] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLocation]    Script Date: 5/23/2015 1:19:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblLocation](
	[ID] [uniqueidentifier] NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[State] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblManufacturer]    Script Date: 5/23/2015 1:19:56 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblManufacturer](
	[ID] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
 CONSTRAINT [PrimaryKey_32fdfa55-53fa-4dcf-a841-349a2cef3762] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMonitor]    Script Date: 5/23/2015 1:19:56 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMonitor](
	[ID] [uniqueidentifier] NOT NULL,
	[ManufacturerID] [uniqueidentifier] NOT NULL,
	[EmployeeID] [uniqueidentifier] NOT NULL,
	[SerialNumber] [nvarchar](7) NOT NULL,
	[LocationID] [uniqueidentifier] NULL,
 CONSTRAINT [PrimaryKey_6e524b19-5b98-4b87-8fce-ffb4422dbb08] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPrinter]    Script Date: 5/23/2015 1:19:56 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPrinter](
	[ID] [uniqueidentifier] NOT NULL,
	[ManufacturerID] [uniqueidentifier] NOT NULL,
	[SerialNumber] [nvarchar](7) NOT NULL,
	[LocationID] [uniqueidentifier] NULL,
 CONSTRAINT [PrimaryKey_ddb02999-e9b0-45e3-94fb-35285193da21] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tblComputer]  WITH CHECK ADD FOREIGN KEY([LocationID])
REFERENCES [dbo].[tblLocation] ([ID])
GO
ALTER TABLE [dbo].[tblComputer]  WITH CHECK ADD  CONSTRAINT [FK_tblComputer_tblComputerType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[tblComputerType] ([ID])
GO
ALTER TABLE [dbo].[tblComputer] CHECK CONSTRAINT [FK_tblComputer_tblComputerType]
GO
ALTER TABLE [dbo].[tblComputer]  WITH CHECK ADD  CONSTRAINT [FK_tblComputer_tblEmployee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[tblEmployee] ([ID])
GO
ALTER TABLE [dbo].[tblComputer] CHECK CONSTRAINT [FK_tblComputer_tblEmployee]
GO
ALTER TABLE [dbo].[tblComputer]  WITH CHECK ADD  CONSTRAINT [FK_tblComputer_tblManufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[tblManufacturer] ([ID])
GO
ALTER TABLE [dbo].[tblComputer] CHECK CONSTRAINT [FK_tblComputer_tblManufacturer]
GO
ALTER TABLE [dbo].[tblDepartment]  WITH CHECK ADD FOREIGN KEY([LocationID])
REFERENCES [dbo].[tblLocation] ([ID])
GO
ALTER TABLE [dbo].[tblEmployee]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[tblDepartment] ([ID])
GO
ALTER TABLE [dbo].[tblMonitor]  WITH CHECK ADD FOREIGN KEY([LocationID])
REFERENCES [dbo].[tblLocation] ([ID])
GO
ALTER TABLE [dbo].[tblMonitor]  WITH CHECK ADD  CONSTRAINT [FK_tblMonitor_tblEmployee] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[tblEmployee] ([ID])
GO
ALTER TABLE [dbo].[tblMonitor] CHECK CONSTRAINT [FK_tblMonitor_tblEmployee]
GO
ALTER TABLE [dbo].[tblMonitor]  WITH CHECK ADD  CONSTRAINT [FK_tblMonitor_tblManufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[tblManufacturer] ([ID])
GO
ALTER TABLE [dbo].[tblMonitor] CHECK CONSTRAINT [FK_tblMonitor_tblManufacturer]
GO
ALTER TABLE [dbo].[tblPrinter]  WITH CHECK ADD FOREIGN KEY([LocationID])
REFERENCES [dbo].[tblLocation] ([ID])
GO
ALTER TABLE [dbo].[tblPrinter]  WITH CHECK ADD  CONSTRAINT [FK_tblPrinter_tblManufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[tblManufacturer] ([ID])
GO
ALTER TABLE [dbo].[tblPrinter] CHECK CONSTRAINT [FK_tblPrinter_tblManufacturer]
GO
USE [master]
GO
ALTER DATABASE [InventoryDB] SET  READ_WRITE 
GO
