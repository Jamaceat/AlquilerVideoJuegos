USE [master]
GO
/****** Object:  Database [RentGames]    Script Date: 30/10/2022 12:46:43 p. m. ******/
CREATE DATABASE [RentGames]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RentGames', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\RentGames.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RentGames_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\RentGames_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RentGames] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RentGames].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RentGames] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RentGames] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RentGames] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RentGames] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RentGames] SET ARITHABORT OFF 
GO
ALTER DATABASE [RentGames] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RentGames] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RentGames] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RentGames] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RentGames] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RentGames] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RentGames] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RentGames] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RentGames] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RentGames] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RentGames] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RentGames] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RentGames] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RentGames] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RentGames] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RentGames] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RentGames] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RentGames] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RentGames] SET  MULTI_USER 
GO
ALTER DATABASE [RentGames] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RentGames] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RentGames] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RentGames] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RentGames] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RentGames] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RentGames] SET QUERY_STORE = OFF
GO
USE [RentGames]
GO
/****** Object:  Table [dbo].[client]    Script Date: 30/10/2022 12:46:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client](
	[id_client] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](30) NOT NULL,
	[last_name] [varchar](30) NOT NULL,
	[age] [int] NOT NULL,
	[address] [varchar](100) NOT NULL,
	[birthday] [date] NOT NULL,
	[gender] [varchar](30) NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_client] PRIMARY KEY CLUSTERED 
(
	[id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[game]    Script Date: 30/10/2022 12:46:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[game](
	[id_game] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[release_year] [int] NOT NULL,
	[protagonist] [varchar](50) NOT NULL,
	[director] [varchar](50) NOT NULL,
	[platform] [varchar](50) NOT NULL,
	[rental_price] [float] NOT NULL,
 CONSTRAINT [PK_game] PRIMARY KEY CLUSTERED 
(
	[id_game] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rent]    Script Date: 30/10/2022 12:46:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rent](
	[id_rent] [int] IDENTITY(1,1) NOT NULL,
	[id_game] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[returned] [bit] NOT NULL,
	[rented_date] [date] NOT NULL,
	[expiration_days] [int] NOT NULL,
 CONSTRAINT [PK_rent] PRIMARY KEY CLUSTERED 
(
	[id_rent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 30/10/2022 12:46:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[id_client] [int] NOT NULL,
	[admin] [bit] NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[client] ON 

INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (1, N'Johan', N'Mendez', 21, N'Cll 17e', CAST(N'2001-03-31' AS Date), N'Male', N'jamacea@uninorte.edu.co')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (2, N'Sasa', N'Mama', 20, N'Cll 16', CAST(N'2003-05-08' AS Date), N'Female', N'wawa@gmail.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (3, N'Noach', N'Gummory', 44, N'471 Superior Way', CAST(N'2010-11-18' AS Date), N'Male', N'ngummory0@blogtalkradio.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (4, N'Tamra', N'Kittredge', 58, N'8 Merchant Place', CAST(N'2004-06-08' AS Date), N'Female', N'tkittredge1@delicious.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (5, N'Britteny', N'Sally', 67, N'7 Armistice Terrace', CAST(N'1981-06-07' AS Date), N'Female', N'bsally2@tinypic.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (6, N'Cassey', N'Bloan', 28, N'326 Susan Plaza', CAST(N'1993-10-06' AS Date), N'Female', N'cbloan3@theatlantic.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (7, N'Kakalina', N'Garlicke', 15, N'9 Harper Hill', CAST(N'1990-07-17' AS Date), N'Genderfluid', N'kgarlicke4@indiatimes.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (8, N'Wait', N'Primett', 20, N'9786 Stang Circle', CAST(N'1990-06-02' AS Date), N'Polygender', N'wprimett5@over-blog.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (9, N'Willard', N'Telega', 56, N'3 Beilfuss Avenue', CAST(N'1987-02-24' AS Date), N'Male', N'wtelega6@sbwire.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (10, N'Tedman', N'Boucher', 78, N'30850 Toban Plaza', CAST(N'2018-02-06' AS Date), N'Male', N'tboucher7@utexas.edu')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (11, N'Durward', N'Bennoe', 30, N'0 Sutherland Crossing', CAST(N'1985-06-18' AS Date), N'Male', N'dbennoe8@last.fm')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (12, N'Heidi', N'Ladon', 57, N'72 Eagle Crest Terrace', CAST(N'1985-12-15' AS Date), N'Female', N'hladon9@issuu.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (13, N'Ade', N'Haffard', 29, N'7 Weeping Birch Road', CAST(N'1997-06-06' AS Date), N'Polygender', N'ahaffarda@slashdot.org')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (14, N'Haley', N'McIlhagga', 61, N'503 Summit Alley', CAST(N'2022-04-25' AS Date), N'Female', N'hmcilhaggab@hud.gov')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (15, N'Maribeth', N'Rakestraw', 11, N'9282 Bluejay Road', CAST(N'2007-12-09' AS Date), N'Female', N'mrakestrawc@squarespace.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (16, N'Adriano', N'Schimank', 12, N'3978 Vahlen Place', CAST(N'2019-04-01' AS Date), N'Male', N'aschimankd@shinystat.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (17, N'Starr', N'Picker', 59, N'1787 Daystar Avenue', CAST(N'1993-10-23' AS Date), N'Female', N'spickere@economist.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (18, N'Lyn', N'Mallindine', 41, N'8 Springview Point', CAST(N'1990-01-22' AS Date), N'Male', N'lmallindinef@ucoz.ru')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (19, N'Rodolph', N'Kelledy', 13, N'4 Farragut Lane', CAST(N'2006-07-26' AS Date), N'Male', N'rkelledyg@bloglovin.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (20, N'Jania', N'Djorevic', 19, N'3 Tony Junction', CAST(N'2002-09-24' AS Date), N'Female', N'jdjorevich@oakley.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (21, N'Conni', N'Brodest', 6, N'001 Hanover Street', CAST(N'2000-03-16' AS Date), N'Female', N'cbrodesti@nps.gov')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (22, N'Reena', N'Collingwood', 53, N'1957 Declaration Crossing', CAST(N'1996-07-15' AS Date), N'Female', N'rcollingwoodj@surveymonkey.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (23, N'Angelina', N'French', 45, N'209 Graceland Point', CAST(N'2021-07-24' AS Date), N'Female', N'afrenchk@miitbeian.gov.cn')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (24, N'Wallache', N'Ickovic', 47, N'2272 Kipling Trail', CAST(N'1984-12-08' AS Date), N'Male', N'wickovicl@cdbaby.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (25, N'Chris', N'Croote', 50, N'9 Homewood Court', CAST(N'1988-10-07' AS Date), N'Female', N'ccrootem@instagram.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (26, N'Cam', N'Polley', 30, N'9 Merchant Terrace', CAST(N'2002-12-30' AS Date), N'Female', N'cpolleyn@angelfire.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (27, N'Marice', N'Stroton', 21, N'1742 Cambridge Avenue', CAST(N'1994-02-26' AS Date), N'Female', N'mstrotono@php.net')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (28, N'Talia', N'Wrightam', 75, N'7 Badeau Road', CAST(N'2018-01-07' AS Date), N'Female', N'twrightamp@state.tx.us')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (29, N'Trixi', N'Teffrey', 47, N'26 Jenna Hill', CAST(N'2009-10-05' AS Date), N'Female', N'tteffreyq@wikipedia.org')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (30, N'Ramon', N'Coultas', 76, N'7079 Mallory Alley', CAST(N'2014-12-27' AS Date), N'Male', N'rcoultasr@elegantthemes.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (31, N'Jenny', N'Hanaby', 21, N'9305 Alpine Pass', CAST(N'2007-12-13' AS Date), N'Female', N'jhanabys@opera.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (32, N'Hanson', N'Dodd', 26, N'86059 Kropf Parkway', CAST(N'2006-09-13' AS Date), N'Male', N'hdoddt@cnbc.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (33, N'Claybourne', N'Pheasey', 69, N'04 Chinook Court', CAST(N'1999-04-16' AS Date), N'Male', N'cpheaseyu@themeforest.net')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (34, N'Cacilie', N'McRae', 76, N'10 Clarendon Street', CAST(N'2016-06-08' AS Date), N'Female', N'cmcraev@meetup.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (35, N'Kailey', N'Phipps', 65, N'929 Saint Paul Park', CAST(N'2007-02-17' AS Date), N'Female', N'kphippsw@google.com.au')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (36, N'Ferdinande', N'Caine', 77, N'4130 Katie Center', CAST(N'2011-08-06' AS Date), N'Female', N'fcainex@google.ru')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (37, N'Ariella', N'Devoy', 46, N'2 Di Loreto Place', CAST(N'1989-07-27' AS Date), N'Female', N'adevoyy@ucsd.edu')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (38, N'Westbrook', N'Remirez', 53, N'4 Moose Junction', CAST(N'1989-03-09' AS Date), N'Male', N'wremirezz@merriam-webster.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (39, N'Mia', N'Stelli', 12, N'9 Weeping Birch Drive', CAST(N'2006-06-28' AS Date), N'Female', N'mstelli10@psu.edu')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (40, N'Ravid', N'Botly', 24, N'194 Fairfield Avenue', CAST(N'1999-11-05' AS Date), N'Male', N'rbotly11@spiegel.de')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (41, N'Christiano', N'Wilder', 56, N'52077 Holy Cross Court', CAST(N'1993-10-22' AS Date), N'Genderfluid', N'cwilder12@constantcontact.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (42, N'Sharla', N'Baskerville', 29, N'7776 Manitowish Center', CAST(N'1993-09-25' AS Date), N'Female', N'sbaskerville13@wordpress.org')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (43, N'Libby', N'Wedderburn', 33, N'71420 Vernon Court', CAST(N'2011-06-14' AS Date), N'Female', N'lwedderburn14@bizjournals.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (44, N'Anatollo', N'Foldes', 57, N'16 Manitowish Street', CAST(N'2011-11-09' AS Date), N'Male', N'afoldes15@kickstarter.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (45, N'Morley', N'Parysowna', 29, N'71633 Rowland Terrace', CAST(N'2004-07-30' AS Date), N'Male', N'mparysowna16@1688.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (46, N'Kylen', N'Beddard', 38, N'21 Manufacturers Road', CAST(N'1992-09-14' AS Date), N'Female', N'kbeddard17@canalblog.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (47, N'Remington', N'Bagger', 53, N'555 Logan Lane', CAST(N'2006-12-14' AS Date), N'Male', N'rbagger18@irs.gov')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (48, N'Charla', N'M''cowis', 33, N'71 Rigney Pass', CAST(N'2013-03-17' AS Date), N'Female', N'cmcowis19@mashable.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (49, N'Eldin', N'Gerrit', 44, N'109 Maple Wood Circle', CAST(N'2005-02-27' AS Date), N'Bigender', N'egerrit1a@goodreads.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (50, N'Jimmie', N'Malcolmson', 14, N'44522 Shasta Hill', CAST(N'1992-03-01' AS Date), N'Male', N'jmalcolmson1b@irs.gov')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (51, N'Doralin', N'Benjamin', 37, N'89 Lyons Terrace', CAST(N'2016-12-13' AS Date), N'Female', N'dbenjamin1c@icq.com')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (52, N'Vittorio', N'Gostridge', 43, N'5262 Springs Point', CAST(N'1996-10-14' AS Date), N'Male', N'vgostridge1d@edublogs.org')
INSERT [dbo].[client] ([id_client], [first_name], [last_name], [age], [address], [birthday], [gender], [email]) VALUES (53, N'Taranteno', N'Tarantino', 10, N'Cll 12', CAST(N'2010-10-22' AS Date), N'Male', N'Pruebita@gmail.com')
SET IDENTITY_INSERT [dbo].[client] OFF
GO
SET IDENTITY_INSERT [dbo].[game] ON 

INSERT [dbo].[game] ([id_game], [name], [release_year], [protagonist], [director], [platform], [rental_price]) VALUES (1, N'Pinball', 1970, N'Ball', N'Ballers', N'PC', 12000)
INSERT [dbo].[game] ([id_game], [name], [release_year], [protagonist], [director], [platform], [rental_price]) VALUES (2, N'Call of Duty MW1', 2009, N'Ryan', N'Infinity Ward', N'XBoX,PC,PlayStation', 20000)
INSERT [dbo].[game] ([id_game], [name], [release_year], [protagonist], [director], [platform], [rental_price]) VALUES (3, N'Sims 4', 2014, N'Sims', N'Electronic Arts', N'PlayStation,PC', 10000)
INSERT [dbo].[game] ([id_game], [name], [release_year], [protagonist], [director], [platform], [rental_price]) VALUES (4, N'Need for Speed Most Wanted', 2012, N'Brian', N'Electronic Arts', N'PlayStation, Xbox', 15000)
INSERT [dbo].[game] ([id_game], [name], [release_year], [protagonist], [director], [platform], [rental_price]) VALUES (5, N'Gta San Andreas', 2004, N'CJ', N'Rockstar North', N'PlayStation, PC, Xbox', 21000)
SET IDENTITY_INSERT [dbo].[game] OFF
GO
SET IDENTITY_INSERT [dbo].[rent] ON 

INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (1, 4, 2, 1, CAST(N'2022-10-24' AS Date), 3)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (2, 5, 2, 1, CAST(N'2022-01-03' AS Date), 1)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (3, 2, 5, 1, CAST(N'2021-10-23' AS Date), 3)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (4, 1, 6, 1, CAST(N'2022-02-24' AS Date), 1)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (5, 1, 4, 1, CAST(N'2022-02-23' AS Date), 3)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (6, 1, 4, 1, CAST(N'2022-08-01' AS Date), 2)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (7, 4, 5, 1, CAST(N'2022-08-28' AS Date), 2)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (8, 1, 2, 1, CAST(N'2022-06-15' AS Date), 2)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (9, 4, 4, 1, CAST(N'2022-09-30' AS Date), 1)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (10, 5, 7, 1, CAST(N'2021-12-31' AS Date), 2)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (11, 4, 7, 1, CAST(N'2021-11-27' AS Date), 1)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (12, 5, 5, 1, CAST(N'2022-10-07' AS Date), 3)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (13, 2, 6, 1, CAST(N'2022-05-21' AS Date), 3)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (14, 5, 2, 1, CAST(N'2021-11-07' AS Date), 3)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (15, 5, 2, 1, CAST(N'2022-10-02' AS Date), 2)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (16, 4, 2, 1, CAST(N'2022-06-13' AS Date), 1)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (17, 3, 2, 1, CAST(N'2021-12-28' AS Date), 1)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (18, 2, 5, 1, CAST(N'2021-10-27' AS Date), 3)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (19, 5, 7, 1, CAST(N'2022-04-01' AS Date), 3)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (20, 5, 5, 1, CAST(N'2022-05-16' AS Date), 1)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (21, 4, 3, 1, CAST(N'2021-12-22' AS Date), 3)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (22, 5, 6, 1, CAST(N'2022-09-28' AS Date), 3)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (23, 1, 6, 1, CAST(N'2022-05-06' AS Date), 3)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (24, 1, 7, 1, CAST(N'2022-06-08' AS Date), 1)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (25, 4, 4, 1, CAST(N'2021-11-25' AS Date), 3)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (26, 5, 3, 1, CAST(N'2022-06-25' AS Date), 3)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (27, 5, 2, 1, CAST(N'2022-08-25' AS Date), 2)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (28, 3, 3, 1, CAST(N'2022-09-30' AS Date), 3)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (29, 1, 4, 1, CAST(N'2022-04-17' AS Date), 2)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (30, 1, 7, 1, CAST(N'2022-08-08' AS Date), 2)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (31, 1, 2, 1, CAST(N'2022-10-30' AS Date), 1)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (32, 2, 7, 1, CAST(N'2022-10-30' AS Date), 2)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (33, 4, 8, 1, CAST(N'2022-10-31' AS Date), 1)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (34, 5, 10, 1, CAST(N'2022-11-01' AS Date), 1)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (35, 4, 10, 1, CAST(N'2022-11-01' AS Date), 1)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (36, 1, 11, 1, CAST(N'2022-11-02' AS Date), 2)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (37, 2, 12, 1, CAST(N'2022-11-02' AS Date), 1)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (38, 2, 4, 1, CAST(N'2022-11-03' AS Date), 1)
INSERT [dbo].[rent] ([id_rent], [id_game], [id_user], [returned], [rented_date], [expiration_days]) VALUES (39, 3, 13, 1, CAST(N'2022-11-04' AS Date), 1)
SET IDENTITY_INSERT [dbo].[rent] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (1, 1, 1, N'12345')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (2, 2, 0, N'Gwijft2woyp')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (3, 3, 0, N'LatpkPA')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (4, 4, 0, N'iXjHnrc9KBwG')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (5, 5, 0, N'uQ2CaCf')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (6, 6, 0, N'VASjgw3jHU')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (7, 7, 0, N'WWJaboar')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (8, 8, 0, N'LJlelrr')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (9, 9, 0, N'cjVNz4EZBLT6')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (10, 10, 0, N'5CSjO0lbia')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (11, 11, 0, N'7Hoa9s')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (12, 12, 0, N'tYoQwFyZ')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (13, 13, 0, N'DaPRMyERhSo')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (14, 14, 0, N'NZuEySd')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (15, 15, 0, N'1EJLZn')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (16, 16, 0, N'sQAFKP0')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (17, 17, 0, N'UqBg6qW')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (18, 18, 0, N'b02ygWstz')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (19, 19, 0, N'lX1hgg880G')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (20, 20, 0, N'fNscbrkN')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (21, 21, 0, N's7ZOCCN2C')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (22, 22, 0, N'8DDXvn1a')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (23, 23, 0, N'LnbLcBR9Q7j')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (24, 24, 0, N'GLEu0nf')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (25, 25, 0, N'GvWTWo')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (26, 26, 0, N'Qh6Hjr')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (27, 27, 0, N'yx9E3r38u')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (28, 28, 0, N'6qYbEh')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (29, 29, 0, N'n2AD9wsT')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (30, 30, 0, N'ug0WAdDCZT')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (31, 31, 0, N'TRqcpoguX6qp')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (32, 32, 0, N'cnbmk9')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (33, 33, 0, N'Lk2AwEQe7mOy')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (34, 34, 0, N'uon5qkPSkwb0')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (35, 35, 0, N'A6dtmM5Vs7bF')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (36, 36, 0, N'NxhVHPd')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (37, 37, 0, N'jubWjXrdvnA')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (38, 38, 0, N'cBesvWlLC')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (39, 39, 0, N'yHEFCwmi')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (40, 40, 0, N'gbZ5YzsADog')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (41, 41, 0, N'tx8FLI')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (42, 42, 0, N'YT1BJZMLxS')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (43, 43, 0, N'nKLsSJR')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (44, 44, 0, N'kboXaW')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (45, 45, 0, N'eo9URT')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (46, 46, 0, N'R5QYXFw9IDgK')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (47, 47, 0, N'YcFCkI')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (48, 48, 0, N'CMJDnPN7')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (49, 49, 0, N'5fZhLFE')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (50, 50, 0, N'mpbftLsnCK')
INSERT [dbo].[user] ([id_user], [id_client], [admin], [password]) VALUES (51, 51, 0, N'yQe3xb')
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[rent]  WITH CHECK ADD  CONSTRAINT [FK_rent_game] FOREIGN KEY([id_game])
REFERENCES [dbo].[game] ([id_game])
GO
ALTER TABLE [dbo].[rent] CHECK CONSTRAINT [FK_rent_game]
GO
ALTER TABLE [dbo].[rent]  WITH CHECK ADD  CONSTRAINT [FK_rent_user] FOREIGN KEY([id_user])
REFERENCES [dbo].[user] ([id_user])
GO
ALTER TABLE [dbo].[rent] CHECK CONSTRAINT [FK_rent_user]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_user_client] FOREIGN KEY([id_client])
REFERENCES [dbo].[client] ([id_client])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_user_client]
GO
USE [master]
GO
ALTER DATABASE [RentGames] SET  READ_WRITE 
GO
