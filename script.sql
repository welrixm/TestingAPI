USE [UserAPI]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 24.06.2023 1:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 24.06.2023 1:13:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'admin')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'client')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (1, N'alina', 22, 1)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (2, N'paul', 21, 2)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (3, N'kate', 23, 2)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (4, N'daniel', 43, 2)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (5, N'lena', 21, 2)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (6, N'aaaa', 111, 2)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (7, N'dddd', 22, 1)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (8, N'ssssss', 23, 1)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (9, N'hhhh', 65, 2)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (10, N'eeee', 333, 1)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (11, N'dd', 34, 1)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (12, N'jjj', 33, 2)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (13, N'qwerty', 22, 1)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (14, N'qwerty', 22, 2)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (15, N'fff', 123, 2)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (16, N'aaa', 22, 1)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (17, N'ss', 22, 1)
INSERT [dbo].[User] ([Id], [Name], [Age], [RoleId]) VALUES (18, N'ss', 22, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
