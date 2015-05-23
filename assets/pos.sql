USE [master]
GO
/****** Object:  Database [posSystemDB]    Script Date: 5/23/2015 1:18:45 PM ******/
CREATE DATABASE [posSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'posSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\posSystemDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'posSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\posSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [posSystemDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [posSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [posSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [posSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [posSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [posSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [posSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [posSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [posSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [posSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [posSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [posSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [posSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [posSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [posSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [posSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [posSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [posSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [posSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [posSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [posSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [posSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [posSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [posSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [posSystemDB] SET RECOVERY FULL 
GO
ALTER DATABASE [posSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [posSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [posSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [posSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [posSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [posSystemDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'posSystemDB', N'ON'
GO
USE [posSystemDB]
GO
/****** Object:  Table [dbo].[tblCardType]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCardType](
	[CardType_Id] [int] NOT NULL,
	[CardType_Type] [varchar](25) NOT NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[CardType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCreditCard]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCreditCard](
	[CardType_Id] [int] NOT NULL,
	[Person_Id] [uniqueidentifier] NOT NULL,
	[CreditCard_Id] [uniqueidentifier] NOT NULL,
	[CreditCard_Number] [int] NOT NULL,
	[CreditCard_DateIssued] [date] NOT NULL,
	[CreditCard_DateExpired] [date] NOT NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[CreditCard_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[Person_Id] [uniqueidentifier] NOT NULL,
	[MemberType_Id] [int] NOT NULL,
	[Customer_Id] [uniqueidentifier] NOT NULL,
	[Customer_DateJoined] [date] NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Customer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[Person_Id] [uniqueidentifier] NOT NULL,
	[Store_Id] [uniqueidentifier] NOT NULL,
	[Employee_Id] [uniqueidentifier] NOT NULL,
	[Employee_Username] [int] NOT NULL,
	[Employee_Password] [int] NOT NULL,
	[Employee_DateHired] [date] NOT NULL,
	[Employee_Wage] [money] NOT NULL,
	[Employee_Status] [bit] NOT NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Employee_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblLocation]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblLocation](
	[Location_Id] [int] NOT NULL,
	[Location_State] [varchar](2) NOT NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Location_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblManufacturer]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblManufacturer](
	[Manufacturer_Id] [int] NOT NULL,
	[Manufacturer_Name] [varchar](250) NOT NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Manufacturer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMemberType]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMemberType](
	[MemberType_Id] [int] NOT NULL,
	[MemberType_Desc] [varchar](25) NOT NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrder](
	[Product_Id] [uniqueidentifier] NOT NULL,
	[Employee_Id] [uniqueidentifier] NOT NULL,
	[OrderFullfillment_Id] [int] NOT NULL,
	[Order_Id] [uniqueidentifier] NOT NULL,
	[Order_Number] [int] NOT NULL,
	[Order_DateOrdered] [datetime] NOT NULL,
	[Order_DateShipped] [date] NULL,
	[Order_DateDelivered] [date] NULL,
	[Order_ShippingCost] [money] NULL,
	[Order_Details] [varchar](150) NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderFullfillment]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrderFullfillment](
	[OrderFullfillment_Id] [int] NOT NULL,
	[OrderFullfillment_Desc] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderFullfillment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrderItem]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderItem](
	[Order_Id] [uniqueidentifier] NOT NULL,
	[Product_Id] [uniqueidentifier] NOT NULL,
	[OrderItem_Id] [uniqueidentifier] NOT NULL,
	[OrderItem_Number] [int] NOT NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderItem_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPayment]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPayment](
	[Transaction_Id] [uniqueidentifier] NOT NULL,
	[Payment_Id] [uniqueidentifier] NOT NULL,
	[Payment_Amount] [money] NOT NULL,
	[Notes] [text] NULL,
	[PaymentType_Id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Payment_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPaymentType]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPaymentType](
	[PaymentType_Id] [int] NOT NULL,
	[PaymentType_Type] [varchar](25) NOT NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPerson]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPerson](
	[Person_Id] [uniqueidentifier] NOT NULL,
	[Person_Fname] [varchar](50) NOT NULL,
	[Person_Lname] [varchar](50) NOT NULL,
	[Person_DOB] [date] NULL,
	[Person_Phone] [varchar](15) NOT NULL,
	[Person_Address] [varchar](150) NOT NULL,
	[Person_Country] [varchar](50) NOT NULL,
	[Person_City] [varchar](50) NOT NULL,
	[Person_State] [varchar](2) NOT NULL,
	[Person_ZIP] [int] NOT NULL,
	[Person_SSN] [int] NULL,
	[Person_Email] [varchar](150) NULL,
	[Notes] [text] NULL,
	[Person_Age] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPersonCreditCard]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPersonCreditCard](
	[Person_Id] [uniqueidentifier] NOT NULL,
	[CreditCard_Id] [uniqueidentifier] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblProduct](
	[Manufacturer_Id] [int] NOT NULL,
	[Product_Id] [uniqueidentifier] NOT NULL,
	[Product_Model] [varchar](50) NOT NULL,
	[Product_UPC] [int] NOT NULL,
	[Product_Desc] [varchar](250) NOT NULL,
	[Product_Cost] [money] NOT NULL,
	[Product_Quantity] [int] NOT NULL,
	[Product_Status] [bit] NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblStore]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblStore](
	[Location_Id] [int] NOT NULL,
	[Store_Id] [uniqueidentifier] NOT NULL,
	[Store_Number] [int] NOT NULL,
	[Store_Phone] [varchar](15) NOT NULL,
	[Store_City] [varchar](50) NOT NULL,
	[Store_Address] [varchar](250) NOT NULL,
	[Store_ZIP] [int] NOT NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Store_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTransaction]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTransaction](
	[TransactionType_Id] [int] NOT NULL,
	[Employee_Id] [uniqueidentifier] NOT NULL,
	[Customer_Id] [uniqueidentifier] NOT NULL,
	[MemberType_Id] [int] NOT NULL,
	[Product_Id] [uniqueidentifier] NOT NULL,
	[Order_Id] [uniqueidentifier] NULL,
	[Transaction_Id] [uniqueidentifier] NOT NULL,
	[Transaction_Time] [datetime] NOT NULL,
	[Transaction_Subtotal] [money] NULL,
	[Transaction_Tax] [money] NULL,
	[Transaction_Total] [money] NOT NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[Transaction_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTransactionType]    Script Date: 5/23/2015 1:18:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTransactionType](
	[TransactionType_Id] [int] NOT NULL,
	[TransactionType_Type] [varchar](50) NOT NULL,
	[Notes] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionType_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[tblCreditCard]  WITH CHECK ADD  CONSTRAINT [fk_CardType] FOREIGN KEY([CardType_Id])
REFERENCES [dbo].[tblCardType] ([CardType_Id])
GO
ALTER TABLE [dbo].[tblCreditCard] CHECK CONSTRAINT [fk_CardType]
GO
ALTER TABLE [dbo].[tblCreditCard]  WITH CHECK ADD  CONSTRAINT [fk_PersonCard] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[tblPerson] ([Person_Id])
GO
ALTER TABLE [dbo].[tblCreditCard] CHECK CONSTRAINT [fk_PersonCard]
GO
ALTER TABLE [dbo].[tblCustomer]  WITH CHECK ADD  CONSTRAINT [fk_MemberCustomer] FOREIGN KEY([MemberType_Id])
REFERENCES [dbo].[tblMemberType] ([MemberType_Id])
GO
ALTER TABLE [dbo].[tblCustomer] CHECK CONSTRAINT [fk_MemberCustomer]
GO
ALTER TABLE [dbo].[tblCustomer]  WITH CHECK ADD  CONSTRAINT [fk_PersonCustomer] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[tblPerson] ([Person_Id])
GO
ALTER TABLE [dbo].[tblCustomer] CHECK CONSTRAINT [fk_PersonCustomer]
GO
ALTER TABLE [dbo].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [fk_PersonEmployee] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[tblPerson] ([Person_Id])
GO
ALTER TABLE [dbo].[tblEmployee] CHECK CONSTRAINT [fk_PersonEmployee]
GO
ALTER TABLE [dbo].[tblEmployee]  WITH CHECK ADD  CONSTRAINT [fk_StoreEmployee] FOREIGN KEY([Store_Id])
REFERENCES [dbo].[tblStore] ([Store_Id])
GO
ALTER TABLE [dbo].[tblEmployee] CHECK CONSTRAINT [fk_StoreEmployee]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeOrder] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[tblEmployee] ([Employee_Id])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [fk_EmployeeOrder]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [fk_OrderFullfillment] FOREIGN KEY([OrderFullfillment_Id])
REFERENCES [dbo].[tblOrderFullfillment] ([OrderFullfillment_Id])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [fk_OrderFullfillment]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [fk_ProductOrder] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[tblProduct] ([Product_Id])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [fk_ProductOrder]
GO
ALTER TABLE [dbo].[tblOrderItem]  WITH CHECK ADD  CONSTRAINT [fk_OrderItem] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[tblOrder] ([Order_Id])
GO
ALTER TABLE [dbo].[tblOrderItem] CHECK CONSTRAINT [fk_OrderItem]
GO
ALTER TABLE [dbo].[tblOrderItem]  WITH CHECK ADD  CONSTRAINT [fk_ProductOrderItem] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[tblProduct] ([Product_Id])
GO
ALTER TABLE [dbo].[tblOrderItem] CHECK CONSTRAINT [fk_ProductOrderItem]
GO
ALTER TABLE [dbo].[tblPayment]  WITH CHECK ADD FOREIGN KEY([PaymentType_Id])
REFERENCES [dbo].[tblPaymentType] ([PaymentType_Id])
GO
ALTER TABLE [dbo].[tblPayment]  WITH CHECK ADD  CONSTRAINT [fk_TransactionPayment] FOREIGN KEY([Transaction_Id])
REFERENCES [dbo].[tblTransaction] ([Transaction_Id])
GO
ALTER TABLE [dbo].[tblPayment] CHECK CONSTRAINT [fk_TransactionPayment]
GO
ALTER TABLE [dbo].[tblPersonCreditCard]  WITH CHECK ADD  CONSTRAINT [fk_CreditCard] FOREIGN KEY([CreditCard_Id])
REFERENCES [dbo].[tblCreditCard] ([CreditCard_Id])
GO
ALTER TABLE [dbo].[tblPersonCreditCard] CHECK CONSTRAINT [fk_CreditCard]
GO
ALTER TABLE [dbo].[tblPersonCreditCard]  WITH CHECK ADD  CONSTRAINT [fk_PersonCreditCard] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[tblPerson] ([Person_Id])
GO
ALTER TABLE [dbo].[tblPersonCreditCard] CHECK CONSTRAINT [fk_PersonCreditCard]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [fk_ManufacturerProduct] FOREIGN KEY([Manufacturer_Id])
REFERENCES [dbo].[tblManufacturer] ([Manufacturer_Id])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [fk_ManufacturerProduct]
GO
ALTER TABLE [dbo].[tblStore]  WITH CHECK ADD  CONSTRAINT [fk_LocationStore] FOREIGN KEY([Location_Id])
REFERENCES [dbo].[tblLocation] ([Location_Id])
GO
ALTER TABLE [dbo].[tblStore] CHECK CONSTRAINT [fk_LocationStore]
GO
ALTER TABLE [dbo].[tblTransaction]  WITH CHECK ADD  CONSTRAINT [fk_CustomerTransaction] FOREIGN KEY([Customer_Id])
REFERENCES [dbo].[tblCustomer] ([Customer_Id])
GO
ALTER TABLE [dbo].[tblTransaction] CHECK CONSTRAINT [fk_CustomerTransaction]
GO
ALTER TABLE [dbo].[tblTransaction]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeTransaction] FOREIGN KEY([Employee_Id])
REFERENCES [dbo].[tblEmployee] ([Employee_Id])
GO
ALTER TABLE [dbo].[tblTransaction] CHECK CONSTRAINT [fk_EmployeeTransaction]
GO
ALTER TABLE [dbo].[tblTransaction]  WITH CHECK ADD  CONSTRAINT [fk_MemberTransaction] FOREIGN KEY([MemberType_Id])
REFERENCES [dbo].[tblMemberType] ([MemberType_Id])
GO
ALTER TABLE [dbo].[tblTransaction] CHECK CONSTRAINT [fk_MemberTransaction]
GO
ALTER TABLE [dbo].[tblTransaction]  WITH CHECK ADD  CONSTRAINT [fk_OrderTransaction] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[tblOrder] ([Order_Id])
GO
ALTER TABLE [dbo].[tblTransaction] CHECK CONSTRAINT [fk_OrderTransaction]
GO
ALTER TABLE [dbo].[tblTransaction]  WITH CHECK ADD  CONSTRAINT [fk_ProductTransaction] FOREIGN KEY([Product_Id])
REFERENCES [dbo].[tblProduct] ([Product_Id])
GO
ALTER TABLE [dbo].[tblTransaction] CHECK CONSTRAINT [fk_ProductTransaction]
GO
ALTER TABLE [dbo].[tblTransaction]  WITH CHECK ADD  CONSTRAINT [fk_TransactionType] FOREIGN KEY([TransactionType_Id])
REFERENCES [dbo].[tblTransactionType] ([TransactionType_Id])
GO
ALTER TABLE [dbo].[tblTransaction] CHECK CONSTRAINT [fk_TransactionType]
GO
USE [master]
GO
ALTER DATABASE [posSystemDB] SET  READ_WRITE 
GO
