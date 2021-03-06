USE [master]
GO
/****** Object:  Database [PropertyManagement]    Script Date: 9/26/2021 1:36:17 PM ******/
CREATE DATABASE [PropertyManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PropertyManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PropertyManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PropertyManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PropertyManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PropertyManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PropertyManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PropertyManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PropertyManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PropertyManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PropertyManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PropertyManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [PropertyManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PropertyManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PropertyManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PropertyManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PropertyManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PropertyManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PropertyManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PropertyManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PropertyManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PropertyManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PropertyManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PropertyManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PropertyManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PropertyManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PropertyManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PropertyManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PropertyManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PropertyManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [PropertyManagement] SET  MULTI_USER 
GO
ALTER DATABASE [PropertyManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PropertyManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PropertyManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PropertyManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PropertyManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PropertyManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PropertyManagement', N'ON'
GO
ALTER DATABASE [PropertyManagement] SET QUERY_STORE = OFF
GO
USE [PropertyManagement]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 9/26/2021 1:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Address_ID] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nchar](40) NOT NULL,
	[City] [nchar](30) NOT NULL,
	[State] [nchar](30) NOT NULL,
	[Zip] [nchar](5) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 9/26/2021 1:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[People_ID] [int] IDENTITY(1,1) NOT NULL,
	[First_Name] [nchar](50) NOT NULL,
	[Middle_Initial] [nchar](1) NOT NULL,
	[Last_Name] [nchar](50) NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[People_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 9/26/2021 1:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[Stock_ID] [int] IDENTITY(1,1) NOT NULL,
	[Lined_Paper] [int] NULL,
	[Printer_Paper] [int] NULL,
	[Ink] [int] NULL,
	[Printers] [int] NULL,
	[Paper_Clips] [int] NULL,
	[Sticky_Notes] [int] NULL,
	[Pens] [int] NULL,
	[Pencils] [int] NULL,
	[Computers] [int] NULL,
	[Calenders] [int] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Stock_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 9/26/2021 1:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[Store_ID] [int] IDENTITY(1,1) NOT NULL,
	[Address_ID] [int] NOT NULL,
	[Stock_ID] [int] NOT NULL,
	[Manager_ID] [int] NOT NULL,
	[Employee_ID] [int] NOT NULL,
	[Phone] [nchar](16) NOT NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[Store_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 9/26/2021 1:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Manager_ID] [int] NOT NULL,
	[Truck_ID] [int] NOT NULL,
	[Phone] [nchar](16) NOT NULL,
	[Address_ID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trucks]    Script Date: 9/26/2021 1:36:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trucks](
	[Truck_ID] [int] IDENTITY(1,1) NOT NULL,
	[Driver_ID] [int] NOT NULL,
 CONSTRAINT [PK_Trucks] PRIMARY KEY CLUSTERED 
(
	[Truck_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Address_ID], [Street], [City], [State], [Zip]) VALUES (1, N'1019 5th Street W                       ', N'Red Wing                      ', N'Mn                            ', N'55066')
INSERT [dbo].[Address] ([Address_ID], [Street], [City], [State], [Zip]) VALUES (2, N'901 Forward Drive                       ', N'St. Paul                      ', N'Mn                            ', N'55101')
INSERT [dbo].[Address] ([Address_ID], [Street], [City], [State], [Zip]) VALUES (3, N'372 Littlewood Street                   ', N'Lake City                     ', N'Mn                            ', N'55041')
INSERT [dbo].[Address] ([Address_ID], [Street], [City], [State], [Zip]) VALUES (4, N'482 1st Street N                        ', N'St. Cloud                     ', N'Mn                            ', N'56301')
INSERT [dbo].[Address] ([Address_ID], [Street], [City], [State], [Zip]) VALUES (5, N'653 Lake Dr                             ', N'Rochester                     ', N'Mn                            ', N'55905')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[People] ON 

INSERT [dbo].[People] ([People_ID], [First_Name], [Middle_Initial], [Last_Name]) VALUES (1, N'David                                             ', N'P', N'Fireson                                           ')
INSERT [dbo].[People] ([People_ID], [First_Name], [Middle_Initial], [Last_Name]) VALUES (2, N'Michelle                                          ', N'S', N'Peterson                                          ')
INSERT [dbo].[People] ([People_ID], [First_Name], [Middle_Initial], [Last_Name]) VALUES (3, N'Joey                                              ', N'L', N'Thorton                                           ')
INSERT [dbo].[People] ([People_ID], [First_Name], [Middle_Initial], [Last_Name]) VALUES (4, N'Peter                                             ', N'U', N'Hoffing                                           ')
INSERT [dbo].[People] ([People_ID], [First_Name], [Middle_Initial], [Last_Name]) VALUES (5, N'Leonard                                           ', N'G', N'Cobian                                            ')
INSERT [dbo].[People] ([People_ID], [First_Name], [Middle_Initial], [Last_Name]) VALUES (6, N'Abigail                                           ', N'U', N'Smith                                             ')
INSERT [dbo].[People] ([People_ID], [First_Name], [Middle_Initial], [Last_Name]) VALUES (7, N'John                                              ', N'K', N'Antonio                                           ')
INSERT [dbo].[People] ([People_ID], [First_Name], [Middle_Initial], [Last_Name]) VALUES (8, N'Joe                                               ', N'M', N'Richardson                                        ')
INSERT [dbo].[People] ([People_ID], [First_Name], [Middle_Initial], [Last_Name]) VALUES (9, N'Adam                                              ', N'H', N'Kington                                           ')
SET IDENTITY_INSERT [dbo].[People] OFF
GO
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([Stock_ID], [Lined_Paper], [Printer_Paper], [Ink], [Printers], [Paper_Clips], [Sticky_Notes], [Pens], [Pencils], [Computers], [Calenders]) VALUES (1, 100, 150, 60, 20, 100, 40, 20, 50, 15, 25)
INSERT [dbo].[Stock] ([Stock_ID], [Lined_Paper], [Printer_Paper], [Ink], [Printers], [Paper_Clips], [Sticky_Notes], [Pens], [Pencils], [Computers], [Calenders]) VALUES (2, 27, 49, 26, 10, 50, 200, 60, 50, NULL, 10)
INSERT [dbo].[Stock] ([Stock_ID], [Lined_Paper], [Printer_Paper], [Ink], [Printers], [Paper_Clips], [Sticky_Notes], [Pens], [Pencils], [Computers], [Calenders]) VALUES (3, 20, 100, NULL, NULL, 158, 48, 36, 39, NULL, 100)
SET IDENTITY_INSERT [dbo].[Stock] OFF
GO
SET IDENTITY_INSERT [dbo].[Store] ON 

INSERT [dbo].[Store] ([Store_ID], [Address_ID], [Stock_ID], [Manager_ID], [Employee_ID], [Phone]) VALUES (1, 1, 1, 1, 2, N'(651)086-1111   ')
INSERT [dbo].[Store] ([Store_ID], [Address_ID], [Stock_ID], [Manager_ID], [Employee_ID], [Phone]) VALUES (2, 2, 2, 2, 3, N'(651)797-0008   ')
INSERT [dbo].[Store] ([Store_ID], [Address_ID], [Stock_ID], [Manager_ID], [Employee_ID], [Phone]) VALUES (3, 3, 3, 4, 5, N'(651)080-3636   ')
SET IDENTITY_INSERT [dbo].[Store] OFF
GO
INSERT [dbo].[Supplier] ([Manager_ID], [Truck_ID], [Phone], [Address_ID]) VALUES (6, 1, N'(651)222-3223   ', 4)
INSERT [dbo].[Supplier] ([Manager_ID], [Truck_ID], [Phone], [Address_ID]) VALUES (7, 2, N'(651)222-4444   ', 5)
GO
SET IDENTITY_INSERT [dbo].[Trucks] ON 

INSERT [dbo].[Trucks] ([Truck_ID], [Driver_ID]) VALUES (1, 8)
INSERT [dbo].[Trucks] ([Truck_ID], [Driver_ID]) VALUES (2, 9)
SET IDENTITY_INSERT [dbo].[Trucks] OFF
GO
USE [master]
GO
ALTER DATABASE [PropertyManagement] SET  READ_WRITE 
GO
