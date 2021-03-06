USE [master]
GO
/****** Object:  Database [UniversityManagementSystemDB]    Script Date: 12/14/2015 1:08:00 PM ******/
CREATE DATABASE [UniversityManagementSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityManagementSystemDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityManagementSystemDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityManagementSystemDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\UniversityManagementSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityManagementSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityManagementSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityManagementSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityManagementSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityManagementSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [UniversityManagementSystemDB]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 12/14/2015 1:08:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Courses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 12/14/2015 1:08:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentCourse]    Script Date: 12/14/2015 1:08:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourse](
	[StudentId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_StudentCourse] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC,
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 12/14/2015 1:08:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[RegNo] [varchar](50) NOT NULL,
	[Address] [varchar](150) NULL,
	[Phone] [varchar](11) NULL,
	[DepartmentID] [int] NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[GetStudentAndCourseInfo]    Script Date: 12/14/2015 1:08:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetStudentAndCourseInfo]
AS
SELECT s.Id, s.Name, c.Name as CourseName FROM Students s LEFT OUTER JOIN StudentCourse sc
ON s.Id = sc.StudentId LEFT OUTER JOIN Courses c
ON c.Id = sc.CourseId
GO
/****** Object:  View [dbo].[GetStudentsWithDepartments]    Script Date: 12/14/2015 1:08:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GetStudentsWithDepartments]
AS
SELECT s.Id, s.Name,s.RegNo,s.Address,s.Phone, d.Name as DepartmentName FROM 
Students as s LEFT OUTER JOIN Departments d
ON s.DepartmentID = d.ID
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([Id], [Name]) VALUES (1, N'CSE-101')
INSERT [dbo].[Courses] ([Id], [Name]) VALUES (2, N'CSE-102')
INSERT [dbo].[Courses] ([Id], [Name]) VALUES (3, N'EEE-101')
INSERT [dbo].[Courses] ([Id], [Name]) VALUES (4, N'EEE-102')
INSERT [dbo].[Courses] ([Id], [Name]) VALUES (5, N'AECE-101')
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([ID], [Name]) VALUES (1, N'CSE')
INSERT [dbo].[Departments] ([ID], [Name]) VALUES (2, N'EEE')
INSERT [dbo].[Departments] ([ID], [Name]) VALUES (3, N'AECE')
SET IDENTITY_INSERT [dbo].[Departments] OFF
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (1017, 1)
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (1017, 2)
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (1017, 3)
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (1018, 1)
INSERT [dbo].[StudentCourse] ([StudentId], [CourseId]) VALUES (1018, 2)
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [Name], [RegNo], [Address], [Phone], [DepartmentID]) VALUES (10, N'Minar', N'123-126', N'Dhaka', N'012365478', NULL)
INSERT [dbo].[Students] ([Id], [Name], [RegNo], [Address], [Phone], [DepartmentID]) VALUES (11, N'Amir', N'123-125', N'Dhaka', N'012365478', NULL)
INSERT [dbo].[Students] ([Id], [Name], [RegNo], [Address], [Phone], [DepartmentID]) VALUES (1017, N'A', N'001', N'Dhaka', NULL, 1)
INSERT [dbo].[Students] ([Id], [Name], [RegNo], [Address], [Phone], [DepartmentID]) VALUES (1018, N'B', N'002', NULL, NULL, 2)
INSERT [dbo].[Students] ([Id], [Name], [RegNo], [Address], [Phone], [DepartmentID]) VALUES (1019, N'C', N'003', NULL, NULL, 1)
INSERT [dbo].[Students] ([Id], [Name], [RegNo], [Address], [Phone], [DepartmentID]) VALUES (1021, N'E', N'005005', N'', N'', 3)
INSERT [dbo].[Students] ([Id], [Name], [RegNo], [Address], [Phone], [DepartmentID]) VALUES (1023, N'F', N'006006', N'Dhaka', N'', 2)
INSERT [dbo].[Students] ([Id], [Name], [RegNo], [Address], [Phone], [DepartmentID]) VALUES (1024, N'James Bond', N'007007', N'London', N'0293482034', 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Students]    Script Date: 12/14/2015 1:08:00 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Students] ON [dbo].[Students]
(
	[RegNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Courses] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([Id])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Courses]
GO
ALTER TABLE [dbo].[StudentCourse]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourse_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[StudentCourse] CHECK CONSTRAINT [FK_StudentCourse_Students]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([ID])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Departments]
GO
USE [master]
GO
ALTER DATABASE [UniversityManagementSystemDB] SET  READ_WRITE 
GO
