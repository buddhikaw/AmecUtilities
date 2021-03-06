USE [master]
GO
/****** Object:  Database [Amec]    Script Date: 2017-01-28 11:27:06 AM ******/
CREATE DATABASE [Amec]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Amec', FILENAME = N'D:\RDSDBDATA\DATA\Amec.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Amec_log', FILENAME = N'D:\RDSDBDATA\DATA\Amec_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Amec] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Amec].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Amec] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Amec] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Amec] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Amec] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Amec] SET ARITHABORT OFF 
GO
ALTER DATABASE [Amec] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Amec] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Amec] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Amec] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Amec] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Amec] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Amec] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Amec] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Amec] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Amec] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Amec] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Amec] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Amec] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Amec] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Amec] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Amec] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Amec] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Amec] SET RECOVERY FULL 
GO
ALTER DATABASE [Amec] SET  MULTI_USER 
GO
ALTER DATABASE [Amec] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Amec] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Amec] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Amec] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Amec] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Amec]
GO
/****** Object:  User [buddhikaw]    Script Date: 2017-01-28 11:27:06 AM ******/
CREATE USER [buddhikaw] FOR LOGIN [buddhikaw] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [AmecApp]    Script Date: 2017-01-28 11:27:06 AM ******/
CREATE USER [AmecApp] FOR LOGIN [AmecApp] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [buddhikaw]
GO
ALTER ROLE [db_owner] ADD MEMBER [AmecApp]
GO
/****** Object:  Table [dbo].[amec_leaves]    Script Date: 2017-01-28 11:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[amec_leaves](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nt_id] [varchar](15) NOT NULL,
	[leave_type] [nvarchar](max) NOT NULL,
	[leave_type_desc] [nvarchar](max) NOT NULL,
	[leave_date_type] [nvarchar](max) NOT NULL,
	[leave_date] [date] NOT NULL,
	[leave_remarks] [nvarchar](max) NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[created_by] [nvarchar](15) NULL,
	[updated_by] [nvarchar](15) NULL,
 CONSTRAINT [PK_amec_leaves] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_amec_leaves] UNIQUE NONCLUSTERED 
(
	[nt_id] ASC,
	[leave_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


GO
/****** Object:  Table [dbo].[amec_leaves_log]    Script Date: 2017-01-28 11:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[amec_leaves_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[leave_id] [int] NOT NULL,
	[action] [varchar](15) NOT NULL,
	[nt_id] [varchar](15) NOT NULL,
	[leave_type] [nvarchar](max) NOT NULL,
	[leave_type_desc] [nvarchar](max) NOT NULL,
	[leave_date_type] [nvarchar](max) NOT NULL,
	[leave_date] [date] NOT NULL,
	[leave_remarks] [nvarchar](max) NULL,
	[created_date] [datetime] NULL,
	[created_by] [varchar](15) NULL,
 CONSTRAINT [PK_amec_leaves_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[amec_members]    Script Date: 2017-01-28 11:27:06 AM ******/
/****** Object:  Table [dbo].[amec_members]    Script Date: 07/02/2017 16:04:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[amec_members](
	[nt_id] [varchar](15) NOT NULL,
	[name] [nvarchar](500) NULL,
	[given_name] [nvarchar](500) NULL,
	[email] [nvarchar](100) NULL,
	[created_date] [datetime] NULL,
	[updated_date] [datetime] NULL,
	[created_by] [nvarchar](100) NULL,
	[updated_by] [nvarchar](100) NULL,
	[team_id] [int] NULL,
 CONSTRAINT [PK_AmecMembers] PRIMARY KEY CLUSTERED 
(
	[nt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[amec_members]  WITH CHECK ADD  CONSTRAINT [FK_amec_members_amec_teams] FOREIGN KEY([team_id])
REFERENCES [dbo].[amec_teams] ([team_id])
GO

ALTER TABLE [dbo].[amec_members] CHECK CONSTRAINT [FK_amec_members_amec_teams]
GO

/****** Object:  StoredProcedure [dbo].[amec_leaves_submit]    Script Date: 2017-01-28 11:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[amec_leaves_submit]
@operation int, --1 insert/ 2 --delete
@ntid varchar(15),
-- @leaveType numeric(2,0),
@leaveType varchar(max),
@leaveTypeDesc varchar(max),
@leaveDateType varchar(50),
@leaveDateStr varchar(max),
@leaveRemarks varchar(max) = null
as
Begin

DECLARE @ListItem nvarchar(10), @Pos int;
Create table #tmpLvDates (leave_date date);

WHILE LEN(@leaveDateStr) > 0
Begin
      SET @Pos = CHARINDEX(',', @leaveDateStr)
       IF @Pos = 0
       Begin
               SET @ListItem = @leaveDateStr
       End
       ELSE
       Begin
               SET @ListItem = SUBSTRING(@leaveDateStr, 1, @Pos - 1)
       End
	         
       insert into #tmpLvDates values (CONVERT(datetime, @ListItem, 103));

       IF @Pos = 0
       Begin
               SET @leaveDateStr = ''
       End
       ELSE
       Begin
              SET @leaveDateStr = SUBSTRING(@leaveDateStr, @Pos + 1, LEN(@leaveDateStr) - @Pos)
       End
End

if (@operation = 1)
begin
	if not exists(select 1 from amec_leaves a join #tmpLvDates b on a.leave_date = b.leave_date where a.nt_id = @ntid  )
	begin
    INSERT INTO [dbo].[amec_leaves]
           ([nt_id]
           ,[leave_type]
           ,[leave_type_desc]
           ,[leave_date_type]
           ,[leave_date]
           ,[leave_remarks]
           ,[created_date]
           ,[created_by])
     select @ntid,@leaveType,@leaveTypeDesc,@leaveDateType,leave_date,@leaveRemarks,GETDATE(),@ntid from #tmpLvDates

	 select 0 as status, 'Success' as status_msg
	 end
	 else
	 begin
	 DECLARE @existDateStr VARCHAR(MAX)
	 select @existDateStr = COALESCE(@existDateStr + ',','') + (CONVERT(varchar, a.leave_date, 106)) from amec_leaves a join #tmpLvDates b on a.leave_date = b.leave_date where a.nt_id = @ntid
	 select 1 as status, 'Failed, Leave exists for ' + @existDateStr as status_msg
	 end
end

end
GO
/****** Object:  StoredProcedure [dbo].[amec_user_init]    Script Date: 2017-01-28 11:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[amec_user_init]
@ntid varchar(15),
@name nvarchar(500),
@email nvarchar(100),
@givenName nvarchar(500)
as
Begin
if not exists(select 1 from amec_members where nt_id = @ntid) 
begin
 	INSERT INTO [dbo].[amec_members]
			   ([nt_id]
			   ,[name]
			   ,[given_name]
			   ,[email]
			   ,[created_date]
			   ,[created_by])
		 VALUES
			   (@ntid
			   ,@name
			   ,@givenName
			   ,@email
			   ,GETDATE()
			   ,@ntid)
end
end


GO
/****** Object:  DdlTrigger [rds_deny_backups_trigger]    Script Date: 2017-01-28 11:27:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [rds_deny_backups_trigger] ON DATABASE WITH EXECUTE AS 'dbo' FOR
 ADD_ROLE_MEMBER, GRANT_DATABASE AS BEGIN
   SET NOCOUNT ON;
   SET ANSI_PADDING ON;
 
   DECLARE @data xml;
   DECLARE @user sysname;
   DECLARE @role sysname;
   DECLARE @type sysname;
   DECLARE @sql NVARCHAR(MAX);
   DECLARE @permissions TABLE(name sysname PRIMARY KEY);
   
   SELECT @data = EVENTDATA();
   SELECT @type = @data.value('(/EVENT_INSTANCE/EventType)[1]', 'sysname');
    
   IF @type = 'ADD_ROLE_MEMBER' BEGIN
      SELECT @user = @data.value('(/EVENT_INSTANCE/ObjectName)[1]', 'sysname'),
       @role = @data.value('(/EVENT_INSTANCE/RoleName)[1]', 'sysname');

      IF @role IN ('db_owner', 'db_backupoperator') BEGIN
         SELECT @sql = 'DENY BACKUP DATABASE, BACKUP LOG TO ' + QUOTENAME(@user);
         EXEC(@sql);
      END
   END ELSE IF @type = 'GRANT_DATABASE' BEGIN
      INSERT INTO @permissions(name)
      SELECT Permission.value('(text())[1]', 'sysname') FROM
       @data.nodes('/EVENT_INSTANCE/Permissions/Permission')
      AS DatabasePermissions(Permission);
      
      IF EXISTS (SELECT * FROM @permissions WHERE name IN ('BACKUP DATABASE',
       'BACKUP LOG'))
         RAISERROR('Cannot grant backup database or backup log', 15, 1) WITH LOG;       
   END
END


GO
ENABLE TRIGGER [rds_deny_backups_trigger] ON DATABASE
GO
USE [master]
GO
ALTER DATABASE [Amec] SET  READ_WRITE 
GO



/****** Object:  Table [dbo].[amec_teams]    Script Date: 07/02/2017 15:52:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[amec_teams](
	[team_id] [int] NOT NULL,
	[team_desc] [nvarchar](500) NULL,
 CONSTRAINT [PK_amec_teams] PRIMARY KEY CLUSTERED 
(
	[team_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE PROCEDURE amec_get_holidays
@retHolidays varchar(max) output
AS 
BEGIN
declare @strHolidays varchar(max)
select @strHolidays = COALESCE(@strHolidays+',','') + CONVERT(varchar,holiday,103) from amec_holidays where holiday between DATEADD(MONTH,-12,getdate()) AND DATEADD(MONTH,18,getdate())
set @retHolidays = @strHolidays;
END
