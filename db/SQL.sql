USE [master]
GO
/****** Object:  Database [genetic_db]    Script Date: 03/01/2016 19:14:15 ******/
CREATE DATABASE [genetic_db] ON  PRIMARY 
( NAME = N'genetic_db', FILENAME = N'E:\Project_2013-2014\Recomender system using GA\genetic\db\genetic_db.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'genetic_db_log', FILENAME = N'E:\Project_2013-2014\Recomender system using GA\genetic\db\genetic_db_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [genetic_db] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [genetic_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [genetic_db] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [genetic_db] SET ANSI_NULLS OFF
GO
ALTER DATABASE [genetic_db] SET ANSI_PADDING OFF
GO
ALTER DATABASE [genetic_db] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [genetic_db] SET ARITHABORT OFF
GO
ALTER DATABASE [genetic_db] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [genetic_db] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [genetic_db] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [genetic_db] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [genetic_db] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [genetic_db] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [genetic_db] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [genetic_db] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [genetic_db] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [genetic_db] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [genetic_db] SET  DISABLE_BROKER
GO
ALTER DATABASE [genetic_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [genetic_db] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [genetic_db] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [genetic_db] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [genetic_db] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [genetic_db] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [genetic_db] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [genetic_db] SET  READ_WRITE
GO
ALTER DATABASE [genetic_db] SET RECOVERY SIMPLE
GO
ALTER DATABASE [genetic_db] SET  MULTI_USER
GO
ALTER DATABASE [genetic_db] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [genetic_db] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'genetic_db', N'ON'
GO
USE [genetic_db]
GO
/****** Object:  User [Admin_new]    Script Date: 03/01/2016 19:14:15 ******/
CREATE USER [Admin_new] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[rating_temp]    Script Date: 03/01/2016 19:14:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rating_temp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[song_id] [int] NULL,
	[rating] [int] NULL,
	[date_mdf] [smalldatetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[rating_temp] ON
INSERT [dbo].[rating_temp] ([id], [song_id], [rating], [date_mdf]) VALUES (1, 7, 3, CAST(0xA5A8044F AS SmallDateTime))
INSERT [dbo].[rating_temp] ([id], [song_id], [rating], [date_mdf]) VALUES (2, 9, 4, CAST(0xA5A8044F AS SmallDateTime))
INSERT [dbo].[rating_temp] ([id], [song_id], [rating], [date_mdf]) VALUES (3, 11, 5, CAST(0xA5A8044F AS SmallDateTime))
INSERT [dbo].[rating_temp] ([id], [song_id], [rating], [date_mdf]) VALUES (4, 13, 5, CAST(0xA5A8044F AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[rating_temp] OFF
/****** Object:  Table [dbo].[MUser]    Script Date: 03/01/2016 19:14:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MUser](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[first_name] [nvarchar](50) NULL,
	[middle_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[state] [nvarchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[zipcode] [nvarchar](50) NULL,
	[mobile_no] [nvarchar](50) NULL,
	[contact_no] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MUser] ON
INSERT [dbo].[MUser] ([user_id], [username], [password], [first_name], [middle_name], [last_name], [address], [state], [country], [zipcode], [mobile_no], [contact_no]) VALUES (1, N'sachin.t@gmail.com', N'sachin', N'Sachin', N'Ramesh', N'Tendulkar', N'Bandra east', N'Maharashtra', N'India', N'400001', N'8108305127', N'9221036548')
INSERT [dbo].[MUser] ([user_id], [username], [password], [first_name], [middle_name], [last_name], [address], [state], [country], [zipcode], [mobile_no], [contact_no]) VALUES (2, N'chintan@gmail.com', N'chintan', N'Chintabn', N'k', N'k', N'k', N'k', N'k', N'778998', N'9878989', N'89898')
INSERT [dbo].[MUser] ([user_id], [username], [password], [first_name], [middle_name], [last_name], [address], [state], [country], [zipcode], [mobile_no], [contact_no]) VALUES (3, N'shailesh@gmail.com', N'shailesh', N'shailesh', N's', N'bhor', N'k', N'k', N'k', N'458745', N'2222222222', N'3211233212')
INSERT [dbo].[MUser] ([user_id], [username], [password], [first_name], [middle_name], [last_name], [address], [state], [country], [zipcode], [mobile_no], [contact_no]) VALUES (4, N'manoj@gmail.com', N'manoj', N'manoj', N'p', N'p', N'p', N'p', N'p', N'123456', N'8888888888', N'8888888888')
INSERT [dbo].[MUser] ([user_id], [username], [password], [first_name], [middle_name], [last_name], [address], [state], [country], [zipcode], [mobile_no], [contact_no]) VALUES (5, N'harshad@gmail.com', N'harshad', N'Harshad', N'v', N'v', N'v', N'v', N'v', N'159753', N'9999999999', N'9999999999')
INSERT [dbo].[MUser] ([user_id], [username], [password], [first_name], [middle_name], [last_name], [address], [state], [country], [zipcode], [mobile_no], [contact_no]) VALUES (6, N'ninad@gmail.com', N'ninad', N'Ninad', N's', N's', N's', N's', N's', N'444444', N'5555555555', N'5555555555')
INSERT [dbo].[MUser] ([user_id], [username], [password], [first_name], [middle_name], [last_name], [address], [state], [country], [zipcode], [mobile_no], [contact_no]) VALUES (7, N'mayur@gmail.com', N'mayur', N'Mayur', N'y', N'y', N'y', N'y', N'y', N'456789', N'6666666666', N'6666666666')
INSERT [dbo].[MUser] ([user_id], [username], [password], [first_name], [middle_name], [last_name], [address], [state], [country], [zipcode], [mobile_no], [contact_no]) VALUES (8, N'jenny@gmail.com', N'jenny', N'Jenny', N'l', N'l', N'l', N'l', N'l', N'555555', N'7777777777', N'7777777777')
INSERT [dbo].[MUser] ([user_id], [username], [password], [first_name], [middle_name], [last_name], [address], [state], [country], [zipcode], [mobile_no], [contact_no]) VALUES (9, N'aarav@gmail.com', N'aarav', N'Aarav', N'a', N'a', N'a', N'a', N'a', N'111111', N'2585258784', N'5478454545')
INSERT [dbo].[MUser] ([user_id], [username], [password], [first_name], [middle_name], [last_name], [address], [state], [country], [zipcode], [mobile_no], [contact_no]) VALUES (10, N'salman@gmail.com', N'salman', N'Salman', N'k', N'k', N'k', N'k', N'k', N'32145', N'3256987412', N'9878457856')
SET IDENTITY_INSERT [dbo].[MUser] OFF
/****** Object:  Table [dbo].[favorites]    Script Date: 03/01/2016 19:14:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favorites](
	[f_id] [int] IDENTITY(1,1) NOT NULL,
	[song_id] [int] NULL,
	[user_id] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[favorites] ON
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (268, 17, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (269, 18, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (270, 10, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (271, 26, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (273, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (274, 14, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (275, 11, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (277, 14, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (278, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (279, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (281, 11, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (282, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (283, 15, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (287, 11, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (288, 12, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (289, 9, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (293, 8, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (295, 11, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (297, 9, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (299, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (302, 10, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (305, 10, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (306, 9, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (307, 12, 1)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (309, 10, 1)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (312, 13, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (314, 8, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (315, 22, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (316, 14, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (318, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (319, 23, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (321, 10, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (323, 14, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (325, 11, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (326, 9, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (328, 12, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (333, 8, 0)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (334, 11, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (336, 9, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (337, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (340, 15, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (341, 10, 0)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (342, 9, 0)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (351, 2, 0)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (354, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (356, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (358, 10, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (360, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (361, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (364, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (365, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (367, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (369, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (371, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (372, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (373, 9, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (375, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (376, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (377, 15, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (380, 11, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (383, 8, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (385, 22, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (386, 21, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (387, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (388, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (389, 20, 1)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (391, 16, 1)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (392, 25, 1)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (394, 21, 1)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (395, 18, 1)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (396, 10, 1)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (398, 22, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (402, 23, 3)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (403, 21, 3)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (406, 25, 3)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (407, 10, 3)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (408, 7, 3)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (410, 15, 3)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (412, 2, 4)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (415, 12, 4)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (418, 2, 4)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (419, 15, 4)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (421, 8, 4)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (422, 20, 4)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (426, 17, 5)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (427, 18, 5)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (429, 20, 5)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (430, 21, 5)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (432, 23, 5)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (433, 24, 5)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (435, 15, 6)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (437, 13, 6)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (438, 12, 6)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (440, 10, 6)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (441, 9, 6)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (444, 2, 6)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (445, 10, 7)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (446, 9, 7)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (449, 2, 7)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (452, 23, 7)
GO
print 'Processed 100 total records'
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (455, 20, 8)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (456, 19, 8)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (458, 17, 8)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (459, 16, 8)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (461, 12, 8)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (462, 13, 8)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (465, 16, 9)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (467, 18, 9)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (469, 2, 9)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (472, 12, 9)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (473, 10, 9)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (477, 13, 10)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (478, 10, 10)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (481, 23, 10)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (484, 16, 10)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (486, 13, 10)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (490, 8, 10)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (492, 13, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (494, 9, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (495, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (286, 11, 0)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (310, 8, 1)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (338, 13, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (381, 9, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (411, 26, 4)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (416, 9, 4)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (453, 24, 7)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (470, 14, 9)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (487, 14, 10)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (290, 8, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (291, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (301, 11, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (304, 8, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (327, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (344, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (346, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (348, 7, 0)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (352, 7, 0)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (399, 24, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (413, 15, 4)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (423, 21, 4)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (450, 21, 7)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (482, 20, 10)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (267, 26, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (276, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (285, 12, 0)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (324, 12, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (355, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (378, 14, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (404, 19, 3)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (434, 25, 5)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (442, 8, 6)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (447, 8, 7)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (463, 14, 8)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (479, 7, 10)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (280, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (330, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (332, 7, 0)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (350, 7, 0)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (363, 7, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (368, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (382, 11, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (393, 23, 1)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (401, 24, 3)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (431, 22, 5)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (439, 11, 6)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (460, 11, 8)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (466, 17, 9)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (476, 15, 10)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (272, 10, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (294, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (296, 10, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (298, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (303, 9, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (308, 11, 1)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (313, 12, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (317, 12, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (320, 26, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (322, 8, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (329, 11, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (335, 10, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (343, 8, 0)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (357, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (359, 9, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (362, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (366, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (370, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (374, 8, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (384, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (390, 17, 1)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (409, 13, 3)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (420, 11, 4)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (428, 19, 5)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (436, 14, 6)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (457, 18, 8)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (474, 11, 9)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (475, 14, 9)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (485, 26, 10)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (493, 11, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (300, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (311, 2, 1)
GO
print 'Processed 200 total records'
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (339, 14, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (397, 7, 1)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (417, 12, 4)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (425, 16, 5)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (454, 25, 7)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (471, 15, 9)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (488, 15, 10)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (489, 7, 10)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (284, 7, 0)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (292, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (331, 10, 0)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (345, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (347, 2, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (349, 2, 0)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (353, 2, 0)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (400, 18, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (414, 14, 4)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (424, 22, 4)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (451, 22, 7)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (468, 7, 9)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (483, 18, 10)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (379, 12, 2)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (405, 17, 3)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (443, 7, 6)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (448, 7, 7)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (464, 15, 8)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (480, 25, 10)
INSERT [dbo].[favorites] ([f_id], [song_id], [user_id]) VALUES (491, 12, 10)
SET IDENTITY_INSERT [dbo].[favorites] OFF
/****** Object:  Table [dbo].[admin]    Script Date: 03/01/2016 19:14:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON
INSERT [dbo].[admin] ([user_id], [username], [password]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[admin] OFF
/****** Object:  Table [dbo].[Share]    Script Date: 03/01/2016 19:14:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Share](
	[share_id] [int] IDENTITY(1,1) NOT NULL,
	[Song_id] [int] NULL,
	[From_user] [int] NULL,
	[To_user] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Share] ON
INSERT [dbo].[Share] ([share_id], [Song_id], [From_user], [To_user]) VALUES (1, 9, 2, 1)
INSERT [dbo].[Share] ([share_id], [Song_id], [From_user], [To_user]) VALUES (2, 10, 2, 1)
INSERT [dbo].[Share] ([share_id], [Song_id], [From_user], [To_user]) VALUES (3, 12, 2, 1)
INSERT [dbo].[Share] ([share_id], [Song_id], [From_user], [To_user]) VALUES (4, 14, 2, 1)
INSERT [dbo].[Share] ([share_id], [Song_id], [From_user], [To_user]) VALUES (5, 12, 1, 2)
INSERT [dbo].[Share] ([share_id], [Song_id], [From_user], [To_user]) VALUES (6, 15, 2, 1)
INSERT [dbo].[Share] ([share_id], [Song_id], [From_user], [To_user]) VALUES (8, 26, 2, 1)
INSERT [dbo].[Share] ([share_id], [Song_id], [From_user], [To_user]) VALUES (7, 17, 2, 1)
SET IDENTITY_INSERT [dbo].[Share] OFF
/****** Object:  Table [dbo].[Song_temp]    Script Date: 03/01/2016 19:14:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Song_temp](
	[Song_id] [int] NOT NULL,
	[Artist] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Category] [nvarchar](50) NULL,
	[song_path] [nvarchar](max) NULL,
	[Tempo] [decimal](25, 6) NULL,
	[Pitch] [decimal](25, 6) NULL,
	[Octav] [decimal](25, 6) NULL,
	[Root] [decimal](25, 6) NULL,
	[Mode] [decimal](25, 6) NULL,
	[Rating] [int] NULL,
	[UserCount] [int] NULL,
	[trating] [int] NULL,
	[crating] [int] NULL,
	[diff] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (2, N'Himesh', N'I Love You', N'Romantic', N'/genetic/Admin/Songs/[Songs.PK] Bodyguard - 02 - I Love You.mp3', CAST(0.011330 AS Decimal(25, 6)), CAST(0.040330 AS Decimal(25, 6)), CAST(0.040330 AS Decimal(25, 6)), CAST(0.740330 AS Decimal(25, 6)), CAST(0.139330 AS Decimal(25, 6)), 3, 47, 149, 4, 0.751233712211251)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (7, N'A. R. Rehmaan', N'Sadda Haqq', N'Romantic', N'/genetic/Admin/songs/rockstar13(www.songs.pk).mp3', CAST(0.011370 AS Decimal(25, 6)), CAST(0.040370 AS Decimal(25, 6)), CAST(0.040370 AS Decimal(25, 6)), CAST(0.740370 AS Decimal(25, 6)), CAST(0.169370 AS Decimal(25, 6)), 3, 65, 216, 3, 0.781433712211251)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (8, N'Akon & Hamsika Iyer', N'Chammak Challo', N'Dance-Item', N'/genetic/Admin/songs/raone01(www.songs.pk).mp3', CAST(0.011380 AS Decimal(25, 6)), CAST(0.040380 AS Decimal(25, 6)), CAST(0.040380 AS Decimal(25, 6)), CAST(0.740380 AS Decimal(25, 6)), CAST(0.169380 AS Decimal(25, 6)), 3, 31, 104, 3, 0.781483712211251)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (9, N'Ajay - Atul', N'Deva Shree Ganesha', N'Dance', N'/genetic/Admin/songs/agneepath06(www.songs.pk).mp3', CAST(0.011390 AS Decimal(25, 6)), CAST(0.040390 AS Decimal(25, 6)), CAST(0.040390 AS Decimal(25, 6)), CAST(0.740390 AS Decimal(25, 6)), CAST(0.169390 AS Decimal(25, 6)), 3, 33, 117, 4, 0.781533712211251)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (10, N'K.K.', N'Mere Brother Ki Dulhan', N'Happy/Fun', N'/genetic/Admin/songs/[Songs.PK] Mere Brother Ki Dulhan - 01 - Mere Brother Ki Dulhan.mp3', CAST(0.021370 AS Decimal(25, 6)), CAST(0.041370 AS Decimal(25, 6)), CAST(0.041370 AS Decimal(25, 6)), CAST(0.741370 AS Decimal(25, 6)), CAST(0.161370 AS Decimal(25, 6)), 3, 33, 109, 2, 0.786433712211251)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (11, N'Vishal Dadlani', N'Zara Dil Ko Thamlo', N'Pop/Remix', N'/genetic/Admin/songs/don2-02(www.songs.pk).mp3', CAST(0.011890 AS Decimal(25, 6)), CAST(0.040890 AS Decimal(25, 6)), CAST(0.040890 AS Decimal(25, 6)), CAST(0.740890 AS Decimal(25, 6)), CAST(0.169890 AS Decimal(25, 6)), 3, 53, 180, 4, 0.784033712211251)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (12, N'Vijay', N'Govinda', N'Dance', N'/genetic/Admin/songs/GOVINDA RE(www.saptsur.net).mp3', CAST(0.345000 AS Decimal(25, 6)), CAST(0.651200 AS Decimal(25, 6)), CAST(0.039400 AS Decimal(25, 6)), CAST(0.135100 AS Decimal(25, 6)), CAST(0.196400 AS Decimal(25, 6)), 3, 35, 122, 4, 1.14668371221125)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (13, N'Mamta Sharma', N'Anarkali Disco', N'Pop/Remix', N'/genetic/Admin/songs/[Songs.PK] Housefull 2 - 02 - Anarkali Disco Chali.mp3', CAST(0.458000 AS Decimal(25, 6)), CAST(0.314610 AS Decimal(25, 6)), CAST(0.039540 AS Decimal(25, 6)), CAST(0.038542 AS Decimal(25, 6)), CAST(0.025840 AS Decimal(25, 6)), 3, 29, 88, 2, 0.927307461877942)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (14, N'Neha Basin', N'Dhunki', N'Rock', N'/genetic/Admin/songs/[Songs.PK] Mere Brother Ki Dulhan - 02 - Dhunki.mp3', CAST(0.012548 AS Decimal(25, 6)), CAST(0.038410 AS Decimal(25, 6)), CAST(0.648000 AS Decimal(25, 6)), CAST(0.369000 AS Decimal(25, 6)), CAST(0.124100 AS Decimal(25, 6)), 3, 28, 85, 4, 0.971641712211251)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (15, N'Mika Singh', N'Desi Beat Bodyguard', N'Romantic', N'/genetic/Admin/songs/[Songs.PK] Bodyguard - 03 - Desi Beat.mp3', CAST(0.033400 AS Decimal(25, 6)), CAST(0.045100 AS Decimal(25, 6)), CAST(0.124400 AS Decimal(25, 6)), CAST(0.123000 AS Decimal(25, 6)), CAST(0.257000 AS Decimal(25, 6)), 3, 7, 23, 3, 0.362483712211251)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (16, N'Rahat Fateh Ali', N'Teri Meri BodyGaurd', N'Sad', N'/genetic/Admin/songs/[Songs.PK] Bodyguard - 04 - Teri Meri.mp3', CAST(0.012360 AS Decimal(25, 6)), CAST(0.135000 AS Decimal(25, 6)), CAST(0.274000 AS Decimal(25, 6)), CAST(0.794000 AS Decimal(25, 6)), CAST(0.179100 AS Decimal(25, 6)), 3, 3, 9, 3, 1.17404371221125)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (17, N'Rahat Fateh Ali', N'Ishq Risk - Mere Brother ki dulhan', N'Happy/Fun', N'/genetic/Admin/songs/[Songs.PK] Mere Brother Ki Dulhan - 04 - Isq Risk.mp3', CAST(0.794100 AS Decimal(25, 6)), CAST(0.642000 AS Decimal(25, 6)), CAST(0.039400 AS Decimal(25, 6)), CAST(0.054610 AS Decimal(25, 6)), CAST(0.684500 AS Decimal(25, 6)), 5, 3, 15, 5, 2.06216127591074)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (18, N'Benny Dayal', N'Choomantar - Mere Brother ki Dulhan', N'Pop/Remix', N'/genetic/Admin/songs/[Songs.PK] Mere Brother Ki Dulhan - 07 - Choomantar (Remix).mp3', CAST(0.794000 AS Decimal(25, 6)), CAST(0.064000 AS Decimal(25, 6)), CAST(0.413900 AS Decimal(25, 6)), CAST(0.375200 AS Decimal(25, 6)), CAST(0.941000 AS Decimal(25, 6)), 3, 1, 3, 3, 2.36768371221125)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (19, N'Vijay', N'jaalajale', N'Dance-Item', N'/genetic/Admin/songs/04 jalajale  {Www.Skillsongs.Com}.mp3', CAST(0.195000 AS Decimal(25, 6)), CAST(0.085400 AS Decimal(25, 6)), CAST(0.418500 AS Decimal(25, 6)), CAST(0.417000 AS Decimal(25, 6)), CAST(0.641000 AS Decimal(25, 6)), 4, 1, 4, 4, 1.53648371221125)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (20, N'Vijay', N'saaavdhan', N'Dance-Item', N'/genetic/Admin/songs/05 saavdhan  {Www.Skillsongs.Com}.mp3', CAST(0.974100 AS Decimal(25, 6)), CAST(0.494300 AS Decimal(25, 6)), CAST(0.068000 AS Decimal(25, 6)), CAST(0.394000 AS Decimal(25, 6)), CAST(0.944200 AS Decimal(25, 6)), 3, 3, 9, 3, 2.65418371221125)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (21, N'sonu nigam', N'Agneepath', N'Sad', N'/genetic/Admin/songs/agneepath06(www.songs.pk).mp3', CAST(0.104200 AS Decimal(25, 6)), CAST(0.031690 AS Decimal(25, 6)), CAST(0.510000 AS Decimal(25, 6)), CAST(0.520000 AS Decimal(25, 6)), CAST(0.850000 AS Decimal(25, 6)), 4, 1, 4, 4, 1.79547371221125)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (22, N'Vishal Dadlani', N'Main Hoon Don', N'Pop/Remix', N'/genetic/Admin/songs/don2-02(www.songs.pk).mp3', CAST(0.695000 AS Decimal(25, 6)), CAST(0.013940 AS Decimal(25, 6)), CAST(0.358100 AS Decimal(25, 6)), CAST(0.096410 AS Decimal(25, 6)), CAST(0.691000 AS Decimal(25, 6)), 3, 6, 19, 5, 1.63403371221125)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (23, N'Dyaneshwar', N'Morya Song', N'Happy/Fun', N'/genetic/Admin/songs/Morya (Title Song)(www.saptsur.net).mp3', CAST(0.046400 AS Decimal(25, 6)), CAST(0.490000 AS Decimal(25, 6)), CAST(0.791000 AS Decimal(25, 6)), CAST(0.357000 AS Decimal(25, 6)), CAST(0.319000 AS Decimal(25, 6)), 3, 1, 3, 3, 1.78298371221125)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (24, N'Shweta pandit', N'Do Dhaari Talwar', N'Pop/Remix', N'/genetic/Admin/songs/[Songs.PK] Mere Brother Ki Dulhan - 06 - Do Dhaari Talwaar.mp3', CAST(0.798100 AS Decimal(25, 6)), CAST(0.794100 AS Decimal(25, 6)), CAST(0.194700 AS Decimal(25, 6)), CAST(0.614460 AS Decimal(25, 6)), CAST(0.791000 AS Decimal(25, 6)), 3, 4, 13, 1, 2.97194371221125)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (25, N'Benny Dayal', N'Ek Main aur ek tu', N'Rock', N'/genetic/Admin/songs/ek-main-aur-ekk-tu01(www.songs.pk).mp3', CAST(0.461800 AS Decimal(25, 6)), CAST(0.186000 AS Decimal(25, 6)), CAST(0.094600 AS Decimal(25, 6)), CAST(0.097610 AS Decimal(25, 6)), CAST(0.137900 AS Decimal(25, 6)), 4, 2, 9, 4, 0.757493712211251)
INSERT [dbo].[Song_temp] ([Song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (26, N'Dyaneshwar', N'HEY LAMBODAR', N'Pop/Remix', N'/genetic/Admin/songs/HEY LAMBODAR (www.saptsur.net).mp3', CAST(0.346210 AS Decimal(25, 6)), CAST(0.161000 AS Decimal(25, 6)), CAST(0.128743 AS Decimal(25, 6)), CAST(0.157490 AS Decimal(25, 6)), CAST(0.285000 AS Decimal(25, 6)), 3, 3, 11, 4, 0.858026712211251)
/****** Object:  Table [dbo].[t1]    Script Date: 03/01/2016 19:14:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[t1](
	[song] [varchar](30) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Songs]    Script Date: 03/01/2016 19:14:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Songs](
	[song_id] [int] IDENTITY(1,1) NOT NULL,
	[Artist] [nvarchar](50) NULL,
	[Title] [nvarchar](500) NULL,
	[Category] [nvarchar](50) NULL,
	[song_path] [nvarchar](max) NULL,
	[Tempo] [decimal](25, 6) NULL,
	[Pitch] [decimal](25, 6) NULL,
	[Octav] [decimal](25, 6) NULL,
	[Root] [decimal](25, 6) NULL,
	[Mode] [decimal](25, 6) NULL,
	[Rating] [int] NULL,
	[UserCount] [int] NULL,
	[trating] [int] NULL,
	[crating] [int] NULL,
	[diff] [float] NULL,
 CONSTRAINT [PK_Songs] PRIMARY KEY CLUSTERED 
(
	[song_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Songs] ON
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (2, N'Himesh', N'I Love You', N'Romantic', N'/genetic/Admin/Songs/[Songs.PK] Bodyguard - 02 - I Love You.mp3', CAST(0.011330 AS Decimal(25, 6)), CAST(0.040330 AS Decimal(25, 6)), CAST(0.040330 AS Decimal(25, 6)), CAST(0.740330 AS Decimal(25, 6)), CAST(0.139330 AS Decimal(25, 6)), 3, 52, 169, 3, 0.954292937700153)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (7, N'A. R. Rehmaan', N'Sadda Haqq', N'Romantic', N'/genetic/Admin/songs/rockstar13(www.songs.pk).mp3', CAST(0.011370 AS Decimal(25, 6)), CAST(0.040370 AS Decimal(25, 6)), CAST(0.040370 AS Decimal(25, 6)), CAST(0.740370 AS Decimal(25, 6)), CAST(0.169370 AS Decimal(25, 6)), 3, 73, 244, 3, 0.984412937700152)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (8, N'Akon & Hamsika Iyer', N'Chammak Challo', N'Dance-Item', N'/genetic/Admin/songs/raone01(www.songs.pk).mp3', CAST(0.011380 AS Decimal(25, 6)), CAST(0.040380 AS Decimal(25, 6)), CAST(0.040380 AS Decimal(25, 6)), CAST(0.740380 AS Decimal(25, 6)), CAST(0.169380 AS Decimal(25, 6)), 3, 35, 117, 4, 0.984442937700152)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (9, N'Ajay - Atul', N'Deva Shree Ganesha', N'Dance', N'/genetic/Admin/songs/agneepath06(www.songs.pk).mp3', CAST(0.011390 AS Decimal(25, 6)), CAST(0.040390 AS Decimal(25, 6)), CAST(0.040390 AS Decimal(25, 6)), CAST(0.740390 AS Decimal(25, 6)), CAST(0.169390 AS Decimal(25, 6)), 3, 39, 135, 4, 0.984472937700152)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (10, N'K.K.', N'Mere Brother Ki Dulhan', N'Happy/Fun', N'/genetic/Admin/songs/[Songs.PK] Mere Brother Ki Dulhan - 01 - Mere Brother Ki Dulhan.mp3', CAST(0.021370 AS Decimal(25, 6)), CAST(0.041370 AS Decimal(25, 6)), CAST(0.041370 AS Decimal(25, 6)), CAST(0.741370 AS Decimal(25, 6)), CAST(0.161370 AS Decimal(25, 6)), 3, 39, 128, 3, 0.969412937700152)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (11, N'Vishal Dadlani', N'Zara Dil Ko Thamlo', N'Pop/Remix', N'/genetic/Admin/songs/don2-02(www.songs.pk).mp3', CAST(0.011890 AS Decimal(25, 6)), CAST(0.040890 AS Decimal(25, 6)), CAST(0.040890 AS Decimal(25, 6)), CAST(0.740890 AS Decimal(25, 6)), CAST(0.169890 AS Decimal(25, 6)), 3, 58, 199, 5, 0.985972937700152)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (12, N'Vijay', N'Govinda', N'Dance', N'/genetic/Admin/songs/GOVINDA RE(www.saptsur.net).mp3', CAST(0.345000 AS Decimal(25, 6)), CAST(0.651200 AS Decimal(25, 6)), CAST(0.039400 AS Decimal(25, 6)), CAST(0.135100 AS Decimal(25, 6)), CAST(0.196400 AS Decimal(25, 6)), 3, 41, 142, 4, 1.14119631166697)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (13, N'Mamta Sharma', N'Anarkali Disco', N'Pop/Remix', N'/genetic/Admin/songs/[Songs.PK] Housefull 2 - 02 - Anarkali Disco Chali.mp3', CAST(0.458000 AS Decimal(25, 6)), CAST(0.314610 AS Decimal(25, 6)), CAST(0.039540 AS Decimal(25, 6)), CAST(0.038542 AS Decimal(25, 6)), CAST(0.025840 AS Decimal(25, 6)), 3, 37, 116, 5, 0.672919245647073)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (14, N'Neha Basin', N'Dhunki', N'Rock', N'/genetic/Admin/songs/[Songs.PK] Mere Brother Ki Dulhan - 02 - Dhunki.mp3', CAST(0.012548 AS Decimal(25, 6)), CAST(0.038410 AS Decimal(25, 6)), CAST(0.648000 AS Decimal(25, 6)), CAST(0.369000 AS Decimal(25, 6)), CAST(0.124100 AS Decimal(25, 6)), 3, 35, 110, 2, 1.17226493770015)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (15, N'Mika Singh', N'Desi Beat Bodyguard', N'Romantic', N'/genetic/Admin/songs/[Songs.PK] Bodyguard - 03 - Desi Beat.mp3', CAST(0.033400 AS Decimal(25, 6)), CAST(0.045100 AS Decimal(25, 6)), CAST(0.124400 AS Decimal(25, 6)), CAST(0.123000 AS Decimal(25, 6)), CAST(0.257000 AS Decimal(25, 6)), 3, 16, 55, 1, 0.521402937700152)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (16, N'Rahat Fateh Ali', N'Teri Meri BodyGaurd', N'Sad', N'/genetic/Admin/songs/[Songs.PK] Bodyguard - 04 - Teri Meri.mp3', CAST(0.012360 AS Decimal(25, 6)), CAST(0.135000 AS Decimal(25, 6)), CAST(0.274000 AS Decimal(25, 6)), CAST(0.794000 AS Decimal(25, 6)), CAST(0.179100 AS Decimal(25, 6)), 3, 8, 28, 4, 1.37504293770015)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (17, N'Rahat Fateh Ali', N'Ishq Risk - Mere Brother ki dulhan', N'Happy/Fun', N'/genetic/Admin/songs/[Songs.PK] Mere Brother Ki Dulhan - 04 - Isq Risk.mp3', CAST(0.794100 AS Decimal(25, 6)), CAST(0.642000 AS Decimal(25, 6)), CAST(0.039400 AS Decimal(25, 6)), CAST(0.054610 AS Decimal(25, 6)), CAST(0.684500 AS Decimal(25, 6)), 4, 8, 34, 4, 1.98870631166697)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (18, N'Benny Dayal', N'Choomantar - Mere Brother ki Dulhan', N'Pop/Remix', N'/genetic/Admin/songs/[Songs.PK] Mere Brother Ki Dulhan - 07 - Choomantar (Remix).mp3', CAST(0.794000 AS Decimal(25, 6)), CAST(0.064000 AS Decimal(25, 6)), CAST(0.413900 AS Decimal(25, 6)), CAST(0.375200 AS Decimal(25, 6)), CAST(0.941000 AS Decimal(25, 6)), 3, 7, 26, 4, 2.36219631166697)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (19, N'Vijay', N'jaalajale', N'Dance-Item', N'/genetic/Admin/songs/04 jalajale  {Www.Skillsongs.Com}.mp3', CAST(0.195000 AS Decimal(25, 6)), CAST(0.085400 AS Decimal(25, 6)), CAST(0.418500 AS Decimal(25, 6)), CAST(0.417000 AS Decimal(25, 6)), CAST(0.641000 AS Decimal(25, 6)), 3, 4, 15, 3, 1.53099631166697)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (20, N'Vijay', N'saaavdhan', N'Dance-Item', N'/genetic/Admin/songs/05 saavdhan  {Www.Skillsongs.Com}.mp3', CAST(0.974100 AS Decimal(25, 6)), CAST(0.494300 AS Decimal(25, 6)), CAST(0.068000 AS Decimal(25, 6)), CAST(0.394000 AS Decimal(25, 6)), CAST(0.944200 AS Decimal(25, 6)), 3, 8, 26, 4, 2.64869631166697)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (21, N'sonu nigam', N'Agneepath', N'Sad', N'/genetic/Admin/songs/agneepath06(www.songs.pk).mp3', CAST(0.104200 AS Decimal(25, 6)), CAST(0.031690 AS Decimal(25, 6)), CAST(0.510000 AS Decimal(25, 6)), CAST(0.520000 AS Decimal(25, 6)), CAST(0.850000 AS Decimal(25, 6)), 3, 6, 23, 4, 1.81279293770015)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (22, N'Vishal Dadlani', N'Main Hoon Don', N'Pop/Remix', N'/genetic/Admin/songs/don2-02(www.songs.pk).mp3', CAST(0.695000 AS Decimal(25, 6)), CAST(0.013940 AS Decimal(25, 6)), CAST(0.358100 AS Decimal(25, 6)), CAST(0.096410 AS Decimal(25, 6)), CAST(0.691000 AS Decimal(25, 6)), 3, 10, 33, 3, 1.66404202018678)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (23, N'Dyaneshwar', N'Morya Song', N'Happy/Fun', N'/genetic/Admin/songs/Morya (Title Song)(www.saptsur.net).mp3', CAST(0.046400 AS Decimal(25, 6)), CAST(0.490000 AS Decimal(25, 6)), CAST(0.791000 AS Decimal(25, 6)), CAST(0.357000 AS Decimal(25, 6)), CAST(0.319000 AS Decimal(25, 6)), 3, 6, 22, 4, 1.91590293770015)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (24, N'Shweta pandit', N'Do Dhaari Talwar', N'Pop/Remix', N'/genetic/Admin/songs/[Songs.PK] Mere Brother Ki Dulhan - 06 - Do Dhaari Talwaar.mp3', CAST(0.798100 AS Decimal(25, 6)), CAST(0.794100 AS Decimal(25, 6)), CAST(0.194700 AS Decimal(25, 6)), CAST(0.614460 AS Decimal(25, 6)), CAST(0.791000 AS Decimal(25, 6)), 3, 8, 27, 3, 2.96645631166697)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (25, N'Benny Dayal', N'Ek Main aur ek tu', N'Rock', N'/genetic/Admin/songs/ek-main-aur-ekk-tu01(www.songs.pk).mp3', CAST(0.461800 AS Decimal(25, 6)), CAST(0.186000 AS Decimal(25, 6)), CAST(0.094600 AS Decimal(25, 6)), CAST(0.097610 AS Decimal(25, 6)), CAST(0.137900 AS Decimal(25, 6)), 3, 7, 26, 4, 0.752006311666966)
INSERT [dbo].[Songs] ([song_id], [Artist], [Title], [Category], [song_path], [Tempo], [Pitch], [Octav], [Root], [Mode], [Rating], [UserCount], [trating], [crating], [diff]) VALUES (26, N'Dyaneshwar', N'HEY LAMBODAR', N'Pop/Remix', N'/genetic/Admin/songs/HEY LAMBODAR (www.saptsur.net).mp3', CAST(0.346210 AS Decimal(25, 6)), CAST(0.161000 AS Decimal(25, 6)), CAST(0.128743 AS Decimal(25, 6)), CAST(0.157490 AS Decimal(25, 6)), CAST(0.285000 AS Decimal(25, 6)), 4, 5, 20, 5, 0.852539311666966)
SET IDENTITY_INSERT [dbo].[Songs] OFF
/****** Object:  StoredProcedure [dbo].[user_update]    Script Date: 03/01/2016 19:14:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[user_update]
(@user_id int, @first_name nvarchar(50), @middle_name nvarchar(50),@last_name nvarchar(50),@address nvarchar(MAX),@state nvarchar(50),@country nvarchar(50), @zipcode nvarchar(50), @mobile_no nvarchar(50), @contact_no nvarchar(50))
as
	begin	
		Update MUser Set first_name=@first_name,middle_name= @middle_name,last_name=@last_name,address=@address,state=@state,country=@country,zipcode=@zipcode,mobile_no=@mobile_no,contact_no=@contact_no where user_id = @user_id 
	end
GO
/****** Object:  StoredProcedure [dbo].[user_select]    Script Date: 03/01/2016 19:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[user_select]
(@user_id int)

as
	begin	
		Select * From MUser Where user_id = @user_id
end
GO
/****** Object:  StoredProcedure [dbo].[user_login]    Script Date: 03/01/2016 19:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create procedure [dbo].[user_login]
(
@username nvarchar(50),
@password nvarchar(50)

)
as
	begin
		Select * From MUser where username = @username and password = @password
	end
GO
/****** Object:  StoredProcedure [dbo].[user_insert]    Script Date: 03/01/2016 19:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[user_insert]
(@username nvarchar(50), @password nvarchar(50), @first_name nvarchar(50), @middle_name nvarchar(50),@last_name nvarchar(50),@address nvarchar(MAX),@state nvarchar(50),@country nvarchar(50), @zipcode nvarchar(50), @mobile_no nvarchar(50), @contact_no nvarchar(50)) 

as
	begin	
		insert into MUser
		(username, password,first_name, middle_name,last_name,address,state,country,zipcode,mobile_no,contact_no) 
		values (@username, @password,@first_name, @middle_name,@last_name,@address,@state,@country,@zipcode,@mobile_no,@contact_no) 
	end
GO
/****** Object:  StoredProcedure [dbo].[song_update]    Script Date: 03/01/2016 19:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[song_update]
(@song_id int, @Title nvarchar(500),@Artist nvarchar(50),@Category nvarchar(50),@Tempo decimal(25, 6),@Pitch decimal(25, 6),@Octav decimal(25, 6),@Root decimal(25, 6),@Mode decimal(25, 6)) 
as
	begin
		update dbo.Songs
		set Title = @Title,Artist=@Artist,Category=@Category,Tempo= @Tempo,Pitch=@Pitch,Octav=@Octav,Root=@Root,Mode=@Mode where song_id = @song_id
	end
GO
/****** Object:  StoredProcedure [dbo].[song_select]    Script Date: 03/01/2016 19:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[song_select]
@song_id int
as
	begin	
		select * from dbo.Songs where song_id = @song_id
	end
GO
/****** Object:  StoredProcedure [dbo].[song_insert]    Script Date: 03/01/2016 19:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[song_insert]
(@Title nvarchar(500),@Artist nvarchar(50),@Category nvarchar(50), @song_path nvarchar(MAX), @Tempo decimal(25, 6),@Pitch decimal(25, 6),@Octav decimal(25, 6),@Root decimal(25, 6),@Mode decimal(25, 6)) 

as
	begin	
		insert into dbo.Songs
		(Title,Artist,Category,song_path,Tempo,Pitch,Octav,Root,Mode) 

		values (@Title,@Artist,@Category,@song_path,@Tempo,@Pitch,@Octav,@Root,@Mode)  
	end
GO
/****** Object:  StoredProcedure [dbo].[recommend_cat_new]    Script Date: 03/01/2016 19:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[recommend_cat_new]
--@song_id int
(
@flag varchar(10),
@cat varchar(20) 
)
as
	begin	
		if (@flag = 'false') --false
		begin
			SELECT     TOP (10) song_id, Artist, Title, Category, Tempo, Pitch, Octav, Root, Mode, UserCount, Rating, song_path, diff
			FROM       Song_temp
			ORDER BY diff
		--select category wise
		end
		else if (@flag = 'true') --true
		begin
			SELECT     TOP (10) song_id, Artist, Title, Category, Tempo, Pitch, Octav, Root, Mode, UserCount, Rating, song_path, diff
			FROM       Song_temp
			WHERE     Category = @cat
			ORDER BY diff
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[recommend_cat]    Script Date: 03/01/2016 19:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[recommend_cat]
--@song_id int
(
@flag varchar(10),
@cat varchar(20) 
)
as
	begin	
		if (@flag = 'false') --false
		begin
			SELECT     TOP (10) song_id, Artist, Title, Category, Tempo, Pitch, Octav, Root, Mode, UserCount, Rating, song_path, diff
			FROM       Songs
			ORDER BY diff
		--select category wise
		end
		else if (@flag = 'true') --true
		begin
			SELECT     TOP (10) song_id, Artist, Title, Category, Tempo, Pitch, Octav, Root, Mode, UserCount, Rating, song_path, diff
			FROM       Songs
			WHERE     Category = @cat
			ORDER BY diff
		end
	end
GO
/****** Object:  StoredProcedure [dbo].[admin_login]    Script Date: 03/01/2016 19:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[admin_login]
(
@username nvarchar(50),
@password nvarchar(50)
)
as
	begin
		Select * From admin where username = @username and password = @password
	end
GO
/****** Object:  Default [DF_rating_temp_date_mdf]    Script Date: 03/01/2016 19:14:16 ******/
ALTER TABLE [dbo].[rating_temp] ADD  CONSTRAINT [DF_rating_temp_date_mdf]  DEFAULT (getdate()) FOR [date_mdf]
GO
/****** Object:  Default [DF_Songs_Rating]    Script Date: 03/01/2016 19:14:16 ******/
ALTER TABLE [dbo].[Songs] ADD  CONSTRAINT [DF_Songs_Rating]  DEFAULT ((0)) FOR [Rating]
GO
/****** Object:  Default [DF_Songs_UserCount]    Script Date: 03/01/2016 19:14:16 ******/
ALTER TABLE [dbo].[Songs] ADD  CONSTRAINT [DF_Songs_UserCount]  DEFAULT ((0)) FOR [UserCount]
GO
/****** Object:  Default [DF_Songs_trating]    Script Date: 03/01/2016 19:14:16 ******/
ALTER TABLE [dbo].[Songs] ADD  CONSTRAINT [DF_Songs_trating]  DEFAULT ((0)) FOR [trating]
GO
/****** Object:  Default [DF_Songs_diff]    Script Date: 03/01/2016 19:14:16 ******/
ALTER TABLE [dbo].[Songs] ADD  CONSTRAINT [DF_Songs_diff]  DEFAULT ((0.0)) FOR [diff]
GO
