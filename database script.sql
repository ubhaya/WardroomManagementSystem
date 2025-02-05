USE [master]
GO
/****** Object:  Database [NHQ_VICTUALING]    Script Date: 9/30/2024 11:51:00 AM ******/
CREATE DATABASE [NHQ_VICTUALING]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VICTULING', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\NHQ_VICTUALING.mdf' , SIZE = 961536KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VICTULING_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\NHQ_VICTUALING_log.ldf' , SIZE = 3164032KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NHQ_VICTUALING] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NHQ_VICTUALING].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NHQ_VICTUALING] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET ARITHABORT OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [NHQ_VICTUALING] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NHQ_VICTUALING] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NHQ_VICTUALING] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NHQ_VICTUALING] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NHQ_VICTUALING] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET RECOVERY FULL 
GO
ALTER DATABASE [NHQ_VICTUALING] SET  MULTI_USER 
GO
ALTER DATABASE [NHQ_VICTUALING] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NHQ_VICTUALING] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NHQ_VICTUALING] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NHQ_VICTUALING] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'NHQ_VICTUALING', N'ON'
GO
USE [NHQ_VICTUALING]
GO
/****** Object:  User [Mobile_App]    Script Date: 9/30/2024 11:51:00 AM ******/
CREATE USER [Mobile_App] FOR LOGIN [Mobile_App] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [it119380]    Script Date: 9/30/2024 11:51:00 AM ******/
CREATE USER [it119380] FOR LOGIN [it119380] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [it112904]    Script Date: 9/30/2024 11:51:00 AM ******/
CREATE USER [it112904] FOR LOGIN [it112904] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [it110075]    Script Date: 9/30/2024 11:51:00 AM ******/
CREATE USER [it110075] FOR LOGIN [it110075] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [it109476]    Script Date: 9/30/2024 11:51:00 AM ******/
CREATE USER [it109476] FOR LOGIN [it109476] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [it100434]    Script Date: 9/30/2024 11:51:00 AM ******/
CREATE USER [it100434] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [IIS_USER_VICTUALING]    Script Date: 9/30/2024 11:51:00 AM ******/
CREATE USER [IIS_USER_VICTUALING] FOR LOGIN [IIS_USER_VICTUALING] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Mobile_App]
GO
ALTER ROLE [db_owner] ADD MEMBER [it119380]
GO
ALTER ROLE [db_owner] ADD MEMBER [it112904]
GO
ALTER ROLE [db_owner] ADD MEMBER [it110075]
GO
ALTER ROLE [db_owner] ADD MEMBER [it109476]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS_USER_VICTUALING]
GO
/****** Object:  StoredProcedure [dbo].[Get_User_Role]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Get_User_Role]
@userName varchar(250)
as 
select [roll] from [dbo].[T_Login] where [userName]=@userName

GO
/****** Object:  StoredProcedure [dbo].[GetAllDetails]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Tea Count
-- =============================================
CREATE PROCEDURE [dbo].[GetAllDetails] 
@officialNo varchar(50),
@serviceType varchar(50),
@OS varchar(10)



as
BEGIN	

select * from T_IndividualBasic where officialNo = @officialNo and serviceType = @serviceType and OS = @OS

END

--execute [VICTULING_GetTeaCount] '2017-12-04','60000001'





GO
/****** Object:  StoredProcedure [dbo].[GetMonthlyTeaCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMonthlyTeaCost] 
	-- Add the parameters for the stored procedure here
	@wardroom varchar(50),
	@year int,
	@month varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT teaCost, plainTeaCost from [dbo].[T_MonthlyTeaCost] WHERE [Year]=@year AND [month]=@month
END


GO
/****** Object:  StoredProcedure [dbo].[HRIS_MaxItem_Code]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma
-- Description: Use to find maximun item Code 
-- =============================================
CREATE PROCEDURE [dbo].[HRIS_MaxItem_Code] 
		
AS
BEGIN
	
SELECT  max(itemCode)
  FROM [dbo].[M_Item]
	
	
END 





GO
/****** Object:  StoredProcedure [dbo].[HRIS_MaxMenuItem_Code]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma
-- Description: Use to find maximun menu item Code 
-- =============================================
CREATE PROCEDURE [dbo].[HRIS_MaxMenuItem_Code] 
		
AS
BEGIN
	
SELECT  max(mainItemCode)
  FROM [dbo].[M_MainItem]
	
	
END 





GO
/****** Object:  StoredProcedure [dbo].[HRIS_PersonalRecord_Area]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[HRIS_PersonalRecord_Area] 

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Select Area Name without Non Active Naval Area and Naval Headquarters
-- =============================================
AS
BEGIN


SELECT a.[areaName],a.areaCode
  FROM [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_areas] as a
  WHERE a.areaCode not in(11100000)
  order by a.areaName ASC

END








GO
/****** Object:  StoredProcedure [dbo].[HRIS_PersonalRecord_Base]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147

-- Description: Select All Base by Area
-- =============================================
CREATE PROCEDURE [dbo].[HRIS_PersonalRecord_Base] @areaName varchar(50)
as
BEGIN
select dn.baseName, dn.baseCode,dn.baseDescription
from [10.10.1.215].[HRISLIVE].[dbo].HRIS_M_base as dn,[10.10.1.215].[HRISLIVE].[dbo].HRIS_M_areas as pr
where dn.areaCode =pr.areaCode and pr.areaName = @areaName and dn.isActive = '1'
order by baseDescription ASC
END








GO
/****** Object:  StoredProcedure [dbo].[HRIS_PersonalRecord_rankRateByOfficer]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HRIS_PersonalRecord_rankRateByOfficer]  
as
select dn.rankRate, dn. rankRateCode,dn.description
from [10.10.1.215].[HRISLIVE].[dbo].HRIS_M_rankRate as dn,[10.10.1.215].[HRISLIVE].[dbo].HRIS_M_navalCategory as pr
where dn.officerSailor =pr.navalCategoryCode and pr.navalCategory = 'Officer' and rankRate not in ('TLt','WRONG')
order by [priority] ASC



GO
/****** Object:  StoredProcedure [dbo].[HRIS_Save_Item]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to create new aitem
-- =============================================
CREATE PROCEDURE [dbo].[HRIS_Save_Item]  
@itemCode varchar(50),
@item varchar(250),
@itemCatagoryCode varchar(50),
@itemMessurmentCode varchar(50),
@handsStock varchar(50),
@mainItemCode varchar(50),
@wordRoomCode varchar(50),
@createdUser varchar(70),
@createdDate datetime
                                                              
AS

BEGIN



	INSERT INTO [dbo].[M_Item]
            (   itemCode ,
				item ,
				itemCatagoryCode ,
				itemMessurmentCode ,
				--handsStock ,
				mainItemCode ,
				--wordRoomCode ,
				createdUser ,
				createdDate 

           )
VALUES
		(  @itemCode ,
		@item ,
		@itemCatagoryCode ,
		@itemMessurmentCode ,
		--@handsStock ,
		@mainItemCode ,
		--@wordRoomCode ,
		@createdUser ,
		@createdDate 
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[HRIS_Search_GetAllCivilDetails]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Select Official No.,Service Type(RNF,VNF like wise),Officer or Sailor
-- =============================================
CREATE PROCEDURE [dbo].[HRIS_Search_GetAllCivilDetails] 
	
	@off varchar(100),
	@sevtype varchar(100)

	
AS
BEGIN
	


	SELECT *
	from T_CivilPersonalDetails	
	where officialNo = @off and serviceType=@sevtype 
	
	
	

END 




GO
/****** Object:  StoredProcedure [dbo].[HRIS_Victualling_GetDetails]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lt (IT) KAUK Hettiarachchi

-- Description:	Get Base, Email, Officer/Sailor for Wardroom Victualling
-- =============================================
CREATE PROCEDURE [dbo].[HRIS_Victualling_GetDetails] 
	-- Add the parameters for the stored procedure here
	@officialNo int,
	@officerSailor varchar(1),
	@serviceType varchar(10)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT tp.emailAddress, base.baseName, b.branchId + Cast(tp.officialNo as nvarchar) as officialNo, base.wardroomCode, w.wardroomName, area.[areaName], tp.gender, CONVERT (varchar(4),DATEPART(Year, tp.dateOfBirth)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tp.dateOfBirth)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tp.dateOfBirth)) AS dateOfBirth
	
	FROM 
		[10.10.1.215].[HRISLIVE].[dbo].HRIS_T_personalData as tp inner join
		[10.10.1.215].[HRISLIVE].[dbo].HRIS_M_branch as b on tp.branchCode=b.branchCode inner join
		[10.10.1.215].[HRISLIVE].[dbo].HRIS_M_base as base on tp.permanentBaseCode=base.baseCode inner join
		[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_areas] as area on tp.[permanentAreaCode]=area.[areaCode] inner join
		[dbo].[M_Wardroom] as w on base.wardroomCode=w.wardroomCode
		

	WHERE tp.officialNo=@officialNo AND tp.officerSailor=@officerSailor AND tp.isActive='true' and tp.serviceType = @serviceType -- and b.branchID=@branchId
END


--execute [HRIS_Victualling_GetDetails] '3701','O','RNF'

GO
/****** Object:  StoredProcedure [dbo].[select_Base]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get Personal Data
-- =============================================
CREATE proc [dbo].[select_Base]

as
BEGIN









select baseCode,baseName from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_base] where isActive=1
order by baseName



end



GO
/****** Object:  StoredProcedure [dbo].[Select_Base_In_Area]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get Personal Data
-- =============================================
CREATE proc [dbo].[Select_Base_In_Area]
@areaCode varchar(20)

as
BEGIN





select baseCode ,baseName  from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_base] where isActive=1 and areaCode=@areaCode





end



GO
/****** Object:  StoredProcedure [dbo].[Update_Upload_Date_BaseCode]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get Personal Data
-- =============================================
CREATE proc [dbo].[Update_Upload_Date_BaseCode]
 @baseCode varchar(50)

as
BEGIN

 update TempMonthly304Data
 set baseCode=@baseCode 

 --insert into Monthly304Data
 --select * from TempMonthly304Data


end

--execute [Update_Upload_Date_BaseCode] '11110200'
GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Check_Nic_Exists]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Check_Nic_Exists]

@NIC varchar(20)

AS
BEGIN
	
	select [nicNo] from [dbo].[T_Login] where [nicNo] = @NIC

END


GO
/****** Object:  StoredProcedure [dbo].[VICTULING_CheckMealAttendance]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_CheckMealAttendance] 
	@off varchar(100),	
	@off_sailor varchar(100),
	@date varchar(100),
	@reasonCode varchar(100),
	@wardroomCode varchar(100)
		



as
BEGIN	



select 
tm.officialNo
,mr.rankRate
,tp.initials + ' ' + tp.surename as fullName
,tm.mealCount
,tm.mealId
,cd.branchID
,mb.baseDescription as baseName
,tm.mealIn
, tm.mealOut
,tm.vegetarian
,tm.noneVegetarian
,tm.mealCount
,tp.image
,tp.nicNo_SSID
,tp.serviceType
, tm.mealDate
,tm.reason
, tm.wardroom

--tp.initials + ' ' + tp.surename as fullName
--,tp.officialNo
--,mr.rankRate
--,tp.image
--,tp.nicNo_SSID
--,tp.serviceType
--,tm.mealCount
--,tm.mealId
--,cd.branchID
--,mb.baseDescription as baseName
--,tm.mealIn
--, tm.mealOut
--,tm.vegetarian
--,tm.noneVegetarian
--,tm.mealCount
--, tm.mealDate
--,tm.reason
--, tm.wardroom

from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp 

left join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr 
on mr.rankRateCode = tp.rankRateCode

left join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as cd
on tp.branchCode = cd.branchCode

left join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_base] as mb
on tp.permanentBaseCode = mb.baseCode 

left join [T_MealAttendance] as tm 
on  tp.officialNo = tm.officialNo 
and tp.officerSailor = tm.officerSailor

left join [M_ItemReason] as tr
on tr.reasonCode = tm.reason


where 
tp.officerSailor = 'O' 
and tp.isActive = 'true' 
and tp.officialNo = @off 
and tp.officerSailor = @off_sailor 
and tm.mealDate = @date 
and tm.reason = @reasonCode  
and tm.wardroom = @wardroomCode  
and tm.groupMenuCode = '70000000'


--and tr.reasonCode = tm.reason 


--and tp.branchCode = cd.branchCode  
--and tp.permanentBaseCode = mb.baseCode 
--and tp.officialNo = tm.officialNo 
--and tp.officerSailor = tm.officerSailor

order by mr.[priority],tm.officialNo


END

--execute [VICTULING_CheckMealAttendance] 3147,'O','2024-07-3','30000002','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_CheckMealAttendance_NotIn]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_CheckMealAttendance_NotIn] 
	@off varchar(100),	
	@off_sailor varchar(100)

		



as
BEGIN	



select 


tp.initials + ' ' + tp.surename as fullName
,tp.officialNo
,mr.rankRate
,tp.image
,tp.nicNo_SSID
,tp.serviceType
,cd.branchID
,mb.baseDescription as baseName


from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp 

left join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr 
on mr.rankRateCode = tp.rankRateCode

left join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as cd
on tp.branchCode = cd.branchCode

left join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_base] as mb
on tp.permanentBaseCode = mb.baseCode 





where 
tp.officerSailor = 'O' 
and tp.isActive = 'true' 
and tp.officialNo = @off 
and tp.officerSailor = @off_sailor 




END

--execute [VICTULING_CheckMealAttendance_NotIn] 3147,'O','2024-07-2','30000002','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_DailySaleSummery]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get Daily Sale Summery Sheet
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_DailySaleSummery] 
--@wardroomName varchar(150),
--@onChargeDate date

@saleDate date,
@wardroomName varchar(50)

as
BEGIN	


--menu--
select mi.itemCode,mi.item,round(ts.saleQty,4) as saleQty,mm.itemMessurment,
CONVERT (varchar(4),DATEPART(Year, ts.[date])) + '/' + CONVERT (varchar(2), DATEPART(MONTH, ts.[date])) + '/' + CONVERT (varchar(2), DATEPART(DAY, ts.[date])) AS [date]
,mr.reason,'' as GroupMenu
from [dbo].[T_DailyMenuSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mr
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode 
and mw.wardroomCode = @wardroomName and ts.[date] = @saleDate and ts.saleQty !='0.000'
and  mr.reasonCode = ts.reasonCode and ts.reasonCode != '30000004'
order by mi.item ASC

--extra--
select mi.itemCode,mi.item,round(td.saleQty,4) as saleQty,mm.itemMessurment,
CONVERT (varchar(4),DATEPART(Year, td.[saleDate])) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.[saleDate])) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.[saleDate])) AS [date]
,mr.reason,mg.GroupMenu
from [dbo].[T_DailyExtraSales] as td,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mr,[M_GroupMenu] as mg
where mi.itemCode = td.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = td.wardroomCode 
and mw.wardroomCode = @wardroomName and td.[saleDate]  = @saleDate and td.saleQty !='0.000'
and  mr.reasonCode = td.reasonCode and mg.GroupMenuCode = td.groupType and td.reasonCode != '30000004'
order by mi.item ASC

--party--
select mi.itemCode,mi.item,round(ts.saleQty,4) as saleQty,mm.itemMessurment,
CONVERT (varchar(4),DATEPART(Year, ts.[date])) + '/' + CONVERT (varchar(2), DATEPART(MONTH, ts.[date])) + '/' + CONVERT (varchar(2), DATEPART(DAY, ts.[date])) AS [date]
,mr.reason,'' as GroupMenu
from [dbo].[T_DailyMenuSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mr
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode 
and mw.wardroomCode = @wardroomName and ts.[date] = @saleDate and ts.saleQty !='0.000'
and  mr.reasonCode = ts.reasonCode and ts.reasonCode = '30000004'
order by mi.item ASC

--Depreciation--
select mi.itemCode,mi.item,round(tde.depreciationQty,4) as  saleQty,mm.itemMessurment,
CONVERT (varchar(4),DATEPART(Year, tde.depreciationDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tde.depreciationDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tde.depreciationDate)) AS [date]
,mr.reason,'' as GroupMenu
from [dbo].[T_DepreciationItems] as tde,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mr
where mi.itemCode = tde.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = tde.wordRoomCode 
and mw.wardroomCode = @wardroomName and tde.depreciationDate  = @saleDate and tde.depreciationQty !='0.000'
and  mr.reasonCode = tde.reasonCode 
order by mi.item ASC


END

--execute [VICTULING_DailySaleSummery] '2020-01-01','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_DailySaleSummery_price]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get Daily Sale Summery Sheet
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_DailySaleSummery_price] 
--@wardroomName varchar(150),
--@onChargeDate date

@saleDate date,
@wardroomName varchar(50)

as
BEGIN	


--menu--
select mi.itemCode,mi.item,round(ts.saleQty,4) as saleQty,mm.itemMessurment,
CONVERT (varchar(4),DATEPART(Year, ts.[date])) + '/' + CONVERT (varchar(2), DATEPART(MONTH, ts.[date])) + '/' + CONVERT (varchar(2), DATEPART(DAY, ts.[date])) AS [date]
,mr.reason,'' as GroupMenu,ts.unitPrice,round(ts.price,4) as price
from [dbo].[T_DailyMenuSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mr
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode 
and mw.wardroomCode = @wardroomName and ts.[date] = @saleDate and ts.saleQty !='0.000'
and  mr.reasonCode = ts.reasonCode and ts.reasonCode != '30000004'
order by mi.item ASC

--extra--
select mi.itemCode,mi.item,round(td.saleQty,4) as saleQty,mm.itemMessurment,
CONVERT (varchar(4),DATEPART(Year, td.[saleDate])) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.[saleDate])) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.[saleDate])) AS [date]
,mr.reason,mg.GroupMenu,td.unitPrice,round(td.totalCost,4) as totalCost
from [dbo].[T_DailyExtraSales] as td,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mr,[M_GroupMenu] as mg
where mi.itemCode = td.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = td.wardroomCode 
and mw.wardroomCode = @wardroomName and td.[saleDate]  = @saleDate and td.saleQty !='0.000'
and  mr.reasonCode = td.reasonCode and mg.GroupMenuCode = td.groupType and td.reasonCode != '30000004'
order by mi.item ASC

--party--
select mi.itemCode,mi.item,round(ts.saleQty,4) as saleQty,mm.itemMessurment,
CONVERT (varchar(4),DATEPART(Year, ts.[date])) + '/' + CONVERT (varchar(2), DATEPART(MONTH, ts.[date])) + '/' + CONVERT (varchar(2), DATEPART(DAY, ts.[date])) AS [date]
,mr.reason,mg.GroupMenu as GroupMenu,ts.unitPrice ,round(ts.price,4) as price
from [dbo].[T_DailyMenuSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mr,[dbo].[M_GroupMenu] as mg
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode 
and mw.wardroomCode = @wardroomName and ts.[date] = @saleDate and ts.saleQty !='0.000'
and  mr.reasonCode = ts.reasonCode and ts.reasonCode = '30000004' and ts.menuType = mg.GroupMenuCode
order by mi.item ASC

--Depreciation--
select mi.itemCode,mi.item,round(tde.depreciationQty,4) as saleQty,mm.itemMessurment,
CONVERT (varchar(4),DATEPART(Year, tde.depreciationDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tde.depreciationDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tde.depreciationDate)) AS [date]
,mr.reason,'' as GroupMenu,tde.unitPrice , round(tde.price,4) as price
from [dbo].[T_DepreciationItems] as tde,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mr
where mi.itemCode = tde.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = tde.wordRoomCode 
and mw.wardroomCode = @wardroomName and tde.depreciationDate  = @saleDate and tde.depreciationQty !='0.000'
and  mr.reasonCode = tde.reasonCode 
order by mi.item ASC


END

--execute [VICTULING_DailySaleSummery_price] '2021-03-09','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_DailySaleSummerySheet]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get Daily Sale Summery Sheet
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_DailySaleSummerySheet] 
@wardroomName varchar(150),
@onChargeDate date


as
BEGIN	

--menu--
select mi.itemCode,mi.item,round(sum(convert(float,ts.saleQty)),3) as saleQty ,mm.itemMessurment
from [dbo].[T_DailyMenuSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode 
and mw.wardroomCode = @wardroomName and ts.[date] = @onChargeDate  and ts.saleQty !='0.000'  and ts.reasonCode != '30000004'
group by mi.itemCode,mi.item,mm.itemMessurment
order by mi.item

--extra--
select mi.itemCode,mi.item,round(sum(convert(float,td.saleQty)),3) as saleQty ,mm.itemMessurment
from [dbo].[T_DailyExtraSales] as td,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = td.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = td.wardroomCode 
and mw.wardroomCode = @wardroomName and td.[saleDate] = @onChargeDate and td.saleQty !='0.000' and td.reasonCode != '30000004'
group by mi.itemCode,mi.item,mm.itemMessurment
order by mi.item

--party--
select mi.itemCode,mi.item,round(sum(convert(float,td.saleQty)),3) as saleQty ,mm.itemMessurment
from [dbo].[T_DailyMenuSales] as td,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = td.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = td.wordRoomCode 
and mw.wardroomCode = @wardroomName and td.[date] = @onChargeDate and td.saleQty !='0.000' and td.reasonCode = '30000004'
group by mi.itemCode,mi.item,mm.itemMessurment
order by mi.item

--Depreciation--
select mi.itemCode,mi.item,round(sum(convert(float,tde.depreciationQty)),3) as saleQty,mm.itemMessurment
from [dbo].[T_DepreciationItems] as tde,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = tde.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = tde.wordRoomCode 
and mw.wardroomCode = @wardroomName and tde.depreciationDate = @onChargeDate and tde.depreciationQty !='0.000'
group by mi.itemCode,mi.item,mm.itemMessurment
order by mi.item


END

--execute [VICTULING_DailySaleSummerySheet] '60000001','2019-12-01'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_DailySaleSummerySheet_New]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get Daily Sale Summery Sheet
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_DailySaleSummerySheet_New] 
@wardroomName varchar(150),
@onChargeDate date


as
BEGIN	

--menu--
select mi.itemCode,mi.item,sum(convert(float,ts.saleQty)) as saleQty ,mm.itemMessurment
from [dbo].[T_DailyMenuSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode 
and mw.wardroomCode = @wardroomName and ts.[date] = @onChargeDate  and ts.saleQty !='0.000'
group by mi.itemCode,mi.item,mm.itemMessurment
order by mi.item

--extra--
select mi.itemCode,mi.item,sum(convert(float,td.saleQty)) as saleQty ,mm.itemMessurment
from [dbo].[T_DailyExtraSales] as td,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = td.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = td.wardroomCode 
and mw.wardroomCode = @wardroomName and td.[saleDate] = @onChargeDate and td.saleQty !='0.000' and td.reasonCode != '30000004'
group by mi.itemCode,mi.item,mm.itemMessurment
order by mi.item

--party--
select mi.itemCode,mi.item,sum(convert(float,td.saleQty)) as saleQty ,mm.itemMessurment
from [dbo].[T_DailyExtraSales] as td,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = td.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = td.wardroomCode 
and mw.wardroomCode = @wardroomName and td.[saleDate] = @onChargeDate and td.saleQty !='0.000' and td.reasonCode = '30000004'
group by mi.itemCode,mi.item,mm.itemMessurment
order by mi.item

--Depreciation--
select mi.itemCode,mi.item,sum(convert(float,tde.depreciationQty)) as saleQty,mm.itemMessurment
from [dbo].[T_DepreciationItems] as tde,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = tde.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = tde.wordRoomCode 
and mw.wardroomCode = @wardroomName and tde.depreciationDate = @onChargeDate and tde.depreciationQty !='0.000'
group by mi.itemCode,mi.item,mm.itemMessurment
order by mi.item


END

--execute [VICTULING_DailySaleSummerySheet_New] '60000001','2019-12-01'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_DailySaleSummerySheet_Old]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get Daily Sale Summery Sheet
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_DailySaleSummerySheet_Old] 
@wardroomName varchar(150),
@onChargeDate date


as
BEGIN	

CREATE TABLE #tempSummary(
	[itemCode] [varchar](50) ,
	[item] [varchar](50) ,
	--[unitPrice] [varchar](20) ,
	[saleQty] [varchar](20), 
	[itemMessurment] [varchar](20) 

)

INSERT INTO #tempSummary
           ([itemCode]
           ,[item]
           --,[unitPrice]
           ,[saleQty]
           ,[itemMessurment])

select mi.itemCode,mi.item,ts.saleQty,mm.itemMessurment
--,ts.reasonCode

from [dbo].[T_DailyMenuSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode 
and mw.wardroomCode = @wardroomName and ts.[date] = @onChargeDate and ts.saleQty !='0.000'
--order by mi.item

union

select mi.itemCode,mi.item,td.saleQty,mm.itemMessurment
--,td.reasonCode

from [dbo].[T_DailyExtraSales] as td,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = td.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = td.wardroomCode 
and mw.wardroomCode = @wardroomName and td.[saleDate] = @onChargeDate and td.saleQty !='0.000'
--order by mi.item

union

select mi.itemCode,mi.item,tde.depreciationQty as saleQty,mm.itemMessurment
--,tde.reasonCode

from [dbo].[T_DepreciationItems] as tde,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = tde.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = tde.wordRoomCode 
and mw.wardroomCode = @wardroomName and tde.depreciationDate = @onChargeDate and tde.depreciationQty !='0.000'
--order by mi.item

select itemCode,item,sum(convert(float,saleQty)) as saleQty,itemMessurment
from #tempSummary
group by itemCode,item,itemMessurment
order by item


drop table #tempSummary
END

--execute [VICTULING_DailySaleSummerySheet] '60000001','2019-12-04'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_DailySaleSummerySheetByItem_Period]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get Daily Sale Summery Sheet
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_DailySaleSummerySheetByItem_Period] 
--@wardroomName varchar(150),
--@onChargeDate date
@itemCode varchar(50),
@fromDate date,
@toDate date,
@wardroomName varchar(50)

as
BEGIN	

CREATE TABLE #tempSummary(
	[itemCode] [varchar](50) ,
	[item] [varchar](100) ,
	--[unitPrice] [varchar](20) ,
	[saleQty] [varchar](max), 
	[itemMessurment] [varchar](100) ,
	[date] [datetime],
	[reason] [varchar](20) ,
	[GroupMenu] [varchar](20) 

)

INSERT INTO #tempSummary
           ([itemCode]
           ,[item]
           --,[unitPrice]
           ,[saleQty]
           ,[itemMessurment]
		   ,[date]
		   ,[reason] 
		   ,[GroupMenu])

select mi.itemCode,mi.item,ts.saleQty,mm.itemMessurment,ts.[date],mr.reason,''
--,ts.reasonCode

from [dbo].[T_DailyMenuSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mr
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode 
and mw.wardroomCode = @wardroomName and ts.[date] BETWEEN @fromDate AND @toDate and ts.saleQty !='0.000'
and mi.itemCode =@itemCode and mr.reasonCode = ts.reasonCode 
--order by mi.item

union

select mi.itemCode,mi.item,td.saleQty,mm.itemMessurment,td.[saleDate],mr.reason,mg.GroupMenu
--,td.reasonCode

from [dbo].[T_DailyExtraSales] as td,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mr,[M_GroupMenu] as mg
where mi.itemCode = td.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = td.wardroomCode 
and mw.wardroomCode = @wardroomName and td.[saleDate] BETWEEN @fromDate AND @toDate and td.saleQty !='0.000'
and mi.itemCode =@itemCode and mr.reasonCode = td.reasonCode and mg.GroupMenuCode = td.groupType 
--order by mi.item

union

select mi.itemCode,mi.item,tde.depreciationQty as saleQty,mm.itemMessurment,tde.depreciationDate,mr.reason,''
--,tde.reasonCode

from [dbo].[T_DepreciationItems] as tde,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mr
where mi.itemCode = tde.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = tde.wordRoomCode 
and mw.wardroomCode = @wardroomName and tde.depreciationDate BETWEEN @fromDate AND @toDate and tde.depreciationQty !='0.000'
and mi.itemCode =@itemCode and mr.reasonCode = tde.reasonCode
--order by mi.item

select itemCode,item,round(saleQty,3) as saleQty,itemMessurment,
CONVERT (varchar(4),DATEPART(Year, [date])) + '/' + CONVERT (varchar(2), DATEPART(MONTH, [date])) + '/' + CONVERT (varchar(2), DATEPART(DAY, [date])) AS [date]
,reason,GroupMenu
from #tempSummary
--order by itemCode,item,saleQty,itemMessurment
group by itemCode,item,itemMessurment,saleQty,[date],reason,GroupMenu
order by [date]


drop table #tempSummary
END

--execute [VICTULING_DailySaleSummerySheetByItem_Period] '40000424','2019-10-01','2019-10-31','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_DailySaleSummerySheetByItem_Period_New]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get Daily Sale Summery Sheet
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_DailySaleSummerySheetByItem_Period_New] 
--@wardroomName varchar(150),
--@onChargeDate date
@itemCode varchar(50),
@fromDate date,
@toDate date,
@wardroomName varchar(50)

as
BEGIN	


--menu--
select mi.itemCode,mi.item,round(ts.saleQty,4) as saleQty,mm.itemMessurment,
CONVERT (varchar(4),DATEPART(Year, ts.[date])) + '/' + CONVERT (varchar(2), DATEPART(MONTH, ts.[date])) + '/' + CONVERT (varchar(2), DATEPART(DAY, ts.[date])) AS [date]
,mr.reason,''
from [dbo].[T_DailyMenuSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mr
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode 
and mw.wardroomCode = @wardroomName and ts.[date] BETWEEN @fromDate AND @toDate and ts.saleQty !='0.000'
and mi.itemCode =@itemCode and mr.reasonCode = ts.reasonCode and ts.reasonCode != '30000004'
order by ts.[date] ASC

--extra--
select mi.itemCode,mi.item,round(td.saleQty,4) as saleQty,mm.itemMessurment,
CONVERT (varchar(4),DATEPART(Year, td.[saleDate])) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.[saleDate])) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.[saleDate])) AS [date]
,mr.reason,mg.GroupMenu
from [dbo].[T_DailyExtraSales] as td,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mr,[M_GroupMenu] as mg
where mi.itemCode = td.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = td.wardroomCode 
and mw.wardroomCode = @wardroomName and td.[saleDate] BETWEEN @fromDate AND @toDate and td.saleQty !='0.000'
and mi.itemCode =@itemCode and mr.reasonCode = td.reasonCode and mg.GroupMenuCode = td.groupType and td.reasonCode != '30000004'
order by td.[saleDate] ASC

--party 845--
select mi.itemCode,mi.item,round(td.saleQty,4) as saleQty,mm.itemMessurment,
CONVERT (varchar(4),DATEPART(Year, td.[saleDate])) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.[saleDate])) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.[saleDate])) AS [date]
,mr.reason,mg.GroupMenu
from [dbo].[T_DailyExtraSales] as td,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mr,[M_GroupMenu] as mg
where mi.itemCode = td.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = td.wardroomCode 
and mw.wardroomCode = @wardroomName and td.[saleDate] BETWEEN @fromDate AND @toDate and td.saleQty !='0.000'
and mi.itemCode =@itemCode and mr.reasonCode = td.reasonCode and mg.GroupMenuCode = td.groupType and td.reasonCode = '30000004'
order by td.[saleDate] ASC

--Depreciation--
select mi.itemCode,mi.item,round(tde.depreciationQty,4) as saleQty,mm.itemMessurment,
CONVERT (varchar(4),DATEPART(Year, tde.depreciationDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tde.depreciationDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tde.depreciationDate)) AS [date]
,mr.reason,''
from [dbo].[T_DepreciationItems] as tde,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mr
where mi.itemCode = tde.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = tde.wordRoomCode 
and mw.wardroomCode = @wardroomName and tde.depreciationDate BETWEEN @fromDate AND @toDate and tde.depreciationQty !='0.000'
and mi.itemCode =@itemCode and mr.reasonCode = tde.reasonCode 
order by tde.depreciationDate ASC

--party--
select mi.itemCode,mi.item,round(ts.saleQty,4) as saleQty,mm.itemMessurment,
CONVERT (varchar(4),DATEPART(Year, ts.[date])) + '/' + CONVERT (varchar(2), DATEPART(MONTH, ts.[date])) + '/' + CONVERT (varchar(2), DATEPART(DAY, ts.[date])) AS [date]
,mr.reason,''
from [dbo].[T_DailyMenuSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mr
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode 
and mw.wardroomCode = @wardroomName and ts.[date] BETWEEN @fromDate AND @toDate and ts.saleQty !='0.000'
and mi.itemCode =@itemCode and mr.reasonCode = ts.reasonCode and ts.reasonCode = '30000004'
order by ts.[date] ASC


END

--execute [VICTULING_DailySaleSummerySheetByItem_Period_New] '40000152','2019-12-01','2019-12-31','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Delete_DailySaleSummary]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr WHK Gunasoma
-- Create date: 2020-01-16
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Delete_DailySaleSummary]

@wardroomCode varchar(50)
as
begin	   

DELETE  from T_DailySaleSummary where wardroomCode = @wardroomCode

END


--execute [HRIS_InsertNextAdvancementStatus] '123123','5/10/2019 5/10/2019 12:00:00 AM','3147','NRT','pass','0','DGT','5/10/2019 12:00:00 AM'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Delete_DailySaleSummary_withPrice]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr WHK Gunasoma
-- Create date: 2020-01-16
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Delete_DailySaleSummary_withPrice]

@wardroomCode varchar(50)
as
begin	   

DELETE  from T_DailySaleSummary_withPrice where wardroomCode = @wardroomCode

END


--execute [HRIS_InsertNextAdvancementStatus] '123123','5/10/2019 5/10/2019 12:00:00 AM','3147','NRT','pass','0','DGT','5/10/2019 12:00:00 AM'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Delete_T_IndividualExtraItemByCA]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) KMUL Bandara,NRT 3352
-- Description: Search Wardroom
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Delete_T_IndividualExtraItemByCA] 
@date datetime,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@itemCode varchar(50)

as
BEGIN	

DELETE from T_IndividualExtraItemByCA where date = @date and reasonCode = @reasonCode and wardroomCode = @wardroomCode and itemCode = @itemCode and offNo is NULL and isActive is NULL


END

--execute [VICTULING_Delete_T_IndividualExtraItemByCA] '2018-02-16','30000001','60000001','40000437'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Delete_T_StockQty_OnCharge]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to Menu Sale items update in to T_StockQty table
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Delete_T_StockQty_OnCharge] 
	
@itemCode varchar(50),
@currentStock varchar(50),
@wordRoomCode varchar(50),
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime


AS

BEGIN
	
declare @preStock  float 
declare @currentStock1  float
declare @newStock  varchar(50)

set @preStock =0
set @currentStock1 =0
set @newStock =0

select @preStock = isnull((convert(float,ts.currentStock)),0)
from  [dbo].[T_StockQty] as ts
where ts.itemCode = @itemCode and ts.wordRoomCode = @wordRoomCode

set @currentStock1 = (convert(float,@currentStock))

set @newStock = convert (varchar,(@preStock-@currentStock1))



	UPDATE [dbo].[T_StockQty]
    set  
	   	 
	currentStock = @newStock,
	createdUser = @lastmodifiedUser,
	createdDate = @lastmodifiedDate

	
	WHERE itemCode =@itemCode and wordRoomCode = @wordRoomCode
	  
END

--execute [VICTULING_Update_T_StockQty_forOnCharge] '40000197','50','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_DeleteRecordFromStock]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Delete record from stock table
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_DeleteRecordFromStock] 
@itemID int

as
BEGIN	

DELETE 
     

	   FROM [dbo].[T_Stock]
      WHERE [itemId] = @itemID

END

--execute [VICTULING_DeleteRecordFromStock] '14'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_EAST_Save_T_MealAttendance]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to save East Meal Attendance
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_EAST_Save_T_MealAttendance]  
@mealDate date,
@officialNo int,
@officerSailor varchar(1),
@serviceType varchar(10),
@reason varchar(50),
@groupMenuCode varchar(50),
@vegetarian bit,
@noneVegetarian bit,
@mealIn bit,
@mealOut bit,
@mealCount int,
@baseCode varchar(50),
@wardroom varchar(500),
@createdUser varchar(70),
@createdDate datetime
                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_MealAttendance]
            (   mealDate ,
				officialNo ,
				officerSailor ,
				serviceType ,
				reason ,
				groupMenuCode,
				vegetarian ,
				noneVegetarian,
				mealIn,
				mealOut ,
				mealCount,
				baseCode ,
				wardroom ,
				createdUser, 
				createdDate

           )
VALUES
		(	@mealDate,
			@officialNo,
			'O',
			@serviceType,
			@reason,
			@groupMenuCode,
			@vegetarian,
			@noneVegetarian,
			@mealIn,
			@mealOut,
			@mealCount,
			@baseCode,
			@wardroom,
			@createdUser,
			@createdDate 
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_EditCashBook]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to Get Cash Book
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_EditCashBook] 
	
@wordRoomCode varchar(50),
@date date,
@description varchar(10)

AS

BEGIN

select CONVERT (varchar(4),DATEPART(Year, tc.date)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tc.date)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tc.date)) AS date  
,mc.description,tc.remarks,tc.creditDebit,CAST(isnull(tc.cost,0) as DECIMAL(18,2)) as cost

from [dbo].[T_CashBookDetails] as tc,[dbo].[M_CashBookReason] as mc
where tc.date = @date and tc.wardroom = @wordRoomCode and mc.descriptionCode = @description





END

--execute [VICTULING_EditCashBook] '60000001','2020-04-18','1102'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_FinalMonthlyRecovery_By_SeriveType]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_FinalMonthlyRecovery_By_SeriveType] 
@wardroom varchar(50),
@year int,
@month varchar(50),
@serviceType varchar(50)

as
BEGIN



select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,sum(tt.individualTotalCost +(tt.creditDebit)) as debit,tt.Messsub,tt.barBill,sum(tt.individualTotalCost + tt.Messsub + tt.barBill) as TotRecovery,tt.priority,tt.noOfDays

from [dbo].[T_FinalRecovery_Dining_Wine] as tt ,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays = 0 and tpe.serviceType = @serviceType
and tpe.officialNo = tt.officialNo and tpe.officerSailor = 'O' and mbr.branchCode = tpe.branchCode and mbr.branchID = tt.branchID
and tpe.isActive ='true' 

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays

union 

select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,-(tt.creditDebit) as debit,tt.Messsub,tt.barBill,sum(tt.Messsub  + tt.barBill - (tt.creditDebit)) as TotRecovery,tt.priority,tt.noOfDays

from [dbo].[T_FinalRecovery_Dining_Wine] as tt ,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays != 0  and tt.creditDebit <1
and tpe.officialNo = tt.officialNo and tpe.officerSailor = 'O' and mbr.branchCode = tpe.branchCode and mbr.branchID = tt.branchID 
and tpe.serviceType = @serviceType and tpe.isActive ='true' 

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays

union 

select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,'0.00' as debit,tt.Messsub,tt.barBill,sum(tt.Messsub  + tt.barBill) as TotRecovery,tt.priority,tt.noOfDays

from [dbo].[T_FinalRecovery_Dining_Wine] as tt ,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays != 0  and tt.creditDebit >1
and tpe.officialNo = tt.officialNo and tpe.officerSailor = 'O' and mbr.branchCode = tpe.branchCode and mbr.branchID = tt.branchID 
and tpe.serviceType = @serviceType and tpe.isActive ='true' 

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays

union 

select tt.branchID,tt.officialNo,mr.rankRate ,tpe.initials + ' ' + tpe.surename as name
--, tt.rankRate ,tt.name
,'0.00' as individualTotalCost ,'0.00' as creditDebit,'0.00' as debit,tt.messsub,'0.00' as barBill,tt.messsub as TotRecovery,mr.priority,''

from [dbo].[T_MonthlyMessSub] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr 

where  tt.wardroom = @wardroom and tt.year = @year  and tt.month = @month and 
tt.officialNo not in(select tt.[officialNo] from T_FinalRecovery_Dining_Wine as tt where  wardroom = @wardroom and year = @year and month = @month )
and tpe.officialNo = tt.officialNo and tpe.officerSailor = 'O' and mbr.branchCode = tpe.branchCode and mbr.branchID = tt.branchID 
and mr.rankRateCode = tpe.rankRateCode and tpe.serviceType = @serviceType and tpe.isActive ='true' 

--union 

--select mbr.branchID,tt.offno,mr.rankRate ,tpe.initials + ' ' + tpe.surename as name
----, tt.rankRate ,tt.name
--,'0.00' as individualTotalCost ,'0.00' as creditDebit,'0.00' as debit,tt.recoverDiningAmmount as 'Pending Dining',tt.recoverWineAmmount as 'Pending Wine','0.00' as messsub,'0.00' as barBill,((convert(float,tt.recoverDiningAmmount)) + (convert(float,tt.recoverWineAmmount))) as TotRecovery,mr.priority,''

--from [dbo].[T_PendingRecovery] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr
--,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr

--where  tt.wardroom = @wardroom and tt.recoverYear = @year  and tt.recoverMonth = @month and 
--tt.offno not in(select tt.[officialNo] from T_FinalRecovery_Dining_Wine as tt where  wardroom = @wardroom and year = @year and month = @month )
--and tpe.officialNo = tt.offno and tpe.officerSailor = 'O' and tt.serviceType = tpe.serviceType and  mbr.branchCode = tpe.branchCode 
--and mr.rankRateCode = tpe.rankRateCode 


order by priority,officialNo

------------


END

--execute [VICTULING_FinalMonthlyRecovery_By_SeriveType] '60000001','2020','1','RNF'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GeGrouptMealAttendanceCount_NonVegetarian]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GeGrouptMealAttendanceCount_NonVegetarian] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupMenuCode varchar(50)


as
BEGIN	


select sum(tm.mealCount) as mealCount
from [T_MealAttendance] as tm,[M_ItemReason] as tr,M_GroupMenu as mgm
where  tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.noneVegetarian = 'true' and tm.mealIn = 'false' and tr.reasonCode = tm.reason and mgm.GroupMenuCode = tm.groupMenuCode and
tm.groupMenuCode = @groupMenuCode

select sum(tm.mealCount) as mealCount
from [T_MealAttendance] as tm,[M_ItemReason] as tr,M_GroupMenu as mgm
where  tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.vegetarian = 'true' and tm.mealIn = 'false' and tr.reasonCode = tm.reason and mgm.GroupMenuCode = tm.groupMenuCode and
tm.groupMenuCode = @groupMenuCode
END

--execute [VICTULING_GeGrouptMealAttendanceCount_NonVegetarian] '2018-09-01','30000001','60000001','70000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Get_BaseVisePersons]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Select base vise persons
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Get_BaseVisePersons] 

@base varchar(255),
@rank varchar(255),
--,
@branch varchar(255)

as
BEGIN

select tp.serviceType,br.branchID,tp.officialNo,mra.rankRate,tp.initials + ' ' + tp.surename as name,mb.baseName
--,br.branchID + ' ' + (convert(varchar(50),(tp.officialNo))) as offNo

from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mra,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as br
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_base] as mb

where mra.rankRateCode = tp.rankRateCode and br.branchCode = tp.branchCode and tp.isActive ='true' and mb.baseCode = tp.permanentBaseCode
and tp.permanentBaseCode = @base and tp.rankRateCode = @rank 
and tp.branchCode = @branch
order by tp.officialNo
END


--execute [VICTULING_Get_BaseVisePersons] '11183400','12100815','13100015'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_get_Curry_Price]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) KMUL Bandara,NRT 3352
-- Description: Use to Insrt T_DailyExtraSales
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_get_Curry_Price] 
@item varchar(50)

                                                              
AS


BEGIN

select portionPrice from [dbo].[T_CurryItem] where item = @item
 
END

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Get_Individual_MealTime_Status_By_Month]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Get_Individual_MealTime_Status_By_Month] 
	-- Add the parameters for the stored procedure here
	@Year INT
    ,@Month INT
    ,@OfficialNo INT
    ,@Wardroom varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP (1000)
        ma.[mealDate] as [MealDate]
        ,reason.reason as [Reason]
        ,menu.GroupMenu as [GroupMenu]
        ,ma.[vegetarian] as [Vegetarian]
        ,ma.[noneVegetarian] as [NonVegetarian]
        ,ma.[mealIn] as [MealIn]
        ,ma.[mealOut] as [MealOut]
        ,ma.[mealCount] as [MealCount]

  FROM  [NHQ_VICTUALING].[dbo].[T_MealAttendance] as ma,
        [dbo].[M_ItemReason] as reason ,
        [dbo].[M_GroupMenu] as menu
  
  WHERE officerSailor='O'
  AND reason.reasonCode = ma.reason
  AND menu.GroupMenuCode=ma.groupMenuCode
  AND ma.mealIn=1
  AND Year(ma.mealDate) = @Year AND MONTH(ma.mealDate) = @Month
  AND ma.officialNo = @OfficialNo
  AND ma.wardroom=@Wardroom
END

-- execute VICTULING_Get_Individual_MealTime_Status_By_Month '2021', '6', '3701', '60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Get_NameByOffNo]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Select base vise persons
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Get_NameByOffNo] 

@offNo varchar(255),
@branch varchar(255)


as
BEGIN

select tp.serviceType,br.branchID,tp.officialNo,mra.rankRate,tp.initials + ' ' + tp.surename as name,mb.baseName,br.branchID + ' ' + (convert(varchar(50),(tp.officialNo))) as offNo

from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mra,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as br
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_base] as mb

where mra.rankRateCode = tp.rankRateCode and br.branchCode = tp.branchCode and tp.isActive ='true' and mb.baseCode = tp.permanentBaseCode
and tp.branchCode = @branch and tp.officialNo = @offNo
order by tp.officialNo
END


--execute [VICTULING_Get_NameByOffNo] '3147','13100015'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Get_T_Mobile_MealAttendance_Status]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Get_T_Mobile_MealAttendance_Status] 
	-- Add the parameters for the stored procedure here
	@mealDate date,
	@reason varchar(50),
	@wardroom varchar(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	tm.mealId, tp.serviceType, mb.branchID, tm.officialNo, mr.rankRate, tp.initials + ' ' + tp.surename as name,
			tm.mealCount, tm.noneVegetarian, tm.vegetarian, tm.mealId, mg.GroupMenu

	FROM	[dbo].[T_MealAttendance] as tm inner join
			[dbo].[M_GroupMenu] as mg on mg.groupMenuCode=tm.groupMenuCode inner join
			[dbo].[T_Mobile_MealAttendance_Status] as mob on mob.mealId=tm.mealId,
			[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,
			[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,
			[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
			
			
	WHERE	mb.branchCode=tp.branchCode
		AND	tp.officerSailor=tm.officerSailor
		AND	tp.officialNo=tm.officialNo
		AND mr.rankRateCode = tp.rankRateCode
		AND	tm.mealDate=@mealDate
		AND	tm.reason=@reason
		AND	tm.wardroom=@wardroom
		AND tm.mealIn=1
		AND	mob.acknowledgeStatus=0
END

-- execute VICTULING_Get_T_Mobile_MealAttendance_Status '2019-05-07', '30000001', '60000001'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Get_UpdateBaseVisePersons]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Select base vise persons
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Get_UpdateBaseVisePersons] 

@base varchar(255),
@rank varchar(255),
@mealDate date,
@reason varchar(50),
@groupMenuCode varchar(50)

as
BEGIN

select tp.serviceType,br.branchID,tp.officialNo,mra.rankRate,tp.initials + ' ' + tp.surename as name,mb.baseName,tm.mealIn,tm.mealOut
,tm.mealCount,tm.noneVegetarian,tm.vegetarian

from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mra,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as br
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_base] as mb,[T_MealAttendance] as tm

where mra.rankRateCode = tp.rankRateCode and br.branchCode = tp.branchCode and tp.isActive ='true' and mb.baseCode = tp.permanentBaseCode
and tp.permanentBaseCode = @base and tp.rankRateCode = @rank
and tp.serviceType = tm.serviceType and tp.officialNo = tm.officialNo and tp.officerSailor = tm.officerSailor
order by tp.officialNo
END


--execute [VICTULING_Get_UpdateBaseVisePersons] '11110200','12100407','2019-02-01','30000001','70000000'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Get_UserDetails_Qr]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_Get_UserDetails_Qr]

 @ST         varchar(50)
,@OS     varchar(50)    
,@OfficialNo int

AS
BEGIN

			SELECT PD.[officialNo]
			,PD.serviceType
			,PD.[officerSailor]
			,RR.[description]
			,CONCAT(PD.initials , ' ', PD.surename) as name
			,b.branchID
			,PD.[nicNo_SSID]

			,		(SELECT COUNT(*) as FilteredActs

  FROM [dbo].[GatePass_QrCode]

  WHERE		 [ServiceType]		= @ST 
			AND       
			[OfficerSailor]		= @OS  
			AND   
			[OfficialNumber]	= @OfficialNo) as count1

			FROM [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as PD 
			INNER JOIN [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as RR
			ON RR.[rankRateCode] = PD.[rankRateCode]
			INNER JOIN [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as b
			ON b.[branchCode] = PD.[branchCode]
			
			WHERE PD.[officialNo] = @OfficialNo
			AND PD.[serviceType] = @ST
			AND PD.[officerSailor] = @OS
			AND PD.isActive = 1		

END

--execute VICTULING_Get_UserDetails_Qr 'RNF','O',3147
--execute VICTULING_Get_UserDetails_Qr @ST = 'RNF'	,  @OS  = 'O'	,  @OfficialNo = 3700

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getAddedMenuItem]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) KMUL Bandara ,NRT 3352
-- Description: get added menu items to load grid view
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getAddedMenuItem] 
@menuDate datetime


as
BEGIN	

select DM.itemCode as 'Item Code',M.item as 'Item' 
from [dbo].[M_Item] as M
inner join [T_DailyMenu] as DM on M.itemCode = DM.itemCode where DM.date = @menuDate

END






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAllGroupMealAttendanceList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get All Group Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAllGroupMealAttendanceList] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)



as
BEGIN	

select tp.serviceType,mb.branchID,tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,
tm.mealCount,tm.noneVegetarian,tm.vegetarian,tm.mealId,mg.GroupMenu

from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,
[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,[T_MealAttendance] as tm,
[dbo].[M_GroupMenu] as mg

where mb.branchCode = tp.branchCode and tp.officerSailor = tm.officerSailor  and 
tp.officialNo = tm.officialNo and mr.rankRateCode = tp.rankRateCode
and tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.mealIn = 'true' and mg.GroupMenuCode = tm.groupMenuCode and  tm.groupMenuCode != '70000000' 
and tp.isActive = 'true'

order by mr.[priority],tm.officialNo



END

--execute [VICTULING_GetAllGroupMealAttendanceList] '2019-02-10','30000001','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAllGroupMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAllGroupMenu] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)

as
BEGIN



select mg.GroupMenu ,mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks,ta.officialNo
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc,[dbo].[M_GroupMenu] as mg,[T_MealAttendance] as ta
where tm.date = @date and tm.reasonCode = @reasonCode and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and tm.groupMenuCode  !='70000000' 
and mg.GroupMenuCode = tm.groupMenuCode and ta.mealDate= tm.date and ta.reason = tm.reasonCode and ta.wardroom = tm.wardroomCode
and tm.groupMenuCode = ta.groupMenuCode
order by mg.GroupMenu,ta.officialNo,mm.mainItem ASC

end


--execute [VICTULING_GetAllGroupMenu] '2020-12-01','30000001','60000001','Non-Vegetarian'
--execute [VICTULING_GetAllGroupMenu] '2020-12-01','30000001','60000001','Vegetarian'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAllItemByDuration]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get Personal Data
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAllItemByDuration] 

@itemCode varchar(50),
@fromDate date,
@toDate date,
@wardroom varchar(50)

as
BEGIN	


select CONVERT (varchar(4),DATEPART(Year, ts.onChargeDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, ts.onChargeDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, ts.onChargeDate)) AS onChargeDate
,ts.recevedFrom,ts.billNo,ts.unitPrice,ts.onChargeQty,tm.itemMessurment
from [dbo].[T_Stock] as ts,[dbo].[M_ItemByMessurment] as tm
where tm.itemMessurmentCode = ts.itemMessurmentCode and ts.itemCode = @itemCode and ts.onChargeDate BETWEEN @fromDate AND @toDate
and ts.wordRoomCode = @wardroom
END

--execute [VICTULING_GetAllItemByDuration] '40000080','5/30/2019','6/5/2019','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAllMealAttendanceCount]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get All Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAllMealAttendanceCount] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)



as
BEGIN	

select sum(tm.mealCount) as NonVegiMealCount
from [T_MealAttendance] as tm
where  tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.noneVegetarian = 'true' and tm.mealIn = 'true' and groupMenuCode = '70000000' and tm.vegetarian = 'false'

select sum(tm.mealCount) as VegiMealCount
from [T_MealAttendance] as tm
where  tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.vegetarian = 'true' and tm.mealIn = 'true' and groupMenuCode = '70000000' and tm.noneVegetarian = 'false'

END

--execute [VICTULING_GetAllMealAttendanceCount] '2020-05-04','30000001','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAllMealAttendanceList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get All Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAllMealAttendanceList] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)



as
BEGIN	

--select tp.serviceType,mb.branchID,tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.noneVegetarian,tm.vegetarian,tm.mealId

--from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,
--[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,[10.10.1.216].[NHQ_VICTUALING].[dbo].[T_MealAttendance] as tm

--where mb.branchCode = tp.branchCode and tp.officerSailor = tm.officerSailor  and 
--tp.officialNo = tm.officialNo and mr.rankRateCode = tp.rankRateCode
--and tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
--tm.mealIn = 'true' and groupMenuCode = ''

--order by mr.[priority],tm.officialNo


select tp.serviceType,mb.branchID,tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,
tm.mealCount,tm.noneVegetarian,tm.vegetarian,tm.mealId,mg.GroupMenu

from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,
[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,[T_MealAttendance] as tm,
[dbo].[M_GroupMenu] as mg

where mb.branchCode = tp.branchCode and tp.officerSailor = tm.officerSailor  and 
tp.officialNo = tm.officialNo and mr.rankRateCode = tp.rankRateCode 
and tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.mealIn = 'true' and mg.GroupMenuCode = tm.groupMenuCode and  tm.groupMenuCode = '70000000'
and tp.isActive ='true'
order by mr.[priority],tm.officialNo


END

--execute [VICTULING_GetAllMealAttendanceList] '2019-02-11','30000001','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAllMenuItemList_OnDate]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Menu Item List for On Date
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAllMenuItemList_OnDate] 
@wardroomName varchar(150),
@onChargeDate date,
@reason varchar(50)


as
BEGIN	

select mi.itemCode,mi.item,ts.unitPrice,ts.saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID,
ROUND(sum((convert (float,ts.unitPrice)*convert(float,ts.saleQty))),2) as price
from [dbo].[T_DailyMenuSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode 
and mw.wardroomCode = @wardroomName and ts.[date] = @onChargeDate and ts.reasonCode = @reason and ts.vegi ='Non-Vegetarian' and ts.saleQty !='0.000'
group by mi.itemCode,mi.item,ts.unitPrice,ts.saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID,
ts.unitPrice,ts.saleQty

select mi.itemCode,mi.item,ts.unitPrice,ts.saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID,
ROUND(sum((convert (float,ts.unitPrice)*convert(float,ts.saleQty))),2) as price
from [dbo].[T_DailyMenuSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode 
and mw.wardroomCode = @wardroomName and ts.[date] = @onChargeDate and ts.reasonCode = @reason and ts.vegi ='Vegetarian' and ts.saleQty !='0.000'
group by mi.itemCode,mi.item,ts.unitPrice,ts.saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID,
ts.unitPrice,ts.saleQty
-----------------

--noneVegetarian--
select tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp 
Inner join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr on mr.rankRateCode = tp.rankRateCode
inner join [T_MealAttendance] as tm on  tp.officialNo = tm.officialNo 
,[M_ItemReason] as tr
where tm.mealDate = @onChargeDate and tm.reason = @reason  and tm.wardroom = @wardroomName and 
tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tp.officerSailor = 'O' and tr.reasonCode = tm.reason and groupMenuCode = '70000000'
and tp.isActive = 'true'
order by tm.officialNo

select sum(tm.mealCount) as mealCount
from [T_MealAttendance] as tm,[M_ItemReason] as tr
where  tm.mealDate = @onChargeDate and tm.reason = @reason  and tm.wardroom = @wardroomName and 
tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tr.reasonCode = tm.reason and tm.groupMenuCode = '70000000'

--Vegetarian--
select tm.officialNo,tp.serviceType,mb.branchID,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,[T_MealAttendance] as tm,[M_ItemReason] as tr
where mb.branchCode = tp.branchCode and tp.officerSailor = tm.officerSailor and  tp.officialNo = tm.officialNo
and tm.mealDate = @onChargeDate and tm.reason = @reason  and tm.wardroom = @wardroomName and mr.rankRateCode = tp.rankRateCode and 
tm.vegetarian = 'true' and tm.mealIn = 'true' and tr.reasonCode = tm.reason and groupMenuCode = '70000000'
and tp.isActive = 'true'
order by tm.officialNo

select sum(tm.mealCount) as mealCount
from [T_MealAttendance] as tm,[M_ItemReason] as tr 
where  tm.mealDate = @onChargeDate and tm.reason = @reason  and tm.wardroom = @wardroomName and 
tm.vegetarian = 'true' and tm.mealIn = 'true' and tr.reasonCode = tm.reason and groupMenuCode = '70000000'




END

--execute [VICTULING_GetAllMenuItemList_OnDate] '60000001','2020-12-01','30000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAllMonthlyRecovery]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Select All Monthly Recovery
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAllMonthlyRecovery] 
@wardroom varchar(50),
@year int,
@month varchar(50)

as
BEGIN

select *  from [dbo].[T_TotalIndividualCostPerMonth] as tt where tt.noOfDays =0
begin
select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,tm.barBill 

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tm.offno = tt.officialNo and tt.OS = 'O' 
order by mr.priority,tp.officialNo
end

END




--execute [VICTULING_GetAllMonthlyRecovery] '60000001','2019','10'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAllMonthlyRecovery_DinnigAndWine]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetAllMonthlyRecovery_DinnigAndWine] 
@wardroom varchar(50),
@year int,
@month varchar(50)

as
BEGIN

delete from tempRecovery_Dining_Wine

INSERT INTO tempRecovery_Dining_Wine
           ([branchID] ,
	[officialNo]  ,
	[rankRate]  ,
	[name]  ,
	[individualTotalCost]  , 
	[noOfDays]  ,
	[costPerDay] ,
	[creditDebit] ,
	[Messsub] ,
	[barBill] ,
	[TotRecovery],
	[priority] )

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,tm.barBill,sum(tt.individualTotalCost + 200.00 + tm.barBill) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tm.offno = tt.officialNo and tt.OS = 'O' and tt.noOfDays = 0 AND tm.[month]=@month

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,tm.barBill,mr.priority,tm.[month]

union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,tm.barBill ,sum(200.00 + tm.barBill - (tt.creditDebit)) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tm.offno = tt.officialNo and tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit <1 AND tm.[month]=@month

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,tm.barBill,mr.priority,tm.[month]


union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,tm.barBill ,sum(200.00 + tm.barBill) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tm.offno = tt.officialNo and tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit >1 AND tm.[month]=@month


group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,tm.barBill,mr.priority,tm.[month]

select [branchID] ,[officialNo]  ,[rankRate]  ,[name]  ,[individualTotalCost]  , [noOfDays]  ,[costPerDay] ,[creditDebit] ,[Messsub] ,[barBill] ,[TotRecovery]  from tempRecovery_Dining_Wine
order by [priority],[officialNo]

--delete from tempRecovery_Dining_Wine

INSERT INTO tempRecovery_Dining_Wine
           ([branchID] ,
	[officialNo]  ,
	[rankRate]  ,
	[name]  ,
	[individualTotalCost]  , 
	[noOfDays]  ,
	[costPerDay] ,
	[creditDebit] ,
	[Messsub] ,
	[barBill] ,
	[TotRecovery],
	[priority] )

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,'0' as barBill,sum(tt.individualTotalCost + 200.00 ) as TotRecovery,mr.priority 

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr


where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tt.OS = 'O' and tt.noOfDays = 0   and tp.officialNo not in(select [officialNo] from tempRecovery_Dining_Wine)

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,mr.priority

union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,'0' as barBill ,sum(200.00  - (tt.creditDebit)) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr 
--,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and  tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit <1  and tp.officialNo not in(select [officialNo] from tempRecovery_Dining_Wine)

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,mr.priority


union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,'0' as barBill ,(200.00 ) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr


where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit >1 and  tp.officialNo not in(select [officialNo] from tempRecovery_Dining_Wine)


group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,mr.priority


select * from tempRecovery_Dining_Wine order by priority,officialNo
------------

--UPDATE [dbo].[tempRecovery_Dining_Wine]
--    set  
--	Messsub = '200.00'
--	where (
--	select dw.branchID,dw.officialNo 
--	from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,tempRecovery_Dining_Wine as dw 
--	where dw.officialNo = tp.officialNo and dw.branchID = mb.branchID and mb.branchCode = tp.branchCode and tp.permanentBaseCode = '11183400')

END





--execute [VICTULING_GetAllMonthlyRecovery_DinnigAndWine]  '60000001','2019','11'
--select * from tempRecovery_Dining_Wine order by priority,officialNo
--Completed SP

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAllMonthlyRecovery_DinnigAndWine_1]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetAllMonthlyRecovery_DinnigAndWine_1] 
@wardroom varchar(50),
@year int,
@month varchar(50)

as
BEGIN

delete from tempRecovery_Dining_Wine

INSERT INTO tempRecovery_Dining_Wine
           ([branchID] ,
	[officialNo]  ,
	[rankRate]  ,
	[name]  ,
	[individualTotalCost]  , 
	[noOfDays]  ,
	[costPerDay] ,
	[creditDebit] ,
	[Messsub] ,
	[barBill] ,
	[TotRecovery],
	[priority] )

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'0.00' as Messsub,tm.barBill,sum(tt.individualTotalCost + 0.00 + tm.barBill) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tm.offno = tt.officialNo and tt.OS = 'O' and tt.noOfDays = 0 AND tm.[month]=@month AND tm.[year]=@year 

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,tm.barBill,mr.priority,tm.[month]

union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'0.00' as Messsub,tm.barBill ,sum(0.00 + tm.barBill - (tt.creditDebit)) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tm.offno = tt.officialNo and tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit <1 AND tm.[month]=@month  AND tm.[year]=@year 

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,tm.barBill,mr.priority,tm.[month]


union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'0.00' as Messsub,tm.barBill ,sum(0.00 + tm.barBill) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tm.offno = tt.officialNo and tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit >1 AND tm.[month]=@month  AND tm.[year]=@year 


group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,tm.barBill,mr.priority,tm.[month]

union


select mb.branchID,tm.offno,mr.rankRate,tp.initials + ' ' + tp.surename as name,'','','','','0.00' as Messsub,tm.barBill ,(tm.barBill) as TotRecovery,mr.priority
from [dbo].[T_MonthlyBarBill] as tm ,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
where mb.branchCode = tp.branchCode  and tm.offno not in(select tt.[officialNo] from T_TotalIndividualCostPerMonth as tt where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month )
and tm.year =@year and tm.month =@month  AND tm.[year]=@year
and tp.officialNo = tm.offno and tp.officerSailor = 'O' and mr.rankRateCode = tp.rankRateCode 



select [branchID] ,[officialNo]  ,[rankRate]  ,[name]  ,[individualTotalCost]  , [noOfDays]  ,[costPerDay] ,[creditDebit] ,[Messsub] ,[barBill] ,[TotRecovery]  from tempRecovery_Dining_Wine
order by [priority],[officialNo]

--delete from tempRecovery_Dining_Wine

INSERT INTO tempRecovery_Dining_Wine
           ([branchID] ,
	[officialNo]  ,
	[rankRate]  ,
	[name]  ,
	[individualTotalCost]  , 
	[noOfDays]  ,
	[costPerDay] ,
	[creditDebit] ,
	[Messsub] ,
	[barBill] ,
	[TotRecovery],
	[priority] )

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'0.00' as Messsub,'0' as barBill,sum(tt.individualTotalCost + 0.00 ) as TotRecovery,mr.priority 

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr


where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tt.OS = 'O' and tt.noOfDays = 0   and tp.officialNo not in(select [officialNo] from tempRecovery_Dining_Wine)

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,mr.priority

union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'0.00' as Messsub,'0' as barBill ,sum(0.00  - (tt.creditDebit)) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr 
--,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and  tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit <1  and tp.officialNo not in(select [officialNo] from tempRecovery_Dining_Wine)

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,mr.priority


union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'0.00' as Messsub,'0' as barBill ,(0.00 ) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr


where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit >1 and  tp.officialNo not in(select [officialNo] from tempRecovery_Dining_Wine)


group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,mr.priority


select * from tempRecovery_Dining_Wine order by priority,officialNo
------------

--UPDATE [dbo].[tempRecovery_Dining_Wine]
--    set  
--	Messsub = '200.00'
--	where (
--	select dw.branchID,dw.officialNo 
--	from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,tempRecovery_Dining_Wine as dw 
--	where dw.officialNo = tp.officialNo and dw.branchID = mb.branchID and mb.branchCode = tp.branchCode and tp.permanentBaseCode = '11183400')

END





--execute [VICTULING_GetAllMonthlyRecovery_DinnigAndWine_1]  '60000001','2022','02'
--select * from tempRecovery_Dining_Wine order by priority,officialNo
--Completed SP

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAllMonthlyRecovery_DinnigAndWine_new]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetAllMonthlyRecovery_DinnigAndWine_new] 
@wardroom varchar(50),
@year int,
@month varchar(50)

as
BEGIN

delete from tempRecovery_Dining_Wine

INSERT INTO tempRecovery_Dining_Wine
           ([branchID] ,
	[officialNo]  ,
	[rankRate]  ,
	[name]  ,
	[individualTotalCost]  , 
	[noOfDays]  ,
	[costPerDay] ,
	[creditDebit] ,
	[Messsub] ,
	[barBill] ,
	[TotRecovery],
	[priority] )

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,tm.barBill,sum(tt.individualTotalCost + 200.00 + tm.barBill) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tm.offno = tt.officialNo and tt.OS = 'O' and tt.noOfDays = 0 AND tm.[month]=@month

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,tm.barBill,mr.priority,tm.[month]

union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,tm.barBill ,sum(200.00 + tm.barBill - (tt.creditDebit)) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tm.offno = tt.officialNo and tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit <1 AND tm.[month]=@month

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,tm.barBill,mr.priority,tm.[month]


union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,tm.barBill ,sum(200.00 + tm.barBill) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tm.offno = tt.officialNo and tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit >1 AND tm.[month]=@month


group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,tm.barBill,mr.priority,tm.[month]

select [branchID] ,[officialNo]  ,[rankRate]  ,[name]  ,[individualTotalCost]  , [noOfDays]  ,[costPerDay] ,[creditDebit] ,[Messsub] ,[barBill] ,[TotRecovery]  from tempRecovery_Dining_Wine
order by [priority],[officialNo]

--delete from tempRecovery_Dining_Wine

INSERT INTO tempRecovery_Dining_Wine
           ([branchID] ,
	[officialNo]  ,
	[rankRate]  ,
	[name]  ,
	[individualTotalCost]  , 
	[noOfDays]  ,
	[costPerDay] ,
	[creditDebit] ,
	[Messsub] ,
	[barBill] ,
	[TotRecovery],
	[priority] )

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,'0' as barBill,sum(tt.individualTotalCost + 200.00 ) as TotRecovery,mr.priority 

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr


where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tt.OS = 'O' and tt.noOfDays = 0   and tp.officialNo not in(select [officialNo] from tempRecovery_Dining_Wine)

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,mr.priority

union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,'0' as barBill ,sum(200.00  - (tt.creditDebit)) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr 
--,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and  tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit <1  and tp.officialNo not in(select [officialNo] from tempRecovery_Dining_Wine)

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,mr.priority


union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,'0' as barBill ,(200.00 ) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr


where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit >1 and  tp.officialNo not in(select [officialNo] from tempRecovery_Dining_Wine)


group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,mr.priority



------------

--declare @MessSub as decimal(18, 5)
--declare @offNo as int
--select @offNo = (select dw.officialNo from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,tempRecovery_Dining_Wine as dw where dw.officialNo = tp.officialNo and dw.branchID = mb.branchID and mb.branchCode = tp.branchCode and tp.permanentBaseCode = '11183400')

--UPDATE [dbo].[tempRecovery_Dining_Wine]
--    set  
--	Messsub = '200.00'
--	where officialNo = @offNo

----------------

select * from tempRecovery_Dining_Wine order by priority,officialNo

END





--execute [VICTULING_GetAllMonthlyRecovery_DinnigAndWine]  '60000001','2019','11'
--select * from tempRecovery_Dining_Wine order by priority,officialNo
--Completed SP

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAllMonthlyRecovery_new]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetAllMonthlyRecovery_new] 
@wardroom varchar(50),
@year int,
@month varchar(50),
 @NoOfDays int

as
BEGIN


select @NoOfDays=  tt.noOfDays  from [dbo].[T_TotalIndividualCostPerMonth] as tt where tt.noOfDays =0 and tt.wardroom = '60000001' and tt.year ='2019' and tt.month ='10'

IF (@NoOfDays = 0)
BEGIN
    select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,tm.barBill 

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tm.offno = tt.officialNo and tt.OS = 'O' 
order by mr.priority,tp.officialNo
END

ELSE
BEGIN
select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub
--,tm.barBill 

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tm.offno = tt.officialNo and tt.OS = 'O' 
order by mr.priority,tp.officialNo
END


end

--execute VICTULING_GetAllMonthlyRecovery_new '60000001','2019','10'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAllMonthlyRecovery_newOne]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetAllMonthlyRecovery_newOne] 
@wardroom varchar(50),
@year int,
@month varchar(50)

as
BEGIN

CREATE TABLE #tempRecovery(
	[branchID] [varchar](50) ,
	[officialNo] int ,
	[rankRate] [varchar](50)  ,
	[name] [varchar](200) ,
	[individualTotalCost] [decimal](18, 5) , 
	[noOfDays] int ,
	[costPerDay] [decimal](18, 5),
	[creditDebit] [decimal](18, 5),
	[Messsub] [decimal](18, 5),
	[barBill] [decimal](18, 5),
	[TotRecovery] [decimal](18, 5),
	[priority] int


)

--print(@mainItemCode)

INSERT INTO #tempRecovery
           ([branchID] ,
	[officialNo]  ,
	[rankRate]  ,
	[name]  ,
	[individualTotalCost]  , 
	[noOfDays]  ,
	[costPerDay] ,
	[creditDebit] ,
	[Messsub] ,
	[barBill] ,
	[TotRecovery],
	[priority] )

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,tm.barBill,sum(tt.individualTotalCost + 200.00 + tm.barBill) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tm.offno = tt.officialNo and tt.OS = 'O' and tt.noOfDays = 0 AND tm.[month]='11'

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,tm.barBill,mr.priority,tm.[month]

union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,tm.barBill ,sum(200.00 + tm.barBill - (tt.creditDebit)) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tm.offno = tt.officialNo and tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit <1 AND tm.[month]='11'

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,tm.barBill,mr.priority,tm.[month]


union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,tm.barBill ,sum(200.00 + tm.barBill) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tm.offno = tt.officialNo and tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit >1 AND tm.[month]='11'


group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,tm.barBill,mr.priority,tm.[month]

select [branchID] ,[officialNo]  ,[rankRate]  ,[name]  ,[individualTotalCost]  , [noOfDays]  ,[costPerDay] ,[creditDebit] ,[Messsub] ,[barBill] ,[TotRecovery]  from #tempRecovery
order by [priority],[officialNo]

drop table #tempRecovery

END




--execute VICTULING_GetAllMonthlyRecovery_newOne '60000001','2019','11'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAllMonthlyRecovery_newOne_1]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetAllMonthlyRecovery_newOne_1] 
@wardroom varchar(50),
@year int,
@month varchar(50)

as
BEGIN

--CREATE TABLE tempRecovery_Dining_Wine(
--	[branchID] [varchar](50) ,
--	[officialNo] int ,
--	[rankRate] [varchar](50)  ,
--	[name] [varchar](200) ,
--	[individualTotalCost] [decimal](18, 5) , 
--	[noOfDays] int ,
--	[costPerDay] [decimal](18, 5),
--	[creditDebit] [decimal](18, 5),
--	[Messsub] [decimal](18, 5),
--	[barBill] [decimal](18, 5),
--	[TotRecovery] [decimal](18, 5),
--	[priority] int


--)

--print(@mainItemCode)

INSERT INTO tempRecovery_Dining_Wine
           ([branchID] ,
	[officialNo]  ,
	[rankRate]  ,
	[name]  ,
	[individualTotalCost]  , 
	[noOfDays]  ,
	[costPerDay] ,
	[creditDebit] ,
	[Messsub] ,
	[barBill] ,
	[TotRecovery],
	[priority] )

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,tm.barBill,sum(tt.individualTotalCost + 200.00 + tm.barBill) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = '60000001' and tt.year ='2019' and tt.month ='11'
and tm.offno = tt.officialNo and tt.OS = 'O' and tt.noOfDays = 0 AND tm.[month]='11'

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,tm.barBill,mr.priority,tm.[month]

union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,tm.barBill ,sum(200.00 + tm.barBill - (tt.creditDebit)) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = '60000001' and tt.year ='2019' and tt.month ='11'
and tm.offno = tt.officialNo and tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit <1 AND tm.[month]='11'

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,tm.barBill,mr.priority,tm.[month]


union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,tm.barBill ,sum(200.00 + tm.barBill) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = '60000001' and tt.year ='2019' and tt.month ='11'
and tm.offno = tt.officialNo and tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit >1 AND tm.[month]='11'


group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,tm.barBill,mr.priority,tm.[month]

select [branchID] ,[officialNo]  ,[rankRate]  ,[name]  ,[individualTotalCost]  , [noOfDays]  ,[costPerDay] ,[creditDebit] ,[Messsub] ,[barBill] ,[TotRecovery]  from tempRecovery_Dining_Wine
order by [priority],[officialNo]

--delete from tempRecovery_Dining_Wine



END




--execute VICTULING_GetAllMonthlyRecovery_newOne '60000001','2019','11'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAllMonthlyRecovery_newOne_1_dinnig]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetAllMonthlyRecovery_newOne_1_dinnig] 
@wardroom varchar(50),
@year int,
@month varchar(50)

as
BEGIN

CREATE TABLE #tempRecovery(
	[branchID] [varchar](50) ,
	[officialNo] int ,
	[rankRate] [varchar](50)  ,
	[name] [varchar](200) ,
	[individualTotalCost] [decimal](18, 5) , 
	[noOfDays] int ,
	[costPerDay] [decimal](18, 5),
	[creditDebit] [decimal](18, 5),
	[Messsub] [decimal](18, 5),
	[barBill] [decimal](18, 5),
	[TotRecovery] [decimal](18, 5),
	[priority] int


)

--print(@mainItemCode)

INSERT INTO #tempRecovery
           ([branchID] ,
	[officialNo]  ,
	[rankRate]  ,
	[name]  ,
	[individualTotalCost]  , 
	[noOfDays]  ,
	[costPerDay] ,
	[creditDebit] ,
	[Messsub] ,
	[barBill] ,
	[TotRecovery],
	[priority] )

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,'0' as barBill,sum(tt.individualTotalCost + 200.00 ) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
--,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tt.OS = 'O' and tt.noOfDays = 0 

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,mr.priority

union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,'0' as barBill ,sum(200.00  - (tt.creditDebit)) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
--,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and  tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit <1 

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,mr.priority


union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,'0' as barBill ,(200.00 ) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr


where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit >1  


group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,mr.priority

select [branchID] ,[officialNo]  ,[rankRate]  ,[name]  ,[individualTotalCost]  , [noOfDays]  ,[costPerDay] ,[creditDebit] ,[Messsub] ,[barBill] ,[TotRecovery]  from #tempRecovery
order by [priority],[officialNo]

drop table #tempRecovery

END




--execute VICTULING_GetAllMonthlyRecovery_newOne '60000001','2019','11'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAllMonthlyRecovery_OnlyDinnig]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetAllMonthlyRecovery_OnlyDinnig] 
@wardroom varchar(50),
@year int,
@month varchar(50)

as
BEGIN

--select * from tempRecovery_Dining_Wine 
--delete from tempRecovery_Dining_Wine



INSERT INTO tempRecovery_Dining_Wine
           ([branchID] ,
	[officialNo]  ,
	[rankRate]  ,
	[name]  ,
	[individualTotalCost]  , 
	[noOfDays]  ,
	[costPerDay] ,
	[creditDebit] ,
	[Messsub] ,
	[barBill] ,
	[TotRecovery],
	[priority] )

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,'0' as barBill,sum(tt.individualTotalCost + 200.00 ) as TotRecovery,mr.priority 

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr


where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tt.OS = 'O' and tt.noOfDays = 0   and tp.officialNo not in(select [officialNo] from tempRecovery_Dining_Wine)

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,mr.priority

union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,'0' as barBill ,sum(200.00  - (tt.creditDebit)) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr 
--,[dbo].[T_MonthlyBarBill] as tm 

where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and  tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit <1  and tp.officialNo not in(select [officialNo] from tempRecovery_Dining_Wine)

group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,mr.priority


union

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay 
,tt.creditDebit,'200.00' as Messsub,'0' as barBill ,(200.00 ) as TotRecovery,mr.priority

from [dbo].[T_TotalIndividualCostPerMonth] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr


where mb.branchCode = tp.branchCode and tt.officialNo = tp.officialNo and tt.serviceType = tp.serviceType and tt.OS = tp.officerSailor 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tt.OS = 'O' and tt.noOfDays != 0  and tt.creditDebit >1 and  tp.officialNo not in(select [officialNo] from tempRecovery_Dining_Wine)


group by mr.rankRate ,tp.officialNo, tp.initials,tp.surename,mb.branchID,
tt.individualTotalCost ,tt.noOfDays ,tt.costPerDay ,tt.creditDebit,mr.priority

end

--execute [VICTULING_GetAllMonthlyRecovery_OnlyDinnig] '60000001','2019','11' 

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAndBindBiteMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAndBindBiteMenu] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupMenuCode varchar(50)

--use to normal menu

as
BEGIN	

--if(@groupMenuCode = '')

--begin
--select tm.mainItemCode,mc.mainItemCategory,mm.mainItem,tm.id
--from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
--where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode 
--and mc.mainItemCategoryCode = tm.mealCategory and tm.isAuthorized = 'false' and  tm.groupMenuCode  =@groupMenuCode 
--end

--else
select tm.mainItemCode,mc.mainItemCategory,mm.mainItem,tm.id,tbi.remark
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc,[dbo].[M_GroupMenu] as mgm,[dbo].[T_BiteMenue] as tbi
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode 
and mc.mainItemCategoryCode = tm.mealCategory and tm.isAuthorized = 'false' and mgm.GroupMenuCode = tm.groupMenuCode and tm.isActive is null
and tm.groupMenuCode = @groupMenuCode 
and tbi.wardroom = tm.wardroomCode and tbi.reason = tm.reasonCode and tbi.groupType = tm.groupMenuCode and tbi.vegNonVeg = tm.vegiNonVegi
and tbi.date = tm.date

END

--execute [VICTULING_GetAndBindBiteMenu] '8/5/2020','30000023','60000001','70000026'

--execute [VICTULING_GetAndBindDailyMenu] '2020-08-13','30000023','60000001','70000026'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAndBindDailyAuthorizedMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Authorized Menu 
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAndBindDailyAuthorizedMenu] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupMenu varchar(50),
@Veg varchar(50)



as
BEGIN	

select tm.mainItemCode,mc.mainItemCategory,mm.mainItem,tm.id
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc,[dbo].[M_GroupMenu] as mg
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode 
and mc.mainItemCategoryCode = tm.mealCategory and tm.isAuthorized = 'true' and tm.isActive ='true' and tm.groupMenuCode = mg.GroupMenuCode 
and tm.groupMenuCode = @groupMenu and tm.vegiNonVegi =@veg


END

--execute [VICTULING_GetAndBindDailyAuthorizedMenu] '2019-01-01','30000001','60000001','70000000','Vegetarian'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAndBindDailyGroupMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAndBindDailyGroupMenu] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupMenuCode varchar(50)

--use to CreateGroupMenuByMA.aspx

as
BEGIN	

if(@groupMenuCode =  '70000016')

begin
select tm.mainItemCode,mc.mainItemCategory,mm.mainItem,tm.id
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc,[dbo].[M_GroupMenu] as mgm
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode 
and mc.mainItemCategoryCode = tm.mealCategory and tm.isAuthorized = 'true' and mgm.GroupMenuCode = tm.groupMenuCode and tm.isActive = 'true' 
and tm.groupMenuCode = @groupMenuCode
end

else
select tm.mainItemCode,mc.mainItemCategory,mm.mainItem,tm.id
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc,[dbo].[M_GroupMenu] as mgm
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode 
and mc.mainItemCategoryCode = tm.mealCategory and tm.isAuthorized = 'true' and mgm.GroupMenuCode = tm.groupMenuCode and tm.isActive is null
and tm.groupMenuCode = @groupMenuCode


END


--execute [VICTULING_GetAndBindDailyGroupMenu] '2019-02-01','30000001','60000001','70000000'

--execute [VICTULING_GetAndBindDailyGroupMenu] '2019-02-01','30000001','60000001','70000016'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAndBindDailyMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAndBindDailyMenu] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupMenuCode varchar(50)

--use to normal menu

as
BEGIN	

--if(@groupMenuCode = '')

--begin
--select tm.mainItemCode,mc.mainItemCategory,mm.mainItem,tm.id
--from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
--where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode 
--and mc.mainItemCategoryCode = tm.mealCategory and tm.isAuthorized = 'false' and  tm.groupMenuCode  =@groupMenuCode 
--end

--else
select tm.mainItemCode,mc.mainItemCategory,mm.mainItem,tm.id,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc,[dbo].[M_GroupMenu] as mgm
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode 
and mc.mainItemCategoryCode = tm.mealCategory and tm.isAuthorized = 'false' and mgm.GroupMenuCode = tm.groupMenuCode 
--and tm.isActive = 'true'
and tm.groupMenuCode = @groupMenuCode
-- and tm.isActive = 'true'


END

--execute [VICTULING_GetAndBindDailyMenu]  '8/5/2020','30000023','60000001','70000026'

--execute [VICTULING_GetAndBindDailyMenu] '2020-08-13','30000023','60000001','70000026'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAndBindDailyMenu_bite]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAndBindDailyMenu_bite] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupMenuCode varchar(50)

--use to normal menu

as
BEGIN	

--if(@groupMenuCode = '')

--begin
--select tm.mainItemCode,mc.mainItemCategory,mm.mainItem,tm.id
--from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
--where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode 
--and mc.mainItemCategoryCode = tm.mealCategory and tm.isAuthorized = 'false' and  tm.groupMenuCode  =@groupMenuCode 
--end

--else
select tm.mainItemCode,mc.mainItemCategory,mm.mainItem,tm.id,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc,[dbo].[M_GroupMenu] as mgm
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode 
and mc.mainItemCategoryCode = tm.mealCategory and tm.isAuthorized = 'false' and mgm.GroupMenuCode = tm.groupMenuCode 
and tm.isActive = 'true'
and tm.groupMenuCode = @groupMenuCode
-- and tm.isActive = 'true'


END

--execute [VICTULING_GetAndBindDailyMenu]  '8/5/2020','30000023','60000001','70000026'

--execute [VICTULING_GetAndBindDailyMenu] '2020-08-13','30000023','60000001','70000026'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAndBindDailyMenuItem]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu item list
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAndBindDailyMenuItem] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@vegi varchar(50)


as
BEGIN	

select tm.itemCode,mm.item,ts.currentStock,mme.itemMessurment,tm.qty
from [dbo].[T_MenuListItem] as tm,[dbo].[M_Item] as mm,[dbo].[T_StockQty] as ts,[dbo].[M_ItemByMessurment] as mme
where tm.date = @date and tm.reasonCode = @reasonCode  and tm.wardroom = @wardroomCode and mm.itemCode = tm.itemCode and tm.vegi =@vegi
and ts.itemCode = tm.itemCode and mme.itemMessurmentCode = mm.itemMessurmentCode
and tm.isActive ='true'


END
                                             
--execute [VICTULING_GetAndBindDailyMenuItem] '2017-11-01','30000001','60000001','Non-Vegetarian'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAndBindFinalGroupMenuItemByCA]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Group Menu item list
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAndBindFinalGroupMenuItemByCA] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)



as
BEGIN	

select tm.offNo,tm.serviceType,tm.itemCode,mm.item,ts.currentStock ,tm.qty ,mme.itemMessurment,tm.id
from [dbo].[T_GroupMenuItemByCA] as tm,[dbo].[M_Item] as mm,[dbo].[T_StockQty] as ts,[dbo].[M_ItemByMessurment] as mme
where tm.date = @date and tm.reasonCode = @reasonCode  and tm.wardroomCode = @wardroomCode and mm.itemCode = tm.itemCode 
and ts.itemCode = tm.itemCode and mme.itemMessurmentCode = mm.itemMessurmentCode
and tm.isActive ='true'




END
                                             
--execute [VICTULING_GetAndBindFinalGroupMenuItemByCA] '2017-11-02','30000001','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAndBindGroupMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAndBindGroupMenu] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)



as
BEGIN	

select mc.mainItemCategory,mm.mainItem,tm.id
from [dbo].[T_GroupMenuAttendance] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode 
and mc.mainItemCategoryCode = tm.mealCategory and tm.isActive = 'true'


END

--execute [VICTULING_GetAndBindDailyMenu] '2017-11-05','30000001','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAndBindGroupMenuAttendance]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Group Menu Attendance
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAndBindGroupMenuAttendance] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)



as
BEGIN	

select tm.offNo,tm.serviceType,tm.id,mc.mainItemCategory,mm.mainItem,tm.remarks
from [T_GroupMenuAttendance] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode 
and mc.mainItemCategoryCode = tm.mealCategory and tm.isActive ='true'
order by mm.mainItem,tm.offNo ASC

END

--execute [VICTULING_GetAndBindGroupMenuAttendance]'2017-11-23','30000009','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAndBindGroupMenuItem]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu item list
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAndBindGroupMenuItem] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupTypeCode varchar(50)


as
BEGIN	

select tm.itemCode,mm.item,ts.currentStock,mme.itemMessurment,tm.qty
from [dbo].[T_GroupMenuListItem] as tm,[dbo].[M_Item] as mm,[dbo].[T_StockQty] as ts,[dbo].[M_ItemByMessurment] as mme,[dbo].[M_ItemReason] as mi
where tm.date = @date and tm.reasonCode = @reasonCode  and tm.wardroomCode = @wardroomCode and mm.itemCode = tm.itemCode  
and ts.itemCode = tm.itemCode and mme.itemMessurmentCode = mm.itemMessurmentCode
and tm.isActive ='true' and mi.reasonCode=tm.reasonCode


END
                                             
--execute [VICTULING_GetAndBindDailyMenuItem] '2017-11-01','30000001','60000001','Non-Vegetarian'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAndBindGroupMenuItemByCA]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Group Menu item list
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAndBindGroupMenuItemByCA] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)



as
BEGIN	

select tm.itemCode,mm.item,ts.currentStock ,mme.itemMessurment,tm.id
from [dbo].[T_GroupMenuItemByCA] as tm,[dbo].[M_Item] as mm,[dbo].[T_StockQty] as ts,[dbo].[M_ItemByMessurment] as mme
where tm.date = @date and tm.reasonCode = @reasonCode  and tm.wardroomCode = @wardroomCode and mm.itemCode = tm.itemCode 
and ts.itemCode = tm.itemCode and mme.itemMessurmentCode = mm.itemMessurmentCode
and tm.isActive ='true'




END
                                             
--execute [VICTULING_GetAndBindGroupMenuItemByCA] '2017-11-02','30000001','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAndBindIndividualExtraItemByCA]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu item list
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAndBindIndividualExtraItemByCA] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)



as
BEGIN	

select tm.offNo,tm.itemCode,mm.item,ts.currentStock ,tm.qty,mme.itemMessurment,tm.id
from [dbo].[T_IndividualExtraItemByCA] as tm,[dbo].[M_Item] as mm,[dbo].[T_StockQty] as ts,[dbo].[M_ItemByMessurment] as mme
where tm.date = @date and tm.reasonCode = @reasonCode  and tm.wardroomCode = @wardroomCode and mm.itemCode = tm.itemCode 
and ts.itemCode = tm.itemCode and mme.itemMessurmentCode = mm.itemMessurmentCode
--and tm.isActive ='true'




END
                                             
--execute [VICTULING_GetAndBindIndividualExtraItemByCA] '2018-09-05','30000001','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetAndBindParty]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetAndBindParty] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupMenuCode varchar(50)

--use to normal menu

as
BEGIN	

--if(@groupMenuCode = '')

--begin
--select tm.mainItemCode,mc.mainItemCategory,mm.mainItem,tm.id
--from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
--where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode 
--and mc.mainItemCategoryCode = tm.mealCategory and tm.isAuthorized = 'false' and  tm.groupMenuCode  =@groupMenuCode 
--end

--else
select tm.mainItemCode,mc.mainItemCategory,mm.mainItem,tm.id,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc,[dbo].[M_GroupMenu] as mgm
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode 
and mc.mainItemCategoryCode = tm.mealCategory and tm.isAuthorized = 'true' and mgm.GroupMenuCode = tm.groupMenuCode and tm.isActive ='true'
and tm.groupMenuCode = @groupMenuCode
order by mc.mainItemCategory,mm.mainItem ASC


END

--execute [VICTULING_GetAndBindParty] '8/5/2020','30000023','60000001','70000026'

--execute [VICTULING_GetAndBindDailyMenu] '2019-08-01','30000004','60000001','70000017'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetBillList_byBillNo]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get bill list 
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetBillList_byBillNo] 
@date date,
@wardroomCode varchar(50),
@billNo varchar(50)

as
BEGIN	



select round(sum(convert(float,ts.unitPrice)*ts.onChargeQty),2) as unitPrice,ts.onChargeDate
from [dbo].[T_Stock] as ts
where ts.onChargeDate = @date and ts.wordRoomCode = @wardroomCode and ts.billNo =@billNo and ts.recevedFrom = 'Cash'
group by ts.onChargeDate



END

--execute [VICTULING_GetBillList_byBillNo] '2021-01-02','60000001','03'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetBillList_byDate]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get bill list 
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetBillList_byDate] 
@date date,
@wardroomCode varchar(50),
@descriptionCode varchar(300)

as
BEGIN	

if(@descriptionCode = '1102')
begin

select distinct(ts.billNo ) as billNo ,ts.onChargeDate
from [dbo].[T_Stock] as ts
where ts.onChargeDate = @date and ts.wordRoomCode = @wardroomCode and ts.recevedFrom = 'Cash'
order by ts.billNo ASC

end

END

--execute [VICTULING_GetBillList_byDate] '2020-06-20','60000001','1102'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetBlockList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetBlockList]  
as
select mb.blockID,mb.blockNo
from [dbo].[M_BlockNo_List] as mb
order by mb.blockNo ASC



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetBranchList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetBranchList]  
as
select br.branchCode,br.branchID,branchName
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as br
where br.officerSailor ='O'
order by br.branchID ASC





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetCabinAllocationList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetCabinAllocationList] 


as
BEGIN

select mb.branchID,tc.officialNo,mr.rankRate,tc.name,tc.livingInOut,tc.cabinTelephoneNo,tc.telephoneNo,tc.remarks,mbl.blockNo,mcl.cabinNo,
CONVERT (varchar(4),DATEPART(Year, tc.fromDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tc.fromDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tc.fromDate)) AS fromDate
from [dbo].[T_CabinAllocation] as tc,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,
[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[dbo].[M_BlockNo_List] as mbl,[dbo].[M_CabinNo_List] as mcl
where mb.branchCode = tc.branch and  mr.rankRateCode = tp.rankRateCode 
and tp.officialNo = tc.officialNo and tp.officerSailor = 'O' and mbl.blockID = tc.blockNo and mcl.cabinID= tc.cabinNo and tc.status is null
order by tc.cabinNo,mr.priority,tc.officialNo ASC

END

--execute [VICTULING_GetCabinAllocationListByCabin] '80000015','90000122'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetCabinAllocationListByCabin]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetCabinAllocationListByCabin] 
@blockName varchar(50),
@cabinName varchar(50)

as
BEGIN
select mb.branchID,tc.officialNo,mr.rankRate,tc.name,tc.livingInOut,tc.cabinTelephoneNo,tc.telephoneNo,tc.remarks,tc.id,
CONVERT (varchar(4),DATEPART(Year, tc.fromDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tc.fromDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tc.fromDate)) AS fromDate
from [dbo].[T_CabinAllocation] as tc,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,
[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
where mb.branchCode = tc.branch and tc.cabinNo = @cabinName and tc.blockNo = @blockName and mr.rankRateCode = tp.rankRateCode
and tp.officialNo = tc.officialNo and tp.officerSailor = 'O' and tc.status is null
order by tc.cabinNo,mr.priority,tc.officialNo ASC

END

--execute [VICTULING_GetCabinAllocationListByCabin] '80000015','90000122'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetCabinList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147

-- Description: 
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetCabinList] @blockName varchar(50)
as
BEGIN
select mc.cabinID,mc.cabinNo,mc.cabinType
from [dbo].[M_BlockNo_List] as mb,[dbo].[M_CabinNo_List] as mc
where mc.blockID = mb.blockID and mc.blockID = @blockName
order by mc.cabinID ASC
END








GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetCAGroupMenuItemListByDate]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu item list
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetCAGroupMenuItemListByDate] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupTypeCode varchar(50)



as
BEGIN	

select tm.itemCode,mm.item,tm.qty ,ti.itemMessurment
from [dbo].[T_GroupMenuListItem] as tm,[dbo].[M_Item] as mm,[dbo].[M_ItemByMessurment] as ti
where tm.date = @date and tm.reasonCode = @reasonCode  and tm.wardroomCode = @wardroomCode 
and mm.itemCode = tm.itemCode and tm.isActive ='true' and mm.itemMessurmentCode = ti.itemMessurmentCode 
and tm.groupTypeCode = @groupTypeCode


END
                                             
--execute [VICTULING_GetCAItemListByDate] '11/1/2017','30000001','60000001','Vegetarian'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetCAItemListByDate]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu item list
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetCAItemListByDate] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@vegi varchar(50)


as
BEGIN	

select tm.itemCode,mm.item,tm.qty ,ti.itemMessurment
from [dbo].[T_MenuListItem] as tm,[dbo].[M_Item] as mm,[dbo].[M_ItemByMessurment] as ti
where tm.date = @date and tm.reasonCode = @reasonCode  and tm.wardroom = @wardroomCode 
and mm.itemCode = tm.itemCode and tm.isActive ='true' and mm.itemMessurmentCode = ti.itemMessurmentCode and tm.vegi=@vegi


END
                                             
--execute [VICTULING_GetCAItemListByDate] '11/1/2017','30000001','60000001','Vegetarian'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetCash309ItemByDuration]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get Personal Data
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetCash309ItemByDuration] 

@type varchar(50),
@fromDate date,
@toDate date,
@wardroom varchar(50)

as
BEGIN	


select CONVERT (varchar(4),DATEPART(Year, ts.onChargeDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, ts.onChargeDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, ts.onChargeDate)) AS onChargeDate
,ts.recevedFrom,ts.billNo,ts.unitPrice,ts.onChargeQty,tm.itemMessurment
,ROUND(sum((convert (float,ts.unitPrice)*convert(float,ts.onChargeQty))),2) as price,mt.item 

from [dbo].[T_Stock] as ts,[dbo].[M_ItemByMessurment] as tm,[dbo].[M_Item] as mt
where tm.itemMessurmentCode = ts.itemMessurmentCode and recevedFrom = @type and ts.onChargeDate BETWEEN @fromDate AND @toDate
and ts.wordRoomCode = @wardroom and mt.itemCode = ts.itemCode

group by ts.onChargeDate,ts.recevedFrom,ts.billNo,ts.unitPrice,ts.onChargeQty,tm.itemMessurment,mt.item
order by ts.onChargeDate

--select sum(tb.discountPrice) as discount
--from [dbo].[T_Stock] as ts,[dbo].[T_BillDiscount] as tb 
--where ts.billNo = tb.billNo and tb.recevedFrom = ts.recevedFrom and ts.onChargeDate = tb.onChargeDate
--and tb.recevedFrom = @type and tb.onChargeDate BETWEEN @fromDate AND @toDate

SELECT        SUM(discountPrice) AS discount
FROM            T_BillDiscount
WHERE        (recevedFrom = @type) AND (onChargeDate BETWEEN @fromDate AND @toDate)

select ISNULL(SUM(convert(float,td.price)),0.00) as price
from [dbo].[T_DepreciationItems] as td
where td.reasonCode =30000027 AND (td.depreciationDate BETWEEN @fromDate AND @toDate) and td.recevedFrom = @type

END

--execute [VICTULING_GetCash309ItemByDuration] '309','2021-12-01','2021-12-31','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetCashBook]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to Get Cash Book
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_GetCashBook] 
	
@wordRoomCode varchar(50),
@date date

AS

BEGIN

select CONVERT (varchar(4),DATEPART(Year, tc.date)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tc.date)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tc.date)) AS date  
,mc.description,tc.remarks,tc.creditDebit,CAST(isnull(tc.cost,0) as DECIMAL(18,2)) as Credit
, CAST(isnull(0 ,0.00) as DECIMAL(18,2)) as Debit
from [dbo].[T_CashBookDetails] as tc,[dbo].[M_CashBookReason] as mc
where tc.date = @date and tc.wardroom = @wordRoomCode and mc.descriptionCode = tc.description and tc.creditDebit = 'C'

union

select CONVERT (varchar(4),DATEPART(Year, tc.date)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tc.date)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tc.date)) AS date  
,mc.description,tc.remarks,tc.creditDebit, CAST(isnull(0,0.00) as DECIMAL(18,2)) ,CAST(isnull(tc.cost,0) as DECIMAL(18,2)) 
from [dbo].[T_CashBookDetails] as tc,[dbo].[M_CashBookReason] as mc
where tc.date = @date and tc.wardroom = @wordRoomCode and mc.descriptionCode = tc.description and tc.creditDebit = 'D'


declare @totalCredit float 
declare @totalDebit float 
declare @cashInHand float 

select ISNULL (sum(tc.cost),0.00) as totalCredit
from [dbo].[T_CashBookDetails] as tc
where tc.date = @date and tc.wardroom = @wordRoomCode  and tc.creditDebit = 'C'

select ISNULL (sum(tc.cost),0.00) as totalDebit
from [dbo].[T_CashBookDetails] as tc
where tc.date = @date and tc.wardroom = @wordRoomCode  and tc.creditDebit = 'D'

select @totalCredit = ISNULL (sum(tc.cost),0.00)
from [dbo].[T_CashBookDetails] as tc
where tc.date = @date and tc.wardroom = @wordRoomCode  and tc.creditDebit = 'C'

select @totalDebit = ISNULL (sum(tc.cost),0.00)
from [dbo].[T_CashBookDetails] as tc
where tc.date = @date and tc.wardroom = @wordRoomCode  and tc.creditDebit = 'D'


select @cashInHand = (@totalDebit-@totalCredit)
select @cashInHand as cashInHand


END

--execute [VICTULING_GetCashBook] '60000001','2021-01-02'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetCashSummaryBook]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to Get Cash Book
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_GetCashSummaryBook] 
	
@wordRoomCode varchar(50),
@year varchar(50),
@month varchar(50)

AS

BEGIN

select 
mc.description,tc.creditDebit,sum(CAST(isnull(tc.cost,0) as DECIMAL(18,2))) as Credit
,sum(CAST(isnull(0 ,0.00) as DECIMAL(18,2))) as Debit
from [dbo].[T_CashBookDetails] as tc,[dbo].[M_CashBookReason] as mc
where YEAR(tc.date)= @year and MONTH(tc.date)= @month and tc.wardroom = @wordRoomCode and mc.descriptionCode = tc.description and tc.creditDebit = 'C'
group by mc.description,tc.creditDebit
union

select 
mc.description,tc.creditDebit, sum(CAST(isnull(0,0.00) as DECIMAL(18,2))) ,sum(CAST(isnull(tc.cost,0) as DECIMAL(18,2))) 
from [dbo].[T_CashBookDetails] as tc,[dbo].[M_CashBookReason] as mc
where YEAR(tc.date)= @year and MONTH(tc.date) = @month and tc.wardroom = @wordRoomCode and mc.descriptionCode = tc.description and tc.creditDebit = 'D'
group by mc.description,tc.creditDebit

declare @totalCredit decimal 
declare @totalDebit decimal 
declare @cashInHand decimal 

select sum(tc.cost) as totalCredit
from [dbo].[T_CashBookDetails] as tc
where YEAR(tc.date)= @year and MONTH(tc.date) = @month and tc.wardroom = @wordRoomCode  and tc.creditDebit = 'C'

select sum(tc.cost) as totalDebit
from [dbo].[T_CashBookDetails] as tc
where YEAR(tc.date)= @year and MONTH(tc.date) = @month and tc.wardroom = @wordRoomCode  and tc.creditDebit = 'D'

select @totalCredit = sum(tc.cost) 
from [dbo].[T_CashBookDetails] as tc
where YEAR(tc.date)= @year and MONTH(tc.date) = @month and tc.wardroom = @wordRoomCode  and tc.creditDebit = 'C'

select @totalDebit = sum(tc.cost) 
from [dbo].[T_CashBookDetails] as tc
where YEAR(tc.date)= @year and MONTH(tc.date) = @month and tc.wardroom = @wordRoomCode  and tc.creditDebit = 'D'


select @cashInHand = (@totalDebit-@totalCredit) 
select round(@cashInHand,2) as cashInHand


END

--execute [VICTULING_GetCashSummaryBook] '60000001','04'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetCstomizeIndividualItems]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get customize meal item list (Individual)
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetCstomizeIndividualItems] 
@date datetime,
@reasonCode varchar(50),
@wardroomCode varchar(50)

as
BEGIN	

select  mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tc.selectedMeal,tc.remarks,tc.noneVegetarian,tc.vegetarian,tc.mealIn,tc.mealOut,tc.mealCount,tc.CID
from [dbo].[T_customizeMealAttendance] as tc,[dbo].[M_Wardroom] as mw,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
where tc.mealDate =@date and tc.reason = @reasonCode and tc.wardroom =@wardroomCode and mw.wardroomCode =tc.wardroom
and mb.branchCode = tp.branchCode and tc.officialNo = tp.officialNo  and tc.officerSailor = tp.officerSailor and mr.rankRateCode = tp.rankRateCode 
and tp.isActive ='true'
order by mr.[priority],tc.officialNo

end

-- execute [VICTULING_GetCstomizeIndividualItems] '2018-08-22','Breakfast','60000001'


GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetCurrentStock]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Current Stock
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetCurrentStock] 
@itemCode varchar(50),
@saleQty varchar(50),
@itemId int


as
BEGIN	

select ts.itemId as itemCode 
,mi.item,ts.recevedFrom,ts.unitPrice,mm.itemMessurment,
ts.CurrentQty,@saleQty as saleQty,(convert(float,ts.CurrentQty)-convert(float,@saleQty)) as stockQty

from [dbo].[T_Stock] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = ts.itemMessurmentCode and ts.CurrentQty != '0' 
and ts.itemCode = @itemCode and ts.itemId = @itemId


END

--execute [VICTULING_GetCurrentStock] '40000513',1,65029





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetCurrentStock_Individual]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Current Stock
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetCurrentStock_Individual] 
@itemCode varchar(50),
@saleQty varchar(50)


as
BEGIN	

select ts.itemId as itemCode 
,mi.item,ts.recevedFrom,ts.unitPrice,mm.itemMessurment,
ts.CurrentQty,@saleQty as saleQty,(convert(float,ts.CurrentQty)-convert(float,@saleQty)) as stockQty

from [dbo].[T_Stock] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = ts.itemMessurmentCode and ts.CurrentQty != '0' 
and ts.itemId = @itemCode 


END

--execute [VICTULING_GetCurrentStock_Individual] '68200',1





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetDailyMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetDailyMenu] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupMenuCode varchar(50)

--use for normal menu

as
BEGIN	
if(@groupMenuCode = '')
begin

if(@reasonCode != 'All')
begin
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and tm.groupMenuCode  =@groupMenuCode 
and tm.vegiNonVegi = 'Non-Vegetarian'
order by mm.mainItem ASC
end

else
begin

--breakfast
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = '30000001' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and tm.groupMenuCode  =@groupMenuCode 
and tm.vegiNonVegi = 'Non-Vegetarian'
order by mm.mainItem ASC

--lunch
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = '30000002' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and tm.groupMenuCode  =@groupMenuCode 
and tm.vegiNonVegi = 'Non-Vegetarian'
order by mm.mainItem ASC

--supper
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = '30000003' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and tm.groupMenuCode  =@groupMenuCode 
and tm.vegiNonVegi = 'Non-Vegetarian'
order by mm.mainItem ASC
end
END

else

if(@reasonCode != 'All')
begin
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and tm.groupMenuCode  =@groupMenuCode 
and tm.vegiNonVegi = 'Non-Vegetarian'
order by mm.mainItem ASC
end

else
begin

--breakfast
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc ,[dbo].[M_GroupMenu] as mgm
where tm.date = @date and tm.reasonCode = '30000001' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and mgm.GroupMenuCode = tm.groupMenuCode 
and tm.groupMenuCode  =@groupMenuCode 
and tm.vegiNonVegi = 'Non-Vegetarian'
order by mm.mainItem ASC

--lunch
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc ,[dbo].[M_GroupMenu] as mgm
where tm.date = @date and tm.reasonCode = '30000002' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and mgm.GroupMenuCode = tm.groupMenuCode
and tm.vegiNonVegi = 'Non-Vegetarian'
order by mm.mainItem ASC

--supper
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc ,[dbo].[M_GroupMenu] as mgm
where tm.date = @date and tm.reasonCode = '30000003' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and mgm.GroupMenuCode = tm.groupMenuCode
and tm.vegiNonVegi = 'Non-Vegetarian'
order by mm.mainItem ASC
end



END




--execute [VICTULING_GetDailyMenu] '2018-09-09','30000001','60000007',''

--execute [VICTULING_GetDailyMenu] '2022-09-09','30000001','60000007','70000000'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetDailyMenu_Veg]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetDailyMenu_Veg] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupMenuCode varchar(50)

--use for normal menu

as
BEGIN	
if(@groupMenuCode = '')
begin

if(@reasonCode != 'All')
begin
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and tm.groupMenuCode  =@groupMenuCode 
and tm.vegiNonVegi = 'Vegetarian'
order by mm.mainItem ASC
end

else
begin

--breakfast
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = '30000001' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and tm.groupMenuCode  =@groupMenuCode 
and tm.vegiNonVegi = 'Vegetarian'
order by mm.mainItem ASC

--lunch
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = '30000002' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and tm.groupMenuCode  =@groupMenuCode 
and tm.vegiNonVegi = 'Vegetarian'
order by mm.mainItem ASC

--supper
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = '30000003' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and tm.groupMenuCode  =@groupMenuCode 
and tm.vegiNonVegi = 'Vegetarian'
order by mm.mainItem ASC
end
END

else

if(@reasonCode != 'All')
begin
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and tm.groupMenuCode  =@groupMenuCode 
and tm.vegiNonVegi = 'Vegetarian'
order by mm.mainItem ASC
end

else
begin

--breakfast
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc ,[dbo].[M_GroupMenu] as mgm
where tm.date = @date and tm.reasonCode = '30000001' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and mgm.GroupMenuCode = tm.groupMenuCode 
and tm.vegiNonVegi = 'Vegetarian'
order by mm.mainItem ASC

--lunch
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc ,[dbo].[M_GroupMenu] as mgm
where tm.date = @date and tm.reasonCode = '30000002' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and mgm.GroupMenuCode = tm.groupMenuCode
and tm.vegiNonVegi = 'Vegetarian'
order by mm.mainItem ASC

--supper
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc ,[dbo].[M_GroupMenu] as mgm
where tm.date = @date and tm.reasonCode = '30000003' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and mgm.GroupMenuCode = tm.groupMenuCode
and tm.vegiNonVegi = 'Vegetarian'
order by mm.mainItem ASC
end



END




--execute [VICTULING_GetDailyMenu_Veg] '2018-12-05','30000001','60000001',''
--execute [VICTULING_GetDailyMenu_Veg] '2018-12-05','30000001','60000001','70000001'


--execute [VICTULING_GetDailyMenu] '2018-12-05','30000001','60000001',''
--execute [VICTULING_GetDailyMenu] '2018-12-05','30000001','60000001','70000001'


GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetDailyMenuNotAuthorized]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu Not Authorized
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetDailyMenuNotAuthorized] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupMenuCode varchar(50),
@vegiNonVegi varchar(50)

--use for normal menu

as
BEGIN	
if(@groupMenuCode = '')

begin
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'false' and tm.groupMenuCode  =@groupMenuCode and tm.vegiNonVegi =@vegiNonVegi
order by mm.mainItem,mc.mainItemCategory ASC
end

else
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc,[dbo].[M_GroupMenu] as mgm
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive  = 'true' and isAuthorized = 'false' and mgm.GroupMenuCode = tm.groupMenuCode and tm.vegiNonVegi =@vegiNonVegi
and tm.groupMenuCode  =@groupMenuCode

order by mm.mainItem,mc.mainItemCategory ASC

END

--execute [VICTULING_GetDailyMenuNotAuthorized] '2018-12-05','30000001','60000001','70000001','Vegetarian'



--execute [VICTULING_GetDailyMenuNotAuthorized] '2018-12-05','30000001','60000001','','Vegetarian'
--execute [VICTULING_GetDailyMenuNotAuthorized] '2019-01-01','30000001','60000001','70000001','Vegetarian'
--execute [VICTULING_GetDailyMenuNotAuthorized] '2019-01-01','30000001','60000001','70000000','Non-Vegetarian'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetDailyProperMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetDailyProperMenu] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@vegiNonVegi varchar(50)
,@groupMenuCode varchar(50)

-- use for normal menu
as
BEGIN	


if(@reasonCode != 'All')
begin
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and vegiNonVegi = @vegiNonVegi 
and tm.groupMenuCode = @groupMenuCode
order by mm.mainItem ASC
end

else
begin

--breakfast
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = '30000001' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and vegiNonVegi = @vegiNonVegi
and tm.groupMenuCode = @groupMenuCode
order by mm.mainItem ASC

--lunch
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = '30000002' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and vegiNonVegi = @vegiNonVegi
and tm.groupMenuCode = @groupMenuCode
order by mm.mainItem ASC

--supper
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = '30000003' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and vegiNonVegi = @vegiNonVegi
and tm.groupMenuCode = @groupMenuCode
order by mm.mainItem ASC
end


END


--execute [VICTULING_GetDailyProperMenu] '1/1/2019','30000001','60000001','Vegetarian','70000000'
--execute [VICTULING_GetDailyProperMenu] '1/1/2019','30000001','60000001','Non-Vegetarian','70000000'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetDailyProperMenu_NonVeg]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetDailyProperMenu_NonVeg] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)
,
@vegiNonVegi varchar(50),
@groupMenuCode varchar(50)


as
BEGIN	


if(@reasonCode != 'All')
begin
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and vegiNonVegi = 'Non-Vegetarian'
and tm.groupMenuCode = @groupMenuCode
order by mm.mainItem ASC
end

else
begin

--breakfast
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = '30000001' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and vegiNonVegi = 'Non-Vegetarian'
and tm.groupMenuCode = @groupMenuCode
order by mm.mainItem ASC

--lunch
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = '30000002' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and vegiNonVegi = 'Non-Vegetarian'
and tm.groupMenuCode = @groupMenuCode
order by mm.mainItem ASC

--supper
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = '30000003' and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and vegiNonVegi = 'Non-Vegetarian'
and tm.groupMenuCode = @groupMenuCode
order by mm.mainItem ASC
end


END




--execute [VICTULING_GetDailyProperMenu_NonVeg] '2018-12-05','30000001','60000001'
--execute [VICTULING_GetDailyProperMenu] '2018-12-05','30000001','60000001'

--execute [VICTULING_GetDailyProperMenu_NonVeg] '2019-02-01','30000001','60000001','70000001'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetDepreciationItemList_OnDate]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Depreciation Item List for On Date
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetDepreciationItemList_OnDate] 
@reason varchar(50),
@onChargeDate date,
@wardroomName varchar(150)


as
BEGIN	

select mi.itemCode,mi.item,ts.unitPrice,ts.depreciationQty,mm.itemMessurment,ts.recevedFrom,ts.depreciationID,round((convert (float,ts.unitPrice)*convert(float,ts.depreciationQty)),2) as price
from [dbo].[T_DepreciationItems] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode 
--and mw.wardroomCode = ts.wordRoomCode 
and mw.wardroomCode = @wardroomName and ts.depreciationDate = @onChargeDate and ts.reasonCode = @reason


END

--execute [VICTULING_GetDepreciationItemList_OnDate] '30000013','2020-06-01','60000001'


--ALTER PROCEDURE [dbo].[VICTULING_GetDepreciationItemList_OnDate] 
--@reason varchar(50),
--@depreciationDate date,
--@wardroomCode varchar(150)


--as
--BEGIN	

--select mi.itemCode,mi.item,ts.unitPrice,ts.depreciationQty,mm.itemMessurment,ts.recevedFrom,ts.depreciationID,(convert (float,ts.unitPrice)*convert(float,ts.depreciationQty)) as price
--from [dbo].[T_DepreciationItems] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
--where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode 
--and mw.wardroomCode = @wardroomCode and ts.depreciationDate = @depreciationDate and ts.reasonCode = @reason 


--END


GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetDetails_ResetPassword]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetDetails_ResetPassword]

@Nic varchar(30)

AS
BEGIN
	
	select * from [dbo].[VICTULING_Reset_Password]
	where [nicNo] = @Nic

END


GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetExcistingStockItems]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Excisting Stock Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetExcistingStockItems] 
@itemCode varchar(50)


as
BEGIN	

select ts.itemId as 'Item Code' ,mi.item as Item,ts.recevedFrom as 'Receved From',ts.unitPrice as 'Unit Price',ts.CurrentQty as 'Current Qty.',mm.itemMessurment as 'Measurement',ts.itemCode,ts.ToOffNo

from [dbo].[T_Stock] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = ts.itemMessurmentCode and ts.CurrentQty != '0' and ts.itemCode = @itemCode
order by ts.itemId ASC
--select mi.item as Item,ts.recevedFrom as 'Receved From',ts.unitPrice as 'Unit Price',mm.itemMessurment as 'Measurement',ts.itemCode,
--sum(convert(float,ts.CurrentQty)) as CurrentQty

--from [dbo].[T_Stock] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm
--where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = ts.itemMessurmentCode and ts.CurrentQty != '0' and ts.itemCode = @itemCode
--group by ts.itemCode,mi.item,ts.recevedFrom,mm.itemMessurment,ts.unitPrice


END

--execute [VICTULING_GetExcistingStockItems] '40000153'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetExcistingStockItems_New]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Excisting Stock Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetExcistingStockItems_New] 
@date date,
@wardroom varchar(70),
@reason varchar(70),
@menuType varchar(70),
@vegNveg varchar(70)


--@itemCode varchar(50)


as
BEGIN	

select mi.item as Item,ts.recevedFrom as 'Receved From',ts.unitPrice as 'Unit Price',mm.itemMessurment as 'Measurement',ts.itemCode,
--ts.CurrentQty as 'Current Qty.,'ts.itemId as 'Item Code' 
sum(convert(float,ts.CurrentQty)) as CurrentQty,tm.qty

from [dbo].[T_Stock] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm
,[dbo].[T_MealItemsSaleBySA] as tm

where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = ts.itemMessurmentCode and ts.CurrentQty != '0' 
and tm.date =@date and tm.wardroom = @wardroom and tm.reason = @reason and tm.menuType = @menuType and tm.vegNveg =  @vegNveg
and ts.itemCode = tm.itemCode

group by ts.itemCode,mi.item,ts.recevedFrom,mm.itemMessurment,ts.unitPrice,tm.qty

order by mi.item ASC

END

--execute [VICTULING_GetExcistingStockItems_New] '2019-04-01','60000001','30000001','70000000','Vegetarian'   
--execute [VICTULING_GetExcistingStockItems_New] '40000314'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetExcistingStockItems_New1]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Excisting Stock Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetExcistingStockItems_New1] 
@date date,
@wardroom varchar(70),
@reason varchar(70),
@menuType varchar(70),
@vegNveg varchar(70)


--@itemCode varchar(50)


as
BEGIN	

select distinct mi.item as Item,ts.recevedFrom as 'Receved From',ts.unitPrice as 'Unit Price',mm.itemMessurment as 'Measurement',ts.itemCode,
--sum(convert(float,ts.CurrentQty)) as CurrentQty
ts.CurrentQty as 'Current Qty.,',ts.itemId as 'Item Code' 

from [dbo].[T_Stock] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm
,[dbo].[T_MealItemsSaleBySA] as tm

where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = ts.itemMessurmentCode and ts.CurrentQty != '0' and ts.CurrentQty != '0.00' and ts.CurrentQty != '0.000'
and tm.date =@date and tm.wardroom = @wardroom and tm.reason = @reason and tm.menuType = @menuType and tm.vegNveg =  @vegNveg
and ts.itemCode = tm.itemCode 
and ts.reason ='---Select---'

--group by ts.itemCode,mi.item,ts.recevedFrom,mm.itemMessurment,ts.unitPrice,tm.qty,ts.itemId,ts.CurrentQty

--order by ts.itemId, mi.item ASC
order by  mi.item,ts.itemId ASC

END

--execute [VICTULING_GetExcistingStockItems_New1] '2021-01-18','60000001','30000003','70000000','Non-Vegetarian'   






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetExcistingStockItems_New1_Group]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Excisting Stock Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetExcistingStockItems_New1_Group] 
@date date,
@wardroom varchar(70),
@reason varchar(70),
@menuType varchar(70),
@vegNveg varchar(70)


--@itemCode varchar(50)


as
BEGIN	

if(@reason ='30000001' or @reason ='30000002' or @reason ='30000003' )
begin
select distinct mi.item as Item,ts.recevedFrom as 'Receved From',ts.unitPrice as 'Unit Price',mm.itemMessurment as 'Measurement',ts.itemCode,
--sum(convert(float,ts.CurrentQty)) as CurrentQty
ts.CurrentQty as 'Current Qty.,',ts.itemId as 'Item Code' 

from [dbo].[T_Stock] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm
,[dbo].[T_MealItemsSaleBySA] as tm

where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = ts.itemMessurmentCode and ts.CurrentQty != '0' 
and tm.date =@date and tm.wardroom = @wardroom and tm.reason = @reason and tm.menuType = @menuType and tm.vegNveg =  @vegNveg
and ts.itemCode = tm.itemCode 
and ts.reason ='---Select---'

group by ts.itemCode,mi.item,ts.recevedFrom,mm.itemMessurment,ts.unitPrice,tm.qty,ts.itemId,ts.CurrentQty

order by mi.item,ts.itemId ASC
end

if(@reason !='30000001' or @reason !='30000002' or @reason !='30000003' )
begin
select distinct mi.item as Item,ts.recevedFrom as 'Receved From',ts.unitPrice as 'Unit Price',mm.itemMessurment as 'Measurement',ts.itemCode,
--sum(convert(float,ts.CurrentQty)) as CurrentQty
ts.CurrentQty as 'Current Qty.,',ts.itemId as 'Item Code' 

from [dbo].[T_Stock] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm
,[dbo].[T_MealItemsSaleBySA] as tm

where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = ts.itemMessurmentCode and ts.CurrentQty != '0' 
and tm.date =@date and tm.wardroom = @wardroom and tm.reason = @reason and tm.menuType = @menuType and tm.vegNveg =  @vegNveg
and ts.itemCode = tm.itemCode 


group by ts.itemCode,mi.item,ts.recevedFrom,mm.itemMessurment,ts.unitPrice,tm.qty,ts.itemId,ts.CurrentQty

order by mi.item,ts.itemId ASC
end

END

--execute [VICTULING_GetExcistingStockItems_New1_Group] '2019-09-19','60000001','30000004','70000018','Non-Vegetarian'   

--execute [VICTULING_GetExcistingStockItems_New1_Group] '2019-10-02','60000001','30000004','70000018','Non-Vegetarian'   




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetExcistingStockItems_New1_Group_Party]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Excisting Stock Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetExcistingStockItems_New1_Group_Party] 
@date date,
@wardroom varchar(70),
@reason varchar(70),
@menuType varchar(70),
@vegNveg varchar(70),
@GroupMenuCode varchar(50)


--@itemCode varchar(50)


as
BEGIN	

if(@reason ='30000001' or @reason ='30000002' or @reason ='30000003' )
begin
select distinct mi.item as Item,ts.recevedFrom as 'Receved From',ts.unitPrice as 'Unit Price',mm.itemMessurment as 'Measurement',ts.itemCode,
--sum(convert(float,ts.CurrentQty)) as CurrentQty
ts.CurrentQty as 'Current Qty.,',ts.itemId as 'Item Code' 

from [dbo].[T_Stock] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm
,[dbo].[T_MealItemsSaleBySA] as tm

where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = ts.itemMessurmentCode and ts.CurrentQty != '0' 
and tm.date =@date and tm.wardroom = @wardroom and tm.reason = @reason and tm.menuType = @menuType and tm.vegNveg =  @vegNveg
and ts.itemCode = tm.itemCode 
and ts.reason ='---Select---' 

group by ts.itemCode,mi.item,ts.recevedFrom,mm.itemMessurment,ts.unitPrice,tm.qty,ts.itemId,ts.CurrentQty

order by mi.item ASC
end

if(@reason !='30000001' or @reason !='30000002' or @reason !='30000003' )
begin
select distinct mi.item as Item,ts.recevedFrom as 'Receved From',ts.unitPrice as 'Unit Price',mm.itemMessurment as 'Measurement',ts.itemCode,
--sum(convert(float,ts.CurrentQty)) as CurrentQty
ts.CurrentQty as 'Current Qty.,',ts.itemId as 'Item Code' 

from [dbo].[T_Stock] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm
,[dbo].[T_MealItemsSaleBySA] as tm

where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = ts.itemMessurmentCode and ts.CurrentQty != '0' 
and tm.date =@date and tm.wardroom = @wardroom and tm.reason = @reason and tm.menuType = @menuType and tm.vegNveg =  @vegNveg
and ts.itemCode = tm.itemCode and tm.GroupMenuCode = @GroupMenuCode


group by ts.itemCode,mi.item,ts.recevedFrom,mm.itemMessurment,ts.unitPrice,tm.qty,ts.itemId,ts.CurrentQty

order by mi.item ASC
end

END

--execute [VICTULING_GetExcistingStockItems_New1_Group] '2019-08-01','60000001','30000004','70000018','Non-Vegetarian'   
--execute [VICTULING_GetExcistingStockItems_New] '40000314'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetExcistingStockItems_New1_Group_test]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Excisting Stock Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetExcistingStockItems_New1_Group_test] 
@date date,
@wardroom varchar(70),
@reason varchar(70),
@menuType varchar(70),
@vegNveg varchar(70)


--@itemCode varchar(50)


as
BEGIN	

if(@reason ='30000001' or @reason ='30000002' or @reason ='30000003' )
begin
select distinct mi.item as Item,ts.recevedFrom as 'Receved From',ts.unitPrice as 'Unit Price',mm.itemMessurment as 'Measurement',ts.itemCode,
--sum(convert(float,ts.CurrentQty)) as CurrentQty
ts.CurrentQty as 'Current Qty.,',ts.itemId as 'Item Code' 

from [dbo].[T_Stock] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm
,[dbo].[T_MealItemsSaleBySA] as tm

where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = ts.itemMessurmentCode and ts.CurrentQty != '0' 
and tm.date =@date and tm.wardroom = @wardroom and tm.reason = @reason and tm.menuType = @menuType and tm.vegNveg =  @vegNveg
and ts.itemCode = tm.itemCode 
and ts.reason ='---Select---'

group by ts.itemCode,mi.item,ts.recevedFrom,mm.itemMessurment,ts.unitPrice,tm.qty,ts.itemId,ts.CurrentQty

order by mi.item ASC
end

if(@reason ='30000004')
begin
select distinct mi.item as Item,ts.recevedFrom as 'Receved From',ts.unitPrice as 'Unit Price',mm.itemMessurment as 'Measurement',ts.itemCode,
--sum(convert(float,ts.CurrentQty)) as CurrentQty
ts.CurrentQty as 'Current Qty.,',ts.itemId as 'Item Code' 

from [dbo].[T_Stock] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm
,[dbo].[T_MealItemsSaleBySA] as tm

where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = ts.itemMessurmentCode and ts.CurrentQty != '0' 
and tm.date =@date and tm.wardroom = @wardroom and tm.reason = @reason and tm.menuType = @menuType and tm.vegNveg =  @vegNveg
and ts.itemCode = tm.itemCode 
and ts.reason ='---Select---'

group by ts.itemCode,mi.item,ts.recevedFrom,mm.itemMessurment,ts.unitPrice,tm.qty,ts.itemId,ts.CurrentQty

order by mi.item ASC
end

if(@reason !='30000001' or @reason !='30000002' or @reason !='30000003' or @reason !='30000003'or @reason !='30000004')
begin
select distinct mi.item as Item,ts.recevedFrom as 'Receved From',ts.unitPrice as 'Unit Price',mm.itemMessurment as 'Measurement',ts.itemCode,
--sum(convert(float,ts.CurrentQty)) as CurrentQty
ts.CurrentQty as 'Current Qty.,',ts.itemId as 'Item Code' 

from [dbo].[T_Stock] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm
,[dbo].[T_MealItemsSaleBySA] as tm

where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = ts.itemMessurmentCode and ts.CurrentQty != '0' 
and tm.date =@date and tm.wardroom = @wardroom and tm.reason = @reason and tm.menuType = @menuType and tm.vegNveg =  @vegNveg
and ts.itemCode = tm.itemCode 


group by ts.itemCode,mi.item,ts.recevedFrom,mm.itemMessurment,ts.unitPrice,tm.qty,ts.itemId,ts.CurrentQty

order by mi.item ASC
end

END

--execute [VICTULING_GetExcistingStockItems_New1_Group] '2019-08-01','60000001','30000004','70000018','Non-Vegetarian'   
--execute [VICTULING_GetExcistingStockItems_New] '40000314'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetFinalMonthlyRecovery_By_SeriveType]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetFinalMonthlyRecovery_By_SeriveType] 
@wardroom varchar(50),
@year int,
@month varchar(50),
@serviceType varchar(50)

as
BEGIN



select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,sum(tt.individualTotalCost +(tt.creditDebit)) as debit,tt.Messsub,tt.barBill,sum(tt.individualTotalCost + tt.Messsub + tt.barBill) as TotRecovery,tt.priority,tt.noOfDays

from [dbo].[T_FinalRecovery_Dining_Wine] as tt ,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays = 0 
and tpe.officialNo = tt.officialNo and tpe.officerSailor = 'O' and mbr.branchCode = tpe.branchCode and mbr.branchID = tt.branchID 

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays

union 

select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,-(tt.creditDebit) as debit,tt.Messsub,tt.barBill,sum(tt.Messsub  + tt.barBill - (tt.creditDebit)) as TotRecovery,tt.priority,tt.noOfDays

from [dbo].[T_FinalRecovery_Dining_Wine] as tt ,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays != 0  and tt.creditDebit <1
and tpe.officialNo = tt.officialNo and tpe.officerSailor = 'O' and mbr.branchCode = tpe.branchCode and mbr.branchID = tt.branchID 

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays

union 

select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,'0.00' as debit,tt.Messsub,tt.barBill,sum(tt.Messsub  + tt.barBill) as TotRecovery,tt.priority,tt.noOfDays

from [dbo].[T_FinalRecovery_Dining_Wine] as tt ,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays != 0  and tt.creditDebit >1
and tpe.officialNo = tt.officialNo and tpe.officerSailor = 'O' and mbr.branchCode = tpe.branchCode and mbr.branchID = tt.branchID 

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays

union 

select tt.branchID,tt.officialNo,mr.rankRate ,tpe.initials + ' ' + tpe.surename as name
--, tt.rankRate ,tt.name
,'0.00' as individualTotalCost ,'0.00' as creditDebit,'0.00' as debit,tt.messsub,'0.00' as barBill,tt.messsub as TotRecovery,mr.priority,''

from [dbo].[T_MonthlyMessSub] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr

where  tt.wardroom = @wardroom and tt.year = @year  and tt.month = @month and 
tt.officialNo not in(select tt.[officialNo] from T_FinalRecovery_Dining_Wine as tt where  wardroom = @wardroom and year = @year and month = @month )
and tpe.officialNo = tt.officialNo and tpe.officerSailor = 'O' and mbr.branchCode = tpe.branchCode and mbr.branchID = tt.branchID 
and mr.rankRateCode = tpe.rankRateCode 

--union 

--select mbr.branchID,tt.offno,mr.rankRate ,tpe.initials + ' ' + tpe.surename as name
----, tt.rankRate ,tt.name
--,'0.00' as individualTotalCost ,'0.00' as creditDebit,'0.00' as debit,tt.recoverDiningAmmount as 'Pending Dining',tt.recoverWineAmmount as 'Pending Wine','0.00' as messsub,'0.00' as barBill,((convert(float,tt.recoverDiningAmmount)) + (convert(float,tt.recoverWineAmmount))) as TotRecovery,mr.priority,''

--from [dbo].[T_PendingRecovery] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr
--,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr

--where  tt.wardroom = @wardroom and tt.recoverYear = @year  and tt.recoverMonth = @month and 
--tt.offno not in(select tt.[officialNo] from T_FinalRecovery_Dining_Wine as tt where  wardroom = @wardroom and year = @year and month = @month )
--and tpe.officialNo = tt.offno and tpe.officerSailor = 'O' and tt.serviceType = tpe.serviceType and  mbr.branchCode = tpe.branchCode 
--and mr.rankRateCode = tpe.rankRateCode 


order by priority,officialNo

------------


END

--execute [VICTULING_GetFinalMonthlyRecovery_DinnigAndWine] '60000001','2020','1'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetFinalMonthlyRecovery_DinnigAndWine]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetFinalMonthlyRecovery_DinnigAndWine] 
@wardroom varchar(50),
@year int,
@month varchar(50)

as
BEGIN



select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,sum(tt.individualTotalCost ) as debit,tt.Messsub,tt.barBill,sum(tt.individualTotalCost + tt.Messsub + tt.barBill) as TotRecovery,tt.priority,tt.noOfDays
--,tt.creditDebit,sum(tt.individualTotalCost +(tt.creditDebit)) as debit,tt.Messsub,tt.barBill,sum(tt.individualTotalCost + tt.Messsub + tt.barBill) as TotRecovery,tt.priority,tt.noOfDays

from [dbo].[T_FinalRecovery_Dining_Wine] as tt

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays = 0

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays

union 

select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,-(tt.creditDebit) as debit,tt.Messsub,tt.barBill,sum(tt.Messsub  + tt.barBill - (tt.creditDebit)) as TotRecovery,tt.priority,tt.noOfDays

from [dbo].[T_FinalRecovery_Dining_Wine] as tt

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays != 0  and tt.creditDebit <1

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays

union 

select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,'0.00' as debit,tt.Messsub,tt.barBill,sum(tt.Messsub  + tt.barBill) as TotRecovery,tt.priority,tt.noOfDays

from [dbo].[T_FinalRecovery_Dining_Wine] as tt

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays != 0  and tt.creditDebit >1

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays

union 

select tt.branchID,tt.officialNo,mr.rankRate ,tpe.initials + ' ' + tpe.surename as name
--, tt.rankRate ,tt.name
,'0.00' as individualTotalCost ,'0.00' as creditDebit,'0.00' as debit,tt.messsub,'0.00' as barBill,tt.messsub as TotRecovery,mr.priority,''

from [dbo].[T_MonthlyMessSub] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr

where  tt.wardroom = @wardroom and tt.year = @year  and tt.month = @month and 
tt.officialNo not in(select tt.[officialNo] from T_FinalRecovery_Dining_Wine as tt where  wardroom = @wardroom and year = @year and month = @month )
and tpe.officialNo = tt.officialNo and tpe.officerSailor = 'O' and mbr.branchCode = tpe.branchCode and mbr.branchID = tt.branchID 
and mr.rankRateCode = tpe.rankRateCode 

--union 

--select mbr.branchID,tt.offno,mr.rankRate ,tpe.initials + ' ' + tpe.surename as name
----, tt.rankRate ,tt.name
--,'0.00' as individualTotalCost ,'0.00' as creditDebit,'0.00' as debit,tt.recoverDiningAmmount as 'Pending Dining',tt.recoverWineAmmount as 'Pending Wine','0.00' as messsub,'0.00' as barBill,((convert(float,tt.recoverDiningAmmount)) + (convert(float,tt.recoverWineAmmount))) as TotRecovery,mr.priority,''

--from [dbo].[T_PendingRecovery] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr
--,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr

--where  tt.wardroom = @wardroom and tt.recoverYear = @year  and tt.recoverMonth = @month and 
--tt.offno not in(select tt.[officialNo] from T_FinalRecovery_Dining_Wine as tt where  wardroom = @wardroom and year = @year and month = @month )
--and tpe.officialNo = tt.offno and tpe.officerSailor = 'O' and tt.serviceType = tpe.serviceType and  mbr.branchCode = tpe.branchCode 
--and mr.rankRateCode = tpe.rankRateCode 


order by priority,officialNo

------------


END

--execute [VICTULING_GetFinalMonthlyRecovery_DinnigAndWine] '60000001','2022','2'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetFinalMonthlyRecovery_DinnigAndWine_ForXML]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetFinalMonthlyRecovery_DinnigAndWine_ForXML] 
@wardroom varchar(50),
@year int,
@month varchar(50)

as
BEGIN



select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,sum(tt.individualTotalCost ) as debit,tt.Messsub,tt.barBill,sum(tt.individualTotalCost + tt.Messsub + tt.barBill) as TotRecovery,tt.priority,tt.noOfDays,tp.serviceType,tp.officerSailor
--,tt.creditDebit,sum(tt.individualTotalCost +(tt.creditDebit)) as debit,tt.Messsub,tt.barBill,sum(tt.individualTotalCost + tt.Messsub + tt.barBill) as TotRecovery,tt.priority,tt.noOfDays

from [dbo].[T_FinalRecovery_Dining_Wine] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays = 0 and tp.officialNo = tt.officialNo and tp.officerSailor = 'O' and tp.isActive = 1

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays,tp.serviceType,tp.officerSailor

union 

select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,-(tt.creditDebit) as debit,tt.Messsub,tt.barBill,sum(tt.Messsub  + tt.barBill - (tt.creditDebit)) as TotRecovery,tt.priority,tt.noOfDays,tp.serviceType,tp.officerSailor

from [dbo].[T_FinalRecovery_Dining_Wine] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays != 0  and tt.creditDebit <1 and tp.officialNo = tt.officialNo and tp.officerSailor = 'O' and tp.isActive = 1

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays,tp.serviceType,tp.officerSailor

union 

select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,'0.00' as debit,tt.Messsub,tt.barBill,sum(tt.Messsub  + tt.barBill) as TotRecovery,tt.priority,tt.noOfDays,tp.serviceType,tp.officerSailor

from [dbo].[T_FinalRecovery_Dining_Wine] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays != 0  and tt.creditDebit >1 and tp.officialNo = tt.officialNo and tp.officerSailor = 'O' and tp.isActive = 1

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays,tp.serviceType,tp.officerSailor

union 

select tt.branchID,tt.officialNo,mr.rankRate ,tpe.initials + ' ' + tpe.surename as name
--, tt.rankRate ,tt.name
,'0.00' as individualTotalCost ,'0.00' as creditDebit,'0.00' as debit,tt.messsub,'0.00' as barBill,tt.messsub as TotRecovery,mr.priority,'',tpe.serviceType,tpe.officerSailor

from [dbo].[T_MonthlyMessSub] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr

where  tt.wardroom = @wardroom and tt.year = @year  and tt.month = @month and 
tt.officialNo not in(select tt.[officialNo] from T_FinalRecovery_Dining_Wine as tt where  wardroom = @wardroom and year = @year and month = @month )
and tpe.officialNo = tt.officialNo and tpe.officerSailor = 'O' and mbr.branchCode = tpe.branchCode and mbr.branchID = tt.branchID 
and mr.rankRateCode = tpe.rankRateCode and tpe.isActive = 1

--union 

--select mbr.branchID,tt.offno,mr.rankRate ,tpe.initials + ' ' + tpe.surename as name
----, tt.rankRate ,tt.name
--,'0.00' as individualTotalCost ,'0.00' as creditDebit,'0.00' as debit,tt.recoverDiningAmmount as 'Pending Dining',tt.recoverWineAmmount as 'Pending Wine','0.00' as messsub,'0.00' as barBill,((convert(float,tt.recoverDiningAmmount)) + (convert(float,tt.recoverWineAmmount))) as TotRecovery,mr.priority,''

--from [dbo].[T_PendingRecovery] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr
--,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr

--where  tt.wardroom = @wardroom and tt.recoverYear = @year  and tt.recoverMonth = @month and 
--tt.offno not in(select tt.[officialNo] from T_FinalRecovery_Dining_Wine as tt where  wardroom = @wardroom and year = @year and month = @month )
--and tpe.officialNo = tt.offno and tpe.officerSailor = 'O' and tt.serviceType = tpe.serviceType and  mbr.branchCode = tpe.branchCode 
--and mr.rankRateCode = tpe.rankRateCode 


order by priority,officialNo

------------


END

--execute [VICTULING_GetFinalMonthlyRecovery_DinnigAndWine_ForXML] '60000001','2023','3'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetFinalMonthlyRecovery_DinnigAndWine_Individual]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetFinalMonthlyRecovery_DinnigAndWine_Individual] 
@wardroom varchar(50),
@year int,
@month varchar(50),
@officialNo int
as
BEGIN



select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,sum(tt.individualTotalCost ) as debit,tt.Messsub,tt.barBill,sum(tt.individualTotalCost + tt.Messsub + tt.barBill) as TotRecovery,tt.priority,tt.noOfDays
--,tt.creditDebit,sum(tt.individualTotalCost +(tt.creditDebit)) as debit,tt.Messsub,tt.barBill,sum(tt.individualTotalCost + tt.Messsub + tt.barBill) as TotRecovery,tt.priority,tt.noOfDays

from [dbo].[T_FinalRecovery_Dining_Wine] as tt

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays = 0 and tt.officialNo=@officialNo

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays

union 

select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,-(tt.creditDebit) as debit,tt.Messsub,tt.barBill,sum(tt.Messsub  + tt.barBill - (tt.creditDebit)) as TotRecovery,tt.priority,tt.noOfDays

from [dbo].[T_FinalRecovery_Dining_Wine] as tt

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays != 0  and tt.creditDebit <1 and tt.officialNo=@officialNo

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays

union 

select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,'0.00' as debit,tt.Messsub,tt.barBill,sum(tt.Messsub  + tt.barBill) as TotRecovery,tt.priority,tt.noOfDays

from [dbo].[T_FinalRecovery_Dining_Wine] as tt

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays != 0  and tt.creditDebit >1 and tt.officialNo=@officialNo

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays

union 

select tt.branchID,tt.officialNo,mr.rankRate ,tpe.initials + ' ' + tpe.surename as name
--, tt.rankRate ,tt.name
,'0.00' as individualTotalCost ,'0.00' as creditDebit,'0.00' as debit,tt.messsub,'0.00' as barBill,tt.messsub as TotRecovery,mr.priority,''

from [dbo].[T_MonthlyMessSub] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr

where  tt.wardroom = @wardroom and tt.year = @year  and tt.month = @month and tt.officialNo=@officialNo and 
tt.officialNo not in(select tt.[officialNo] from T_FinalRecovery_Dining_Wine as tt where  wardroom = @wardroom and year = @year and month = @month )
and tpe.officialNo = tt.officialNo and tpe.officerSailor = 'O' and mbr.branchCode = tpe.branchCode and mbr.branchID = tt.branchID 
and mr.rankRateCode = tpe.rankRateCode 

--union 

--select mbr.branchID,tt.offno,mr.rankRate ,tpe.initials + ' ' + tpe.surename as name
----, tt.rankRate ,tt.name
--,'0.00' as individualTotalCost ,'0.00' as creditDebit,'0.00' as debit,tt.recoverDiningAmmount as 'Pending Dining',tt.recoverWineAmmount as 'Pending Wine','0.00' as messsub,'0.00' as barBill,((convert(float,tt.recoverDiningAmmount)) + (convert(float,tt.recoverWineAmmount))) as TotRecovery,mr.priority,''

--from [dbo].[T_PendingRecovery] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr
--,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr

--where  tt.wardroom = @wardroom and tt.recoverYear = @year  and tt.recoverMonth = @month and 
--tt.offno not in(select tt.[officialNo] from T_FinalRecovery_Dining_Wine as tt where  wardroom = @wardroom and year = @year and month = @month )
--and tpe.officialNo = tt.offno and tpe.officerSailor = 'O' and tt.serviceType = tpe.serviceType and  mbr.branchCode = tpe.branchCode 
--and mr.rankRateCode = tpe.rankRateCode 


order by priority,officialNo

------------


END

--execute [VICTULING_GetFinalMonthlyRecovery_DinnigAndWine_Individual] '60000001','2020','11','3701'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetFinalMonthlyRecovery_DinnigAndWine_new]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetFinalMonthlyRecovery_DinnigAndWine_new] 
@wardroom varchar(50),
@year int,
@month varchar(50)

as
BEGIN



select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,sum(tt.individualTotalCost -(tt.creditDebit)) as debit,tt.Messsub,tt.barBill,sum(tt.individualTotalCost + tt.Messsub + tt.barBill) as TotRecovery,tt.priority,tt.noOfDays

from [dbo].[T_FinalRecovery_Dining_Wine] as tt

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays = 0

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays

union 

select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,sum(tt.individualTotalCost -(tt.creditDebit)) as debit,tt.Messsub,tt.barBill,sum(tt.Messsub  + tt.barBill - (tt.creditDebit)) as TotRecovery,tt.priority,tt.noOfDays

from [dbo].[T_FinalRecovery_Dining_Wine] as tt

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays != 0  and tt.creditDebit <1

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays

union 

select tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,'0.00' as debit,tt.Messsub,tt.barBill,sum(tt.Messsub  + tt.barBill) as TotRecovery,tt.priority,tt.noOfDays

from [dbo].[T_FinalRecovery_Dining_Wine] as tt

where  tt.wardroom = @wardroom and tt.year =@year and tt.month =@month and tt.noOfDays != 0  and tt.creditDebit >1

group by tt.branchID,tt.officialNo, tt.rankRate ,tt.name,tt.individualTotalCost 
,tt.creditDebit,tt.Messsub,tt.barBill,tt.individualTotalCost,tt.Messsub, tt.barBill,tt.priority,tt.noOfDays

union 

select tt.branchID,tt.officialNo,mr.rankRate ,tpe.initials + ' ' + tpe.surename as name
--, tt.rankRate ,tt.name
,'0.00' as individualTotalCost ,'0.00' as creditDebit,'0.00' as debit,tt.messsub,'0.00' as barBill,tt.messsub as TotRecovery,mr.priority,''

from [dbo].[T_MonthlyMessSub] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr

where  tt.wardroom = @wardroom and tt.year = @year  and tt.month = @month and 
tt.officialNo not in(select tt.[officialNo] from T_FinalRecovery_Dining_Wine as tt where  wardroom = @wardroom and year = @year and month = @month )
and tpe.officialNo = tt.officialNo and tpe.officerSailor = 'O' and mbr.branchCode = tpe.branchCode and mbr.branchID = tt.branchID 
and mr.rankRateCode = tpe.rankRateCode 


order by priority,officialNo

------------


END

--execute [VICTULING_GetFinalMonthlyRecovery_DinnigAndWine] '60000001','2020','1'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetFinalRecoveryForPay]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetFinalRecoveryForPay] 


as
BEGIN

delete from [dbo].[T_FinalRecovery]

INSERT INTO [dbo].[T_FinalRecovery]
           (SysCode ,
			CatCode  ,
			OfficialNo  ,
			Amount  
			
	)

select tf.SysCode ,tf.CatCode ,tf.OfficialNo ,tf.Amount 
from [dbo].[T_FinalRecovery] as tf















END







GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetGroupAttendanceList_vegetarian]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Group Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetGroupAttendanceList_vegetarian] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@GroupMenuCode varchar(50)

as
BEGIN	

select tp.serviceType,mb.branchID,tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,
[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,[NHQ_VICTUALING].[dbo].[T_MealAttendance] as tm,
[M_ItemReason] as tr,[M_GroupMenu] as mg
where mb.branchCode = tp.branchCode and tp.officerSailor = tm.officerSailor and  tp.officialNo = tm.officialNo
and tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and mr.rankRateCode = tp.rankRateCode and 
tm.vegetarian = 'true' and tm.mealOut = 'true' and tr.reasonCode = tm.reason and mg.GroupMenuCode = @GroupMenuCode
order by mr.[priority],tm.officialNo




END

--execute [VICTULING_GetGroupMealAttendanceList_vegetarian] '2018-09-01','30000001','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetGroupMealAttendanceCount]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetGroupMealAttendanceCount] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupMenuCode varchar(50),
@vegNonVeg varchar(50)


as
BEGIN	


if(@vegNonVeg = 'Vegetarian')

begin
select sum(tm.mealCount) as mealCount
from [T_MealAttendance] as tm,[M_ItemReason] as tr 
where  tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.mealIn = 'true' and tr.reasonCode = tm.reason and groupMenuCode = @groupMenuCode and tm.vegetarian = 'true' and tm.noneVegetarian = 'false'

select tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp 
Inner join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr on mr.rankRateCode = tp.rankRateCode
inner join [T_MealAttendance] as tm on  tp.officialNo = tm.officialNo 
,[M_ItemReason] as tr,[dbo].[M_GroupMenu] as mg

where tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.vegetarian = 'true' and tm.mealIn = 'true' and tp.officerSailor = 'O' and tr.reasonCode = tm.reason and tp.isActive ='true'
and tm.GroupMenuCode = @groupMenuCode and tm.groupMenuCode = mg.GroupMenuCode and tm.groupMenuCode != '70000000' 


order by mr.[priority],tm.officialNo

end


if(@vegNonVeg = 'Non-Vegetarian')

begin
select sum(tm.mealCount) as mealCount
from [T_MealAttendance] as tm,[M_ItemReason] as tr 
where  tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.mealIn = 'true' and tr.reasonCode = tm.reason and groupMenuCode = @groupMenuCode and tm.vegetarian = 'false' and tm.noneVegetarian = 'true'
------------
select tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp 
Inner join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr on mr.rankRateCode = tp.rankRateCode
inner join [NHQ_VICTUALING].[dbo].[T_MealAttendance] as tm on  tp.officialNo = tm.officialNo 
,[M_ItemReason] as tr,[dbo].[M_GroupMenu] as mg

where tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tp.officerSailor = 'O' and tr.reasonCode = tm.reason and tp.isActive ='true'
and tm.GroupMenuCode = @groupMenuCode and tm.groupMenuCode = mg.GroupMenuCode and tm.groupMenuCode != '70000000' 


order by mr.[priority],tm.officialNo

end

--select SUM(convert(float,td.totalCost)) as totalCost
--from [dbo].[T_DailyExtraSales] as td
--where  td.[saleDate] = @date and td.reasonCode = @reasonCode  and td.wardroomCode = @wardroomCode and td.vegNonVeg = @vegNonVeg and td.groupType =@groupMenuCode


END

--execute [VICTULING_GetGroupMealAttendanceCount] '2022-03-22','30000001','60000001','70000002','Non-Vegetarian'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetGroupMealAttendanceCount_Vegetarian]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetGroupMealAttendanceCount_Vegetarian] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@GroupMenuCode varchar(50)



as
BEGIN	

select sum(tm.mealCount) as mealCount
from [T_MealAttendance] as tm,[M_ItemReason] as tr 
,[dbo].[M_GroupMenu] as mg
where  tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.vegetarian = 'true' and tm.mealOut = 'true' and tr.reasonCode = tm.reason and mg.GroupMenuCode = @GroupMenuCode



END

--execute [VICTULING_GetMealAttendanceCount_Vegetarian] '2018-09-01','30000001','60000001','70000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetGroupMealAttendanceList_NonVegetarian]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Group Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetGroupMealAttendanceList_NonVegetarian] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@GroupMenuCode varchar(50)



as
BEGIN	

--select tp.serviceType,mb.branchID,tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
--from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,[10.10.1.216].[NHQ_VICTUALING].[dbo].[T_MealAttendance] as tm
--where mb.branchCode = tp.branchCode and tp.officerSailor = tm.officerSailor and tp.serviceType = tm.serviceType and tp.officialNo = tm.officialNo and mr.rankRateCode = tp.rankRateCode
--and tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
--tm.noneVegetarian = 'true' and tm.mealIn = 'true'
--order by mr.[priority],tm.officialNo


--select tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
--from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,[10.10.1.216].[NHQ_VICTUALING].[dbo].[T_MealAttendance] as tm
--where tp.officialNo = tm.officialNo and mr.rankRateCode = tp.rankRateCode
--and tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
--tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tp.officerSailor = 'O'
--order by mr.[priority],tm.officialNo

select tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp 
Inner join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr on mr.rankRateCode = tp.rankRateCode
inner join [T_MealAttendance] as tm on  tp.officialNo = tm.officialNo 
,[M_ItemReason] as tr,[M_GroupMenu] as mg

where tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tp.officerSailor = 'O' and tr.reasonCode = tm.reason and tp.isActive ='true'
and tm.GroupMenuCode = @GroupMenuCode and tm.groupMenuCode = mg.GroupMenuCode and tm.groupMenuCode != '70000000' 


order by mr.[priority],tm.officialNo

--select tm.officialNo
--from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[NHQ_VICTUALING].[dbo].[T_MealAttendance] as tm,
--[NHQ_VICTUALING].[dbo].[M_ItemReason] as tr,[dbo].[M_GroupMenu] as mg

--where tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
--tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tp.officerSailor = 'O' and tr.reasonCode = tm.reason and tp.isActive ='true'
--and tm.GroupMenuCode = @GroupMenuCode and tm.groupMenuCode = mg.GroupMenuCode and tm.groupMenuCode != '70000000' 
--and tp.officialNo = tm.officialNo and tp.serviceType = tm.serviceType

END

--execute [VICTULING_GetGroupMealAttendanceList_NonVegetarian] '2023-03-22','30000002','60000001','70000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetGroupMealAttendanceList_vegetarian]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Group Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetGroupMealAttendanceList_vegetarian] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@GroupMenuCode varchar(50)


as
BEGIN	

select tp.serviceType,mb.branchID,tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId

from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,
[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,[NHQ_VICTUALING].[dbo].[T_MealAttendance] as tm,
[M_ItemReason] as tr,[dbo].[M_GroupMenu] as mg

where mb.branchCode = tp.branchCode and tp.officerSailor = tm.officerSailor and  tp.officialNo = tm.officialNo
and tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and mr.rankRateCode = tp.rankRateCode and 
tm.vegetarian = 'true' and tm.mealIn = 'true' and tr.reasonCode = tm.reason 
and tm.GroupMenuCode = @GroupMenuCode and tm.groupMenuCode = mg.GroupMenuCode and tm.groupMenuCode != '70000000' and tp.isActive ='true'

order by mr.[priority],tm.officialNo


--select tm.officialNo
--from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[NHQ_VICTUALING].[dbo].[T_MealAttendance] as tm
--where tp.officerSailor = tm.officerSailor and  tp.officialNo = tm.officialNo and tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode
--and tm.vegetarian = 'true' and tm.mealIn = 'true' 
--and tm.GroupMenuCode = @GroupMenuCode

END

--execute [VICTULING_GetGroupMealAttendanceList_vegetarian] '2020-06-01','30000001','60000001','70000000'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetGroupMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Group Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetGroupMenu] 

as
BEGIN	

SELECT a.GroupMenuCode,a.GroupMenu
FROM [dbo].[M_GroupMenu] as a
order by GroupMenuCode ASC


END

--execute [HRIS_appointment_appointmentCode] 'dn'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetGroupMenuIngedientList_Delete]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:        Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Ingredient list by total
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetGroupMenuIngedientList_Delete]
@wardroomName varchar(150),
@onChargeDate date,
@reasonCode varchar(50),
@groupMenuCode varchar(50),
@vegNonVeg varchar(50)



as
BEGIN   



select mi.itemCode,ts.itemId,mi.item,ts.unitPrice,round((sum(convert(float,ts.saleQty))),4) as saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID
from [dbo].[T_DailyExtraSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_ItemReason] as mir,[dbo].[M_GroupMenu] as mg
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and 
ts.wardroomCode like '%60000001%' and ts.saleDate = @onChargeDate and ts.reasonCode=@reasonCode and mir.reasonCode = ts.reasonCode and mg.GroupMenuCode= ts.groupType
and ts.groupType = @groupMenuCode and ts.saleQty !='0.000' and ts.vegNonVeg = @vegNonVeg
group by mi.itemCode,mi.item,ts.unitPrice,ts.saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID,ts.offNo,ts.serviceType,mir.reason,mg.GroupMenu,ts.itemId,ts.rankRate,ts.takenBy,ts.rankRate,ts.offNoSailor
order by mi.itemCode ASC


if(@vegNonVeg  = 'Non-Vegetarian')
begin
select tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp 
Inner join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr on mr.rankRateCode = tp.rankRateCode
inner join [T_MealAttendance] as tm on  tp.officialNo = tm.officialNo 
,[NHQ_VICTUALING].[dbo].[M_ItemReason] as tr,[dbo].[M_GroupMenu] as mg

where tm.mealDate = @onChargeDate and tm.reason = @reasonCode  and tm.wardroom = @wardroomName and 
tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tp.officerSailor = 'O' and tr.reasonCode = tm.reason and tp.isActive ='true'
and tm.GroupMenuCode = @GroupMenuCode and tm.groupMenuCode = mg.GroupMenuCode and tm.groupMenuCode != '70000000' 


order by tm.officialNo
end

if(@vegNonVeg  = 'Vegetarian')
begin
select tp.serviceType,mb.branchID,tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId

from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,
[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,[NHQ_VICTUALING].[dbo].[T_MealAttendance] as tm,
[M_ItemReason] as tr,[dbo].[M_GroupMenu] as mg

where mb.branchCode = tp.branchCode and tp.officerSailor = tm.officerSailor and  tp.officialNo = tm.officialNo
and tm.mealDate = @onChargeDate and tm.reason = @reasonCode  and tm.wardroom = @wardroomName and mr.rankRateCode = tp.rankRateCode and 
tm.vegetarian = 'true' and tm.mealIn = 'true' and tr.reasonCode = tm.reason 
and tm.GroupMenuCode = @GroupMenuCode and tm.groupMenuCode = mg.GroupMenuCode and tm.groupMenuCode != '70000000' and tp.isActive ='true'

order by tm.officialNo
end

END

--execute [VICTULING_GetGroupMenuIngedientList_Total] '60000001','2020-06-10','30000001','70000001','Non-Vegetarian'


GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetGroupMenuIngedientList_Total]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:        Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Ingredient list by total
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetGroupMenuIngedientList_Total]
@wardroomName varchar(150),
@onChargeDate date,
@reasonCode varchar(50),
@groupMenuCode varchar(50),
@vegNonVeg varchar(50)



as
BEGIN   

/* Insert in to temp table */
INSERT INTO [dbo].[T_Temp_Victualing]
           ([itemCode]
           ,[itemId]
           ,[item]
           ,[unitPrice]
           ,[saleQty]
           ,[itemMessurment]
           ,[recevedFrom]
           ,[transID])

select mi.itemCode,ts.itemId,mi.item,ts.unitPrice,round((sum(convert(float,ts.saleQty))),4) as saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID
from [dbo].[T_DailyExtraSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_ItemReason] as mir,[dbo].[M_GroupMenu] as mg
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and 
ts.wardroomCode like '%60000001%' and ts.saleDate = @onChargeDate and ts.reasonCode=@reasonCode and mir.reasonCode = ts.reasonCode and mg.GroupMenuCode= ts.groupType
and ts.groupType = @groupMenuCode and ts.saleQty !='0.000' and ts.vegNonVeg = @vegNonVeg
group by mi.itemCode,mi.item,ts.unitPrice,ts.saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID,ts.offNo,ts.serviceType,mir.reason,mg.GroupMenu,ts.itemId,ts.rankRate,ts.takenBy,ts.rankRate,ts.offNoSailor
order by mi.itemCode ASC


/* Select Unit Price */
SELECT        a.itemCode, a.item,a.unitPrice, round((sum(convert(float,a.saleQty))),4) as saleQty,a.itemMessurment,
ROUND(((convert(float,a.unitPrice))*sum((convert(float,a.saleQty )))),2)as price,a.recevedFrom
--ROUND(sum(((convert(float,a.unitPrice))*sum((convert(float,a.saleQty ))))),3)as totprice
FROM            T_Temp_Victualing as a
GROUP BY itemCode, item,unitPrice,saleQty,itemMessurment,recevedFrom
order by itemCode ASC


/* Delete Temp table */
DELETE FROM [dbo].[T_Temp_Victualing]



if(@vegNonVeg  = 'Non-Vegetarian')
begin
select tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp 
Inner join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr on mr.rankRateCode = tp.rankRateCode
inner join [T_MealAttendance] as tm on  tp.officialNo = tm.officialNo 
,[NHQ_VICTUALING].[dbo].[M_ItemReason] as tr,[dbo].[M_GroupMenu] as mg

where tm.mealDate = @onChargeDate and tm.reason = @reasonCode  and tm.wardroom = @wardroomName and 
tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tp.officerSailor = 'O' and tr.reasonCode = tm.reason and tp.isActive ='true'
and tm.GroupMenuCode = @GroupMenuCode and tm.groupMenuCode = mg.GroupMenuCode and tm.groupMenuCode != '70000000' 


order by tm.officialNo
end

if(@vegNonVeg  = 'Vegetarian')
begin
select tp.serviceType,mb.branchID,tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId

from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,
[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,[NHQ_VICTUALING].[dbo].[T_MealAttendance] as tm,
[M_ItemReason] as tr,[dbo].[M_GroupMenu] as mg

where mb.branchCode = tp.branchCode and tp.officerSailor = tm.officerSailor and  tp.officialNo = tm.officialNo
and tm.mealDate = @onChargeDate and tm.reason = @reasonCode  and tm.wardroom = @wardroomName and mr.rankRateCode = tp.rankRateCode and 
tm.vegetarian = 'true' and tm.mealIn = 'true' and tr.reasonCode = tm.reason 
and tm.GroupMenuCode = @GroupMenuCode and tm.groupMenuCode = mg.GroupMenuCode and tm.groupMenuCode != '70000000' and tp.isActive ='true'

order by tm.officialNo
end

END

--execute [VICTULING_GetGroupMenuIngedientList_Total] '60000001','2023-07-04','30000001','70000001','Non-Vegetarian'


GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetGroupMenuIngedientList_Total_new]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:        Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Ingredient list by total
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetGroupMenuIngedientList_Total_new]
@wardroomName varchar(150),
@onChargeDate date,
@reasonCode varchar(50),
@groupMenuCode varchar(50),
@vegNonVeg varchar(50)



as
BEGIN   

/* Insert in to temp table */
INSERT INTO [dbo].[T_Temp_Victualing]
           ([itemCode]
           ,[itemId]
           ,[item]
           ,[unitPrice]
           ,[saleQty]
           ,[itemMessurment]
           ,[recevedFrom]
           ,[transID])

select mi.itemCode,ts.itemId,mi.item,ts.unitPrice,round((sum(convert(float,ts.saleQty))),3) as saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID
from [dbo].[T_DailyExtraSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_ItemReason] as mir,[dbo].[M_GroupMenu] as mg
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and 
ts.wardroomCode like '%60000001%' and ts.saleDate = @onChargeDate and ts.reasonCode=@reasonCode and mir.reasonCode = ts.reasonCode and mg.GroupMenuCode= ts.groupType
and ts.groupType = @groupMenuCode and ts.saleQty !='0.000' and ts.vegNonVeg = @vegNonVeg
group by mi.itemCode,mi.item,ts.unitPrice,ts.saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID,ts.offNo,ts.serviceType,mir.reason,mg.GroupMenu,ts.itemId,ts.rankRate,ts.takenBy,ts.rankRate,ts.offNoSailor
order by mi.itemCode ASC


/* Select Unit Price */
SELECT        a.itemCode, a.item,a.unitPrice, round((sum(convert(float,a.saleQty))),3) as saleQty,a.itemMessurment,
ROUND(((convert(float,a.unitPrice))*sum((convert(float,a.saleQty )))),3)as price,a.recevedFrom
FROM            T_Temp_Victualing as a
GROUP BY itemCode, item,unitPrice,saleQty,itemMessurment,recevedFrom
order by itemCode ASC


/* Delete Temp table */
DELETE FROM [dbo].[T_Temp_Victualing]



if(@vegNonVeg  = 'Non-Vegetarian')
begin
select tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp 
Inner join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr on mr.rankRateCode = tp.rankRateCode
inner join [T_MealAttendance] as tm on  tp.officialNo = tm.officialNo 
,[M_ItemReason] as tr,[dbo].[M_GroupMenu] as mg

where tm.mealDate = @onChargeDate and tm.reason = @reasonCode  and tm.wardroom = @wardroomName and 
tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tp.officerSailor = 'O' and tr.reasonCode = tm.reason and tp.isActive ='true'
and tm.GroupMenuCode = @GroupMenuCode and tm.groupMenuCode = mg.GroupMenuCode and tm.groupMenuCode != '70000000' 


order by mr.[priority],tm.officialNo
end

if(@vegNonVeg  = 'Vegetarian')
begin
select tp.serviceType,mb.branchID,tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId

from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,
[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,[NHQ_VICTUALING].[dbo].[T_MealAttendance] as tm,
[M_ItemReason] as tr,[dbo].[M_GroupMenu] as mg

where mb.branchCode = tp.branchCode and tp.officerSailor = tm.officerSailor and  tp.officialNo = tm.officialNo
and tm.mealDate = @onChargeDate and tm.reason = @reasonCode  and tm.wardroom = @wardroomName and mr.rankRateCode = tp.rankRateCode and 
tm.vegetarian = 'true' and tm.mealIn = 'true' and tr.reasonCode = tm.reason 
and tm.GroupMenuCode = @GroupMenuCode and tm.groupMenuCode = mg.GroupMenuCode and tm.groupMenuCode != '70000000' and tp.isActive ='true'

order by mr.[priority],tm.officialNo
end

END

--execute [VICTULING_GetGroupMenuIngedientList_Total_new] '60000001','2020-06-09','30000003','70000001','Non-Vegetarian'


GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetGroupMenuIngedientList_Totalnew]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:        Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Ingredient list by total
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetGroupMenuIngedientList_Totalnew]
@wardroomName varchar(150),
@onChargeDate date,
@reasonCode varchar(50),
@groupMenuCode varchar(50),
@vegNonVeg varchar(50)



as
BEGIN   

/* Insert in to temp table */
INSERT INTO [dbo].[T_Temp_Victualing]
           ([itemCode]
           ,[itemId]
           ,[item]
           ,[unitPrice]         
           ,[itemMessurment]
		   ,[saleQty])           
select mi.itemCode,ts.itemId,mi.item,ts.unitPrice,mm.itemMessurment,(sum(convert(float,ts.saleQty))) as saleQty
from [dbo].[T_DailyExtraSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mir,[dbo].[M_GroupMenu] as mg
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wardroomCode and
mw.wardroomCode = @wardroomName and ts.saleDate = @onChargeDate and ts.reasonCode=@reasonCode and mir.reasonCode = ts.reasonCode and mg.GroupMenuCode= ts.groupType
and ts.groupType = @groupMenuCode and ts.saleQty !='0.000' and ts.vegNonVeg = @vegNonVeg
group by mi.itemCode,ts.itemId,mi.item,ts.unitPrice,mm.itemMessurment
order by mi.itemCode ASC


/* Select Unit Price */
SELECT        itemCode, item,unitPrice, saleQty as saleQty,itemMessurment,(saleQty*unitPrice) as price
FROM            T_Temp_Victualing
GROUP BY itemCode, item,unitPrice,saleQty,itemMessurment
order by itemCode ASC


/* Delete Temp table */
DELETE FROM [dbo].[T_Temp_Victualing]



END

--execute [VICTULING_GetGroupMenuIngedientList_Total] '60000001','2019-09-02','30000001','70000001','Non-Vegetarian'
--execute [VICTULING_GetGroupMenuIngedientList_Totalnew] '60000001','2019-12-17','30000002','70000001','Vegetarian'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetGroupMenuOffNoList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:        Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Ingredient list by total
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetGroupMenuOffNoList]
@wardroomName varchar(150),
@onChargeDate date,
@reasonCode varchar(50),
@groupMenuCode varchar(50),
@vegNonVeg varchar(50)



as
BEGIN   


if(@vegNonVeg  = 'Non-Vegetarian')
begin
select tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp 
Inner join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr on mr.rankRateCode = tp.rankRateCode
inner join [T_MealAttendance] as tm on  tp.officialNo = tm.officialNo 
,[M_ItemReason] as tr,[dbo].[M_GroupMenu] as mg

where tm.mealDate = @onChargeDate and tm.reason = @reasonCode  and tm.wardroom = @wardroomName and 
tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tp.officerSailor = 'O' and tr.reasonCode = tm.reason 
and tm.GroupMenuCode = @GroupMenuCode and tm.groupMenuCode = mg.GroupMenuCode and tm.groupMenuCode != '70000000' 


order by tm.officialNo
end

if(@vegNonVeg  = 'Vegetarian')
begin
select tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId,
tp.serviceType,mb.branchID
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,
[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,[T_MealAttendance] as tm,
[M_ItemReason] as tr,[dbo].[M_GroupMenu] as mg

where mb.branchCode = tp.branchCode and tp.officerSailor = tm.officerSailor and  tp.officialNo = tm.officialNo
and tm.mealDate = @onChargeDate and tm.reason = @reasonCode  and tm.wardroom = @wardroomName and mr.rankRateCode = tp.rankRateCode and 
tm.vegetarian = 'true' and tm.mealIn = 'true' and tr.reasonCode = tm.reason 
and tm.GroupMenuCode = @GroupMenuCode and tm.groupMenuCode = mg.GroupMenuCode and tm.groupMenuCode != '70000000' and tp.isActive ='true'

order by tm.officialNo
end

END

--execute [VICTULING_GetGroupMenuIngedientList_Total] '60000001','2021-09-13','30000003','70000001','Non-Vegetarian'


GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetIndividualCredit]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Individual Credit
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetIndividualCredit] 
@wardroomName varchar(150),
@year int,
@moth varchar(50),
@officialNo int,
--@serviceType varchar(50),
@officerSailor varchar(1)

as
BEGIN	

select mi.itemCode,mi.item,ts.unitPrice,ts.saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID,ts.takenBy,ts.rankRate,ts.offNoSailor
,CONVERT (varchar(4),DATEPART(Year, ts.saleDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, ts.saleDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, ts.saleDate)) AS saleDate 
from [dbo].[T_DailyExtraSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wardroomCode and
mw.wardroomCode = @wardroomName  
and MONTH(ts.saleDate) = @moth and YEAR(ts.saleDate)=@year 
and ts.reasonCode = 30000007 and ts.groupType=70000023
--and ts.reasonCode = 30000005 
and ts.offNo = @officialNo  and ts.officerSailor =@officerSailor

select ts.creditDebit
from T_TotalIndividualCostPerMonth as ts
where ts.wardroom = @wardroomName and ts.month = @moth and ts.year = @year 
and ts.officialNo = @officialNo  and ts.OS =@officerSailor


END

--execute [VICTULING_GetIndividualCredit] '60000001','2019','6','3147','O'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetIndividualItemList_OnDate]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Individual Item List for On Date
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetIndividualItemList_OnDate] 
@wardroomName varchar(150),
@onChargeDate date,
@reasonCode varchar(50),
@groupMenuCode varchar(50)
--@NewBillID varchar(200) = null


as
BEGIN	

if(@groupMenuCode = '70000000')

begin
select mi.itemCode,ts.itemId,mi.item,ts.unitPrice,round(ts.saleQty,3),mm.itemMessurment,ts.recevedFrom,ts.transID,ts.offNo,ts.serviceType,mir.reason,mg.GroupMenu
from [dbo].[T_DailyExtraSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mir,[dbo].[M_GroupMenu] as mg
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wardroomCode and
mw.wardroomCode = @wardroomName and ts.saleDate = @onChargeDate and ts.reasonCode=@reasonCode and mir.reasonCode = ts.reasonCode and mg.GroupMenuCode= ts.groupType 
and ts.groupType = @groupMenuCode and ts.saleQty !='0.000'
order by ts.offNo ASC 
end

if(@groupMenuCode = '70000016')

begin
select mi.itemCode,ts.itemId,mi.item,ts.unitPrice,round(ts.saleQty,3),mm.itemMessurment,ts.recevedFrom,ts.transID,ts.offNo,ts.serviceType,mir.reason,mg.GroupMenu
from [dbo].[T_DailyExtraSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mir,[dbo].[M_GroupMenu] as mg
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wardroomCode and
mw.wardroomCode = @wardroomName and ts.saleDate = @onChargeDate and ts.reasonCode=@reasonCode and mir.reasonCode = ts.reasonCode and mg.GroupMenuCode= ts.groupType
and ts.groupType = @groupMenuCode and ts.saleQty !='0.000'
order by ts.offNo ASC 
end

if(@groupMenuCode = '70000017')

begin
select mi.itemCode,ts.itemId,mi.item,ts.unitPrice,round(ts.saleQty,3),mm.itemMessurment,ts.recevedFrom,ts.transID,ts.offNo,ts.serviceType,mir.reason,mg.GroupMenu,ts.rankRate,ts.takenBy,ts.rankRate,ts.offNoSailor
from [dbo].[T_DailyExtraSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mir,[dbo].[M_GroupMenu] as mg
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wardroomCode and
mw.wardroomCode = @wardroomName and ts.saleDate = @onChargeDate and ts.reasonCode=@reasonCode and mir.reasonCode = ts.reasonCode and mg.GroupMenuCode= ts.groupType
and ts.groupType = @groupMenuCode and ts.saleQty !='0.000'
order by ts.offNo ASC 
end

if(@groupMenuCode != '')

begin
select mi.itemCode,ts.itemId,mi.item,ts.unitPrice,Round((sum(convert(float,ts.saleQty))),3) as saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID,ts.offNo,ts.serviceType,mir.reason,mg.GroupMenu,ts.rankRate,ts.takenBy,ts.rankRate,ts.offNoSailor
,round((convert(float,ts.unitPrice)*convert(float,ts.saleQty)),3) as price
from [dbo].[T_DailyExtraSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mir,[dbo].[M_GroupMenu] as mg
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wardroomCode and
mw.wardroomCode = @wardroomName and ts.saleDate = @onChargeDate and ts.reasonCode=@reasonCode and mir.reasonCode = ts.reasonCode and mg.GroupMenuCode= ts.groupType
and ts.groupType = @groupMenuCode and ts.saleQty !='0.000' 
--and ts.NewBillID = @NewBillID

--group by item

group by mi.itemCode,mi.item,ts.unitPrice,ts.saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID,ts.offNo,ts.serviceType,mir.reason,mg.GroupMenu,ts.itemId,ts.rankRate,ts.takenBy,ts.rankRate,ts.offNoSailor
--order by mi.itemCode ASC 
order by ts.offNo ASC 
end



END

--execute [VICTULING_GetIndividualItemList_OnDate] '60000001','2020-06-07','30000003','70000001'


--select * from [T_DailyExtraSales]



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetIndividualMeal_byDaily]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Individual Meal Dates
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetIndividualMeal_byDaily] 

@wardroomName varchar(50),
@date date



as
BEGIN
	

select CONVERT (varchar(4),DATEPART(Year, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.mealDate)) AS mealDate
,tt.costPerPerson,mb.branchID,tm.officialNo,mi.reason,mg.GroupMenu
,'' as item,'' as saleQty,'' as itemMessurment,'' as unitPrice
from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt,[dbo].[M_ItemReason] as mi,[M_GroupMenu] as mg,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb
where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
tt.vegi = 'Non-Vegetarian' and tm.noneVegetarian = 'true' 
and tm.mealDate = @date
and tm.wardroom = @wardroomName
and mi.reasonCode = tt.reason and tm.reason = tt.reason and tm.groupMenuCode = tt.groupMenuCode
and mg.GroupMenuCode = tm.groupMenuCode and tp.officialNo = tm.officialNo 
--and tp.serviceType = tm.serviceType 
and tp.branchCode = mb.branchCode and tp.officerSailor = 'O'
--and tp.isActive = 'true'

union

select CONVERT (varchar(4),DATEPART(Year, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.mealDate)) AS mealDate
,tt.costPerPerson,mb.branchID,tm.officialNo,mi.reason,mg.GroupMenu,'','','',''
from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt,[dbo].[M_ItemReason] as mi,[M_GroupMenu] as mg,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb
where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
tt.vegi = 'Vegetarian' and tm.vegetarian = 'true' 
and tm.mealDate = @date
and tm.wardroom = @wardroomName
and mi.reasonCode = tt.reason and tm.reason = tt.reason and tm.groupMenuCode = tt.groupMenuCode
and mg.GroupMenuCode = tm.groupMenuCode and tp.officialNo = tm.officialNo 
and tp.branchCode = mb.branchCode and tp.officerSailor = 'O'
--and tp.isActive = 'true'


union

select CONVERT (varchar(4),DATEPART(Year, td.saleDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.saleDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.saleDate)) AS mealDate,
round((convert (float,td.unitPrice)*convert(float,td.saleQty )),2) as costPerPerson,mb.branchID,td.offNo as officialNo,mir.reason,'',mi.item,round(Try_convert(float, td.saleQty),2) as saleQty,mm.itemMessurment,td.unitPrice as price
from [T_DailyExtraSales] as td,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_ItemReason] as mir,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb

where  mi.itemCode = td.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and td.saleDate = @date 
and  td.wardroomCode = @wardroomName
and mir.reasonCode = td.reasonCode and mir.reasonCode != 30000007 and td.saleQty !='0.000' 
and td.groupType not in(70000001,70000002,70000003,70000004,70000005,70000006,70000007,70000008,70000009,70000010,70000011,70000012,70000013,70000014,70000015)
and tp.officialNo = td.offNo and tp.officerSailor  = 'O'  and tp.branchCode = mb.branchCode 
--and tp.isActive = 'true'


union

select CONVERT (varchar(4),DATEPART(Year, td.partyDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.partyDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.partyDate)) AS mealDate,
td.perHeadCost as costPerPerson ,mb.branchID,td.offNo as officialNo,td.partyName as reason,'','','','',''

from [dbo].[T_PartyCostByIndividual] as td,[dbo].[M_GroupMenu] as mg,[dbo].[M_ItemReason] as mir,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb

where td.partyDate = @date 
and mg.GroupMenuCode = td.groupType 
and mir.reasonCode = 30000004 and tp.officialNo = td.offNo and tp.officerSailor  = 'O'
and tp.branchCode = mb.branchCode 
--and tp.isActive = 'true'
 


union 

select CONVERT (varchar(4),DATEPART(Year, td.teaDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.teaDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.teaDate)) AS mealDate,
'',mb.branchID,td.officialNo,td.teaType as reason,'','',td.teaCount as saleQty,'',''
from [T_TeaMark] as td,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb

where td.teaDate = @date  and  td.wardroom = @wardroomName and tp.officialNo = td.officialNo and tp.officerSailor  = 'O' 
--and tp.isActive = 'true'
and mb.branchCode = tp.branchCode 
order by mealDate,officialNo ASC


END

--execute [VICTULING_GetIndividualMeal_byDaily] '60000001','2020-07-08'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetIndividualMeal_byMonth]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Individual Meal Dates
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetIndividualMeal_byMonth] 

@year varchar(50),
@moth varchar(50),
@wardroomName varchar(50)


as
BEGIN
	

select CONVERT (varchar(4),DATEPART(Year, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.mealDate)) AS mealDate
,tt.costPerPerson,mb.branchID,tm.officialNo,mi.reason,mg.GroupMenu
,'' as item,'' as saleQty,'' as itemMessurment,'' as unitPrice
from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt,[dbo].[M_ItemReason] as mi,[M_GroupMenu] as mg,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb
where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
tt.vegi = 'Non-Vegetarian' and tm.noneVegetarian = 'true' 
and  MONTH(tm.mealDate) = @moth
and YEAR(tm.mealDate)=@year
--and tm.wardroom = @wardroom
and mi.reasonCode = tt.reason and tm.reason = tt.reason and tm.groupMenuCode = tt.groupMenuCode
and mg.GroupMenuCode = tm.groupMenuCode and tp.officialNo = tm.officialNo 
--and tp.serviceType = tm.serviceType 
and tp.branchCode = mb.branchCode and tp.officerSailor = 'O'
--and tp.isActive = 'true'

union

select CONVERT (varchar(4),DATEPART(Year, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.mealDate)) AS mealDate
,tt.costPerPerson,mb.branchID,tm.officialNo,mi.reason,mg.GroupMenu,'','','',''
from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt,[dbo].[M_ItemReason] as mi,[M_GroupMenu] as mg,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb
where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
tt.vegi = 'Vegetarian' and tm.vegetarian = 'true' 
and  MONTH(tm.mealDate) = @moth 
and YEAR(tm.mealDate)=@year
and tm.wardroom = @wardroomName
and mi.reasonCode = tt.reason and tm.reason = tt.reason and tm.groupMenuCode = tt.groupMenuCode
and mg.GroupMenuCode = tm.groupMenuCode and tp.officialNo = tm.officialNo 
and tp.branchCode = mb.branchCode and tp.officerSailor = 'O'
--and tp.isActive = 'true'


union

select CONVERT (varchar(4),DATEPART(Year, td.saleDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.saleDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.saleDate)) AS mealDate,
round((convert (float,td.unitPrice)*convert(float,td.saleQty )),2) as costPerPerson,mb.branchID,td.offNo as officialNo,mir.reason,'',mi.item,round(Try_convert(float, td.saleQty),2) as saleQty,mm.itemMessurment,td.unitPrice as price
from [T_DailyExtraSales] as td,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_ItemReason] as mir,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb

where  mi.itemCode = td.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and
MONTH(td.saleDate) = @moth and YEAR(td.saleDate)=@year and td.wardroomCode = @wardroomName
and mir.reasonCode = td.reasonCode and mir.reasonCode != 30000007 and td.saleQty !='0.000' 
and td.groupType not in(70000001,70000002,70000003,70000004,70000005,70000006,70000007,70000008,70000009,70000010,70000011,70000012,70000013,70000014,70000015)
and tp.officialNo = td.offNo and tp.officerSailor  = 'O'  and tp.branchCode = mb.branchCode  
--and tp.isActive = 'true'


union

select CONVERT (varchar(4),DATEPART(Year, td.partyDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.partyDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.partyDate)) AS mealDate,
td.perHeadCost as costPerPerson ,mb.branchID,td.offNo as officialNo,td.partyName as reason,'','','','',''

from [dbo].[T_PartyCostByIndividual] as td,[dbo].[M_GroupMenu] as mg,[dbo].[M_ItemReason] as mir,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb

where MONTH(td.partyDate) = @moth and YEAR(td.partyDate)=@year
and mg.GroupMenuCode = td.groupType 
and mir.reasonCode = 30000004 and tp.officialNo = td.offNo and tp.officerSailor  = 'O'
and tp.branchCode = mb.branchCode 
--and tp.isActive = 'true'
 


union 

select CONVERT (varchar(4),DATEPART(Year, td.teaDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.teaDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.teaDate)) AS mealDate,
'',mb.branchID,td.officialNo,td.teaType as reason,'','',td.teaCount as saleQty,'',''
from [T_TeaMark] as td,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb

where MONTH(td.teaDate) = @moth and YEAR(td.teaDate)=@year and  td.wardroom = @wardroomName and tp.officialNo = td.officialNo and tp.officerSailor  = 'O' 
--and tp.isActive = 'true'
order by mealDate,officialNo ASC


END

--execute [VICTULING_GetIndividualMeal_byMonth] '2021','01','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetIndividualMealDates]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Individual Meal Dates
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetIndividualMealDates] 
@officialNo int,
@officerSailor varchar(1),
@year varchar(50)= null,
@month varchar(50) = null,
@wardroom varchar(50)


as
BEGIN
	

select CONVERT (varchar(4),DATEPART(Year, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.mealDate)) AS mealDate
,tt.costPerPerson,tm.mealCount,tm.officialNo,mi.reason,mg.GroupMenu
from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt,[dbo].[M_ItemReason] as mi,[M_GroupMenu] as mg
where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
tt.vegi = 'Non-Vegetarian' and tm.noneVegetarian = 'true' 
and  MONTH(tm.mealDate) = @month
and YEAR(tm.mealDate)=@year
--and tm.mealDate BETWEEN '2024-3-16' AND '2024-3-31'
and tm.officialNo = @officialNo  and tm.officerSailor =@officerSailor and tm.wardroom = @wardroom
and mi.reasonCode = tt.reason and tm.reason = tt.reason and tm.groupMenuCode = tt.groupMenuCode
and mg.GroupMenuCode = tm.groupMenuCode

union

select CONVERT (varchar(4),DATEPART(Year, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.mealDate)) AS mealDate
,tt.costPerPerson,tm.mealCount ,tm.officialNo,mi.reason,mg.GroupMenu
from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt,[dbo].[M_ItemReason] as mi,[M_GroupMenu] as mg
where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
tt.vegi = 'Vegetarian' and tm.vegetarian = 'true' 
and  MONTH(tm.mealDate) = @month 
and YEAR(tm.mealDate)=@year
--and tm.mealDate BETWEEN '2024-3-16' AND '2024-3-31'
and tm.officialNo = @officialNo and  tm.officerSailor =@officerSailor and tm.wardroom = @wardroom
and mi.reasonCode = tt.reason and tm.reason = tt.reason and tm.groupMenuCode = tt.groupMenuCode
and mg.GroupMenuCode = tm.groupMenuCode
order by mealDate ASC

END

--execute [VICTULING_GetIndividualMealDates] '3823','O','','','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetIndividualMealDates_price]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Individual Meal Dates
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetIndividualMealDates_price] 
--@officialNo int,
--@officerSailor varchar(1),
--@year varchar(50),
--@month varchar(50),
@date date,
@wardroom varchar(50)


as
BEGIN
	

select CONVERT (varchar(4),DATEPART(Year, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.mealDate)) AS mealDate
,tt.costPerPerson,tm.mealCount,tm.officialNo,mi.reason,mg.GroupMenu
from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt,[dbo].[M_ItemReason] as mi,[M_GroupMenu] as mg
where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
tt.vegi = 'Non-Vegetarian' and tm.noneVegetarian = 'true' 
and tm.wardroom = @wardroom and tm.mealDate = @date 
--and tm.mealDate BETWEEN @month AND @year and YEAR(tm.mealDate)=@year and  MONTH(tm.mealDate) = @month
--and tm.officialNo = @officialNo  and tm.officerSailor =@officerSailor 
and mi.reasonCode = tt.reason and tm.reason = tt.reason and tm.groupMenuCode = tt.groupMenuCode
and mg.GroupMenuCode = tm.groupMenuCode

union

select CONVERT (varchar(4),DATEPART(Year, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.mealDate)) AS mealDate
,tt.costPerPerson,tm.mealCount ,tm.officialNo,mi.reason,mg.GroupMenu
from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt,[dbo].[M_ItemReason] as mi,[M_GroupMenu] as mg
where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
tt.vegi = 'Vegetarian' and tm.vegetarian = 'true' 
--and  MONTH(tm.mealDate) = @month and YEAR(tm.mealDate)=@year 
and tm.wardroom = @wardroom and tm.mealDate =@date
--and tm.mealDate BETWEEN @month AND @year
--and tm.officialNo = @officialNo and  tm.officerSailor =@officerSailor 
and mi.reasonCode = tt.reason and tm.reason = tt.reason and tm.groupMenuCode = tt.groupMenuCode
and mg.GroupMenuCode = tm.groupMenuCode
order by mealDate ASC


select CONVERT (varchar(4),DATEPART(Year, td.saleDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.saleDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.saleDate)) AS saleDate,
mi.item,td.unitPrice ,round(Try_convert(float, td.saleQty),2) as saleQty ,mm.itemMessurment ,td.recevedFrom,round((convert (float,td.unitPrice)*convert(float,td.saleQty )),2) as price,mir.reason

from [T_DailyExtraSales] as td,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_ItemReason] as mir

where  mi.itemCode = td.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and
--td.saleDate BETWEEN @month AND @year
--MONTH(td.saleDate) = @month and YEAR(td.saleDate)=@year and 
td.wardroomCode = @wardroom and td.saleDate =@date
--and td.offNo = @officialNo and td.officerSailor =@officerSailor 
and mir.reasonCode = td.reasonCode and mir.reasonCode != 30000007 and td.saleQty !='0.000' 
and td.groupType not in(70000001,70000002,70000003,70000004,70000005,70000006,70000007,70000008,70000009,70000010,70000011,70000012,70000013,70000014,70000015)

order by td.saleDate ASC


select CONVERT (varchar(4),DATEPART(Year, td.partyDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.partyDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.partyDate)) AS partyDate,
mg.GroupMenu,td.perHeadCost ,td.partyName

from [dbo].[T_PartyCostByIndividual] as td,[dbo].[M_GroupMenu] as mg,[dbo].[M_ItemReason] as mir
where td.partyDate =@date and mg.GroupMenuCode = td.groupType and mir.reasonCode = 30000004 
-- td.partyDate BETWEEN @month AND @year
--MONTH(td.partyDate) = @month and YEAR(td.partyDate)=@year
--and td.offNo = @officialNo and td.OS =@officerSailor 


select CONVERT (varchar(4),DATEPART(Year, td.teaDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.teaDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.teaDate)) AS teaDate,
td.teaType,td.teaCount
from [T_TeaMark] as td
where td.teaDate =@date
--td.teaDate BETWEEN @month AND @year
--MONTH(td.teaDate) = @month and YEAR(td.teaDate)=@year
--and td.officialNo = @officialNo  and td.officerSailor =@officerSailor and td.wardroom = @wardroom
order by teaDate ASC

------------------------------------------------------------------------------------------------------
--select ISNULL(sum(round((convert (float,tt.costPerPerson)*convert(float,tt.noOfPersons)),4)),0.00) as nonVegMenuCost
select ISNULL(round(sum(tt.costPerPerson),4),0.00) as nonVegMenuCost
from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt,[dbo].[M_ItemReason] as mi,[M_GroupMenu] as mg
where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
tt.vegi = 'Non-Vegetarian' and tm.noneVegetarian = 'true' and tm.wardroom = @wardroom and tm.mealDate =@date
--and  MONTH(tm.mealDate) = @month and YEAR(tm.mealDate)=@year 
--and tm.mealDate BETWEEN @month AND @year
--and tm.officialNo = @officialNo  and tm.officerSailor =@officerSailor 
and mi.reasonCode = tt.reason and tm.reason = tt.reason and tm.groupMenuCode = tt.groupMenuCode
and mg.GroupMenuCode = tm.groupMenuCode
--group by tt.noOfPersons,tt.costPerPerson


select ISNULL(round(sum(tt.costPerPerson),4),0.00)  as vegMenuCost
from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt,[dbo].[M_ItemReason] as mi,[M_GroupMenu] as mg
where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
tt.vegi = 'Vegetarian'  and tm.vegetarian = 'true' and tm.wardroom = @wardroom and tm.mealDate =@date
--and  MONTH(tm.mealDate) = @month and YEAR(tm.mealDate)=@year 
--and tm.mealDate BETWEEN @month AND @year
--and tm.officialNo = @officialNo and  tm.officerSailor =@officerSailor 
and mi.reasonCode = tt.reason and tm.reason = tt.reason and tm.groupMenuCode = tt.groupMenuCode
and mg.GroupMenuCode = tm.groupMenuCode
--order by mealDate ASC

select ISNULL(sum(round((convert (float,td.unitPrice)*convert(float,td.saleQty )),4)),0.00) as extraCost
from [T_DailyExtraSales] as td,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_ItemReason] as mir
where  mi.itemCode = td.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and td.wardroomCode = @wardroom and td.saleDate =@date
--td.saleDate BETWEEN @month AND @year
--MONTH(td.saleDate) = @month and YEAR(td.saleDate)=@year and 
--and td.offNo = @officialNo and td.officerSailor =@officerSailor 
and mir.reasonCode = td.reasonCode and mir.reasonCode != 30000007 and td.saleQty !='0.000' 
and td.groupType not in(70000001,70000002,70000003,70000004,70000005,70000006,70000007,70000008,70000009,70000010,70000011,70000012,70000013,70000014,70000015)

--order by td.saleDate ASC


select ISNULL(round(sum(td.perHeadCost ),4),0.00) as partyCost
from [dbo].[T_PartyCostByIndividual] as td,[dbo].[M_GroupMenu] as mg,[dbo].[M_ItemReason] as mir
where td.partyDate =@date and mg.GroupMenuCode = td.groupType and mir.reasonCode = 30000004 
-- td.partyDate BETWEEN @month AND @year
--MONTH(td.partyDate) = @month and YEAR(td.partyDate)=@year
--and td.offNo = @officialNo and td.OS =@officerSailor 


select td.teaType,ISNULL(sum(td.teaCount),0) as teaCount
from [T_TeaMark] as td
where td.wardroom = @wardroom and td.teaDate = @date
--td.teaDate BETWEEN @month AND @year
--MONTH(td.teaDate) = @month and YEAR(td.teaDate)=@year and 
--and td.officialNo = @officialNo  and td.officerSailor =@officerSailor 
group by td.teaType

END

--execute [VICTULING_GetIndividualMealDates_price] '2021-02-02','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetIndividualMealDatesMobile]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Individual Meal Dates
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetIndividualMealDatesMobile] 
@officialNo int,
@officerSailor varchar(1),
@year varchar(50),
@month varchar(50) = null,
@wardroom varchar(50)


as
BEGIN
	

select CONVERT (varchar(4),DATEPART(Year, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.mealDate)) AS MealDate
        ,tt.costPerPerson as CostPerPerson,tm.mealCount as MealCount,tm.officialNo,mi.reason as Reason,mg.GroupMenu
from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt,[dbo].[M_ItemReason] as mi,[M_GroupMenu] as mg
where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
tt.vegi = 'Non-Vegetarian' and tm.noneVegetarian = 'true' 
and  MONTH(tm.mealDate) = @month
and YEAR(tm.mealDate)=@year
--and tm.mealDate BETWEEN '2021-3-16' AND '2021-3-31'
and tm.officialNo = @officialNo  and tm.officerSailor =@officerSailor and tm.wardroom = @wardroom
and mi.reasonCode = tt.reason and tm.reason = tt.reason and tm.groupMenuCode = tt.groupMenuCode
and mg.GroupMenuCode = tm.groupMenuCode

union

select CONVERT (varchar(4),DATEPART(Year, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.mealDate)) AS mealDate
        ,tt.costPerPerson as CostPerPerson,tm.mealCount as MealCount,tm.officialNo,mi.reason as Reason,mg.GroupMenu
from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt,[dbo].[M_ItemReason] as mi,[M_GroupMenu] as mg
where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
tt.vegi = 'Vegetarian' and tm.vegetarian = 'true' 
and  MONTH(tm.mealDate) = @month 
and YEAR(tm.mealDate)=@year
--and tm.mealDate BETWEEN '2021-3-16' AND '2021-3-31'
and tm.officialNo = @officialNo and  tm.officerSailor =@officerSailor and tm.wardroom = @wardroom
and mi.reasonCode = tt.reason and tm.reason = tt.reason and tm.groupMenuCode = tt.groupMenuCode
and mg.GroupMenuCode = tm.groupMenuCode
order by mealDate ASC

END

--execute [VICTULING_GetIndividualMealDatesMobile] '866','O','','','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetIndividualPersonal]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Individual Credit
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetIndividualPersonal] 
@wardroomName varchar(150),
@year int,
@moth varchar(50),
@officialNo int,
--@serviceType varchar(50),
@officerSailor varchar(1)

as
BEGIN	

select mi.itemCode,mi.item,ts.unitPrice,ts.saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID,ts.takenBy,ts.rankRate,ts.offNoSailor
,CONVERT (varchar(4),DATEPART(Year, ts.saleDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, ts.saleDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, ts.saleDate)) AS saleDate 
from [dbo].[T_DailyExtraSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wardroomCode and
mw.wardroomCode = @wardroomName  
and MONTH(ts.saleDate) = @moth and YEAR(ts.saleDate)=@year 
and ts.reasonCode = 30000005 and ts.groupType=70000023
--and ts.reasonCode = 30000005 
and ts.offNo = @officialNo  and ts.officerSailor =@officerSailor

select ts.creditDebit
from T_TotalIndividualCostPerMonth as ts
where ts.wardroom = @wardroomName and ts.month = @moth and ts.year = @year 
and ts.officialNo = @officialNo  and ts.OS =@officerSailor


END

--execute [VICTULING_GetIndividualCredit] '60000001','2019','6','3147','O'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetIndividualPersonal_New]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Individual Credit
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetIndividualPersonal_New] 
@wardroomName varchar(150),
@year int,
@moth varchar(50),
@officialNo int,
--@serviceType varchar(50),
@officerSailor varchar(1)

as
BEGIN	

select mi.itemCode,mi.item,ts.unitPrice,round(ts.saleQty,3) as saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID,ts.takenBy,ts.rankRate,ts.offNoSailor
,CONVERT (varchar(4),DATEPART(Year, ts.saleDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, ts.saleDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, ts.saleDate)) AS saleDate 
,round((convert(float,ts.unitPrice)*convert(float,ts.saleQty)),3) as price
from [dbo].[T_DailyExtraSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wardroomCode and
mw.wardroomCode = @wardroomName  
and MONTH(ts.saleDate) = @moth and YEAR(ts.saleDate)=@year 
and ts.reasonCode = 30000005 and ts.groupType=70000023
--and ts.reasonCode = 30000005 
and ts.offNo = @officialNo  and ts.officerSailor =@officerSailor

select ts.creditDebit
from T_TotalIndividualCostPerMonth as ts
where ts.wardroom = @wardroomName and ts.month = @moth and ts.year = @year 
and ts.officialNo = @officialNo  and ts.OS =@officerSailor


END

--execute [VICTULING_GetIndividualPersonal_New] '60000001','2020','5','3144','O'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getIngredientsList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) KMUL Bandara ,NRT 3352
-- Description: get added Ingredients to load grid view
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getIngredientsList] 
--@wardroom varchar(50),
--@mainItem varchar(50)


@mainItem varchar(100),
@wardroom varchar(50)


as
BEGIN	

--select mm.mainItem,mi.item,mn.qty,mes.itemMessurment,(convert(float,mn.qty) * convert(float, 2 )) as qty
--from [dbo].[T_DailyMenu] as tm,[dbo].[M_MainItem] as mm ,[dbo].[M_Item] as mi,[dbo].[M_Ingredients] as mn,[M_ItemByMessurment] as mes
--where mm.mainItemCode = tm.mainItemCode and mi.itemCode = mn. ingredientsCode and tm.mainItemCode = mn.mainItemCode and mes.itemMessurmentCode = mn.messurment 
--and tm.date = @date and tm.reasonCode = @reasonCode and tm.wardroomCode = @wardroomCode  
--order by mm.mainItem,mi.item ASC

select mc.mainItem,mi.item,mig.qty,mm.itemMessurment,mig.id
from [dbo].[M_Ingredients] as mig,[dbo].[M_Item] as mi,[M_MainItem] as mc,[M_ItemByMessurment] as mm
where 
mc.mainItemCode = mig.mainItemCode and

mi.itemCode = mig.ingredientsCode and mi.itemMessurmentCode = mm.itemMessurmentCode
and mig.wardroom = @wardroom 
and mc.mainItem = @mainItem

END


--execute [VICTULING_getIngredientsList] 'Sea Food Salad With Rigatoni Pasta & Thousand Island Dressing','60000001'                                       '

--execute [VICTULING_getIngredientsList] '60000001'  


GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getIngredientsListForBiteyMenu_Tot]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCDR WHK Gunasoma ,NRT 3147
-- Description: get added Ingredients to load grid view
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getIngredientsListForBiteyMenu_Tot] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@vegiNonVegi varchar(50),
@groupMenuCode varchar(50)


as
BEGIN	


select mm.mainItem,mi.item,mn.qty,mes.itemMessurment,(convert(float,mn.qty) * convert(float, tm.remarks)) as Issueqty,mi.itemCode
from [dbo].[T_DailyMenu] as tm,[dbo].[M_MainItem] as mm ,[dbo].[M_Item] as mi,[dbo].[M_Ingredients] as mn,[M_ItemByMessurment] as mes, [dbo].[M_GroupMenu] as mg
where mm.mainItemCode = tm.mainItemCode and mi.itemCode = mn. ingredientsCode and tm.mainItemCode = mn.mainItemCode and mes.itemMessurmentCode = mn.messurment 
and tm.date = @date and tm.reasonCode = @reasonCode and tm.wardroomCode = @wardroomCode and tm.vegiNonVegi = @vegiNonVegi
and tm.groupMenuCode = @groupMenuCode
and tm.groupMenuCode = mg.[GroupMenuCode] and tm.isActive = 1
-- and tm.isAuthorized = 1
order by mm.mainItem

END


--select [mainItemCode] from [dbo].[T_DailyMenu] where [id]=87753
--execute [VICTULING_getIngredientsListForGroupMenu] '2018-12-05','30000001','60000001','2','Vegetarian','70000001'                                                                        
--execute [VICTULING_getIngredientsListForGroupMenu] '2019-02-01','30000001','60000001','3','Non-Vegetarian','70000001','87753'                                                                              
--execute [VICTULING_getIngredientsListForPartyMenu_Tot] '8/5/2020','30000004','60000001','Non-Vegetarian','70000026'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getIngredientsListForCustomizedMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCDR WHK Gunasoma ,NRT 3147
-- Description: get added Ingredients to load grid view
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getIngredientsListForCustomizedMenu] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@noOfPerson varchar(50),
@vegiNonVegi varchar(50),
@groupMenuCode varchar(50),
@mealId int

--used for cuztomized menu sale --
as
BEGIN	

declare @mainItemCode as varchar(50)
select @mainItemCode = [mainItemCode] from [dbo].[T_DailyMenu] where [id]=@mealId

select mm.mainItem,mi.item,mn.qty,mes.itemMessurment,(convert(float,mn.qty) * convert(float, @noOfPerson )) as Issueqty
from [dbo].[T_DailyMenu] as tm,[dbo].[M_MainItem] as mm ,[dbo].[M_Item] as mi,[dbo].[M_Ingredients] as mn,[M_ItemByMessurment] as mes, [dbo].[M_GroupMenu] as mg
where mm.mainItemCode = tm.mainItemCode and mi.itemCode = mn. ingredientsCode and tm.mainItemCode = mn.mainItemCode and mes.itemMessurmentCode = mn.messurment 
and tm.date = @date and tm.reasonCode = @reasonCode and tm.wardroomCode = @wardroomCode and tm.vegiNonVegi = @vegiNonVegi and tm.groupMenuCode = @groupMenuCode
and tm.groupMenuCode = mg.[GroupMenuCode] and tm.isActive = 1 and tm.isAuthorized = 1
and mn.mainItemCode=@mainItemCode
--and mn.mainItemCode=87841
 
order by mm.mainItem,mi.item ASC



select tm.mainItemCode,mc.mainItemCategory,mm.mainItem,tm.id
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc,[dbo].[M_GroupMenu] as mgm
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode 
and mc.mainItemCategoryCode = tm.mealCategory and tm.isAuthorized = 'true' and mgm.GroupMenuCode = tm.groupMenuCode and tm.isActive = 'true' 
and tm.groupMenuCode = @groupMenuCode

END


--select [mainItemCode] from [dbo].[T_DailyMenu] where [id]=87753
--execute [VICTULING_getIngredientsListForGroupMenu] '2018-12-05','30000001','60000001','2','Vegetarian','70000001'                                                                        
--execute [VICTULING_getIngredientsListForGroupMenu] '2019-02-01','30000001','60000001','3','Non-Vegetarian','70000001','87753'                                                                              
--execute [VICTULING_getIngredientsListForCustomizedMenu] '2019-03-01','30000001','60000001','3','Vegetarian','70000016','93525'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getIngredientsListForCustomizedMenu_Tot]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCDR WHK Gunasoma ,NRT 3147
-- Description: get added Ingredients to load grid view
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getIngredientsListForCustomizedMenu_Tot] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@noOfPerson varchar(50),
@vegiNonVegi varchar(50),
@groupMenuCode varchar(50)
--@mealId int

--used for cuztomized menu sale --
as
BEGIN	


--declare @mainItemCode as varchar(50)
--select @mainItemCode = [mainItemCode] from [dbo].[T_DailyMenu] where [id]  in 


CREATE TABLE #temp(
	[mainItem] [varchar](50) ,
	[item] [varchar](50) ,
	[qty] [decimal](18, 5) ,
	[itemMessurment] [varchar](20) ,
	[Issueqty] [decimal](18, 5) , 
	[itemCode] varchar(50) 

)

--print(@mainItemCode)

INSERT INTO #temp
           ([mainItem]
           ,[item]
           ,[qty]
           ,[itemMessurment]
           ,[Issueqty]
		   ,[itemCode])

select mm.mainItem,mi.item,mn.qty,mes.itemMessurment,(convert(float,mn.qty) * convert(float, @noOfPerson )) as Issueqty,mi.itemCode
from [dbo].[T_DailyMenu] as tm,[dbo].[M_MainItem] as mm ,[dbo].[M_Item] as mi,[dbo].[M_Ingredients] as mn,[M_ItemByMessurment] as mes, [dbo].[M_GroupMenu] as mg
where mm.mainItemCode = tm.mainItemCode and mi.itemCode = mn. ingredientsCode and tm.mainItemCode = mn.mainItemCode and mes.itemMessurmentCode = mn.messurment 
and tm.date = @date and tm.reasonCode = @reasonCode and tm.wardroomCode = @wardroomCode and tm.vegiNonVegi = @vegiNonVegi and tm.groupMenuCode = @groupMenuCode
and tm.groupMenuCode = mg.[GroupMenuCode] and tm.isActive = 1 and tm.isAuthorized = 1
and mn.mainItemCode in (select tm.mainItemCode
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc,[dbo].[M_GroupMenu] as mgm
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode 
and mc.mainItemCategoryCode = tm.mealCategory and tm.isAuthorized = 'true' and mgm.GroupMenuCode = tm.groupMenuCode and tm.isActive = 'true' 
and tm.groupMenuCode = @groupMenuCode)
--and mn.mainItemCode=87841
 
order by mm.mainItem,mi.item ASC

--select * from #temp

select item, (sum(convert(float,qty)) * convert(float, @noOfPerson )) as qty,itemMessurment as itemMessurment,itemCode  from #temp
group by item,itemMessurment,itemCode

drop table #temp



END


--select [mainItemCode] from [dbo].[T_DailyMenu] where [id]=87753
--execute [VICTULING_getIngredientsListForGroupMenu] '2018-12-05','30000001','60000001','2','Vegetarian','70000001'                                                                        
--execute [VICTULING_getIngredientsListForGroupMenu] '2019-02-01','30000001','60000001','3','Non-Vegetarian','70000001','87753'                                                                              
--execute [VICTULING_getIngredientsListForCustomizedMenu_Tot] '2019-03-01','30000001','60000001','1','Vegetarian','70000016'

--93521

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getIngredientsListForGroupMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCDR WHK Gunasoma ,NRT 3147
-- Description: get added Ingredients to load grid view
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getIngredientsListForGroupMenu] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@noOfPerson varchar(50),
@vegiNonVegi varchar(50),
@groupMenuCode varchar(50)
--,
--@mealId int

--used for cuztomized menu sale --
as
BEGIN	

--declare @mainItemCode as varchar(50)
--select @mainItemCode = [mainItemCode] from [dbo].[T_DailyMenu] where [id]=@mealId

select mm.mainItem,mi.item,mn.qty,mes.itemMessurment,(convert(float,mn.qty) * convert(float, @noOfPerson )) as Issueqty
from [dbo].[T_DailyMenu] as tm,[dbo].[M_MainItem] as mm ,[dbo].[M_Item] as mi,[dbo].[M_Ingredients] as mn,[M_ItemByMessurment] as mes, [dbo].[M_GroupMenu] as mg
where mm.mainItemCode = tm.mainItemCode and mi.itemCode = mn. ingredientsCode and tm.mainItemCode = mn.mainItemCode and mes.itemMessurmentCode = mn.messurment 
and tm.date = @date and tm.reasonCode = @reasonCode and tm.wardroomCode = @wardroomCode and tm.vegiNonVegi = @vegiNonVegi and tm.groupMenuCode = @groupMenuCode
and tm.groupMenuCode = mg.[GroupMenuCode] and tm.isActive = 1 and tm.isAuthorized = 1
--and mn.mainItemCode=@mainItemCode
--and mn.mainItemCode=87841
 
order by mm.mainItem,mi.item ASC


END


--select [mainItemCode] from [dbo].[T_DailyMenu] where [id]=87753
--execute [VICTULING_getIngredientsListForGroupMenu] '2018-12-05','30000001','60000001','2','Vegetarian','70000001'                                                                        
--execute [VICTULING_getIngredientsListForGroupMenu] '2019-06-26','30000003','60000001','1','Non-Vegetarian','70000002'                                                                            
--execute [VICTULING_getIngredientsListForGroupMenu] '2019-02-01','30000001','60000001','3','Vegetarian','70000016','87846'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getIngredientsListForGroupMenu_Tot]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCDR WHK Gunasoma ,NRT 3147
-- Description: get added Ingredients to load grid view
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getIngredientsListForGroupMenu_Tot] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@noOfPerson varchar(50),
@vegiNonVegi varchar(50),
@groupMenuCode varchar(50)


--used for cuztomized menu sale --
as
BEGIN	

CREATE TABLE #temp(
	[mainItem] [varchar](50) ,
	[item] [varchar](50) ,
	[qty] [decimal](18, 5) ,
	[itemMessurment] [varchar](20) ,
	[Issueqty] [decimal](18, 5), 
	[itemCode] varchar(50) 
)

INSERT INTO #temp
           ([mainItem]
           ,[item]
           ,[qty]
           ,[itemMessurment]
           ,[Issueqty]
		   ,[itemCode])

select mm.mainItem,mi.item,mn.qty,mes.itemMessurment,(convert(float,mn.qty) * convert(float, @noOfPerson )) as Issueqty,mi.itemCode
from [dbo].[T_DailyMenu] as tm,[dbo].[M_MainItem] as mm ,[dbo].[M_Item] as mi,[dbo].[M_Ingredients] as mn,[M_ItemByMessurment] as mes, [dbo].[M_GroupMenu] as mg
where mm.mainItemCode = tm.mainItemCode and mi.itemCode = mn. ingredientsCode and tm.mainItemCode = mn.mainItemCode and mes.itemMessurmentCode = mn.messurment 
and tm.date = @date and tm.reasonCode = @reasonCode and tm.wardroomCode = @wardroomCode and tm.vegiNonVegi = @vegiNonVegi and tm.groupMenuCode = @groupMenuCode
and tm.groupMenuCode = mg.[GroupMenuCode] and tm.isActive = 1 and tm.isAuthorized = 1
--and mn.mainItemCode=@mainItemCode
--and mn.mainItemCode=87841
 
order by mm.mainItem,mi.item ASC

select item, (sum(convert(float,qty)) * convert(float, @noOfPerson )) as qty,itemMessurment as itemMessurment,te.itemCode ,ts.currentStock
from #temp as te,[dbo].[T_StockQty] as ts
where te.itemCode = ts.itemCode
group by item,itemMessurment,te.itemCode,ts.currentStock

drop table #temp

END


--select [mainItemCode] from [dbo].[T_DailyMenu] where [id]=87753
--execute [VICTULING_getIngredientsListForGroupMenu] '2018-12-05','30000001','60000001','2','Vegetarian','70000001'                                                                        
--execute [VICTULING_getIngredientsListForGroupMenu] '2019-02-01','30000001','60000001','3','Non-Vegetarian','70000001','87753'                                                                              
--execute [VICTULING_getIngredientsListForGroupMenu] '2019-02-01','30000001','60000001','3','Vegetarian','70000016','87846'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getIngredientsListForPartyMenu_Tot]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCDR WHK Gunasoma ,NRT 3147
-- Description: get added Ingredients to load grid view
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getIngredientsListForPartyMenu_Tot] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@vegiNonVegi varchar(50),
@groupMenuCode varchar(50)


as
BEGIN	


select mm.mainItem,mi.item,mn.qty,mes.itemMessurment,(convert(float,mn.qty) * convert(float, tm.remarks)) as Issueqty,mi.itemCode
from [dbo].[T_DailyMenu] as tm,[dbo].[M_MainItem] as mm ,[dbo].[M_Item] as mi,[dbo].[M_Ingredients] as mn,[M_ItemByMessurment] as mes, [dbo].[M_GroupMenu] as mg
where mm.mainItemCode = tm.mainItemCode and mi.itemCode = mn. ingredientsCode and tm.mainItemCode = mn.mainItemCode and mes.itemMessurmentCode = mn.messurment 
and tm.date = @date and tm.reasonCode = @reasonCode and tm.wardroomCode = @wardroomCode and tm.vegiNonVegi = @vegiNonVegi
and tm.groupMenuCode = @groupMenuCode
and tm.groupMenuCode = mg.[GroupMenuCode] and tm.isActive = 1 and tm.isAuthorized = 1
order by mm.mainItem

END


--select [mainItemCode] from [dbo].[T_DailyMenu] where [id]=87753
--execute [VICTULING_getIngredientsListForGroupMenu] '2018-12-05','30000001','60000001','2','Vegetarian','70000001'                                                                        
--execute [VICTULING_getIngredientsListForGroupMenu] '2019-02-01','30000001','60000001','3','Non-Vegetarian','70000001','87753'                                                                              
--execute [VICTULING_getIngredientsListForPartyMenu_Tot] '2019-08-01','30000004','60000001','Non-Vegetarian','70000017'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getIngredientsListForSA]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) KMUL Bandara ,NRT 3352
-- Description: get added Ingredients to load grid view
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getIngredientsListForSA] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@noOfPerson varchar(50),
@vegiNonVegi varchar(50),
@groupMenuCode varchar(50)

--use for normal menu

as
BEGIN	

select mm.mainItem,mi.item,mn.qty,mes.itemMessurment,(convert(float,mn.qty) * convert(float, @noOfPerson )) as Issueqty
from [dbo].[T_DailyMenu] as tm,[dbo].[M_MainItem] as mm ,[dbo].[M_Item] as mi,[dbo].[M_Ingredients] as mn,[M_ItemByMessurment] as mes,[dbo].[M_GroupMenu] as mg
where mm.mainItemCode = tm.mainItemCode and mi.itemCode = mn. ingredientsCode and tm.mainItemCode = mn.mainItemCode and mes.itemMessurmentCode = mn.messurment 
and tm.date = @date and tm.reasonCode = @reasonCode and tm.wardroomCode = @wardroomCode and tm.vegiNonVegi = @vegiNonVegi and mg.GroupMenuCode = tm.groupMenuCode 
and tm.groupMenuCode = @groupMenuCode and tm.isActive = 'true' and tm.isAuthorized = 'true'
order by mm.mainItem,mi.item ASC


END


--execute [VICTULING_getIngredientsListForSA] '3/1/2019','30000001','60000001','2','Vegetarian','70000000'                                                                          




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getIngredientsListForSA_Tot]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma ,NRT 3147
-- Description: get added Ingredients to load grid view
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getIngredientsListForSA_Tot] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@noOfPerson varchar(50),
@vegiNonVegi varchar(50),
@groupMenuCode varchar(50)

--use for normal menu

as
BEGIN	

CREATE TABLE #temp(
	[mainItem] [varchar](50) ,
	[item] [varchar](50) ,
	[qty] [varchar](50),
	[itemMessurment] [varchar](20) ,
	[Issueqty] [varchar](50), 
	[itemCode] varchar(50)
)

INSERT INTO #temp
           ([mainItem]
           ,[item]
           ,[qty]
           ,[itemMessurment]
           ,[Issueqty]
		   ,[itemCode])

select mm.mainItem,mi.item,mn.qty,mes.itemMessurment,(convert(float,mn.qty) * convert(float, @noOfPerson )) as Issueqty,mi.itemCode
from [dbo].[T_DailyMenu] as tm,[dbo].[M_MainItem] as mm ,[dbo].[M_Item] as mi,[dbo].[M_Ingredients] as mn,[M_ItemByMessurment] as mes,[dbo].[M_GroupMenu] as mg
where mm.mainItemCode = tm.mainItemCode and mi.itemCode = mn. ingredientsCode and tm.mainItemCode = mn.mainItemCode and mes.itemMessurmentCode = mn.messurment 
and tm.date = @date and tm.reasonCode = @reasonCode and tm.wardroomCode = @wardroomCode and tm.vegiNonVegi = @vegiNonVegi and mg.GroupMenuCode = tm.groupMenuCode 
and tm.groupMenuCode = @groupMenuCode and tm.isActive = 'true' and tm.isAuthorized = 'true'
order by mm.mainItem,mi.item ASC


--select item, sum(qty) as qty,itemMessurment as itemMessurment  from #temp
--group by item,itemMessurment

select item, (sum(convert(float,qty)) * convert(float, @noOfPerson )) as qty,itemMessurment as itemMessurment,te.itemCode  
,ts.currentStock
--,((convert(float,ts.currentStock)) - (sum(convert(float,qty)) * convert(float, @noOfPerson ))) as diff
from #temp as te,[dbo].[T_StockQty] as ts
where te.itemCode = ts.itemCode
--select item, (sum(convert(float,qty))) as qty,itemMessurment as itemMessurment,itemCode  from #temp
group by item,itemMessurment,te.itemCode,ts.currentStock
--,qty

drop table #temp






END


--execute [VICTULING_getIngredientsListForSA_Tot] '2023-4-1','30000002','60000013','7','Vegetarian','70000000'                                                                      




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetItemByCatagory]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VICTULING_GetItemByCatagory] 

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Select main item name
-- =============================================
AS
BEGIN


SELECT a.itemCatagory,a.itemCatagoryCode
  FROM [dbo].[M_ItemByCatagory] as a

   order by itemCatagory ASC

END








GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetItemList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetItemList] 
@item varchar(250)

as
BEGIN	

select mi.itemCode,mi.item,mic.itemCatagory
from [M_Item] as mi,[dbo].[M_ItemByCatagory] as mic
where mic.itemCatagoryCode = mi.itemCatagoryCode and (mi.item like '%'+ @item +'%')

END

--execute [HRIS_appointment_appointmentCode] 'dn'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetItemListByDate]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Select All Items by category
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetItemListByDate] 
@saleDate date,
@wardroomCode varchar(50),
@offNo int,
@serviceType varchar(50)

as
BEGIN

select dn.NewBillID
from [dbo].[T_DailyExtraSales] as dn
where   dn.reasonCode = '30000005' and dn.saleDate = @saleDate and dn.wardroomCode = @wardroomCode and dn.offNo = @offNo and dn.serviceType = @serviceType

order by dn.NewBillID ASC

END

-- execute [VICTULING_GetItemListByDate] '2020-07-10','60000001','234','RNF'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetItemMessurment]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VICTULING_GetItemMessurment] 

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Select main item Messurment
-- =============================================
AS
BEGIN


SELECT a.itemMessurmentCode,a.itemMessurment
  FROM [dbo].[M_ItemByMessurment] as a

   order by itemMessurment ASC

END








GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getItemReason]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) KMUL Bandara
-- Description: get menu Reason from stock table
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getItemReason] 


as
BEGIN	

SELECT reasonCode ,reason from  [dbo].[M_ItemReason]
	   
END







GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetItemsByCategory]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Select All Items by category
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetItemsByCategory] 
@mainItem varchar(50)

as
BEGIN

select pr.item,pr.itemCode,pr.m_item
from [dbo].[M_ItemByCatagory] as dn,[dbo].[M_Item] as pr
where  dn.itemCatagoryCode = pr.itemCatagoryCode and dn.itemCatagory = @mainItem
order by pr.item ASC

END

-- execute [VICTULING_GetItemsByCategory] 'Milk Powder'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetItemsByCategory_Ingredients]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Select All Items by category
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetItemsByCategory_Ingredients] 
@mainItem varchar(50)

as
BEGIN

select pr.item,pr.itemCode,pr.m_item
from [dbo].[M_ItemByCatagory] as dn,[dbo].[M_Item] as pr
where  dn.itemCatagoryCode = pr.itemCatagoryCode and dn.itemCatagory = @mainItem and pr.isIngredients = 'true'
order by pr.item ASC

END

-- execute [VICTULING_GetItemsByCategory_Ingredients] 'Milk Powder'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMainItem]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VICTULING_GetMainItem] 

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Select main item name
-- =============================================
AS
BEGIN


SELECT a.mainItem,a.mainItemCode
  FROM [dbo].[M_MainItem] as a

   order by mainItem ASC

END








GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMainItemCategory]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VICTULING_GetMainItemCategory] 

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Select main item Category
-- =============================================
AS
BEGIN


SELECT a.mainItemCategory,a.mainItemCategoryCode
  FROM [dbo].[M_MainItemCategory] as a

   order by mainItemCategory ASC

END








GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMealAttendance_ByIndividual]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMealAttendance_ByIndividual] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@officialNo varchar(50)



as
BEGIN	


select tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId,tm.mealIn,tm.mealOut,tm.vegetarian,tm.noneVegetarian
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp 
Inner join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr on mr.rankRateCode = tp.rankRateCode
inner join [T_MealAttendance] as tm on  tp.officialNo = tm.officialNo 
,[M_ItemReason] as tr
where tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tp.officerSailor = 'O' and tr.reasonCode = tm.reason and groupMenuCode = '70000000'
and tp.isActive = 'true' and tm.officialNo = @officialNo 
order by mr.[priority],tm.officialNo


END

--execute [VICTULING_GetMealAttendance_ByIndividual] '2024-6-14','30000002','60000001','848'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMealAttendanceCount_NonVegetarian]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMealAttendanceCount_NonVegetarian] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)



as
BEGIN	

select sum(tm.mealCount) as mealCount
from [T_MealAttendance] as tm,[M_ItemReason] as tr
where  tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tr.reasonCode = tm.reason and tm.groupMenuCode = '70000000'


select sum(tm.mealCount) as mealCount
from [T_MealAttendance] as tm,[M_ItemReason] as tr,M_GroupMenu as mgm
where  tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tr.reasonCode = tm.reason and mgm.GroupMenuCode = tm.groupMenuCode


END

--execute [VICTULING_GetMealAttendanceCount_NonVegetarian] '2018-12-05','30000001','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMealAttendanceCount_Vegetarian]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMealAttendanceCount_Vegetarian] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)



as
BEGIN	

select sum(tm.mealCount) as mealCount
from [T_MealAttendance] as tm,[M_ItemReason] as tr 
where  tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.vegetarian = 'true' and tm.mealIn = 'true' and tr.reasonCode = tm.reason and groupMenuCode = '70000000'




select sum(tm.mealCount) as mealCount
from [T_MealAttendance] as tm,[M_ItemReason] as tr,M_GroupMenu as mgm
where  tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.vegetarian = 'true' and tm.mealIn = 'true' and tr.reasonCode = tm.reason and mgm.GroupMenuCode = tm.groupMenuCode


END

--execute [VICTULING_GetMealAttendanceCount_Vegetarian] '2/1/2019','30000001','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMealAttendanceList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMealAttendanceList] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)



as
BEGIN	

select tp.serviceType,mb.branchID,tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[dbo].[T_MealAttendance] as tm
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
where mb.branchCode = tp.branchCode and tp.officerSailor = tm.officerSailor and tp.serviceType = tm.serviceType and tp.officialNo = tm.officialNo
and tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.vegetarian = 'true' and tm.mealIn = 'true' and mr.rankRateCode = tp.rankRateCode
order by mr.[priority] ,tp.officialNo ASC


END

--execute [VICTULING_GetMealAttendanceList] '2017-12-02','30000001','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMealAttendanceList_NonVegetarian]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMealAttendanceList_NonVegetarian] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)



as
BEGIN	

--select tp.serviceType,mb.branchID,tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
--from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,[10.10.1.216].[NHQ_VICTUALING].[dbo].[T_MealAttendance] as tm
--where mb.branchCode = tp.branchCode and tp.officerSailor = tm.officerSailor and tp.serviceType = tm.serviceType and tp.officialNo = tm.officialNo and mr.rankRateCode = tp.rankRateCode
--and tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
--tm.noneVegetarian = 'true' and tm.mealIn = 'true'
--order by mr.[priority],tm.officialNo


--select tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
--from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,[10.10.1.216].[NHQ_VICTUALING].[dbo].[T_MealAttendance] as tm
--where tp.officialNo = tm.officialNo and mr.rankRateCode = tp.rankRateCode
--and tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
--tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tp.officerSailor = 'O'
--order by mr.[priority],tm.officialNo

select tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp 
Inner join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr on mr.rankRateCode = tp.rankRateCode
inner join [T_MealAttendance] as tm on  tp.officialNo = tm.officialNo 
,[M_ItemReason] as tr
where tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and 
tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tp.officerSailor = 'O' and tr.reasonCode = tm.reason and groupMenuCode = '70000000'
and tp.isActive = 'true'
order by mr.[priority],tm.officialNo


END

--execute [VICTULING_GetMealAttendanceList_NonVegetarian] '2018-09-01','30000001','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMealAttendanceList_vegetarian]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMealAttendanceList_vegetarian] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)



as
BEGIN	

select tp.serviceType,mb.branchID,tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,[T_MealAttendance] as tm,[M_ItemReason] as tr
where mb.branchCode = tp.branchCode and tp.officerSailor = tm.officerSailor and  tp.officialNo = tm.officialNo
and tm.mealDate = @date and tm.reason = @reasonCode  and tm.wardroom = @wardroomCode and mr.rankRateCode = tp.rankRateCode and 
tm.vegetarian = 'true' and tm.mealIn = 'true' and tr.reasonCode = tm.reason and groupMenuCode = '70000000'
and tp.isActive = 'true'
order by mr.[priority],tm.officialNo




END

--execute [VICTULING_GetMealAttendanceList_vegetarian] '2018-09-01','30000001','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getMealCategory]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) KMUL Bandara
-- Description: get meal categories
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getMealCategory] 


as
BEGIN	

SELECT mainItemCategoryCode ,mainItemCategory from  [dbo].[M_MainItemCategory]
order by mainItemCategory asc
	   
END

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getMealItems]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) KMUL Bandara
-- Description: get meal items
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getMealItems] 
@mainItemCategoryCode varchar(500)

as
BEGIN	

SELECT a.mainItemCode ,a.mainItem 
from  [dbo].[M_MainItem] as a,[dbo].[M_MainItemCategory] as b
where b.mainItemCategory = @mainItemCategoryCode and a.mainItemCategoryCode = b.mainItemCategoryCode
order by mainItem asc
	   
END

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMenuCcstomizeItemList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get customize item list
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMenuCcstomizeItemList] 
@date datetime,
@reasonCode varchar(50),
@wardroomCode varchar(50),
--@officialNo int,
@officerSailor varchar(1),
@serviceType varchar(10)

as
BEGIN	

--select mi.item ,tc.qty ,tc.itemMessurmentCode
--from [dbo].[T_IndividualExtraItemByCA] as tc,[dbo].[M_Wardroom] as mw,[dbo].[M_Item] as mi
--where tc.offNo = @officialNo and tc.serviceType =@serviceType and 
--tc.[date] =@date and tc.reasonCode = @reasonCode and tc.wardroomCode =@wardroomCode and mw.wardroomCode =tc.wardroomCode
--and mi.itemCode = tc.itemCode and tc.isActive =1
--order by mi.item

select tc.offNo,tc.serviceType, mi.item ,tc.qty ,tc.itemMessurmentCode
from [dbo].[T_IndividualExtraItemByCA] as tc,[dbo].[M_Wardroom] as mw,[dbo].[M_Item] as mi
where tc.serviceType =@serviceType and 
tc.[date] =@date and tc.reasonCode = @reasonCode and tc.wardroomCode =@wardroomCode and mw.wardroomCode =tc.wardroomCode
and mi.itemCode = tc.itemCode and tc.isActive =1
order by mi.item

end

-- execute [VICTULING_GetMenuCcstomizeItemList] '2018-09-01','30000001','60000001','O','RNF'

--select * from [dbo].[T_IndividualExtraItemByCA]

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMenuCcstomizeItemList_OLD]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get customize item list
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMenuCcstomizeItemList_OLD] 
@date datetime,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@officialNo int,
@officerSailor varchar(1),
@serviceType varchar(10)

as
BEGIN	

select mi.item ,tc.qty ,tc.itemMessurmentCode
from [dbo].[T_IndividualExtraItemByCA] as tc,[dbo].[M_Wardroom] as mw,[dbo].[M_Item] as mi
where tc.offNo = @officialNo and tc.serviceType =@serviceType and 
tc.[date] =@date and tc.reasonCode = @reasonCode and tc.wardroomCode =@wardroomCode and mw.wardroomCode =tc.wardroomCode
and mi.itemCode = tc.itemCode and tc.isActive =1
order by mi.item

end

-- execute [VICTULING_GetMenuCcstomizeItemList] '2017-11-1','30000001','60000001','3147','O','RNF'


GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMenuCcstomizeMealItemList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get customize meal item list
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMenuCcstomizeMealItemList] 
@date datetime,
@reasonCode varchar(50),
@wardroomCode varchar(50)
--@serviceType varchar(10)

as
BEGIN	

--select tc.officialNo,tc.selectedMeal,tc.remarks,tc.noneVegetarian,tc.vegetarian,tc.mealIn,tc.mealOut,tc.mealCount
--from [dbo].[T_customizeMealAttendance] as tc,[dbo].[M_Wardroom] as mw
--where  tc.serviceType =@serviceType  and
--tc.mealDate =@date and tc.reason = @reasonCode and tc.wardroom =@wardroomCode and mw.wardroomCode =tc.wardroom
--order by tc.selectedMeal,tc.remarks

select tc.officialNo,tc.selectedMeal,tc.remarks,tc.noneVegetarian,tc.vegetarian,tc.mealIn,tc.mealOut,tc.mealCount
from [dbo].[T_customizeMealAttendance] as tc,[dbo].[M_Wardroom] as mw
where   tc.mealDate =@date and tc.reason = @reasonCode and tc.wardroom =@wardroomCode and mw.wardroomCode =tc.wardroom
order by tc.selectedMeal,tc.remarks


end

-- execute [VICTULING_GetMenuCcstomizeMealItemList] '2018-07-01','Breakfast','60000001'
--select * from [dbo].[T_customizeMealAttendance]

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMenuCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View non Vegi
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMenuCost] 
@date datetime,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupType varchar(50)

as
BEGIN	

select tt.totalCost,sum(tm.mealCount) mealCount,(convert(float,tt.totalCost)/convert(float,sum(tm.mealCount))) as cost
from [dbo].[T_MealAttendance] as tm,[dbo].[T_TotalMenuCost] as tt

where  tt.date = tm.mealDate and tt.reason = tm.reason and tt.wardroom = tm.wardroom 
and tm.mealIn = 'true'  and tt.vegi = 'Non-Vegetarian' and tm.groupMenuCode = @groupType
and tm.wardroom = @wardroomCode and tm.reason = @reasonCode and tm.mealDate = @date
and tm.groupMenuCode=tt.groupMenuCode and tm.noneVegetarian = 'true'

group by tt.totalCost,tm.noneVegetarian

end



-- execute [VICTULING_GetMenuCost] '2019-04-01','30000001','60000001','70000000'
-- execute [VICTULING_GetMenuCostVegetarian] '2019-04-01','30000001','60000001','70000000'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMenuCostVegetarian]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View non Vegi
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMenuCostVegetarian] 
@date datetime,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupType varchar(50)

as
BEGIN	

select tt.totalCost,sum(tm.mealCount) mealCount,(convert(float,tt.totalCost)/convert(float,sum(tm.mealCount))) as cost
from [dbo].[T_MealAttendance] as tm,[dbo].[T_TotalMenuCost] as tt

where  tt.date = tm.mealDate and tt.reason = tm.reason and tt.wardroom = tm.wardroom 
and tm.mealIn = 'true'  and tt.vegi = 'Vegetarian' and tm.groupMenuCode = @groupType
and tm.wardroom = @wardroomCode and tm.reason = @reasonCode and tm.mealDate = @date
and tm.groupMenuCode=tt.groupMenuCode and tm.vegetarian = 'true'

group by tt.totalCost,tm.noneVegetarian

end



-- execute [VICTULING_GetMenuCost] '2019-04-01','30000001','60000001','70000000'
-- execute [VICTULING_GetMenuCost] '2019-04-01','30000001','60000001','Non-Vegetarian','70000000'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMenuCostVegetarian_ForMonth]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View non Vegi
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMenuCostVegetarian_ForMonth] 

@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupType varchar(50),
@year varchar(50),
@moth varchar(50),
@vegi varchar(50)

as
BEGIN	

if(@vegi = 'Vegetarian')
begin
select CONVERT (varchar(4),DATEPART(Year, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.mealDate)) AS mealDate,
round(tt.totalCost,3) as totalCost,sum(tm.mealCount) mealCount,round((convert(float,tt.totalCost)/convert(float,sum(tm.mealCount))),2) as cost,tt.costId
from [dbo].[T_MealAttendance] as tm,[dbo].[T_TotalMenuCost] as tt

where  tt.date = tm.mealDate and tt.reason = tm.reason and tt.wardroom = tm.wardroom 
and tm.mealIn = 'true'  and tt.vegi = 'Vegetarian' and tm.groupMenuCode = @groupType
and tm.wardroom = @wardroomCode and tm.reason = @reasonCode 
and tm.groupMenuCode=tt.groupMenuCode and tm.vegetarian = 'true'
and MONTH(tm.mealDate) = @moth and YEAR(tm.mealDate)=@year 
and isAuthrized IS NULL
--and tm.mealDate BETWEEN @moth AND @year

group by tt.totalCost,tm.noneVegetarian,tm.mealDate,tt.costId

order by tm.mealDate
end

if(@vegi = 'Non-Vegetarian')
begin
select CONVERT (varchar(4),DATEPART(Year, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.mealDate)) AS mealDate,
round(tt.totalCost,3) as totalCost,sum(tm.mealCount) mealCount,round((convert(float,tt.totalCost)/convert(float,sum(tm.mealCount))),2) as cost,tt.costId
from [dbo].[T_MealAttendance] as tm,[dbo].[T_TotalMenuCost] as tt

where  tt.date = tm.mealDate and tt.reason = tm.reason and tt.wardroom = tm.wardroom 
and tm.mealIn = 'true'  and tt.vegi = 'Non-Vegetarian' and tm.groupMenuCode = @groupType
and tm.wardroom = @wardroomCode and tm.reason = @reasonCode 
and tm.groupMenuCode=tt.groupMenuCode and tm.noneVegetarian = 'true'
and MONTH(tm.mealDate) = @moth and YEAR(tm.mealDate)=@year 
and isAuthrized IS NULL
--and tm.mealDate BETWEEN @moth AND @year

group by tt.totalCost,tm.noneVegetarian,tm.mealDate,tt.costId

order by tm.mealDate
end

end


-- execute [VICTULING_GetMenuCostVegetarian_ForMonth] '30000001','60000001','70000000','2019','9','Non-Vegetarian'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMenuItemList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Menu Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMenuItemList] 
@item varchar(250)

as
BEGIN	

select mic.mainItemCode,mic.mainItem,mi.mainItemCategory
from [dbo].[M_MainItemCategory] as mi,[dbo].[M_MainItem] as mic
where mic.mainItemCategoryCode = mi.mainItemCategoryCode and (mic.mainItem like '%'+ @item +'%')

END

--execute [VICTULING_GetMenuItemList] 'noo'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMenuItemList_OnDate]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Menu Item List for On Date
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMenuItemList_OnDate] 
@wardroomName varchar(150),
@onChargeDate date,
@reason varchar(50),
@vegi varchar(50)


as
BEGIN	

select mi.itemCode,mi.item,ts.unitPrice,ts.saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID,
ROUND(sum((convert (float,ts.unitPrice)*convert(float,ts.saleQty))),2) as price
from [dbo].[T_DailyMenuSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode 
and mw.wardroomCode = @wardroomName and ts.[date] = @onChargeDate and ts.reasonCode = @reason and ts.vegi =@vegi and ts.saleQty !='0.000'
group by mi.itemCode,mi.item,ts.unitPrice,ts.saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID,
ts.unitPrice,ts.saleQty
-----------------

if(@vegi = 'Non-Vegetarian' )
begin
select tm.officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp 
Inner join [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr on mr.rankRateCode = tp.rankRateCode
inner join [T_MealAttendance] as tm on  tp.officialNo = tm.officialNo 
,[M_ItemReason] as tr
where tm.mealDate = @onChargeDate and tm.reason = @reason  and tm.wardroom = @wardroomName and 
tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tp.officerSailor = 'O' and tr.reasonCode = tm.reason and groupMenuCode = '70000000'
and tp.isActive = 'true'
order by tm.officialNo

select sum(tm.mealCount) as mealCount
from [T_MealAttendance] as tm,[M_ItemReason] as tr
where  tm.mealDate = @onChargeDate and tm.reason = @reason  and tm.wardroom = @wardroomName and 
tm.noneVegetarian = 'true' and tm.mealIn = 'true' and tr.reasonCode = tm.reason and tm.groupMenuCode = '70000000'
end

if(@vegi = 'Vegetarian' )
begin
select tm.officialNo,tp.serviceType,mb.branchID,mr.rankRate,tp.initials + ' ' + tp.surename as name,tm.mealCount,tm.mealId
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,[NHQ_VICTUALING].[dbo].[T_MealAttendance] as tm,[M_ItemReason] as tr
where mb.branchCode = tp.branchCode and tp.officerSailor = tm.officerSailor and  tp.officialNo = tm.officialNo
and tm.mealDate = @onChargeDate and tm.reason = @reason  and tm.wardroom = @wardroomName and mr.rankRateCode = tp.rankRateCode and 
tm.vegetarian = 'true' and tm.mealIn = 'true' and tr.reasonCode = tm.reason and groupMenuCode = '70000000'
and tp.isActive = 'true'
order by tm.officialNo

select sum(tm.mealCount) as mealCount
from [T_MealAttendance] as tm,[M_ItemReason] as tr 
where  tm.mealDate = @onChargeDate and tm.reason = @reason  and tm.wardroom = @wardroomName and 
tm.vegetarian = 'true' and tm.mealIn = 'true' and tr.reasonCode = tm.reason and groupMenuCode = '70000000'
end



END

--execute [VICTULING_GetMenuItemList_OnDate] '60000001','2023-06-12','30000002','Vegetarian'
--execute [VICTULING_GetMenuItemList_OnDate] '60000001','2023-12-01','30000001','Non-Vegetarian'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMenuItemList_OnDate_party]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Menu Item List for On Date
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMenuItemList_OnDate_party] 
@wardroomName varchar(150),
@onChargeDate date,
@reason varchar(50),
@vegi varchar(50),
@menuType varchar(50)


as
BEGIN	

select mi.itemCode,mi.item,ts.unitPrice,ts.saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID,
ROUND((convert (float,ts.unitPrice)*convert(float,ts.saleQty)),2) as price
from [dbo].[T_DailyMenuSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode 
and mw.wardroomCode = @wardroomName and ts.[date] = @onChargeDate and ts.reasonCode = @reason and ts.vegi =@vegi and ts.saleQty !='0.000'
and ts.menuType = @menuType


select  tp.officialNo,tp.serviceType,mb.branchID,mr.rankRate,tp.initials + ' ' + tp.surename as name
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr,
T_PartyCostByIndividual as tpa
where  tp.officialNo = tpa.offNo and tp.officerSailor = tpa.OS and tp.isActive = 'true' and tpa.wardroom = @wardroomName and tpa.partyDate = @onChargeDate and
tpa.reason = @reason and tpa.veg =@vegi and tpa.groupType = @menuType and mb.branchCode = tp.branchCode and  mr.rankRateCode = tp.rankRateCode
order by mr.priority ,tp.officialNo


select round(sum(convert (float,ts.unitPrice)*convert(float,ts.saleQty)),2) as price

from [dbo].[T_DailyMenuSales] as ts
where ts.wordRoomCode= @wardroomName and ts.[date] = @onChargeDate and ts.reasonCode = @reason and ts.vegi =@vegi and ts.saleQty !='0.000'
and ts.menuType = @menuType

END

--execute [VICTULING_GetMenuItemList_OnDate_party] '60000001','2020-12-08','30000004','Non-Vegetarian','70000019'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getMessurment]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) KMUL Bandara
-- Description: get Messurment
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getMessurment] 
@itemCode varchar(50)

as
BEGIN	

SELECT b.itemMessurment,b.itemMessurmentCode
from  [dbo].[M_Item] as a,[dbo].[M_ItemByMessurment] as b
where b.itemMessurmentCode = a.itemMessurmentCode and a.itemCode = @itemCode

	   
END

--execute [VICTULING_getMessurment] '40000001'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMonthlyIndividualBarBill]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Search Monthly  Individual Bar bill 
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMonthlyIndividualBarBill] 
@officialNo int,
@officerSailor varchar(1),
--@serviceType varchar(10),
@year varchar(50) = null,
@month varchar(50) = null,
@wardroom varchar(50)


as
BEGIN
	

SELECT billNo,
	                   CONVERT (varchar(4),DATEPART(Year, date)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, date)) + '/' + CONVERT (varchar(2), DATEPART(DAY, date)) AS [date]     
                        ,turn    
                        ,itemname
                        ,unitprice
                        ,QTY
                        ,total
                        ,Type
                        ,case 
							
							when PartyCount = 0 then 'Individual'  
							when PartyCount !=0 then 'Party' 
						  End as PartyCount
                  FROM [10.10.1.232].[WMS].[dbo].[DailySale]

   WHERE offIdNumber = @officialNo AND YEAR(date) = @year AND MONTH(date) = @month

order by [date] ASC


END

--execute [VICTULING_GetMonthlyIndividualBarBill] '2860','O','2024','2','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMonthlyIndividualPartyCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Monthly  Individual Party Cost
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMonthlyIndividualPartyCost] 
@officialNo int,
@officerSailor varchar(1),
@year varchar(50)= null,
@month varchar(50)= null,
@wardroom varchar(50)


as
BEGIN
	

select CONVERT (varchar(4),DATEPART(Year, td.partyDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.partyDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.partyDate)) AS partyDate,
mg.GroupMenu,td.perHeadCost ,td.partyName

from [dbo].[T_PartyCostByIndividual] as td,[dbo].[M_GroupMenu] as mg,[dbo].[M_ItemReason] as mir

where

MONTH(td.partyDate) = @month
--td.partyDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(td.partyDate)=@year
and td.offNo = @officialNo and td.OS =@officerSailor 
and mg.GroupMenuCode = td.groupType 
and mir.reasonCode = 30000004 



END

--execute [VICTULING_GetMonthlyIndividualPartyCost] '3147','O','2019','3','60000001'
--execute [VICTULING_GetMonthlyIndividualPartyCost] '866','O','2020-03-15','2020-03-1','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMonthlyIndividualSales]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Monthly  Individual Sales
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMonthlyIndividualSales] 
@officialNo int,
@officerSailor varchar(1),
--@serviceType varchar(10),
@year varchar(50) = null,
@month varchar(50) = null,
@wardroom varchar(50)


as
BEGIN
	

select CONVERT (varchar(4),DATEPART(Year, td.saleDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.saleDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.saleDate)) AS saleDate,
--mi.item,td.unitPrice ,Try_convert(float, td.saleQty) as saleQty ,mm.itemMessurment ,td.recevedFrom,round((convert (float,td.unitPrice)*convert(float,td.saleQty )),2) as price,mir.reason
mi.item,td.unitPrice ,round(Try_convert(float, td.saleQty),2) as saleQty ,mm.itemMessurment ,td.recevedFrom,round((convert (float,td.unitPrice)*convert(float,td.saleQty )),2) as price,mir.reason

from [T_DailyExtraSales] as td,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_ItemReason] as mir

where  mi.itemCode = td.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode 

and MONTH(td.saleDate) = @month 
--and td.saleDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(td.saleDate)=@year
and td.offNo = @officialNo and td.officerSailor =@officerSailor and td.wardroomCode = @wardroom
and mir.reasonCode = td.reasonCode and mir.reasonCode != 30000007 and td.saleQty !='0.000' 
and td.groupType not in(70000001,70000002,70000003,70000004,70000005,70000006,70000007,70000008,70000009,70000010,70000011,70000012,70000013,70000014,70000015)

order by td.saleDate ASC

END

--execute [VICTULING_GetMonthlyIndividualSales] '773','O','2022','4','60000001'

--select * from [T_DailyExtraSales] where offNo = @officialNo





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMonthlyIndividualSales_byMonth]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Monthly  Individual Sales
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMonthlyIndividualSales_byMonth] 

@year varchar(50),
@month varchar(50),
@wardroom varchar(50)


as
BEGIN
	

select CONVERT (varchar(4),DATEPART(Year, td.saleDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.saleDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.saleDate)) AS saleDate,
mi.item,td.unitPrice ,round(Try_convert(float, td.saleQty),2) as saleQty ,mm.itemMessurment ,td.recevedFrom,round((convert (float,td.unitPrice)*convert(float,td.saleQty )),2) as price,mir.reason
,td.offNo
from [T_DailyExtraSales] as td,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_ItemReason] as mir

where  mi.itemCode = td.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and
--td.saleDate BETWEEN @month AND @year
MONTH(td.saleDate) = @month and YEAR(td.saleDate)=@year and td.wardroomCode = @wardroom
and mir.reasonCode = td.reasonCode and mir.reasonCode != 30000007 and td.saleQty !='0.000' 
and td.groupType not in(70000001,70000002,70000003,70000004,70000005,70000006,70000007,70000008,70000009,70000010,70000011,70000012,70000013,70000014,70000015)

order by td.saleDate,td.offNo ASC

END

--execute [VICTULING_GetMonthlyIndividualSales_byMonth] '2020','6','60000001'

--select * from [T_DailyExtraSales] where offNo = @officialNo





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMonthlyIndividualTea]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Monthly  Individual Tea 
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMonthlyIndividualTea] 
@officialNo int,
@officerSailor varchar(1),
--@serviceType varchar(10),
@year varchar(50) = null,
@month varchar(50) = null,
@wardroom varchar(50)


as
BEGIN
	

select CONVERT (varchar(4),DATEPART(Year, td.teaDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.teaDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.teaDate)) AS teaDate,
td.teaType,td.teaCount
from [T_TeaMark] as td

where 

MONTH(td.teaDate) = @month 
--td.teaDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(td.teaDate)=@year
and td.officialNo = @officialNo  and td.officerSailor =@officerSailor and td.wardroom = @wardroom
order by teaDate ASC


END

--execute [VICTULING_GetMonthlyIndividualTea] '3147','O','RNF','2017','9','60000001'
--execute [VICTULING_GetMonthlyIndividualTea] '3147','O','RNF','2020-03-15','2020-03-1','60000001'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMonthlyIndividualTeaCount]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Monthly  Individual Sales
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMonthlyIndividualTeaCount] 
@officialNo int,
@officerSailor varchar(1),
@serviceType varchar(10),
@year int,
@month varchar(50),
@wardroom varchar(50)


as
BEGIN
	

select count (td.teaCount)

from [dbo].[T_TeaMark] as td

where  MONTH(td.teaDate) = @month and YEAR(td.teaDate)=@year and teaType = 'Plain Tea'
and td.officialNo = @officialNo and td.serviceType =@serviceType and td.officerSailor =@officerSailor and td.wardroom = @wardroom 



END

--execute [VICTULING_GetMonthlyIndividualTeaCount] '3147','O','RNF','2017','9','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMonthlyIndividualTotalSales]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Monthly  Individual Sales
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMonthlyIndividualTotalSales] 
@officialNo int,
@officerSailor varchar(1),
@serviceType varchar(10),
@year int,
@month varchar(50),
@wardroom varchar(50)


as
BEGIN
	

select SUM (convert (float,td.unitPrice)*convert(float,td.saleQty )) as price

from [T_DailyExtraSales] as td

where  MONTH(td.saleDate) = @month and YEAR(td.saleDate)=@year
and td.offNo = @officialNo and td.serviceType =@serviceType and td.officerSailor =@officerSailor and td.wardroomCode = @wardroom



END

--execute [VICTULING_GetMonthlyIndividualTotalSales] '3147','O','RNF','2017','9','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMonthlyOfficersList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Individual Credit
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMonthlyOfficersList] 
@wardroomName varchar(150),
@year int = null,
@moth varchar(50) = null

as
BEGIN	


select distinct tp.serviceType,mb.branchID,tm.officialNo ,mr.rankRate,tp.initials + ' ' + tp.surename as name,mr.priority
from T_MealAttendance as tm,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
where tm.officialNo = tp.officialNo and tp.officerSailor = 'O' and mb.branchCode = tp.branchCode
and MONTH(tm.mealDate) = @moth 
--and tm.mealDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(tm.mealDate)=@year 
and tm.wardroom = @wardroomName 
and mr.rankRateCode = tp.rankRateCode and tp.isActive = 'true'


union

select distinct tp.serviceType,mb.branchID,tm.officialNo ,mr.rankRate,tp.initials + ' ' + tp.surename as name,mr.priority
from T_customizeMealAttendance as tm,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
where tm.officialNo = tp.officialNo and tp.officerSailor = 'O' and mb.branchCode = tp.branchCode
and MONTH(tm.mealDate) = @moth 
--and tm.mealDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(tm.mealDate)=@year 
and tm.wardroom = @wardroomName 
and mr.rankRateCode = tp.rankRateCode and tp.isActive = 'true'
 

union

select distinct tp.serviceType,mb.branchID,tm.officialNo ,mr.rankRate,tp.initials + ' ' + tp.surename as name,mr.priority
from T_TeaMark as tm,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
where tm.officialNo = tp.officialNo and tp.officerSailor = 'O' and mb.branchCode = tp.branchCode
and MONTH(tm.teaDate) = @moth 
--and tm.teaDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(tm.teaDate)=@year 
and tm.wardroom = @wardroomName 
and mr.rankRateCode = tp.rankRateCode and tp.isActive = 'true'


union

select distinct tp.serviceType,mb.branchID,tm.offNo ,mr.rankRate,tp.initials + ' ' + tp.surename as name,mr.priority
from T_DailyExtraSales as tm,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
where tm.offNo = tp.officialNo and tp.officerSailor = 'O' and mb.branchCode = tp.branchCode
and MONTH(tm.saleDate) = @moth 
--and tm.saleDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(tm.saleDate)=@year 
and tm.wardroomCode = @wardroomName 
and mr.rankRateCode = tp.rankRateCode and tp.isActive = 'true'

union

select distinct tp.serviceType,mb.branchID,tm.offNo ,mr.rankRate,tp.initials + ' ' + tp.surename as name,mr.priority
from T_PartyCostByIndividual as tm,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
where tm.offNo = tp.officialNo and tp.officerSailor = 'O' and mb.branchCode = tp.branchCode
and MONTH(tm.partyDate) = @moth
--and tm.partyDate BETWEEN '2024-3-16' AND '2024-3-31' 
and YEAR(tm.partyDate)=@year 
and tm.wardroom = @wardroomName 
and mr.rankRateCode = tp.rankRateCode and tp.isActive = 'true'
order by mr.priority,tm.officialNo

END

--execute [VICTULING_GetMonthlyOfficersList] '60000001','2023','03'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMonthlyOfficersList_withFinalCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Individual Credit
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMonthlyOfficersList_withFinalCost] 
@wardroomName varchar(150),
@year int = null,
@moth varchar(50) = null

as
BEGIN	

--Non-Veg--
select distinct tp.serviceType,mb.branchID,tm.officialNo ,mr.rankRate,tp.initials + ' ' + tp.surename as name,mr.priority
,ROUND(isnull(SUM(convert(float,tt.costPerPerson*tm.mealCount)),0),2) as cost
from T_MealAttendance as tm,[T_TotalMenuCost] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
where tm.officialNo = tp.officialNo and tp.officerSailor = 'O' and mb.branchCode = tp.branchCode
and MONTH(tm.mealDate) = @moth 
--and tm.mealDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(tm.mealDate)=@year 
and tm.wardroom = @wardroomName 
and mr.rankRateCode = tp.rankRateCode and tp.isActive = 'true'
and tt.reason = tm.reason and tt.groupMenuCode = tm.groupMenuCode and tm.mealIn = 'true'  
and tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom 
--and tm.groupMenuCode = '70000000'
and tt.vegi = 'Non-Vegetarian' and tm.noneVegetarian = 'true' 
group by tp.serviceType,mb.branchID,tm.officialNo ,mr.rankRate,tp.initials,tp.surename,mr.priority
order by mr.priority,tm.officialNo

--Veg--
select distinct tp.serviceType,mb.branchID,tm.officialNo ,mr.rankRate,tp.initials + ' ' + tp.surename as name,mr.priority
,ROUND(isnull(SUM(convert(float,tt.costPerPerson*tm.mealCount)),0),2) as cost
from T_MealAttendance as tm,[T_TotalMenuCost] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
where tm.officialNo = tp.officialNo and tp.officerSailor = 'O' and mb.branchCode = tp.branchCode
and MONTH(tm.mealDate) = @moth 
--and tm.mealDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(tm.mealDate)=@year 
and tm.wardroom = @wardroomName 
and mr.rankRateCode = tp.rankRateCode and tp.isActive = 'true'
and tt.reason = tm.reason and tt.groupMenuCode = tm.groupMenuCode and tm.mealIn = 'true'  
and tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom 
--and tm.groupMenuCode = '70000000'
and tt.vegi = 'Vegetarian' and tm.vegetarian = 'true' 
group by tp.serviceType,mb.branchID,tm.officialNo ,mr.rankRate,tp.initials,tp.surename,mr.priority
order by mr.priority,tm.officialNo

--Extra--
select distinct tp.serviceType,mb.branchID,tm.offNo as officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,mr.priority
,ROUND(isnull(SUM (convert (float,tm.unitPrice)*convert(float,tm.saleQty )),0),2) as cost
from T_DailyExtraSales as tm,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
where tm.offNo = tp.officialNo and tp.officerSailor = 'O' and mb.branchCode = tp.branchCode
and MONTH(tm.saleDate) = @moth 
--and tm.saleDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(tm.saleDate)=@year 
and tm.wardroomCode = @wardroomName 
and mr.rankRateCode = tp.rankRateCode and tp.isActive = 'true'
and tm.groupType not in(70000001,70000002,70000003,70000004,70000005,70000006,70000007,70000008,70000009,70000010,70000011,70000012,70000013,70000014,70000015)
and tm.reasonCode not in (30000007)
group by tp.serviceType,mb.branchID,tm.offNo ,mr.rankRate,tp.initials,tp.surename,mr.priority
order by mr.priority,tm.offNo


--Party--
select distinct tp.serviceType,mb.branchID,tm.offNo as officialNo,mr.rankRate,tp.initials + ' ' + tp.surename as name,mr.priority,
ROUND(isnull(sum (tm.perHeadCost),0),2) as cost
from T_PartyCostByIndividual as tm,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
where tm.offNo = tp.officialNo and tp.officerSailor = 'O' and mb.branchCode = tp.branchCode
and MONTH(tm.partyDate) = @moth 
--and tm.partyDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(tm.partyDate)=@year 
and tm.wardroom = @wardroomName 
and mr.rankRateCode = tp.rankRateCode and tp.isActive = 'true'
group by tp.serviceType,mb.branchID,tm.offNo ,mr.rankRate,tp.initials,tp.surename,mr.priority
order by mr.priority,tm.offNo

----Get Total Plain Tea Count-------
select distinct tp.serviceType,mb.branchID,tm.officialNo ,mr.rankRate,tp.initials + ' ' + tp.surename as name,mr.priority
,sum (tm.teaCount) cost
from T_TeaMark as tm,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
where tm.officialNo = tp.officialNo and tp.officerSailor = 'O' and mb.branchCode = tp.branchCode
and MONTH(tm.teaDate) = @moth 
--and tm.teaDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(tm.teaDate)=@year 
and tm.wardroom = @wardroomName 
and mr.rankRateCode = tp.rankRateCode and tp.isActive = 'true' and teaType = 'Plain Tea'
group by tp.serviceType,mb.branchID,tm.officialNo ,mr.rankRate,tp.initials,tp.surename,mr.priority
order by mr.priority,tm.officialNo


----Get Total Tea Count-------
select distinct tp.serviceType,mb.branchID,tm.officialNo ,mr.rankRate,tp.initials + ' ' + tp.surename as name,mr.priority
,sum (tm.teaCount) cost
from T_TeaMark as tm,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
where tm.officialNo = tp.officialNo and tp.officerSailor = 'O' and mb.branchCode = tp.branchCode
and MONTH(tm.teaDate) = @moth 
--and tm.teaDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(tm.teaDate)=@year 
and tm.wardroom = @wardroomName 
and mr.rankRateCode = tp.rankRateCode and tp.isActive = 'true' and teaType = 'Tea'
group by tp.serviceType,mb.branchID,tm.officialNo ,mr.rankRate,tp.initials,tp.surename,mr.priority
order by mr.priority,tm.officialNo


select distinct tp.serviceType,mb.branchID,tm.OFFNO as officialNo ,mr.rankRate,tp.initials + ' ' + tp.surename as name,mr.priority
,tm.VIC as cost,tm.noDaysInSea,tm.noDaysInBaseNew,tm.SC as seaDays,tm.SA as baseDays
from TempMonthly304Data as tm,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
where tm.OFFNO = tp.officialNo and tp.officerSailor = 'O' and mb.branchCode = tp.branchCode
and tm.[MONTH] = @moth and tm.[YEAR]=@year 
and mr.rankRateCode = tp.rankRateCode and tp.isActive = 'true' 
order by mr.priority,tm.OFFNO




END

--execute [VICTULING_GetMonthlyOfficersList_withFinalCost] '60000001','2020','6'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMonthlyRecoveryByMonth]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Select All Monthly Recovery
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMonthlyRecoveryByMonth] 
@wardroom varchar(50),
@year int = null,
@month varchar(50) = null

as
BEGIN

DECLARE @plainTeaCost as FLOAT
DECLARE @teaCost as FLOAT

SELECT @plainTeaCost=plainTeaCost, @teaCost=teaCost FROM [dbo].[T_MonthlyTeaCost] WHERE [Year]=@year AND [month]=@month

select mb.branchID,tp.officialNo, mr.rankRate ,tp.initials + ' ' + tp.surename as name,tp.serviceType,tp.officerSailor,
round(isnull(convert(float,tt.vegMenuCost),0)+(isnull(convert(float,tt.nVegMenuCost),0)),2) as totalMenuCost,
round(isnull(convert(float,tt.extraCost),0)+(isnull(convert(float,tt.partyCost),0)),2) as extraParty,
round((isnull(convert(float,tt.plainTeaCount),0))*(@plainTeaCost),2) as plainTeaCost,
round((isnull(convert(float,tt.teaCount),0))*(@teaCost),2) as teaCost,
round((isnull(convert(float,tt.vegMenuCost),0)+(isnull(convert(float,tt.nVegMenuCost),0)))+(isnull(convert(float,tt.extraCost),0)+(isnull(convert(float,tt.partyCost),0)))+(isnull(convert(float,tt.plainTeaCount),0)*(@plainTeaCost))+(isnull(convert(float,tt.teaCount),0)*(@teaCost)),2) as totalCost

--isnull(tt.noDaysInBase,0) as noDaysInBase ,'660.00' as costPerDay,
--((660*isnull(tt.noDaysInBase,0))-(round((isnull(convert(float,tt.vegMenuCost),0)+(isnull(convert(float,tt.nVegMenuCost),0)))+(isnull(convert(float,tt.extraCost),0)+(isnull(convert(float,tt.partyCost),0)))+(isnull(convert(float,tt.plainTeaCount),0)*(7.19))+(isnull(convert(float,tt.teaCount),0)*(37.25)),2))) as crditDebit

,isnull(tt.noDaysInBaseNew,0) as noDaysInBase 
,'1250.00' as costPerDay,isnull(tt.noDaysInSea,0) as noDaysInSea
,'1375.00' as costPerSeaDay
,(((1250*isnull(tt.noDaysInBaseNew,0))+(1375*isnull(tt.noDaysInSea,0)))-(round((isnull(convert(float,tt.vegMenuCost),0)+(isnull(convert(float,tt.nVegMenuCost),0)))+(isnull(convert(float,tt.extraCost),0)+(isnull(convert(float,tt.partyCost),0)))+(isnull(convert(float,tt.plainTeaCount),0)*(@plainTeaCost))+(isnull(convert(float,tt.teaCount),0)*(@teaCost)),2))) as crditDebit

from T_TotalMonthlyAllDetails as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr

where mb.branchCode = tp.branchCode and tt.offNo = tp.officialNo and tt.serviceType = tp.serviceType 
and mr.rankRateCode = tp.rankRateCode and tt.wardroom = @wardroom and tt.year =@year and tt.month =@month
and tp.officerSailor = 'O' and tp.isActive = 'true'
order by mr.priority,tp.officialNo



END




--execute [VICTULING_GetMonthlyRecoveryByMonth] '60000001','2023','5'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMonthlyTea]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Monthly Tea 
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMonthlyTea] 

@year int,
@month varchar(50),
@wardroom varchar(50)


as
BEGIN
	

select 
--CONVERT (varchar(4),DATEPART(Year, td.teaDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, td.teaDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, td.teaDate)) AS teaDate,
td.teaType,sum(td.teaCount) as tea
from [T_TeaMark] as td

where  MONTH(td.teaDate) = @month and YEAR(td.teaDate)=@year and td.wardroom = @wardroom
group by td.teaType
--order by teaDate ASC


END

--execute [VICTULING_GetMonthlyTea] '2018','09','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetMonthlyTeaCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lt (IT) KAUK Hettiarachchi
-- Description:	Get Monthly Tea Cost
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetMonthlyTeaCost]
	-- Add the parameters for the stored procedure here
	@year int,
	@month int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    DECLARE @Count int
    -- Insert statements for procedure here
	SET @Count = (Select COUNT(teaCost) from [dbo].T_MonthlyTeaCost
	WHERE Year = @year AND month=@month)

    IF (@Count>0)
    BEGIN
        SELECT [year],[month],[teaCost],[plainTeaCost] FROM [dbo].[T_MonthlyTeaCost] WHERE Year = @year AND month=@month
    END
    ELSE
    BEGIN
		DECLARE @currentDate datetime
		DECLARE @currentYear int
		DECLARE @currentMonth int

		SET @currentDate = GETDATE()

		SET @currentYear = Datepart(year,@currentDate)
		SET @currentMonth = DATEPART(month,@currentDate)

		IF (@month = 1)
		BEGIN
		SET @month = 12
		SET @year =@currentYear -1
		END
		ELSE
		BEGIN
		SET @month = @currentMonth-1
		END
		
        SELECT [year],[month],[teaCost],[plainTeaCost] FROM [dbo].[T_MonthlyTeaCost] WHERE Year = @year AND month=(@month)
    END
END

-- execute [VICTULING_GetMonthlyTeaCost] '2022', '2'


GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetOnCharge309ItemList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetOnCharge309ItemList] 
@wordRoomCode varchar(150),
@year int


as
BEGIN

select mi.itemCode,mi.item,ts.unitPrice,ts.denomination,mm.itemMessurment,ts.itemId
from [dbo].[T_309AnnualPriceList] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = ts.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode and
mw.wardroomCode = @wordRoomCode and ts.year = @year
order by mi.item ASC

END

--execute [VICTULING_GetOnCharge309ItemList] '60000001','2019'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetOnChargeItemList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetOnChargeItemList] 
@wardroomName varchar(150),
@onChargeDate date,
@recevedFrom varchar(50),
@billNo varchar(50)


as
BEGIN

select mi.itemCode,mi.item,ts.unitPrice,ts.onChargeQty,mm.itemMessurment,ts.itemId
from [dbo].[T_Stock] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = ts.itemMessurmentCode and mw.wardroomCode = ts.wordRoomCode and
mw.wardroomCode = @wardroomName and ts.onChargeDate = @onChargeDate and ts.recevedFrom=@recevedFrom and ts.billNo = @billNo

END

--execute [VICTULING_GetOnChargeItemList] '60000001','2018-07-06','309','000426'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetOnChargeItemListForSA]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) KMUL BANDARA , NRT 3352
-- Description: Search Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetOnChargeItemListForSA] 
@wardroomCode varchar(150),
@billNo varchar(50),
@billingMonth date
,@recevedFrom varchar(500) 


as
BEGIN
if(@billNo != '')
begin
		select ts.itemCode,ts.itemId,ts.billNo,mi.item,ts.onChargeQty,mm.itemMessurment,ts.unitPrice
		,ROUND((convert(float,ts.onChargeQty) * convert(float, ts.unitPrice )),2) as totalPrice
		--ROUND((convert(float,tst.unitPrice)*convert(float,tst.CurrentQty)),2 ) as price
		from [dbo].[T_Stock] as ts 
		inner join [dbo].[M_Item] as mi on ts.itemCode = mi.itemCode
		inner join [dbo].[M_ItemByMessurment] as mm on ts.itemMessurmentCode = mm.itemMessurmentCode
		inner join [dbo].[M_Wardroom] as mw on ts.wordRoomCode = mw.wardroomCode 
		inner join [dbo].[T_BillDiscount] as BD on ts.billNo = BD.billNo and (ts.onChargeDate) = (@billingMonth)
		where ts.wordRoomCode = @wardroomCode 
		 and  ts.billNo = @billNo and (ts.onChargeDate) = (@billingMonth)
		and BD.recevedFrom = @recevedFrom and ts.recevedFrom = BD.recevedFrom
		group by ts.itemCode,ts.itemId,ts.billNo,mi.item,ts.onChargeQty,mm.itemMessurment,ts.unitPrice
		order by mi.item ASC



end

else
begin
	select ts.itemCode,ts.itemId,ts.billNo,mi.item,ts.onChargeQty,mm.itemMessurment,ts.unitPrice
	,ROUND((convert(float,ts.onChargeQty) * convert(float, ts.unitPrice )),2) as totalPrice
		from [dbo].[T_Stock] as ts 
		inner join [dbo].[M_Item] as mi on ts.itemCode = mi.itemCode
		inner join [dbo].[M_ItemByMessurment] as mm on ts.itemMessurmentCode = mm.itemMessurmentCode
		inner join [dbo].[M_Wardroom] as mw on ts.wordRoomCode = mw.wardroomCode 
		--inner join [dbo].[T_BillDiscount] as BD on ts.billNo = BD.billNo and month(ts.onChargeDate) = month(@billingMonth)
		where ts.wordRoomCode = @wardroomCode   and (ts.onChargeDate) = (@billingMonth)
		--and BD.recevedFrom = @recevedFrom
		group by ts.itemCode,ts.itemId,ts.billNo,mi.item,ts.onChargeQty,mm.itemMessurment,ts.unitPrice
		order by mi.item ASC

end
---------------------
		--select ts.itemCode,ts.itemId,ts.billNo,mi.item,ts.onChargeQty,mm.itemMessurment,ts.unitPrice,ROUND((convert(float,ts.onChargeQty) * convert(float, ts.unitPrice )),2) as totalPrice
		--from [dbo].[T_Stock] as ts ,[dbo].[M_Item] as mi, [dbo].[M_ItemByMessurment] as mm,  [dbo].[M_Wardroom] as mw,
		--[dbo].[T_BillDiscount] as BD
		--where  ts.itemCode = mi.itemCode 
		--and ts.itemMessurmentCode = mm.itemMessurmentCode
		--and ts.wordRoomCode = mw.wardroomCode 
		--and ts.recevedFrom = BD.recevedFrom
		-- and ts.billNo = BD.billNo 
		-- and month(ts.onChargeDate) = month(@billingMonth) and ts.billNo = @billNo and ts.wordRoomCode = @wardroomCode and BD.recevedFrom = @recevedFrom		
		--group by ts.itemCode,ts.itemId,ts.billNo,mi.item,ts.onChargeQty,mm.itemMessurment,ts.unitPrice 
		------------------------------

END

BEGIN
		select discountPrice from [dbo].[T_BillDiscount] where billNO = @billNO and onChargeDate = @billingMonth and
		--month(onChargeDate) = month(@billingMonth) and
		recevedFrom = @recevedFrom
END



--execute [VICTULING_GetOnChargeItemListForSA] '60000001','..','2019-01-06'
--execute [VICTULING_GetOnChargeItemListForSA] '60000001','280','2023-08-14','Cash'
--execute [VICTULING_GetOnChargeItemListForSA] '60000001','229','2019-01-02','309'
--execute [VICTULING_GetOnChargeItemListForSA] '60000001','..','2019-03-01','309'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetPartContributionHeadCount]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: 
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetPartContributionHeadCount] 

@areaCode varchar(20)


as
BEGIN	

if(@areaCode = 1)
begin

select count(tp.officerSailor) as offCount
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_areas] as td,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
where td.areaCode = tp.permanentAreaCode and tp.isActive =1 and tp.officerSailor = 'O'

select tp.officialNo
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_areas] as td,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
where td.areaCode = tp.permanentAreaCode and tp.isActive =1 and tp.officerSailor = 'O'
order by tp.officialNo ASC

end

else

begin

select count(tp.officerSailor) as offCount
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_areas] as td,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
where td.areaCode = tp.permanentAreaCode and tp.isActive =1 and td.areaCode = @areaCode and tp.officerSailor = 'O'

select tp.officialNo
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_areas] as td,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
where td.areaCode = tp.permanentAreaCode and tp.isActive =1 and tp.officerSailor = 'O' and td.areaCode = @areaCode 
order by tp.officialNo ASC

end


END

--execute [VICTULING_GetPartContributionHeadCount] '1'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetPartContributionHeadCountOfficialNo]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: 
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetPartContributionHeadCountOfficialNo] 

@areaCode varchar(20)


as
BEGIN	

if(@areaCode = 1)
begin

select tp.officialNo
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_areas] as td,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
where td.areaCode = tp.permanentAreaCode and tp.isActive =1 and tp.officerSailor = 'O'
order by tp.officialNo ASC

end

else

begin

select tp.officialNo
from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_areas] as td,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp
where td.areaCode = tp.permanentAreaCode and tp.isActive =1 and td.areaCode = '11180000' and tp.officerSailor = 'O'
order by tp.officialNo ASC

end


END

--execute [VICTULING_GetPartContributionHeadCountOfficialNo] '11180000'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetPassword_For_Decrypt]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[VICTULING_GetPassword_For_Decrypt]
	-- Add the parameters for the stored procedure here
	@userName VARCHAR(100)
AS
BEGIN
	
	SELECT [password],[baseName],[baseCode] FROM [dbo].[T_Login]
	WHERE [userName] = @userName

    
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetPendingRecovery]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VICTULING_GetPendingRecovery] 
@wardroom varchar(50),
@year int,
@month varchar(50)

as
BEGIN



select mbr.branchID,tt.offno,mr.rankRate ,tpe.initials + ' ' + tpe.surename as name
--, tt.rankRate ,tt.name
,'0.00' as individualTotalCost ,'0.00' as creditDebit,'0.00' as debit,tt.recoverDiningAmmount ,tt.recoverWineAmmount ,'0.00' as messsub,'0.00' as barBill,((convert(float,tt.recoverDiningAmmount)) + (convert(float,tt.recoverWineAmmount))) as TotRecovery,mr.priority,''

from [dbo].[T_PendingRecovery] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tpe,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mbr
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr

where  tt.wardroom = @wardroom and tt.recoverYear = @year  and tt.recoverMonth = @month 
and tpe.officialNo = tt.offno and tpe.officerSailor = 'O' and tt.serviceType = tpe.serviceType and  mbr.branchCode = tpe.branchCode 
and mr.rankRateCode = tpe.rankRateCode 


order by priority,officialNo

------------


END

--execute [VICTULING_GetPendingRecovery] '60000001','2020','1'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetSelectedItem309Price]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetSelectedItem309Price] 
@wordRoomCode varchar(150),
@year date,
@itemCode varchar(150)


as
BEGIN

select ts.itemCode,mi.item,ts.unitPrice

from [dbo].[T_309AnnualPriceList] as ts,[dbo].[M_Item] as mi

where mi.itemCode = ts.itemCode and ts.itemCode =@itemCode and 
ts.wordRoomCode = @wordRoomCode and ts.year = YEAR(@year) and ts.isActive= 1

order by mi.item ASC


END

--execute [VICTULING_GetSelectedItem309Price] '60000001','2019-07-03','40000641'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetTeaCount]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Tea Count
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetTeaCount] 
@date date,
@wardroomCode varchar(50)



as
BEGIN	

select sum(tt.teaCount) as teaCount
from [dbo].[T_TeaMark] as tt
where  tt.teaDate = @date and tt.wardroom = @wardroomCode and tt.teaType = 'Tea' 

select sum(tt.teaCount) as plainTeaCount
from [dbo].[T_TeaMark] as tt
where  tt.teaDate = @date and tt.wardroom = @wardroomCode and tt.teaType = 'Plain Tea' 



END

--execute [VICTULING_GetTeaCount] '2017-12-04','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetTeaRetion_ForMonth]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Depreciation Item List for On Date
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetTeaRetion_ForMonth] 
@reason varchar(50),
@year varchar(50),
@month varchar(50),
@wardroomName varchar(150)


as
BEGIN	

select CONVERT (varchar(4),DATEPART(Year, ts.depreciationDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, ts.depreciationDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, ts.depreciationDate)) AS depreciationDate
,mi.itemCode,mi.item,ts.unitPrice,ts.depreciationQty,mm.itemMessurment,ts.recevedFrom,ts.depreciationID,round((convert (float,ts.unitPrice)*convert(float,ts.depreciationQty)),2) as price
from [dbo].[T_DepreciationItems] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode 
--and mw.wardroomCode = ts.wordRoomCode 
and mw.wardroomCode = @wardroomName and MONTH(ts.depreciationDate) = @month  and YEAR(ts.depreciationDate) = @year and ts.reasonCode = @reason
order by ts.depreciationDate ASC


select count (td.teaCount) as PlainTea
from [dbo].[T_TeaMark] as td
where  MONTH(td.teaDate) = @month and YEAR(td.teaDate)=@year and teaType = 'Plain Tea'
and  td.wardroom = @wardroomName 

select count (td.teaCount) as Tea
from [dbo].[T_TeaMark] as td
where  MONTH(td.teaDate) = @month and YEAR(td.teaDate)=@year and teaType = 'Tea'
and  td.wardroom = @wardroomName 

END

--execute [VICTULING_GetTeaRetion_ForMonth] '30000018','2020','8','60000001'








GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetTotalDepreciationCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Depreciation total Cost
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetTotalDepreciationCost] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)



as
BEGIN	

select SUM(convert(float,td.price)) as totalCost
from [dbo].[T_DepreciationItems] as td
where  td.[depreciationDate] = @date and td.reasonCode = @reasonCode  and td.wordRoomCode = @wardroomCode 



END

--execute [VICTULING_GetTotalMenuCost] '2017-08-02','Breakfast','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetTotalIndividualMealCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Individual Meal Dates
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetTotalIndividualMealCost] 
@officialNo int,
@officerSailor varchar(1),
----@serviceType varchar(10),
@year varchar(50) = null,
@month varchar(50) = null,
@wardroom varchar(50)

as
BEGIN

---------------Get Total Menu Cost------------	

declare @NonVegicost  float 
declare @Vegicost float 
declare @Totalcost float 

select @NonVegicost = ROUND(isnull(SUM(convert(float,tt.costPerPerson*tm.mealCount)),0),2)
from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt
where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
tt.vegi = 'Non-Vegetarian' and tm.noneVegetarian = 'true' 
and  MONTH(tm.mealDate) = @month 
and YEAR(tm.mealDate)=@year
--and tm.mealDate BETWEEN '2024-3-16' AND '2024-3-31'

and tm.officialNo = @officialNo  and tm.officerSailor =@officerSailor and tm.wardroom = @wardroom
and tt.reason = tm.reason and tt.groupMenuCode = tm.groupMenuCode

select @Vegicost = ROUND(isnull(SUM(convert(float,tt.costPerPerson*tm.mealCount)),0),2)
from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt
where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
tt.vegi = 'Vegetarian' and tm.vegetarian = 'true' 
and  MONTH(tm.mealDate) = @month 
and YEAR(tm.mealDate)=@year
--and tm.mealDate BETWEEN '2024-3-16' AND '2024-3-31'

and tm.officialNo = @officialNo  and tm.officerSailor =@officerSailor and tm.wardroom = @wardroom
and tt.reason = tm.reason and tt.groupMenuCode = tm.groupMenuCode


set @Totalcost = convert (varchar,(@NonVegicost+@Vegicost))  

select @Totalcost as TotalMenucost

---------------Get Total Extra Cost------------

select ROUND(isnull(SUM (convert (float,td.unitPrice)*convert(float,td.saleQty )),0),2) as TotalExtracost

from [T_DailyExtraSales] as td

where  

MONTH(td.saleDate) = @month
--td.saleDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(td.saleDate)=@year
and td.offNo = @officialNo  and td.officerSailor =@officerSailor and td.wardroomCode = @wardroom and td.reasonCode != 30000007 
and td.groupType not in(70000001,70000002,70000003,70000004,70000005,70000006,70000007,70000008,70000009,70000010,70000011,70000012,70000013,70000014,70000015)


----Get Total Plain Tea Count-------
select sum (td.teaCount) plainTeaCount

from [dbo].[T_TeaMark] as td

where  

MONTH(td.teaDate) = @month 
--td.teaDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(td.teaDate)=@year 
and teaType = 'Plain Tea'
and td.officialNo = @officialNo  and td.officerSailor =@officerSailor and td.wardroom = @wardroom 

----Get Total Tea Count-------
select sum (td.teaCount) as teaCount

from [dbo].[T_TeaMark] as td

where  

MONTH(td.teaDate) = @month 
--td.teaDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(td.teaDate)=@year 
and teaType = 'Tea'
and td.officialNo = @officialNo  and td.officerSailor =@officerSailor and td.wardroom = @wardroom 

--Get 206 days by Individual--
select tm.VIC
--,tm.[P/DAY] as PDay
from TempMonthly304Data as tm,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_base] as mb
where mb.baseCode = tm.BASE and tm.OFFNO = @officialNo and tm.[OS] = @officerSailor 
and tm.MONTH = @month and tm.YEAR=@year 

--Get Party Cost--
select ROUND(isnull(sum (td.perHeadCost),0),2) as perHeadCost

from [dbo].[T_PartyCostByIndividual] as td

where 

MONTH(td.partyDate) = @month 
--td.partyDate BETWEEN '2024-3-16' AND '2024-3-31'
and YEAR(td.partyDate)=@year 
and td.offNo = @officialNo  and td.OS =@officerSailor and td.wardroom = @wardroom 

SELECT ISNULL(SUM(total),0) as total                       
                           FROM [10.10.1.232].[WMS].[dbo].[DailySale]
						      WHERE offIdNumber = @officialNo AND YEAR(date) = @year AND MONTH(date) = @month

                        
SELECT ISNULL(SUM(Ammount),0) as Amount                      
                           FROM [10.10.1.232].[WMS].[dbo].[CashSale]
                              WHERE OffNumber = @officialNo AND YEAR(date) = @year AND MONTH(date) = @month

END

--execute [VICTULING_GetTotalIndividualMealCost] '3153','O','2024','2','60000001'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetTotalIndividualMealCostMobile]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) KAUK Hettiarachchi,NRT 3701
-- Description: Search Individual Meal Dates
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetTotalIndividualMealCostMobile] 
@officialNo int,
@officerSailor varchar(1),
----@serviceType varchar(10),
@year varchar(50),
@month varchar(50) = null,
@wardroom varchar(50)

as
BEGIN

---------------Get Total Menu Cost------------	

declare @NonVegicost  float 
declare @Vegicost float 
declare @Totalcost float 

declare @StartMonth varchar (50)
declare @StartDate varchar(50)
declare @EndMonth VARCHAR(50)
declare @EndDate varchar(50)

IF @month=3
BEGIN
    SELECT @month
    select @NonVegicost = ROUND(isnull(SUM(convert(float,tt.costPerPerson*tm.mealCount)),0),2)
    from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt
    where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
    tt.vegi = 'Non-Vegetarian' and tm.noneVegetarian = 'true' 
    --and  MONTH(tm.mealDate) = @month 
    --and YEAR(tm.mealDate)=@year
    and tm.mealDate BETWEEN '2021-3-01' AND '2021-3-15'

    and tm.officialNo = @officialNo  and tm.officerSailor =@officerSailor and tm.wardroom = @wardroom
    and tt.reason = tm.reason and tt.groupMenuCode = tm.groupMenuCode

    select @Vegicost = ROUND(isnull(SUM(convert(float,tt.costPerPerson*tm.mealCount)),0),2)
    from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt
    where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
    tt.vegi = 'Vegetarian' and tm.vegetarian = 'true' 
    --and  MONTH(tm.mealDate) = @month 
    --and YEAR(tm.mealDate)=@year
    and tm.mealDate BETWEEN '2021-3-01' AND '2021-3-15'

    and tm.officialNo = @officialNo  and tm.officerSailor =@officerSailor and tm.wardroom = @wardroom
    and tt.reason = tm.reason and tt.groupMenuCode = tm.groupMenuCode


    set @Totalcost = convert (varchar,(@NonVegicost+@Vegicost))  

    select @Totalcost as TotalMenucost

    ---------------Get Total Extra Cost------------

    select ROUND(isnull(SUM (convert (float,td.unitPrice)*convert(float,td.saleQty )),0),2) as TotalExtracost

    from [T_DailyExtraSales] as td

    where  

    --MONTH(td.saleDate) = @month
    td.saleDate BETWEEN '2021-3-01' AND '2021-3-15' 
    --and YEAR(td.saleDate)=@year
    and td.offNo = @officialNo  and td.officerSailor =@officerSailor and td.wardroomCode = @wardroom and td.reasonCode != 30000007 
    and td.groupType not in(70000001,70000002,70000003,70000004,70000005,70000006,70000007,70000008,70000009,70000010,70000011,70000012,70000013,70000014,70000015)


    ----Get Total Plain Tea Count-------
    select sum (td.teaCount) plainTeaCount

    from [dbo].[T_TeaMark] as td

    where  

    --MONTH(td.teaDate) = @month 
    td.teaDate BETWEEN '2021-3-01' AND '2021-3-15' 
    --and YEAR(td.teaDate)=@year 
    and teaType = 'Plain Tea'
    and td.officialNo = @officialNo  and td.officerSailor =@officerSailor and td.wardroom = @wardroom 

    ----Get Total Tea Count-------
    select sum (td.teaCount) as teaCount

    from [dbo].[T_TeaMark] as td

    where  

    --MONTH(td.teaDate) = @month 
    td.teaDate BETWEEN '2021-3-16' AND '2021-3-31' 
    --and YEAR(td.teaDate)=@year 
    and teaType = 'Tea'
    and td.officialNo = @officialNo  and td.officerSailor =@officerSailor and td.wardroom = @wardroom 

    --Get 206 days by Individual--
    select tm.VIC
    --,tm.[P/DAY] as PDay
    from TempMonthly304Data as tm,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_base] as mb
    where mb.baseCode = tm.BASE and tm.OFFNO = @officialNo and tm.[OS] = @officerSailor 
    and tm.MONTH = @month and tm.YEAR=@year 

    --Get Party Cost--
    select ROUND(isnull(sum (td.perHeadCost),0),2) as perHeadCost

    from [dbo].[T_PartyCostByIndividual] as td

    where 

    --MONTH(td.partyDate) = @month 
    td.partyDate BETWEEN '2021-3-01' AND '2021-3-15' 
    --and YEAR(td.partyDate)=@year 
    and td.offNo = @officialNo  and td.OS =@officerSailor and td.wardroom = @wardroom
END
ELSE IF @month =4
BEGIN
    SELECT @month

    select @NonVegicost = ROUND(isnull(SUM(convert(float,tt.costPerPerson*tm.mealCount)),0),2)
    from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt
    where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
    tt.vegi = 'Non-Vegetarian' and tm.noneVegetarian = 'true' 
    --and  MONTH(tm.mealDate) = @month 
    --and YEAR(tm.mealDate)=@year
    and tm.mealDate BETWEEN '2021-3-16' AND '2021-4-30'

    and tm.officialNo = @officialNo  and tm.officerSailor =@officerSailor and tm.wardroom = @wardroom
    and tt.reason = tm.reason and tt.groupMenuCode = tm.groupMenuCode

    select @Vegicost = ROUND(isnull(SUM(convert(float,tt.costPerPerson*tm.mealCount)),0),2)
    from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt
    where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
    tt.vegi = 'Vegetarian' and tm.vegetarian = 'true' 
    --and  MONTH(tm.mealDate) = @month 
    --and YEAR(tm.mealDate)=@year
    and tm.mealDate BETWEEN '2021-3-16' AND '2021-4-30'

    and tm.officialNo = @officialNo  and tm.officerSailor =@officerSailor and tm.wardroom = @wardroom
    and tt.reason = tm.reason and tt.groupMenuCode = tm.groupMenuCode


    set @Totalcost = convert (varchar,(@NonVegicost+@Vegicost))  

    select @Totalcost as TotalMenucost

    ---------------Get Total Extra Cost------------

    select ROUND(isnull(SUM (convert (float,td.unitPrice)*convert(float,td.saleQty )),0),2) as TotalExtracost

    from [T_DailyExtraSales] as td

    where  

    --MONTH(td.saleDate) = @month
    td.saleDate BETWEEN '2021-3-16' AND '2021-4-30'
    --and YEAR(td.saleDate)=@year
    and td.offNo = @officialNo  and td.officerSailor =@officerSailor and td.wardroomCode = @wardroom and td.reasonCode != 30000007 
    and td.groupType not in(70000001,70000002,70000003,70000004,70000005,70000006,70000007,70000008,70000009,70000010,70000011,70000012,70000013,70000014,70000015)


    ----Get Total Plain Tea Count-------
    select sum (td.teaCount) plainTeaCount

    from [dbo].[T_TeaMark] as td

    where  

    --MONTH(td.teaDate) = @month 
    td.teaDate BETWEEN '2021-3-16' AND '2021-4-30'
    --and YEAR(td.teaDate)=@year 
    and teaType = 'Plain Tea'
    and td.officialNo = @officialNo  and td.officerSailor =@officerSailor and td.wardroom = @wardroom 

    ----Get Total Tea Count-------
    select sum (td.teaCount) as teaCount

    from [dbo].[T_TeaMark] as td

    where  

    --MONTH(td.teaDate) = @month 
    td.teaDate BETWEEN '2021-3-16' AND '2021-4-30'
    --and YEAR(td.teaDate)=@year 
    and teaType = 'Tea'
    and td.officialNo = @officialNo  and td.officerSailor =@officerSailor and td.wardroom = @wardroom 

    --Get 206 days by Individual--
    select tm.VIC
    --,tm.[P/DAY] as PDay
    from TempMonthly304Data as tm,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_base] as mb
    where mb.baseCode = tm.BASE and tm.OFFNO = @officialNo and tm.[OS] = @officerSailor 
    and tm.MONTH = @month and tm.YEAR=@year 

    --Get Party Cost--
    select ROUND(isnull(sum (td.perHeadCost),0),2) as perHeadCost

    from [dbo].[T_PartyCostByIndividual] as td

    where 

    --MONTH(td.partyDate) = @month 
    td.partyDate BETWEEN '2021-3-16' AND '2021-4-30'
    --and YEAR(td.partyDate)=@year 
    and td.offNo = @officialNo  and td.OS =@officerSailor and td.wardroom = @wardroom
END
ELSE
BEGIN
    select @NonVegicost = ROUND(isnull(SUM(convert(float,tt.costPerPerson*tm.mealCount)),0),2)
    from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt
    where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
    tt.vegi = 'Non-Vegetarian' and tm.noneVegetarian = 'true' 
    and  MONTH(tm.mealDate) = @month 
    and YEAR(tm.mealDate)=@year
    --and tm.mealDate BETWEEN '2021-3-16' AND '2021-3-31'

    and tm.officialNo = @officialNo  and tm.officerSailor =@officerSailor and tm.wardroom = @wardroom
    and tt.reason = tm.reason and tt.groupMenuCode = tm.groupMenuCode

    select @Vegicost = ROUND(isnull(SUM(convert(float,tt.costPerPerson*tm.mealCount)),0),2)
    from [T_MealAttendance] as tm,[T_TotalMenuCost] as tt
    where tm.mealDate = tt.[date] and tm.wardroom = tt.wardroom  and tm.mealIn = 'true' and 
    tt.vegi = 'Vegetarian' and tm.vegetarian = 'true' 
    and  MONTH(tm.mealDate) = @month 
    and YEAR(tm.mealDate)=@year
    --and tm.mealDate BETWEEN '2021-3-16' AND '2021-3-31'

    and tm.officialNo = @officialNo  and tm.officerSailor =@officerSailor and tm.wardroom = @wardroom
    and tt.reason = tm.reason and tt.groupMenuCode = tm.groupMenuCode


    set @Totalcost = convert (varchar,(@NonVegicost+@Vegicost))  

    select @Totalcost as TotalMenucost

    ---------------Get Total Extra Cost------------

    select ROUND(isnull(SUM (convert (float,td.unitPrice)*convert(float,td.saleQty )),0),2) as TotalExtracost

    from [T_DailyExtraSales] as td

    where  

    MONTH(td.saleDate) = @month
    --td.saleDate BETWEEN '2021-3-16' AND '2021-3-31' 
    and YEAR(td.saleDate)=@year
    and td.offNo = @officialNo  and td.officerSailor =@officerSailor and td.wardroomCode = @wardroom and td.reasonCode != 30000007 
    and td.groupType not in(70000001,70000002,70000003,70000004,70000005,70000006,70000007,70000008,70000009,70000010,70000011,70000012,70000013,70000014,70000015)


    ----Get Total Plain Tea Count-------
    select sum (td.teaCount) plainTeaCount

    from [dbo].[T_TeaMark] as td

    where  

    MONTH(td.teaDate) = @month 
    --td.teaDate BETWEEN '2021-3-16' AND '2021-3-31' 
    and YEAR(td.teaDate)=@year 
    and teaType = 'Plain Tea'
    and td.officialNo = @officialNo  and td.officerSailor =@officerSailor and td.wardroom = @wardroom 

    ----Get Total Tea Count-------
    select sum (td.teaCount) as teaCount

    from [dbo].[T_TeaMark] as td

    where  

    MONTH(td.teaDate) = @month 
    --td.teaDate BETWEEN '2021-3-16' AND '2021-3-31' 
    and YEAR(td.teaDate)=@year 
    and teaType = 'Tea'
    and td.officialNo = @officialNo  and td.officerSailor =@officerSailor and td.wardroom = @wardroom 

    --Get 206 days by Individual--
    select tm.VIC
    --,tm.[P/DAY] as PDay
    from TempMonthly304Data as tm,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_base] as mb
    where mb.baseCode = tm.BASE and tm.OFFNO = @officialNo and tm.[OS] = @officerSailor 
    and tm.MONTH = @month and tm.YEAR=@year 

    --Get Party Cost--
    select ROUND(isnull(sum (td.perHeadCost),0),2) as perHeadCost

    from [dbo].[T_PartyCostByIndividual] as td

    where 

    MONTH(td.partyDate) = @month 
    --td.partyDate BETWEEN '2021-3-16' AND '2021-3-31' 
    and YEAR(td.partyDate)=@year 
    and td.offNo = @officialNo  and td.OS =@officerSailor and td.wardroom = @wardroom 
END
END

-- Execute [VICTULING_GetTotalIndividualMealCostMobile] '3701','O','2021','4','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getTotalIngredientsListForBite]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCDR WHK Gunasoma ,NRT 3147
-- Description: get total Ingredients for party
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getTotalIngredientsListForBite] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
--@noOfPerson varchar(50),
@vegiNonVegi varchar(50),
@groupMenuCode varchar(50)


--used for cuztomized menu sale --
as
BEGIN	

CREATE TABLE #temp(
	[mainItem] varchar(250) ,
	[item] varchar(150) ,
	[qty] decimal(18, 5) ,
	[itemMessurment] varchar(20) ,
	[Issueqty] decimal(18, 5), 
	[itemCode] varchar(50), 
	[remarks] varchar(250) 
)

INSERT INTO #temp
           ([mainItem]
           ,[item]
           ,[qty]
           ,[itemMessurment]
           ,[Issueqty]
		   ,[itemCode]
		   ,[remarks])

select mm.mainItem,mi.item,mn.qty,mes.itemMessurment,(convert(float,mn.qty) * convert(float, tm.remarks)) as Issueqty,mi.itemCode,tm.remarks
from [dbo].[T_DailyMenu] as tm,[dbo].[M_MainItem] as mm ,[dbo].[M_Item] as mi,[dbo].[M_Ingredients] as mn,[M_ItemByMessurment] as mes, [dbo].[M_GroupMenu] as mg
where mm.mainItemCode = tm.mainItemCode and mi.itemCode = mn. ingredientsCode and tm.mainItemCode = mn.mainItemCode and mes.itemMessurmentCode = mn.messurment 
and tm.date = @date and tm.reasonCode = @reasonCode and tm.wardroomCode = @wardroomCode and tm.vegiNonVegi = @vegiNonVegi and tm.groupMenuCode = @groupMenuCode
and tm.groupMenuCode = mg.[GroupMenuCode] and tm.isActive = 1
-- and tm.isAuthorized = 1

 
order by mm.mainItem,mi.item ASC

select item, (sum(Issueqty)) as qty,itemMessurment as itemMessurment,itemCode from #temp
--select item, (sum(Issueqty)) as qty,itemMessurment as itemMessurment,itemCode from #temp
group by item,itemMessurment,itemCode

drop table #temp

END


                                                                              
--execute [VICTULING_getTotalIngredientsListForParty] '2019-09-02','30000004','60000001','Non-Vegetarian','70000017'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getTotalIngredientsListForBiteOrder]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCDR WHK Gunasoma ,NRT 3147
-- Description: get total Ingredients for party
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getTotalIngredientsListForBiteOrder] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
--@noOfPerson varchar(50),
@vegiNonVegi varchar(50),
@groupMenuCode varchar(50)


--used for cuztomized menu sale --
as
BEGIN	

CREATE TABLE #temp(
	[mainItem] varchar(250) ,
	[item] varchar(150) ,
	[qty] decimal(18, 5) ,
	[itemMessurment] varchar(20) ,
	[Issueqty] decimal(18, 5), 
	[itemCode] varchar(50), 
	[remarks] varchar(250) 
)

INSERT INTO #temp
           ([mainItem]
           ,[item]
           ,[qty]
           ,[itemMessurment]
           ,[Issueqty]
		   ,[itemCode]
		   ,[remarks])

select mm.mainItem,mi.item,mn.qty,mes.itemMessurment,(convert(float,mn.qty) * convert(float, tm.remarks)) as Issueqty,mi.itemCode,tm.remarks
from [dbo].[T_DailyMenu] as tm,[dbo].[M_MainItem] as mm ,[dbo].[M_Item] as mi,[dbo].[M_Ingredients] as mn,[M_ItemByMessurment] as mes, [dbo].[M_GroupMenu] as mg
where mm.mainItemCode = tm.mainItemCode and mi.itemCode = mn. ingredientsCode and tm.mainItemCode = mn.mainItemCode and mes.itemMessurmentCode = mn.messurment 
and tm.date = @date and tm.reasonCode = @reasonCode and tm.wardroomCode = @wardroomCode and tm.vegiNonVegi = @vegiNonVegi and tm.groupMenuCode = @groupMenuCode
and tm.groupMenuCode = mg.[GroupMenuCode] and tm.isActive = 1
-- and tm.isAuthorized = 1

 
order by mm.mainItem,mi.item ASC

select item, (sum(Issueqty)) as qty,itemMessurment as itemMessurment,itemCode from #temp
--select item, (sum(Issueqty)) as qty,itemMessurment as itemMessurment,itemCode from #temp
group by item,itemMessurment,itemCode

drop table #temp

END


                                                                              
--execute [VICTULING_getTotalIngredientsListForParty] '8/5/2020','30000023','60000001','Non-Vegetarian','70000026'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_getTotalIngredientsListForParty]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCDR WHK Gunasoma ,NRT 3147
-- Description: get total Ingredients for party
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_getTotalIngredientsListForParty] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
--@noOfPerson varchar(50),
@vegiNonVegi varchar(50),
@groupMenuCode varchar(50)


--used for cuztomized menu sale --
as
BEGIN	

CREATE TABLE #temp(
	[mainItem] varchar(250) ,
	[item] varchar(150) ,
	[qty] decimal(18, 5) ,
	[itemMessurment] varchar(20) ,
	[Issueqty] decimal(18, 5), 
	[itemCode] varchar(50), 
	[remarks] varchar(250) 
)

INSERT INTO #temp
           ([mainItem]
           ,[item]
           ,[qty]
           ,[itemMessurment]
           ,[Issueqty]
		   ,[itemCode]
		   ,[remarks])

select mm.mainItem,mi.item,mn.qty,mes.itemMessurment,(convert(float,mn.qty) * convert(float, tm.remarks)) as Issueqty,mi.itemCode,tm.remarks
from [dbo].[T_DailyMenu] as tm,[dbo].[M_MainItem] as mm ,[dbo].[M_Item] as mi,[dbo].[M_Ingredients] as mn,[M_ItemByMessurment] as mes, [dbo].[M_GroupMenu] as mg
where mm.mainItemCode = tm.mainItemCode and mi.itemCode = mn. ingredientsCode and tm.mainItemCode = mn.mainItemCode and mes.itemMessurmentCode = mn.messurment 
and tm.date = @date and tm.reasonCode = @reasonCode and tm.wardroomCode = @wardroomCode and tm.vegiNonVegi = @vegiNonVegi and tm.groupMenuCode = @groupMenuCode
and tm.groupMenuCode = mg.[GroupMenuCode] and tm.isActive = 1 and tm.isAuthorized = 1

 
order by mm.mainItem,mi.item ASC

select item, (sum(Issueqty)) as qty,itemMessurment as itemMessurment,itemCode from #temp
--select item, (sum(Issueqty)) as qty,itemMessurment as itemMessurment,itemCode from #temp
group by item,itemMessurment,itemCode

drop table #temp

END


                                                                              
--execute [VICTULING_getTotalIngredientsListForParty] '2019-09-02','30000004','60000001','Non-Vegetarian','70000017'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetTotalMenuCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Menu total Cost
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetTotalMenuCost] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@vegi varchar(50)


as
BEGIN	

select SUM(convert(float,td.price)) as totalCost
from [dbo].[T_DailyMenuSales ] as td
where  td.[date] = @date and td.reasonCode = @reasonCode  and td.wordRoomCode = @wardroomCode and td.vegi = @vegi 



END

--execute [VICTULING_GetTotalMenuCost] '2017-10-16','Breakfast','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetTotalMenuCost_Group]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Menu total Cost
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetTotalMenuCost_Group] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@vegi varchar(50),
@groupMenue varchar(50)


as
BEGIN	

select SUM(convert(float,td.totalCost)) as totalCost
from [dbo].[T_DailyExtraSales] as td
where  td.[saleDate] = @date and td.reasonCode = @reasonCode  and td.wardroomCode = @wardroomCode and td.vegNonVeg = @vegi and td.groupType =@groupMenue

--------------


END

--execute [VICTULING_GetTotalMenuCost_Group] '2020-06-01','30000001','60000001','Non-Vegetarian','70000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetTotalMenuCost_Party]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Menu total Cost
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetTotalMenuCost_Party] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@vegi varchar(50),
@menuType varchar(50)


as
BEGIN	

select SUM(convert(float,td.price)) as totalCost
from [dbo].[T_DailyMenuSales ] as td
where  td.[date] = @date and td.reasonCode = @reasonCode  and td.wordRoomCode = @wardroomCode and td.vegi = @vegi and td.menuType =@menuType



END

--execute [VICTULING_GetTotalMenuCost_Party] '2020-09-08', '30000004','60000001','Non-Vegetarian','70000017'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_GetWardroom]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Wardroom
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_GetWardroom] 

as
BEGIN	

SELECT a.wardroomCode,a.wardroomName
FROM [dbo].[M_Wardroom] as a
order by wardroomName ASC


END

--execute [HRIS_appointment_appointmentCode] 'dn'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_IndividulCostDetails]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_IndividulCostDetails] 
@officialNo int,
@officerSailor varchar(1),
@serviceType varchar(10)

as
BEGIN	

select tm.mealDate,tm.reason,tt.costPerPerson
from [dbo].[T_MealAttendance] as tm,[dbo].[T_TotalMenuCost] as tt
where mealIn ='true' and tm.mealDate = tt.date and tm.reason = tt.reason and tm.wardroom = tt.wardroom  
and tm.officialNo =@officialNo and tm.serviceType = @serviceType and tm.officerSailor = @officerSailor and tm.vegetarian = 'true' and tt.vegi = 'Vegetarian'

end

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Insert_T_BiteMenue]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to insert bite Menu Details
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Insert_T_BiteMenue] 
	
@date datetime,
@wardroom varchar(50),
@reason varchar(50),
@vegNonVeg varchar(50),
@groupType varchar(50),
@mealItem varchar(50),
@remark varchar(50),
@offNo varchar(50),
@createdDate datetime,
@createdUser varchar(250),
@isActive bit,
@remarksNew nvarchar(4000)

AS

BEGIN
	



	INSERT INTO [dbo].[T_BiteMenue]
           (
		   date ,
			wardroom ,
			reason ,
			vegNonVeg ,
			groupType ,
			mealItem ,
			remark ,
			offNo ,
			createdDate ,
			createdUser ,
			isActive,
			remarksNew
			)
VALUES
			(
			@date ,
			@wardroom ,
			@reason ,
			@vegNonVeg ,
			@groupType ,
			@mealItem ,
			@remark ,
			@offNo ,
			@createdDate ,
			@createdUser ,
			@isActive,
			@remarksNew
			
			)
	  
END


--execute [VICTULING_Update_T_DailyMenu] '9/1/2017','50000004','30000001','60000001','Mini Burger one','kal','2017-09-11 16:38:45.000'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_insert_T_DailyExtraGroupSales]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to Insrt T_DailyExtraSales
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_insert_T_DailyExtraGroupSales] 
@saleDate date,
@itemCode varchar(50),
@itemId varchar(50),
@saleQty varchar(50),
@unitPrice varchar(50),
@TotalCost varchar(50),
@recevedFrom varchar(50),
@reasonCode varchar(70),
@groupMenuCode varchar(50),
@offNo int,
@officerSailor varchar(1),
@serviceType varchar(50),
@currentBase varchar(50),
@permantBase varchar(50),
@wardroomCode varchar(50),
@createdUser varchar(70),
@createdDate datetime
                                                              
AS
--IF NOT EXISTS(SELECT signalDate,signalReference,teamType,nicNo_SSID,officialNo FROM [dbo].[HRIS_T_sportsPersonalData] WHERE nicNo_SSID =@nicNo_SSID and officialNo =@Official_No and officerSailor =@officerSailor and signalDate =@signalDate and signalReference =@signalDate and teamType =@sportsTeamCode)

BEGIN
--declare  @nic varchar(20)
--select  @nic = nicNo_SSID from [HRISLIVE].[dbo].[HRIS_T_personalData] where officialNo = @offNo and officerSailor = @officerSailor and serviceType = @serviceType


	INSERT INTO [dbo].[T_DailyExtraSales] 
           (saleDate,
			itemCode,
			itemId,			
			saleQty,
			unitPrice,
			TotalCost,
			recevedFrom,
			reasonCode,
			groupType, 
			offNo,
			officerSailor,
			serviceType,
			currentBase,
			permantBase,
			wardroomCode,
			createdUser,
			createdDate 
			)
VALUES
			(@saleDate,
			@itemCode,
			@itemId,			
			@saleQty,
			@unitPrice,
			@TotalCost,
			@recevedFrom,
			@reasonCode,
			@groupMenuCode, 
			@offNo,
			@officerSailor,
			@serviceType,
			@currentBase,
			@permantBase,
			@wardroomCode,
			@createdUser,
			@createdDate 
			
			)



END




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_insert_T_DailyExtraSales]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to Insrt T_DailyExtraSales
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_insert_T_DailyExtraSales] 
@saleDate date,
@itemCode varchar(50),
@itemId varchar(50),
@saleQty varchar(50),
@unitPrice varchar(50),
@TotalCost varchar(50),
@recevedFrom varchar(50),
@reasonCode varchar(70),
@groupMenuCode varchar(50),
@offNo int,
@officerSailor varchar(1),
@serviceType varchar(50),
@currentBase varchar(50),
@permantBase varchar(50),
@wardroomCode varchar(50),
@createdUser varchar(70),
@createdDate datetime,

@takenBy varchar(250),
@offNoSailor varchar(50),
@serviceTypeSailor varchar(50),
@osSailor varchar(50),
@rankRate varchar(150),
@vegNonVeg varchar(50)

                                                              
AS
--IF NOT EXISTS(SELECT signalDate,signalReference,teamType,nicNo_SSID,officialNo FROM [dbo].[HRIS_T_sportsPersonalData] WHERE nicNo_SSID =@nicNo_SSID and officialNo =@Official_No and officerSailor =@officerSailor and signalDate =@signalDate and signalReference =@signalDate and teamType =@sportsTeamCode)

BEGIN
--declare  @nic varchar(20)
--select  @nic = nicNo_SSID from [HRISLIVE].[dbo].[HRIS_T_personalData] where officialNo = @offNo and officerSailor = @officerSailor and serviceType = @serviceType


	INSERT INTO [dbo].[T_DailyExtraSales] 
           (saleDate,
			itemCode,
			itemId,			
			saleQty,
			unitPrice,
			TotalCost,
			recevedFrom,
			reasonCode,
			groupType, 
			offNo,
			officerSailor,
			serviceType,
			currentBase,
			permantBase,
			wardroomCode,
			createdUser,
			createdDate,

			takenBy ,
			offNoSailor ,
			serviceTypeSailor ,
			osSailor ,
			rankRate,
			vegNonVeg 

			)
VALUES
			(@saleDate,
			@itemCode,
			@itemId,			
			@saleQty,
			@unitPrice,
			@TotalCost,
			@recevedFrom,
			@reasonCode,
			@groupMenuCode, 
			@offNo,
			@officerSailor,
			@serviceType,
			@currentBase,
			@permantBase,
			@wardroomCode,
			@createdUser,
			@createdDate,

			@takenBy ,
			@offNoSailor ,
			@serviceTypeSailor ,
			@osSailor ,
			@rankRate,
			@vegNonVeg 
			
			)



END




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_insert_T_DailyExtraSales_Individual]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to Insrt T_DailyExtraSales
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_insert_T_DailyExtraSales_Individual] 
@saleDate date,
@itemCode varchar(50),
@itemId varchar(50),
@saleQty varchar(50),
@unitPrice varchar(50),
@TotalCost varchar(50),
@recevedFrom varchar(50),
@reasonCode varchar(70),
@groupMenuCode varchar(50),
@offNo int,
@officerSailor varchar(1),
@serviceType varchar(50),
@currentBase varchar(50),
@permantBase varchar(50),
@wardroomCode varchar(50),
@createdUser varchar(70),
@createdDate datetime,

@takenBy varchar(250),
@offNoSailor varchar(50),
@serviceTypeSailor varchar(50),
@osSailor varchar(50),
@rankRate varchar(150),
@NewBillID varchar(200)

                                                              
AS
--IF NOT EXISTS(SELECT signalDate,signalReference,teamType,nicNo_SSID,officialNo FROM [dbo].[HRIS_T_sportsPersonalData] WHERE nicNo_SSID =@nicNo_SSID and officialNo =@Official_No and officerSailor =@officerSailor and signalDate =@signalDate and signalReference =@signalDate and teamType =@sportsTeamCode)

BEGIN
--declare  @nic varchar(20)
--select  @nic = nicNo_SSID from [HRISLIVE].[dbo].[HRIS_T_personalData] where officialNo = @offNo and officerSailor = @officerSailor and serviceType = @serviceType


	INSERT INTO [dbo].[T_DailyExtraSales] 
           (saleDate,
			itemCode,
			itemId,			
			saleQty,
			unitPrice,
			TotalCost,
			recevedFrom,
			reasonCode,
			groupType, 
			offNo,
			officerSailor,
			serviceType,
			currentBase,
			permantBase,
			wardroomCode,
			createdUser,
			createdDate,

			takenBy ,
			offNoSailor ,
			serviceTypeSailor ,
			osSailor ,
			rankRate,
			NewBillID 

			)
VALUES
			(@saleDate,
			@itemCode,
			@itemId,			
			@saleQty,
			@unitPrice,
			@TotalCost,
			@recevedFrom,
			@reasonCode,
			@groupMenuCode, 
			@offNo,
			@officerSailor,
			@serviceType,
			@currentBase,
			@permantBase,
			@wardroomCode,
			@createdUser,
			@createdDate,

			@takenBy ,
			@offNoSailor ,
			@serviceTypeSailor ,
			@osSailor ,
			@rankRate ,
			@NewBillID 
			
			)



END




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_insert_T_DailyMenuSales]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to Insrt T_DailyMenuSales
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_insert_T_DailyMenuSales] 
@date date,
@itemCode varchar(50),
@saleQty varchar(50),
@unitPrice varchar(50),
@price varchar(50),
@recevedFrom varchar(50),
@reasonCode varchar(50),
@wordRoomCode varchar(50),
@vegi varchar(50),
@createdUser varchar(70),
@createdDate datetime
                                                              
AS
IF NOT EXISTS(SELECT date,wordRoomCode,reasonCode,vegi,itemCode FROM [dbo].[T_DailyMenuSales] WHERE date =@date and wordRoomCode =@wordRoomCode and reasonCode =@reasonCode and  vegi =@vegi and itemCode = @itemCode)

BEGIN


	INSERT INTO [dbo].[T_DailyMenuSales] 
           ([date] ,
			itemCode,
			saleQty,
			unitPrice,
			price,
			recevedFrom,
			reasonCode,
			wordRoomCode,
			vegi,
			createdUser,
			createdDate
			)
VALUES
			(	@date,
				@itemCode,
				@saleQty,
				@unitPrice,
				@price,
				@recevedFrom,
				@reasonCode,
				@wordRoomCode,
				@vegi,
				@createdUser,
				@createdDate
			
			)



END






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_insert_T_DailyMenuSales_Extra]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to Insrt T_DailyMenuSales
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_insert_T_DailyMenuSales_Extra] 
@date date,
@itemCode varchar(50),
@saleQty varchar(50),
@unitPrice varchar(50),
@price varchar(50),
@recevedFrom varchar(50),
@reasonCode varchar(50),
@wordRoomCode varchar(50),
@vegi varchar(50),
@createdUser varchar(70),
@createdDate datetime,
@menuType varchar(50)
                                                              
AS
--IF NOT EXISTS(SELECT date,wordRoomCode,reasonCode,vegi,itemCode FROM [dbo].[T_DailyMenuSales] WHERE date =@date and wordRoomCode =@wordRoomCode and reasonCode =@reasonCode and  vegi =@vegi and itemCode = @itemCode)

BEGIN


	INSERT INTO [dbo].[T_DailyMenuSales] 
           ([date] ,
			itemCode,
			saleQty,
			unitPrice,
			price,
			recevedFrom,
			reasonCode,
			wordRoomCode,
			vegi,
			createdUser,
			createdDate,
			menuType
			)
VALUES
			(	@date,
				@itemCode,
				@saleQty,
				@unitPrice,
				@price,
				@recevedFrom,
				@reasonCode,
				@wordRoomCode,
				@vegi,
				@createdUser,
				@createdDate,
				@menuType
			
			)



END






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_insert_T_DailyMenuSales_Party]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to Insrt T_DailyMenuSales
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_insert_T_DailyMenuSales_Party] 
@date date,
@itemCode varchar(50),
@saleQty varchar(50),
@unitPrice varchar(50),
@price varchar(50),
@recevedFrom varchar(50),
@reasonCode varchar(50),
@wordRoomCode varchar(50),
@vegi varchar(50),
@createdUser varchar(70),
@createdDate datetime,
@partyName varchar(500),
@menuType varchar(50)
                                                              
AS
IF NOT EXISTS(SELECT date,saleQty,unitPrice,price,recevedFrom,wordRoomCode,reasonCode,itemCode,vegi,partyName,menuType FROM [dbo].[T_DailyMenuSales] WHERE date =@date and saleQty =@saleQty and unitPrice = @unitPrice and price = @price and recevedFrom = @recevedFrom and wordRoomCode = @wordRoomCode and reasonCode = @reasonCode and itemCode = @itemCode and vegi = @vegi and partyName = @partyName and menuType = @menuType  )

BEGIN


	INSERT INTO [dbo].[T_DailyMenuSales] 
           ([date] ,
			itemCode,
			saleQty,
			unitPrice,
			price,
			recevedFrom,
			reasonCode,
			wordRoomCode,
			vegi,
			createdUser,
			createdDate,
			partyName,
			menuType
			)
VALUES
			(	@date,
				@itemCode,
				@saleQty,
				@unitPrice,
				@price,
				@recevedFrom,
				@reasonCode,
				@wordRoomCode,
				@vegi,
				@createdUser,
				@createdDate,
				@partyName,
				@menuType  
			
			)



END






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_insert_T_DepreciationItems]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to Insrt T_DepreciationItems
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_insert_T_DepreciationItems] 
@depreciationDate date,
@itemCode varchar(50),
@depreciationQty varchar(50),
@unitPrice varchar(50),
@price varchar(50),
@recevedFrom varchar(50),
@reasonCode varchar(50),
@wordRoomCode varchar(50),
@createdUser varchar(70),
@createdDate datetime,
@remarks varchar(500),
@billNo int
                                                              
AS
--IF NOT EXISTS(SELECT signalDate,signalReference,teamType,nicNo_SSID,officialNo FROM [dbo].[HRIS_T_sportsPersonalData] WHERE nicNo_SSID =@nicNo_SSID and officialNo =@Official_No and officerSailor =@officerSailor and signalDate =@signalDate and signalReference =@signalDate and teamType =@sportsTeamCode)

BEGIN


	INSERT INTO [dbo].[T_DepreciationItems] 
           (depreciationDate ,
			itemCode,
			depreciationQty,
			unitPrice,
			price,
			recevedFrom,
			reasonCode,
			wordRoomCode,
			createdUser,
			createdDate,
			remarks,
			billNo
			)
VALUES
			(	@depreciationDate,
				@itemCode,
				@depreciationQty,
				@unitPrice,
				@price,
				@recevedFrom,
				@reasonCode,
				@wordRoomCode,
				@createdUser,
				@createdDate ,
				@remarks,
				@billNo
			
			)



END




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Insert_T_DiscountPrice]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to save Civil personal details
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Insert_T_DiscountPrice]  

@billNo varchar(500),
@recevedFrom varchar(500),
@onChargeDate date,
@discountPrice float,
@createdUser varchar(50),
@createdDate date

                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_BillDiscount]
            (   
				billNo ,
				recevedFrom ,
				onChargeDate ,
				discountPrice ,
				createdUser ,
				createdDate 

           )
VALUES
		(	
			@billNo ,
			@recevedFrom ,
			@onChargeDate ,
			@discountPrice ,
			@createdUser ,
			@createdDate 
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_insert_T_FinalRecovery_Dining_Wine]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lcdr(IT) WHK Gunasoma,NRT 3147
-- Description: Use to Insrt FinalRecovery
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_insert_T_FinalRecovery_Dining_Wine] 
@branchID varchar(50),
@officialNo int,
@rankRate varchar(50),
@name varchar(200),
@individualTotalCost decimal(18,5),
@creditDebit decimal(18,5),
@barBill decimal(18,5),
@TotRecovery decimal(18,5),
@isAuthorized bit,
@wardroom varchar(50),
@year int,
@month int,
@priority int,
@noOfDays int,
@Messsub decimal(18, 2),

@createdUser varchar(70),
@createdDate datetime

                                                              
AS
--IF NOT EXISTS(SELECT signalDate,signalReference,teamType,nicNo_SSID,officialNo FROM [dbo].[HRIS_T_sportsPersonalData] WHERE nicNo_SSID =@nicNo_SSID and officialNo =@Official_No and officerSailor =@officerSailor and signalDate =@signalDate and signalReference =@signalDate and teamType =@sportsTeamCode)

BEGIN
--declare  @nic varchar(20)
--select  @nic = nicNo_SSID from [HRISLIVE].[dbo].[HRIS_T_personalData] where officialNo = @offNo and officerSailor = @officerSailor and serviceType = @serviceType

--delete from [T_FinalRecovery_Dining_Wine]

	INSERT INTO [dbo].[T_FinalRecovery_Dining_Wine]
           ([branchID]
           ,[officialNo]
           ,[rankRate]
           ,[name]
           ,[individualTotalCost]
           ,[creditDebit]
           ,[barBill]
           ,[TotRecovery]
           ,[isAuthorized]
		   ,[wardroom]
		   ,[year]
		   ,[month]
		   ,[priority]
		   ,[noOfDays]
		   ,[Messsub]
           ,[createdUser]
           ,[createdDate])
     VALUES
           (@branchID
           ,@officialNo
           ,@rankRate
           ,@name
           ,@individualTotalCost
           ,@creditDebit
           ,@barBill
           ,@TotRecovery
		   ,@isAuthorized
		   ,@wardroom
		   ,@year
		   ,@month
		   ,@priority
		   ,@noOfDays
		   ,@Messsub
           ,@createdUser
           ,@createdDate)
			
			



END




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_insert_T_FinalRecovery_Pay]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lcdr(IT) WHK Gunasoma,NRT 3147
-- Description: Use to Insrt FinalRecovery
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_insert_T_FinalRecovery_Pay] 
@SysCode varchar(50),
@CatCode varchar(50),
@OfficialNo int,
@Amount decimal(18, 3),

@createdUser varchar(250),
@createdDate datetime

                                                              
AS
--IF NOT EXISTS(SELECT signalDate,signalReference,teamType,nicNo_SSID,officialNo FROM [dbo].[HRIS_T_sportsPersonalData] WHERE nicNo_SSID =@nicNo_SSID and officialNo =@Official_No and officerSailor =@officerSailor and signalDate =@signalDate and signalReference =@signalDate and teamType =@sportsTeamCode)

BEGIN
--declare  @nic varchar(20)
--select  @nic = nicNo_SSID from [HRISLIVE].[dbo].[HRIS_T_personalData] where officialNo = @offNo and officerSailor = @officerSailor and serviceType = @serviceType

delete from [T_FinalRecovery]

	INSERT INTO [dbo].[T_FinalRecovery]
           (SysCode ,
			CatCode ,
			OfficialNo ,
			Amount ,

			createdUser ,
			createdDate )


     VALUES
           (@SysCode ,
			@CatCode ,
			@OfficialNo ,
			@Amount ,

			@createdUser ,
			@createdDate)
					
END




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_insert_T_PartyCostByIndividual]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to Insrt T_PartyCostByIndividual
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_insert_T_PartyCostByIndividual] 
@partyDate date,
@wardroom varchar(50),
@reason varchar(50),
@groupType varchar(50),
@veg varchar(50),
@totalMenuCost decimal(18,2),
@noOfPerson int,
@perHeadCost decimal(18, 2),
@offNo int,
@OS varchar(50),
@partyName varchar(100),
@createdUser varchar(70),
@createdDate datetime



                                                              
AS
--IF NOT EXISTS(SELECT signalDate,signalReference,teamType,nicNo_SSID,officialNo FROM [dbo].[HRIS_T_sportsPersonalData] WHERE nicNo_SSID =@nicNo_SSID and officialNo =@Official_No and officerSailor =@officerSailor and signalDate =@signalDate and signalReference =@signalDate and teamType =@sportsTeamCode)

BEGIN


	INSERT INTO [dbo].[T_PartyCostByIndividual]
           (partyDate,
			wardroom,
			reason,
			groupType,
			veg,
			totalMenuCost,
			noOfPerson,
			perHeadCost,
			offNo,
			OS,
			partyName,
			createdUser,
			createdDate 

			)
VALUES
			(	@partyDate ,
				@wardroom ,
				@reason ,
				@groupType ,
				@veg ,
				@totalMenuCost ,
				@noOfPerson ,
				@perHeadCost ,
				@offNo ,
				@OS ,
				@partyName,
				@createdUser ,
				@createdDate 
			
			)



END

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_insert_T_PendingRecovery]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to Insrt T_DailyExtraSales
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_insert_T_PendingRecovery] 
@offno int,
@serviceType varchar(50),
@prndingDinning varchar(50),
@pendingWine varchar(50),
@pendingYear int,
@pendingMonth varchar(50),
@recoverDiningAmmount varchar(50),
@recoverWineAmmount varchar(50),
@recoverYear int,
@recoverMonth varchar(50),
@wardroom varchar(50),
@createdUser varchar(500),
@createdDate datetime

                                                              
AS
--IF NOT EXISTS(SELECT signalDate,signalReference,teamType,nicNo_SSID,officialNo FROM [dbo].[HRIS_T_sportsPersonalData] WHERE nicNo_SSID =@nicNo_SSID and officialNo =@Official_No and officerSailor =@officerSailor and signalDate =@signalDate and signalReference =@signalDate and teamType =@sportsTeamCode)

BEGIN
--declare  @nic varchar(20)
--select  @nic = nicNo_SSID from [HRISLIVE].[dbo].[HRIS_T_personalData] where officialNo = @offNo and officerSailor = @officerSailor and serviceType = @serviceType


	INSERT INTO [dbo].[T_PendingRecovery] 
           (offno ,
			serviceType ,
			prndingDinning ,
			pendingWine ,
			pendingYear ,
			pendingMonth ,
			recoverDiningAmmount ,
			recoverWineAmmount ,
			recoverYear ,
			recoverMonth ,
			wardroom ,
			createdUser ,
			createdDate 
			)
VALUES
			(
			@offno ,
			@serviceType ,
			@prndingDinning ,
			@pendingWine ,
			@pendingYear ,
			@pendingMonth ,
			@recoverDiningAmmount ,
			@recoverWineAmmount ,
			@recoverYear ,
			@recoverMonth ,
			@wardroom ,
			@createdUser ,
			@createdDate 
			
			)



END




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_insert_T_TotalIndividualCostPerMonth]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lcdr(IT) WHK Gunasoma,NRT 3147
-- Description: Use to Insrt FinalRecovery
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_insert_T_TotalIndividualCostPerMonth] 

@officialNo int,
@serviceType varchar(10),
@OS varchar(1),
@wardroom varchar(50),
@year int,
@month varchar(50),
@totalMenuCost float,
@extraTotalCost float,
@plainTeaCost float,
@TeaCost float,
@individualTotalCost float,
@noOfDays int,
@costPerDay float,
@creditDebit float,

@createdUser varchar(70),
@createdDate datetime,
@noOfSeaDays int,
@costPerSeaDay float


                                                              
AS
--IF NOT EXISTS(SELECT signalDate,signalReference,teamType,nicNo_SSID,officialNo FROM [dbo].[HRIS_T_sportsPersonalData] WHERE nicNo_SSID =@nicNo_SSID and officialNo =@Official_No and officerSailor =@officerSailor and signalDate =@signalDate and signalReference =@signalDate and teamType =@sportsTeamCode)

BEGIN
--declare  @nic varchar(20)
--select  @nic = nicNo_SSID from [HRISLIVE].[dbo].[HRIS_T_personalData] where officialNo = @offNo and officerSailor = @officerSailor and serviceType = @serviceType

--delete from [T_FinalRecovery_Dining_Wine]

	INSERT INTO [dbo].[T_TotalIndividualCostPerMonth]
           (officialNo ,
			serviceType ,
			OS ,
			wardroom ,
			year ,
			month ,
			totalMenuCost ,
			extraTotalCost ,
			plainTeaCost ,
			TeaCost ,
			individualTotalCost ,
			noOfDays ,
			costPerDay ,
			creditDebit ,

			createdUser ,
			createdDate,
			noOfSeaDays,
			costPerSeaDay
			)
     VALUES
           (@officialNo ,
			@serviceType ,
			@OS ,
			@wardroom ,
			@year ,
			@month ,
			@totalMenuCost ,
			@extraTotalCost ,
			@plainTeaCost ,
			@TeaCost ,
			@individualTotalCost ,
			@noOfDays ,
			@costPerDay ,
			@creditDebit ,

			@createdUser ,
			@createdDate,
			@noOfSeaDays,
			@costPerSeaDay )
			
			



END




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_insert_T_TotalMenuCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to Insrt Total Menu Cost
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_insert_T_TotalMenuCost] 
@date date,
@reason varchar(50),
@groupMenuCode varchar(50),
@totalCost float,
@wardroom varchar(50),
@vegi varchar(50),
@createdUser varchar(70),
@createdDate datetime

                                                              
AS
--IF NOT EXISTS(SELECT [date],reason,totalCost,wardroom,vegi FROM [T_TotalMenuCost] 
--WHERE [date] =@date and reason =@reason and wardroom =@wardroom and vegi =@vegi and  groupMenuCode =@groupMenuCode)

BEGIN


	INSERT INTO [dbo].[T_TotalMenuCost]

           (
		    [date] ,
			reason,
			totalCost,
			wardroom,
			vegi,
			groupMenuCode,
			createdUser,
			createdDate
			)
VALUES
			(	
			    @date,
				@reason,
				@totalCost,
				@wardroom,
				@vegi,
				@groupMenuCode,
				@createdUser,
				@createdDate		
			)


END




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Insert304List]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr WHK Gunasoma
-- Create date: 06/27/2019
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Insert304List]
	   
	   @SN int
      ,@OS varchar(50)
      ,@ST varchar(50)
      ,@NAME varchar(100)
      ,@INITIAL varchar(50)
      ,@OFFNO int
      ,@RANK varchar(50)
      ,@SM varchar(50)
      ,@INDATE varchar(50)
      ,@OUTDATE varchar(50)
      ,@INFORM varchar(50)
      ,@OUTTO varchar(50)
      ,@SC varchar(50)
      ,@SA varchar(50)
      ,@RA int
      ,@TA int
      ,@VIC int
      ,@baseCode varchar(50)
      ,@year int
      ,@month int
	  ,@createdUser varchar(100)
	  ,@createdDate datetime
	                
AS
BEGIN



	INSERT INTO [dbo].[TempMonthly304Data]
    ( 
	   SN 
      ,OS
      ,ST
      ,NAME 
      ,INITIAL 
      ,OFFNO 
      ,RANK 
      ,SM 
      ,INDATE
      ,OUTDATE
      ,INFORM
      ,OUTTO 
      ,SC 
      ,SA 
      ,RA 
      ,TA 
      ,VIC 
      ,BASE 
      ,YEAR
      ,MONTH 
	  ,createdUser 
	  ,createdDate 

          )

     VALUES
           (  
	  @SN
      ,@OS
      ,@ST 
      ,@NAME
      ,@INITIAL
      ,@OFFNO
      ,@RANK
      ,@SM
      ,@INDATE
      ,@OUTDATE 
      ,@INFORM
      ,@OUTTO 
      ,@SC 
      ,@SA 
      ,@RA 
      ,@TA 
      ,@VIC 
      ,@baseCode
      ,@year
      ,@month
	  ,@createdUser 
	  ,@createdDate 
                          
		   )
END


--execute [HRIS_InsertNextAdvancementStatus] '123123','5/10/2019 5/10/2019 12:00:00 AM','3147','NRT','pass','0','DGT','5/10/2019 12:00:00 AM'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_InsertDailyItemSummary]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr WHK Gunasoma
-- Create date: 2020-01-16
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_InsertDailyItemSummary]
	   
	         @ItemCode int
			,@Item varchar(100)
			,@SaleQty decimal(18, 3)
			,@Messurment varchar(100)
			,@reason varchar(100)
			,@groupMenue varchar(100)
			,@saleDate date
			,@wardroomCode varchar(50)
			,@createdUser varchar(100)
			,@craetdDate datetime
			--,@serialNo int
	                
AS
BEGIN



	INSERT INTO [dbo].[T_DailySaleSummary]
           ( 
		     ItemCode 
			,Item 
			,SaleQty 
			,Messurment 
			,reason 
			,groupMenue 
			,saleDate 
			,wardroomCode 
			,createdUser 
			,craetdDate 
			--,serialNo

          )

     VALUES
           (  
		     @ItemCode 
			,@Item 
			,@SaleQty 
			,@Messurment 
			,@reason 
			,@groupMenue
			,@saleDate 
			,@wardroomCode 
			,@createdUser 
			,@craetdDate 
			--,@serialNo
                          
		   )
END


--execute [HRIS_InsertNextAdvancementStatus] '123123','5/10/2019 5/10/2019 12:00:00 AM','3147','NRT','pass','0','DGT','5/10/2019 12:00:00 AM'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_InsertDailyItemSummary_price]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr WHK Gunasoma
-- Create date: 2020-01-16
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_InsertDailyItemSummary_price]
	   
	         @ItemCode int
			,@Item varchar(100)
			,@SaleQty decimal(18, 3)
			,@Messurment varchar(100)
			,@unitPrice decimal(18, 3)
			,@price decimal(18, 3)
			,@reason varchar(100)
			,@groupMenue varchar(100)
			,@saleDate date
			,@wardroomCode varchar(50)
			,@createdUser varchar(100)
			,@craetdDate datetime
			--,@serialNo int
	                
AS
BEGIN



	INSERT INTO [dbo].[T_DailySaleSummary_withPrice]
           ( 
		     ItemCode 
			,Item 
			,SaleQty 
			,Messurment 
			,unitPrice
			,price
			,reason 
			,groupMenue 
			,saleDate 
			,wardroomCode 
			,createdUser 
			,craetdDate 
			--,serialNo

          )

     VALUES
           (  
		     @ItemCode 
			,@Item 
			,@SaleQty 
			,@Messurment 
			,@unitPrice
			,@price
			,@reason 
			,@groupMenue
			,@saleDate 
			,@wardroomCode 
			,@createdUser 
			,@craetdDate 
			--,@serialNo
                          
		   )
END


--execute [HRIS_InsertNextAdvancementStatus] '123123','5/10/2019 5/10/2019 12:00:00 AM','3147','NRT','pass','0','DGT','5/10/2019 12:00:00 AM'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_InsertDailyItemSummary_temp]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr WHK Gunasoma
-- Create date: 2020-01-16
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_InsertDailyItemSummary_temp]
	   
	         @ItemCode int
			,@Item varchar(100)
			,@SaleQty decimal(18, 3)
			,@Messurment varchar(100)
			,@reason varchar(100)
			,@groupMenue varchar(100)
			,@saleDate date
			,@wardroomCode varchar(50)
			,@createdUser varchar(100)
			,@craetdDate datetime
			--,@serialNo int
	                
AS
BEGIN

CREATE TABLE #tempSummarySale(
			ItemCode int
			,Item varchar(100)
			,SaleQty decimal(18, 3)
			,Messurment varchar(100)
			,reason varchar(100)
			,groupMenue varchar(100)
			,saleDate date
			,wardroomCode varchar(50)
			,createdUser varchar(100)
			,craetdDate datetime
)

	INSERT INTO #tempSummarySale
           ( 
		     ItemCode 
			,Item 
			,SaleQty 
			,Messurment 
			,reason 
			,groupMenue 
			,saleDate 
			,wardroomCode 
			,createdUser 
			,craetdDate 
			--,serialNo

          )

     VALUES
           (  
		     @ItemCode 
			,@Item 
			,@SaleQty 
			,@Messurment 
			,@reason 
			,@groupMenue
			,@saleDate 
			,@wardroomCode 
			,@createdUser 
			,@craetdDate 
			--,@serialNo
                          
		   )



select td.itemCode,td.item,(sum(convert(float,td.saleQty))) as saleQty ,td.Messurment
from #tempSummarySale as td
where td.saleDate =@saleDate and td.wardroomCode = @wardroomCode
group by td.itemCode,td.item,td.Messurment
order by td.item ASC

END


--execute [HRIS_InsertNextAdvancementStatus] '123123','5/10/2019 5/10/2019 12:00:00 AM','3147','NRT','pass','0','DGT','5/10/2019 12:00:00 AM'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_InsertDailyItemSummaryMenue]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr WHK Gunasoma
-- Create date: 06/27/2019
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_InsertDailyItemSummaryMenue]
	   
	         @ItemCode int
			,@Item varchar(100)
			,@SaleQty decimal(18, 3)
			,@Messurment varchar(100)
			,@reason varchar(100)
			,@groupMenue varchar(100)
			,@createdUser varchar(100)
			,@craetdDate datetime
	                
AS
BEGIN

delete from T_DailySaleSummary

	INSERT INTO [dbo].[T_DailySaleSummary]
           ( 
		     ItemCode 
			,Item 
			,SaleQty 
			,Messurment 
			,reason 
			,groupMenue 
			,createdUser 
			,craetdDate 

          )

     VALUES
           (  
		     @ItemCode 
			,@Item 
			,@SaleQty 
			,@Messurment 
			,@reason 
			,@groupMenue 
			,@createdUser 
			,@craetdDate 
                          
		   )
END


--execute [HRIS_InsertNextAdvancementStatus] '123123','5/10/2019 5/10/2019 12:00:00 AM','3147','NRT','pass','0','DGT','5/10/2019 12:00:00 AM'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_InsertMonthlyBarBill]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr WHK Gunasoma
-- Create date: 06/27/2019
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_InsertMonthlyBarBill]
	   
	         @offno int
			,@rank varchar(50)
			,@initial varchar(50)
			,@name varchar(100)
			,@barBill decimal(18, 2)
			,@baseCode int
			,@year int
			,@month int
			--,@insert bit
			,@createdUser varchar(100)
			,@createdDate datetime
	                
AS
BEGIN



	INSERT INTO [dbo].[T_MonthlyBarBill]
           ( 
		     offno 
			,rank 
			,initial 
			,name 
			,barBill 
			,baseCode 
			,year 
			,month 
			,createdUser 
			,createdDate 

          )

     VALUES
           (  
		     @offno 
			,@rank 
			,@initial 
			,@name 
			,@barBill 
			,@baseCode 
			,@year 
			,@month 
			,@createdUser 
			,@createdDate  
                          
		   )
END


--execute [HRIS_InsertNextAdvancementStatus] '123123','5/10/2019 5/10/2019 12:00:00 AM','3147','NRT','pass','0','DGT','5/10/2019 12:00:00 AM'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_InsertMonthlyOfficerList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr WHK Gunasoma
-- Create date: 2020-01-16
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_InsertMonthlyOfficerList]
	   
	         @serviceType varchar(50)
			,@branch varchar(50)
			,@offNo varchar(50)
			,@rank varchar(50)
			,@name varchar(500)
			,@wardroom varchar(50)
			,@year int
			,@month int
		
			
	                
AS
BEGIN



	INSERT INTO [dbo].[T_TotalMonthlyAllDetails]
           ( 
		     serviceType 
			,branch 
			,offNo 
			,rank 
			,name 
			,wardroom 
			,year 
			,month 

          )

     VALUES
           (  
		     @serviceType 
			,@branch 
			,@offNo 
			,@rank 
			,@name 
			,@wardroom 
			,@year 
			,@month
                          
		   )
END


--execute [HRIS_InsertNextAdvancementStatus] '123123','5/10/2019 5/10/2019 12:00:00 AM','3147','NRT','pass','0','DGT','5/10/2019 12:00:00 AM'




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_INSERTMONTHLYTEACOST]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Search Monthly  Individual Tea 
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_INSERTMONTHLYTEACOST] 
    @Year INT
    ,@Month INT
    ,@PlainTeaCost varchar(50)
    ,@TeaCost varchar(50)

as
BEGIN

    INSERT INTO [dbo].[T_MonthlyTeaCost] ([Year],[month],[teaCost],[plainTeaCost]) VALUES(@Year,@Month,@TeaCost,@PlainTeaCost)

END

--execute [VICTULING_INSERTMONTHLYTEACOST] '3147','O','RNF','2017','9','60000001'
--execute [VICTULING_INSERTMONTHLYTEACOST] '3147','O','RNF','2020-03-15','2020-03-1','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_MealBook]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get All Meal Attendance List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_MealBook] 


@month int,
@wardroomCode varchar(50),
@offNo int

as
BEGIN	

select  CONVERT (varchar(4),DATEPART(Year, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.mealDate)) AS mealDate
,mi.reason,tm.mealIn,tm.mealCount,tm.vegetarian,tm.noneVegetarian,mg.GroupMenu ,'' as selectedMeal,'' as remarks,tm.createdUser
,CONVERT (varchar(4),DATEPART(Year, tm.createdDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.createdDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.createdDate)) AS createdDate
 
from [dbo].[T_MealAttendance] as tm,[dbo].[M_ItemReason] as mi,M_GroupMenu as mg
where  MONTH(mealDate) = @month and  wardroom = @wardroomCode and officialNo = @offNo and mi.reasonCode= tm.reason 
and mg.GroupMenuCode = tm.groupMenuCode



union

select  CONVERT (varchar(4),DATEPART(Year, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.mealDate)) AS mealDate
,tm.reason,tm.mealIn,tm.mealCount,tm.vegetarian,tm.noneVegetarian,'',tm.selectedMeal,tm.remarks,tm.createdUser
,CONVERT (varchar(4),DATEPART(Year, tm.createdDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.createdDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.createdDate)) AS createdDate 
from [dbo].[T_customizeMealAttendance] as tm
where  MONTH(mealDate) = @month and  wardroom = @wardroomCode and officialNo = @offNo  
order by mealDate ASC


END

--execute [VICTULING_MealBook] '12','60000001','3147'

--(select  CONVERT (varchar(4),DATEPART(Year, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.mealDate)) AS mealDate
--,mi.reason,tm.mealIn,tm.mealCount,tm.vegetarian,tm.noneVegetarian,mg.GroupMenu as 'Menu Type','' as 'Selected Meals','' as 'Customized  Meals',tm.createdUser,tm.createdDate 
--from [dbo].[T_MealAttendance] as tm,[dbo].[M_ItemReason] as mi,M_GroupMenu as mg
--where  MONTH(mealDate) = @month and  wardroom = @wardroomCode and officialNo = @offNo and mi.reasonCode= tm.reason 
--and mg.GroupMenuCode = tm.groupMenuCode)
--union
--(select  CONVERT (varchar(4),DATEPART(Year, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tm.mealDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tm.mealDate)) AS mealDate
--,tm.reason,tm.mealIn,tm.mealCount,tm.vegetarian,tm.noneVegetarian,'' as 'Menu Type',tm.selectedMeal as 'Selected Meals',tm.remarks as 'Customized  Meals',tm.createdUser,tm.createdDate 
--from [dbo].[T_customizeMealAttendance] as tm
--where  MONTH(mealDate) = @month and  wardroom = @wardroomCode and officialNo = @offNo  )

--order by tm.mealDate ASC




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_officialNo]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma
-- Description: Use to find maximun official No 
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_officialNo] 
		
AS
BEGIN
	
SELECT  max(officialNo)
  FROM [dbo].[T_CivilPersonalDetails]
	
	
END 





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_PrepareCashBook]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) KMUL BANDARA , NRT 3352
-- Description: Search Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_PrepareCashBook] 

@dateSelected date


as
BEGIN

--select CB.[BalanceBF], SUM(convert(float,unitPrice) * CONVERT(float,onChargeQty)) as Purchasing,(convert(float, CB.BalanceBF) - (sum((convert(float, ST.unitPrice) * convert(float,ST.onChargeQty))))) as BalanceCF
--from [dbo].[T_CashBook] as CB
--inner join [dbo].[T_Stock] as ST on CB.date =  ST.onChargeDate 
--inner join [dbo].[T_BankDeposit] as BD on CB.date =  BD.depositDate  
--where CB.date = @dateSelected group by CB.BalanceBF,CB.BalanceCF


select CB.date,CB.[BalanceBF], SUM(convert(float,unitPrice) * CONVERT(float,onChargeQty)) as Purchasing,(convert(float, CB.BalanceBF) - (sum((convert(float, ST.unitPrice) * convert(float,ST.onChargeQty))))) as BalanceCF
from [dbo].[T_CashBook] as CB
inner join [dbo].[T_Stock] as ST on CB.date =  ST.onChargeDate 
inner join [dbo].[T_BankDeposit] as BD on CB.date =  BD.depositDate  
where CB.date = @dateSelected group by CB.date,CB.BalanceBF,CB.BalanceCF





END

BEGIN

select  slipNumber,depositValue  from [dbo].[T_BankDeposit] where depositDate = '2018-08-01'
--select  SUM(depositValue) as BankDeposit from [dbo].[T_BankDeposit] where depositDate = @dateSelected

END

BEGIN

--select distinct billNo,SUM(convert(float, unitPrice) * convert(float, onChargeQty)) as Total_Bill 
--from [dbo].[T_Stock] where onChargeDate = @dateSelected group by billNo

select distinct ST.billNo,(SUM(convert(float, ST.unitPrice) * convert(float, ST.onChargeQty)) - convert(float,BD.discountPrice)) as Total_Bill 
from [dbo].[T_Stock] as ST 
inner join [dbo].[T_BillDiscount] as BD on ST.billNo = BD.billNo
where ST.onChargeDate = @dateSelected group by ST.billNo,BD.discountPrice

END


--execute [VICTULING_PrepareCashBook] '2018-08-01'

--select * from [T_Stock] where onChargeDate = '2018-08-01'

--select  slipNumber,depositValue as BankDeposit from [dbo].[T_BankDeposit] where depositDate = '2018-08-01'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_PrepareCashBookBankDeposit]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) KMUL BANDARA , NRT 3352
-- Description: Search Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_PrepareCashBookBankDeposit] 

@dateSelected date


as
BEGIN


select depositDate, slipNumber,depositValue  from [dbo].[T_BankDeposit] where depositDate = @dateSelected
--select  SUM(depositValue) as BankDeposit from [dbo].[T_BankDeposit] where depositDate = @dateSelected

END


--execute [VICTULING_PrepareCashBook] '2018-08-01'

--select * from [T_Stock] where onChargeDate = '2018-08-01'

--select  slipNumber,depositValue as BankDeposit from [dbo].[T_BankDeposit] where depositDate = '2018-08-01'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_PrintIndividualSaleItem]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Get Individual Item List for On Date
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_PrintIndividualSaleItem] 
@wardroomName varchar(150),
@onChargeDate date,
@offNo int,
@serviceType varchar(50),
@NewBillID varchar(200)

as
BEGIN	

--select itemCode = ISNULL(mi.itemCode, 'Total'),
select itemCode = ISNULL(mi.itemCode, ''),
itemId = ISNULL(ts.itemId, ''),
item = ISNULL(mi.item, ''),
unitPrice = ISNULL(ts.unitPrice, ''), 
--saleQty = ISNULL((sum(convert(float,ts.saleQty))) , ''),
saleQty = ISNULL(convert(float,ts.saleQty) , ''),
--price = sum(ts.unitPrice * convert(float,ts.saleQty)),
price = (ts.unitPrice * convert(float,ts.saleQty)),
itemMessurment = ISNULL(mm.itemMessurment, ''), 
recevedFrom = ISNULL(ts.recevedFrom, ''),
transID = ISNULL(ts.transID,''),
offNo = ISNULL(ts.offNo,''),
serviceType = ISNULL(ts.serviceType,''),
reason = ISNULL(mir.reason,''),
GroupMenu = ISNULL(mg.GroupMenu,''),
--rankRate = ISNULL(ts.rankRate,''),
takenBy = ISNULL(ts.takenBy,''),
--rankRate = ISNULL(ts.rankRate,''),
offNoSailor = ISNULL(ts.offNoSailor,''),
wardroomName = ISNULL(mw.wardroomName,''),
saleDate  = ISNULL(ts.saleDate,''),
wardroomCode = ISNULL(ts.wardroomCode,''),
branchID = ISNULL(mb.branchID,''),
rankRate = ISNULL(mr.rankRate,'') ,
initials = ISNULL(tp.initials,''),
surename = ISNULL(tp.surename,'')


from [dbo].[T_DailyExtraSales] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw,[dbo].[M_ItemReason] as mir,[dbo].[M_GroupMenu] as mg
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr
where mi.itemCode = ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and mw.wardroomCode = ts.wardroomCode 
and ts.reasonCode='30000005' and mir.reasonCode = ts.reasonCode and mg.GroupMenuCode= ts.groupType
and ts.groupType = '70000023' and ts.saleQty !='0.000' and ts.offNo = @offNo 
and ts.offNo = tp.officialNo and tp.officerSailor = 'O' and mb.branchCode = tp.branchCode
and mr.rankRateCode = tp.rankRateCode and tp.isActive = 'true' and ts.NewBillID = @NewBillID and
mw.wardroomCode = @wardroomName and ts.saleDate = @onChargeDate

--GROUP BY GROUPING SETS ((mi.itemCode,mi.item,ts.unitPrice,ts.saleQty,mm.itemMessurment,ts.recevedFrom,ts.transID,ts.offNo,ts.serviceType,mir.reason,mg.GroupMenu,ts.itemId,ts.rankRate,ts.takenBy,ts.rankRate,ts.offNoSailor,mw.wardroomName,ts.saleDate,ts.wardroomCode), ())
order by mi.item ASC 



END

--execute [VICTULING_PrintIndividualSaleItem] '60000001','2020-10-21',367,'RNF','NHQ10/21/2020 12:00:00 AM41'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_309PriceList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to 309 Price List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_309PriceList]  
@itemCode varchar(50),
@unitPrice varchar(50),
@denomination varchar(50),
@itemMessurmentCode varchar(50),
@onChargeDate date,
@year int,
@recevedFrom varchar(50),
@wordRoomCode varchar(50),
@createdUser varchar(70),
@createdDate datetime,
@isActive bit
                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_309AnnualPriceList]
            (   itemCode,
				unitPrice,
				denomination,
				itemMessurmentCode,
				onChargeDate,
				year,
				recevedFrom,
				wordRoomCode,
				createdUser,
				createdDate,
				isActive 

           )
VALUES
		(	@itemCode,
			@unitPrice,
			@denomination,
			@itemMessurmentCode,
			@onChargeDate,
			@year,
			@recevedFrom,
			@wordRoomCode,
			@createdUser,
			@createdDate,
			@isActive 

			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_BankDeposit]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) KMUL BANDARA , NRT 3352
-- Description: Search Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_BankDeposit] 

	@depositType varchar(250),
	@slipNumber varchar(250),
	@depositValue float,
	@depositDate date,
	@createdUser varchar(250),
	@createdDate date

as
BEGIN
insert into T_BankDeposit 
values
	( @depositType ,@slipNumber ,@depositValue ,@depositDate ,	@createdUser,	@createdDate  )

END


--execute [VICTULING_PreapareCashBook] '2018-08-01'

--select * from [T_Stock] where onChargeDate = '2018-08-01'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_BiteMenuItems]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma NRT3147
-- Description: Insert bite menu items
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_BiteMenuItems] 
@date datetime, 
@reasonCode varchar(50),
@groupMenuCode varchar(50),
@mealCategory varchar(50),
@mainItemCode varchar(500),
@wardroomCode varchar(50), 
@vegiNonVegi varchar(50), 
@createdUser varchar(70),
@createdDate datetime,
@isAuthorized bit,
@remarks varchar(500),
@isActive bit

                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_DailyMenu]
            (   date ,
				reasonCode ,
				groupMenuCode,
				mealCategory,
				mainItemCode ,		
				wardroomCode,
				vegiNonVegi, 		
				createdUser ,
				createdDate,
				isAuthorized,
				remarks,			
			    isActive
			

           )
VALUES
		(  @date ,@reasonCode ,@groupMenuCode,@mealCategory,@mainItemCode,@wardroomCode ,@vegiNonVegi,@createdUser ,@createdDate,@isAuthorized ,@remarks
		,@isActive
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_CivilPersonalDetails]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to save Civil personal details
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_CivilPersonalDetails]  

@initial varchar(50),
@surname varchar(250),
@rank varchar(50),
@serviceType varchar(50),
@permentBase varchar(200),
@temporaryBase varchar(200),
@createdUser varchar(70),
@createdDate datetime
                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_CivilPersonalDetails]
            (   
				initial ,
				surname ,
				rank ,
				serviceType ,
				permentBase ,
				temporaryBase ,
				createdUser ,
				createdDate 

           )
VALUES
		(	
			@initial,
			@surname,
			@rank,
			@serviceType,
			@permentBase,
			@temporaryBase,
			@createdUser,
			@createdDate 
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_DailyCustomizedMenuItems]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) KMUL Bandara NRT3352
-- Description: Insert daily menu items
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_DailyCustomizedMenuItems] 
@date datetime, 
@reasonCode varchar(50),
@groupMenuCode varchar(50),
@mealCategory varchar(50),
@mainItemCode varchar(500),
@wardroomCode varchar(50), 
@vegiNonVegi varchar(50), 
@createdUser varchar(70),
@createdDate datetime,
@isAuthorized bit,
@isActive bit

                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_DailyMenu]
            (   date ,
				reasonCode ,
				groupMenuCode,
				mealCategory,
				mainItemCode ,		
				wardroomCode,
				vegiNonVegi, 		
				createdUser ,
				createdDate,
				isAuthorized,			
			    isActive
			

           )
VALUES
		(  @date ,@reasonCode ,@groupMenuCode,@mealCategory,@mainItemCode,@wardroomCode ,@vegiNonVegi,@createdUser ,@createdDate,@isAuthorized ,@isActive
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_DailyGroupMenuItems]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) KMUL Bandara NRT3352
-- Description: Insert daily menu items
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_DailyGroupMenuItems] 
@date datetime, 
@reasonCode varchar(50),
@groupMenuCode varchar(50),
@mealCategory varchar(50),
@mainItemCode varchar(500),
@wardroomCode varchar(50), 
@vegiNonVegi varchar(50), 
@createdUser varchar(70),
@createdDate datetime,
@isAuthorized bit,
@isActive bit

                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_DailyMenu]
            (   date ,
				reasonCode ,
				groupMenuCode,
				mealCategory,
				mainItemCode ,		
				wardroomCode,
				vegiNonVegi, 		
				createdUser ,
				createdDate,
				isAuthorized,
				isActive
			

           )
VALUES
		(  @date ,@reasonCode ,@groupMenuCode,@mealCategory,@mainItemCode,@wardroomCode ,@vegiNonVegi,@createdUser ,@createdDate,@isAuthorized ,@isActive
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_DailyMenuItemList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) KMUL Bandara NRT3352
-- Description: Insert daily menu item List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_DailyMenuItemList] 
@date datetime,
@reasonCode varchar(50),
@wardroom varchar(50),
@itemCode varchar(50),
@vegi varchar(50),
@isActive bit,
@createdUser varchar(70),
@createdDate datetime
                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_MenuListItem]
            (   date,
				reasonCode,
				wardroom,
				itemCode ,
				vegi,	
				isActive,	
				createdUser ,
				createdDate 

           )
VALUES
		(  @date,
			@reasonCode ,
			@wardroom ,
			@itemCode ,
			@vegi,
			@isActive,
			@createdUser ,
			@createdDate 
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_DailyMenuItems]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) KMUL Bandara NRT3352
-- Description: Insert daily menu items
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_DailyMenuItems] 
@date datetime, 
@reasonCode varchar(50),
@groupMenuCode varchar(50),
@mealCategory varchar(50),
@mainItemCode varchar(500),
@wardroomCode varchar(50), 
@vegiNonVegi varchar(50), 
@createdUser varchar(70),
@createdDate datetime,
@isAuthorized bit
--,
--@isActive bit

                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_DailyMenu]
            (   date ,
				reasonCode ,
				groupMenuCode,
				mealCategory,
				mainItemCode ,		
				wardroomCode,
				vegiNonVegi, 		
				createdUser ,
				createdDate,
				isAuthorized
				--,			
			    --isActive
			

           )
VALUES
		(  @date ,@reasonCode ,@groupMenuCode,@mealCategory,@mainItemCode,@wardroomCode ,@vegiNonVegi,@createdUser ,@createdDate,@isAuthorized 
		--,@isActive
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_DailyPartyItems]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) KMUL Bandara NRT3352
-- Description: Insert daily party items
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_DailyPartyItems] 
@date datetime, 
@reasonCode varchar(50),
@groupMenuCode varchar(50),
@mealCategory varchar(50),
@mainItemCode varchar(500),
@wardroomCode varchar(50), 
@vegiNonVegi varchar(50), 
@createdUser varchar(70),
@createdDate datetime,
@isAuthorized bit,
@isActive bit

                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_DailyMenu]
            (   date ,
				reasonCode ,
				groupMenuCode,
				mealCategory,
				mainItemCode ,		
				wardroomCode,
				vegiNonVegi, 		
				createdUser ,
				createdDate,
				isAuthorized,
				isActive
			

           )
VALUES
		(  @date ,@reasonCode ,@groupMenuCode,@mealCategory,@mainItemCode,@wardroomCode ,@vegiNonVegi,@createdUser ,@createdDate,@isAuthorized ,@isActive
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_GroupMenuAttendance]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma NRT3147
-- Description: Insert Group menu items
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_GroupMenuAttendance] 
@date datetime, 
@mealCategory varchar(50),
@mainItemCode varchar(50),
@reasonCode varchar(500),
@wardroomCode varchar(50), 
@createdUser varchar(70),
@createdDate datetime,
@isActive bit
                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_GroupMenuAttendance]
            (   date ,
				mealCategory ,
				mainItemCode,
				reasonCode ,		
				wardroomCode,	
				createdUser ,
				createdDate,
				isActive

           )
VALUES
		(  @date ,@mealCategory ,@mainItemCode,@reasonCode,@wardroomCode  ,@createdUser,@createdDate,@isActive
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_GroupMenuItemList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma 
-- Description: Insert group menu item List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_GroupMenuItemList] 
@date datetime,
@reasonCode varchar(50),
@groupTypeCode varchar(50),
@wardroom varchar(50),
@itemCode varchar(50),
--@currentStock varchar(50),
@isActive bit,
@createdUser varchar(70),
@createdDate datetime
                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_GroupMenuListItem]
            (   
				   [date]
				  ,[reasonCode]
				  ,[groupTypeCode]
				  ,[wardroomCode]
				  ,[itemCode]	
				  --,[currentStock]	
				  ,[isActive]
				  ,[createdUser]
				  ,[createdDate]

           )
VALUES
		(   @date,
			@reasonCode ,
			@groupTypeCode,
			@wardroom ,
			@itemCode ,
			--@currentStock,
			@isActive,
			@createdUser ,
			@createdDate 
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_individualTotalCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to save individual total cost
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_individualTotalCost]  
@officialNo int,
@serviceType varchar(10),
@OS varchar(1),
@wardroom varchar(50),
@year int,
@month varchar(50),
@totalMenuCost float,
@extraTotalCost float,
@plainTeaCost float,
@TeaCost float,
@individualTotalCost float,
@noOfDays int,
@costPerDay float,
@creditDebit float,
@createdUser varchar(70),
@createdDate datetime
                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_TotalIndividualCostPerMonth]
            (   officialNo,
				serviceType,
				OS,
				wardroom,
				[year],
				[month],
				totalMenuCost ,
				extraTotalCost ,
				plainTeaCost ,
				TeaCost ,
				individualTotalCost ,
				noOfDays ,
				costPerDay ,
				creditDebit ,
				createdUser ,
				createdDate 

           )
VALUES
		(  @officialNo ,
			@serviceType ,
			@OS ,
			@wardroom ,
			@year ,
			@month ,
			@totalMenuCost ,
			@extraTotalCost ,
			@plainTeaCost ,
			@TeaCost ,
			@individualTotalCost ,
			@noOfDays ,
			@costPerDay ,
			@creditDebit ,
			@createdUser,
			@createdDate 
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_IngredientsList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma 
-- Description: Insert Ingredients List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_IngredientsList] 
@mainItemCode varchar(50),
@ingredientsCode varchar(50),
@qty varchar(50),
@messurment varchar(50),
@wardroom varchar(50),
@createdUser varchar(50),
@createdDate datetime 
                                                              
AS

BEGIN



	INSERT INTO [dbo].[M_Ingredients]
            (   
				    mainItemCode ,
					ingredientsCode ,
					qty ,
					messurment ,
					wardroom,
					createdUser ,
					createdDate  

           )
VALUES
		(  @mainItemCode ,
			@ingredientsCode ,
			@qty ,
			@messurment ,
			@wardroom,
			@createdUser ,
			@createdDate  
			 

		)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_Item]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to create new aitem
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_Item]  
@itemCode varchar(50),
@item varchar(250),
@itemCatagoryCode varchar(50),
@itemMessurmentCode varchar(50),
@m_item varchar(250),
@isIngredients bit,
--@handsStock varchar(50),
--@mainItemCode varchar(50),
--@wordRoomCode varchar(50),
@createdUser varchar(70),
@createdDate datetime
                                                              
AS

BEGIN



	INSERT INTO [dbo].[M_Item]
            (   itemCode ,
				item ,
				itemCatagoryCode ,
				itemMessurmentCode ,
				m_item,
				isIngredients,
				--handsStock ,
				--mainItemCode ,
				--wordRoomCode ,
				createdUser ,
				createdDate 

           )
VALUES
		(  @itemCode ,
		@item ,
		@itemCatagoryCode ,
		@itemMessurmentCode ,
		@m_item,
		@isIngredients,
		--@handsStock ,
		--@mainItemCode ,
		--@wordRoomCode ,
		@createdUser ,
		@createdDate 
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_MealItemsSaleBySA]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma 
-- Description: Insert Ingredients List
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_MealItemsSaleBySA] 
@date date,
@wardroom varchar(70),
@reason varchar(70),
@menuType varchar(70),
@vegNveg varchar(70),
@itemCode int,
@item varchar(500),
@qty decimal(18, 5),
@itemMessurment varchar(50),
@createdUser varchar(70),
@createdDate datetime 
                                                              
AS

BEGIN

IF NOT EXISTS (SELECT date,wardroom,reason,menuType,itemCode,qty FROM T_MealItemsSaleBySA WHERE date = @date and wardroom = @wardroom and reason = @reason and menuType = @menuType and itemCode=@itemCode and qty=@qty and vegNveg=@vegNveg)
BEGIN

	INSERT INTO [dbo].[T_MealItemsSaleBySA]
            (   
					date ,
					wardroom ,
					reason ,
					menuType ,
					vegNveg,
				    itemCode ,
					item ,
					qty ,
					itemMessurment ,
					createdUser ,
					createdDate  

           )
VALUES
		(   
			@date ,
			@wardroom ,
			@reason ,
			@menuType,
			@vegNveg,
			@itemCode ,
			@item ,
			@qty ,
			@itemMessurment ,
			@createdUser ,
			@createdDate  
			 

		)

		end
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_MenuItem]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to create new aitem
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_MenuItem]  
@mainItemCode varchar(50),
@mainItem varchar(100),
@mainItemCategoryCode varchar(50),
@createdUser varchar(70),
@createdDate datetime
                                                              
AS

BEGIN



	INSERT INTO [dbo].[M_MainItem]
            (   mainItemCode ,
				mainItem ,
				mainItemCategoryCode ,
				createdUser ,
				createdDate 

           )
VALUES
		(	@mainItemCode ,
			@mainItem ,
			@mainItemCategoryCode ,
			@createdUser,
			@createdDate 
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_OnChargeItem]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to on charge items
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_OnChargeItem]  
@itemCode varchar(50),
@onChargeDate date,
@recevedFrom varchar(50),
@billNo varchar(50),
@unitPrice varchar(50),
@onChargeQty varchar(50),
@itemMessurmentCode varchar(50),
@CurrentQty varchar(50),
@wordRoomCode varchar(50),
@createdUser varchar(70),
@createdDate datetime,
@isActive bit,
@reason varchar(70),
@ToOffNo int
                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_Stock]
            (   itemCode ,
				onChargeDate ,
				recevedFrom ,
				billNo ,
				unitPrice ,
				onChargeQty ,
				itemMessurmentCode,
				CurrentQty,
				wordRoomCode ,
				createdUser ,
				createdDate ,
				isActive,
				reason,
				ToOffNo

           )
VALUES
		(  @itemCode ,
			@onChargeDate ,
			@recevedFrom ,
			@billNo ,
			@unitPrice ,
			@onChargeQty ,
			@itemMessurmentCode,
			@CurrentQty,
			@wordRoomCode ,
			@createdUser ,
			@createdDate ,
			@isActive,
			@reason,
			@ToOffNo

			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_T_CabinAllocation]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to save Meal Attendance
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_T_CabinAllocation]  
@blockNo varchar(50),
@cabinNo varchar(50),
@cabinTelephoneNo int,
@telephoneNo int,
@officialNo varchar(50),
@serviceType varchar(50),
@branch int,
@name varchar(500),
@livingInOut varchar(50),
@permanentTemporary varchar(50),
@isActive bit,
@remarks varchar(500),
@fromDate date,
@createdUser varchar(50),
@craetdDate datetime
                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_CabinAllocation]
            (  blockNo ,
			cabinNo ,
			cabinTelephoneNo,
			telephoneNo ,
			officialNo ,
			serviceType ,
			branch ,
			name ,
			livingInOut ,
			permanentTemporary ,
			isActive ,
			remarks ,
			fromDate,
			createdUser ,
			craetdDate 

           )
VALUES
		(	@blockNo ,
			@cabinNo ,
			@cabinTelephoneNo,
			@telephoneNo ,
			@officialNo ,
			@serviceType ,
			@branch ,
			@name ,
			@livingInOut ,
			@permanentTemporary ,
			@isActive ,
			@remarks ,
			@fromDate,
			@createdUser ,
			@craetdDate 
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_T_CashBookDetails]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to save Meal Attendance
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_T_CashBookDetails]  
@date date,
@wardroom varchar(50),
@description varchar(300),
@remarks varchar(500),
@creditDebit varchar(50),
@cost decimal(18, 2),

@createdUser varchar(500),
@createdDate datetime,
@specialRemark varchar(3000)
                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_CashBookDetails]
            (	date ,
				wardroom ,
				description ,
				remarks ,
				creditDebit ,
				cost ,

				createdUser ,
				createdDate ,
				specialRemark

           )
VALUES
		(	@date ,
			@wardroom ,
			@description ,
			@remarks ,
			@creditDebit ,
			@cost ,

			@createdUser ,
			@createdDate ,
			@specialRemark
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_T_customizeMealAttendance]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to save Meal Attendance
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_T_customizeMealAttendance]  
@mealDate date,
@officialNo int,
@officerSailor varchar(1),
@serviceType varchar(10),
@reason varchar(50),
@vegetarian bit,
@noneVegetarian bit,
@mealIn bit,
@mealOut bit,
@mealCount int,
@baseCode varchar(50),
@wardroom varchar(50),
@selectedMeal varchar(700),
@remarks varchar(700),
@createdUser varchar(70),
@createdDate datetime
                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_customizeMealAttendance]
            (   mealDate ,
				officialNo ,
				officerSailor ,
				serviceType ,
				reason ,
				vegetarian ,
				noneVegetarian,
				mealIn,
				mealOut ,
				mealCount,
				baseCode ,
				wardroom ,
				selectedMeal,
				remarks,
				createdUser, 
				createdDate

           )
VALUES
		(	@mealDate,
			@officialNo,
			@officerSailor,
			@serviceType,
			@reason,
			@vegetarian,
			@noneVegetarian,
			@mealIn,
			@mealOut,
			@mealCount,
			@baseCode,
			@wardroom,
			@selectedMeal,
			@remarks,
			@createdUser,
			@createdDate 
			 

)

--lakmal bandara 
--insert record to [T_IndividualExtraItemByCa]

--INSERT INTO T_IndividualExtraItemByCA (serviceType,offNo,date,reasonCode,wardroomCode,createdUser,createdDate )
-- VALUES ( @serviceType,@officialNo,@mealDate,@reason,@wardroom,@createdUser,@createdDate  )
END







GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_T_GroupMenuItemByCA]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma NRT 3147
-- Description: Insert Group Menu Item By CA
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_T_GroupMenuItemByCA] 

@date date,
@reasonCode int,
@wardroomCode int,
@itemCode varchar(50),
@isActive bit,
--@qty varchar(50),
--@itemMessurmentCode varchar(50),
@createdUser varchar(70),
@createdDate date
                                                              
AS

BEGIN

	INSERT INTO [dbo].[T_GroupMenuItemByCA]
            (  
				[date] ,
				reasonCode ,
				wardroomCode ,
				itemCode ,
				isActive,
				--qty ,
				--itemMessurmentCode ,
				createdUser ,
				createdDate 

           )
VALUES
		(  
			@date ,
			@reasonCode ,
			@wardroomCode ,
			@itemCode ,
			@isActive,
			--@qty ,
			--@itemMessurmentCode ,
			@createdUser ,
			@createdDate 
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_T_IndividualExtraItemByCA]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) KMUL Bandara NRT3352
-- Description: Insert Individual Extra Item By CA
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_T_IndividualExtraItemByCA] 

@date date,
@reasonCode int,
@wardroomCode int,
@itemCode varchar(50),
--@qty varchar(50),
--@itemMessurmentCode varchar(50),
@createdUser varchar(70),
@createdDate date
                                                              
AS

BEGIN

	INSERT INTO [dbo].[T_IndividualExtraItemByCA]
            (  
				[date] ,
				reasonCode ,
				wardroomCode ,
				itemCode ,
				--qty ,
				--itemMessurmentCode ,
				createdUser ,
				createdDate 

           )
VALUES
		(  
			@date ,
			@reasonCode ,
			@wardroomCode ,
			@itemCode ,
			--@qty ,
			--@itemMessurmentCode ,
			@createdUser ,
			@createdDate 
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_T_IndividualExtraItemByCA_New]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) KMUL Bandara NRT3352
-- Description: Insert Individual Extra Item By CA
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_T_IndividualExtraItemByCA_New] 

@serviceType varchar(50),
@offNo int,
@date date,
@reasonCode int,
@wardroomCode int,
@itemCode varchar(50),
@qty varchar(50),
@itemMessurmentCode varchar(50),
@isActive bit,
@createdUser varchar(70),
@createdDate date,
@lastmodifiedUser varchar(50),
@lastmodifiedDate varchar(50),
@id int
                                                              
AS

BEGIN
IF NOT EXISTS (SELECT * FROM T_IndividualExtraItemByCA WHERE id = @id )
 begin
	INSERT INTO [dbo].[T_IndividualExtraItemByCA]
            (  
				serviceType ,
				offNo ,
				date ,
				reasonCode ,
				wardroomCode ,
				itemCode ,
				qty ,
				itemMessurmentCode ,
				isActive ,
				createdUser ,
				createdDate ,
				lastmodifiedUser,
				lastmodifiedDate
				

           )
VALUES
		(  
				@serviceType ,
				@offNo ,
				@date ,
				@reasonCode ,
				@wardroomCode, 
				@itemCode ,
				@qty ,
				@itemMessurmentCode ,
				@isActive ,
				@createdUser ,
				@createdDate ,
				@lastmodifiedUser ,
				@lastmodifiedDate
				
			 

)
END


end




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_T_MealAttendance]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to save Meal Attendance
-- Modified by:	Lt(IT) KAUK Hettiarachchi,NRT3701
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_T_MealAttendance]  
@mealDate date,
@officialNo int,
--@officerSailor varchar(1),
--@serviceType varchar(10),
@reason varchar(50),
@groupMenuCode varchar(50),
@vegetarian bit,
@noneVegetarian bit,
@mealIn bit,
@mealOut bit,
@mealCount int,
@baseCode varchar(50),
@wardroom varchar(500),
@createdUser varchar(70),
@createdDate datetime
                                                              
AS

BEGIN
	
	DECLARE @isExist varchar(max) = null;

	SET @isExist = (SELECT TOP 1 createdUser FROM [dbo].[T_MealAttendance] 
	WHERE	officialNo=@officialNo 
	AND		mealDate=@mealDate
	AND		reason=@reason
	AND		groupMenuCode=@groupMenuCode
	AND		vegetarian=@vegetarian


	ORDER BY mealDate ASC)

	IF @isExist is not null
	BEGIN
		UPDATE [dbo].[T_MealAttendance]
			SET	 [mealDate] = @mealDate
				,[officialNo] = @officialNo
				,[reason] = @reason
				,[groupMenuCode] = @groupMenuCode
				,[vegetarian] = @vegetarian
				,[noneVegetarian] = @noneVegetarian
				,[mealIn] = @mealIn
				,[mealOut] = @mealOut
				,[mealCount] = @mealCount
				,[baseCode] = @baseCode
				,[wardroom] = @wardroom
				,[lastmodifiedUser] = @createdUser
				,[lastmodifiedDate] = @createdDate
		WHERE officialNo=@officialNo 
	AND		mealDate=@mealDate
	AND		reason=@reason
	AND		groupMenuCode=@groupMenuCode
	END
	ELSE
	BEGIN
	INSERT INTO [dbo].[T_MealAttendance]
		(	mealDate ,
			officialNo ,
			officerSailor ,
			--serviceType ,
			reason ,
			groupMenuCode,
			vegetarian ,
			noneVegetarian,
			mealIn,
			mealOut ,
			mealCount,
			baseCode ,
			wardroom ,
			createdUser, 
			createdDate
		)
	VALUES
		(	@mealDate,
			@officialNo,
			'O',
			--@serviceType,
			@reason,
			@groupMenuCode,
			@vegetarian,
			@noneVegetarian,
			@mealIn,
			@mealOut,
			@mealCount,
			@baseCode,
			@wardroom,
			@createdUser,
			@createdDate 
		)
	END
END






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_T_MealAttendance_QR]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to save Meal Attendance
-- Modified by:	Lt(IT) KAUK Hettiarachchi,NRT3701
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_T_MealAttendance_QR]  
@mealDate date,
@officialNo int,
--@officerSailor varchar(1),
--@serviceType varchar(10),
@reason varchar(50),
@groupMenuCode varchar(50),
@vegetarian bit,
@noneVegetarian bit,
@mealIn bit,
@mealOut bit,
@mealCount int,
--@baseCode varchar(50),
@wardroom varchar(500),
@createdUser varchar(70),
@createdDate datetime
                                                              
AS

BEGIN
	
	DECLARE @isExist varchar(max) = null;

	SET @isExist = (SELECT TOP 1 createdUser FROM [dbo].[T_MealAttendance] 
	WHERE	officialNo=@officialNo 
	AND		mealDate=@mealDate
	AND		reason=@reason
	AND		groupMenuCode=@groupMenuCode
	AND		vegetarian=@vegetarian


	ORDER BY mealDate ASC)

	IF @isExist is not null
	BEGIN
		UPDATE [dbo].[T_MealAttendance]
			SET	 [mealDate] = @mealDate
				,[officialNo] = @officialNo
				,[reason] = @reason
				,[groupMenuCode] = @groupMenuCode
				,[vegetarian] = @vegetarian
				,[noneVegetarian] = @noneVegetarian
				,[mealIn] = @mealIn
				,[mealOut] = @mealOut
				,[mealCount] = @mealCount
				--,[baseCode] = @baseCode
				,[wardroom] = @wardroom
				,[lastmodifiedUser] = @createdUser
				,[lastmodifiedDate] = @createdDate
		WHERE officialNo=@officialNo 
	AND		mealDate=@mealDate
	AND		reason=@reason
	AND		groupMenuCode=@groupMenuCode
	END
	ELSE
	BEGIN
	INSERT INTO [dbo].[T_MealAttendance]
		(	mealDate ,
			officialNo ,
			officerSailor ,
			--serviceType ,
			reason ,
			groupMenuCode,
			vegetarian ,
			noneVegetarian,
			mealIn,
			mealOut ,
			mealCount,
			--baseCode ,
			wardroom ,
			createdUser, 
			createdDate
		)
	VALUES
		(	@mealDate,
			@officialNo,
			'O',
			--@serviceType,
			@reason,
			@groupMenuCode,
			@vegetarian,
			@noneVegetarian,
			@mealIn,
			@mealOut,
			@mealCount,
			--@baseCode,
			@wardroom,
			@createdUser,
			@createdDate 
		)
	END
END






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_T_Mobile_MealAttendance_Status]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lt (IT) KAUK Hettiarachchi
-- Create date: 2021-03-26
-- Description:	Save acknowledgement status in mobile app
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_T_Mobile_MealAttendance_Status] 
	-- Add the parameters for the stored procedure here
	@mealDate date,
@officialNo int,
@officerSailor varchar(1) = 'O',
--@serviceType varchar(10),
@reason varchar(50),
@groupMenuCode varchar(50),
@vegetarian bit,
@noneVegetarian bit,
@mealIn bit,
@mealOut bit,
@mealCount int,
@baseCode varchar(50),
@wardroom varchar(500),
@createdUser varchar(70),
@createdDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @mealId int

	SELECT @mealId = mealId From [dbo].[T_MealAttendance]
	WHERE mealDate = @mealDate
	AND officialNo=@officialNo
	AND officerSailor=@officerSailor
	AND reason=@reason
	AND groupMenuCode=@groupMenuCode
	AND vegetarian=@vegetarian
	AND noneVegetarian=@noneVegetarian
	AND mealIn=@mealIn
	AND mealOut=@mealOut
	AND mealCount=@mealCount
	AND baseCode=@baseCode
	AND wardroom=@wardroom

    -- Insert statements for procedure here
    DECLARE @isExist VARCHAR(max) = null;
    
    SET @isExist = (SELECT TOP 1 createdUser FROM [dbo].[T_Mobile_MealAttendance_Status]
    WHERE mealId=@mealId)
    
    IF @isExist IS NOT NULL
    BEGIN
        UPDATE [dbo].[T_Mobile_MealAttendance_Status]
        SET     [acknowledgeStatus]=0
                ,[createdUser] = @createdUser
                ,[createdDate]=@createdDate
        WHERE [mealId]=@mealId
    END
    ELSE
    BEGIN
	INSERT INTO [dbo].[T_Mobile_MealAttendance_Status]
	(	[mealId],
		[acknowledgeStatus],
		[createdUser],
		[createdDate]
	)
	VALUES
	(	@mealId,
		0,
		@createdUser,
		@createdDate
	)
    END
END

-- execute VICTULING_Save_T_Mobile_MealAttendance_Status '2019-05-02','5157', 'O', '30000001','70000002','0','1','1','0','1','0','60000001'


GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_T_StockQty]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to create new item T_StockQty
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_T_StockQty]  
@itemCode varchar(50),
@wordRoomCode varchar(50)

                                                              
AS

BEGIN



	INSERT INTO [dbo].[T_StockQty]
            (   itemCode ,
				wordRoomCode 
				

           )
VALUES
		(  @itemCode ,
		   @wordRoomCode 
			 

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Save_T_TeaAttendance]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Use to save Tea Attendance
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Save_T_TeaAttendance]  

@officialNo int,
@officerSailor varchar(1),
@serviceType varchar(5),
@teaDate date,
@wardroom varchar(50),
@teaCount int,
@teaType varchar(20),
@createdUser varchar(70),
@createdDate datetime
                                                              
AS

BEGIN


	INSERT INTO [dbo].[T_TeaMark]
            (   
				officialNo,
				officerSailor,
				serviceType,
				teaDate,
				wardroom,
				teaCount,
				teaType,
				createdUser,
				createdDate
           )
VALUES
		(	
			@officialNo,
			@officerSailor,
			@serviceType,
			@teaDate,
			@wardroom,
			@teaCount,
			@teaType,
			@createdUser,
			@createdDate

)
END





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Search_PersonalRecordCivil]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: Select Official No.,Service Type(RNF,VNF like wise),Officer or Sailor
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Search_PersonalRecordCivil] 
	
@ST varchar(100),
@OFF varchar(100)

	
AS
BEGIN
	


select dn.initial + ' ' + dn.surname as fullName,mb.baseDescription
from [T_CivilPersonalDetails] as dn,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_base] as mb
where dn.serviceType=@ST and dn.officialNo=@OFF and mb.baseCode = dn.permentBase
	
	
	
END 




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_select_T_DepreciationItems]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) KMUL Bandara,NRT 3352
-- Description: Use to Insrt T_DepreciationItems
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_select_T_DepreciationItems] 
@reasonCode varchar(50),
@depreciationDate date,
@wordRoomCode varchar
                                                              
AS
--IF NOT EXISTS(SELECT signalDate,signalReference,teamType,nicNo_SSID,officialNo FROM [dbo].[HRIS_T_sportsPersonalData] WHERE nicNo_SSID =@nicNo_SSID and officialNo =@Official_No and officerSailor =@officerSailor and signalDate =@signalDate and signalReference =@signalDate and teamType =@sportsTeamCode)

BEGIN


select IT.item,DP.depreciationQty,DP.unitPrice,DP.price from [dbo].[T_DepreciationItems] as DP
inner join [dbo].[M_Item] as IT on DP.itemCode = IT.item
where DP.depreciationDate = @depreciationDate and DP.reasonCode = @reasonCode and DP.wordRoomCode = @wordRoomCode

END




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_select_Wardroom]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Description: Select Wardroom
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_select_Wardroom] 

                                                              
AS
--IF NOT EXISTS(SELECT signalDate,signalReference,teamType,nicNo_SSID,officialNo FROM [dbo].[HRIS_T_sportsPersonalData] WHERE nicNo_SSID =@nicNo_SSID and officialNo =@Official_No and officerSailor =@officerSailor and signalDate =@signalDate and signalReference =@signalDate and teamType =@sportsTeamCode)

BEGIN


select DP.wardroomCode,DP.wardroomName
from [dbo].[M_Wardroom] as DP
order by DP.wardroomName


END




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_selectToPrintIndividualReport]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_selectToPrintIndividualReport]


@officialNo int , @officerSailor varchar(10), @date datetime,@wardRoom varchar(500)
as
BEGIN

  SELECT [dbo].[T_DailyExtraSales].saleQty,[dbo].[T_DailyExtraSales].unitPrice,[dbo].[T_DailyExtraSales].totalCost,
	[dbo].[T_DailyExtraSales].billNo,[dbo].[T_DailyExtraSales].offNo,[dbo].[M_Item].item,[dbo].[M_Wardroom].wardroomName from [dbo].[T_DailyExtraSales]  
  inner join [dbo].[M_Item]  on [dbo].[T_DailyExtraSales].itemCode = [dbo].[M_Item].itemCode
  inner join [dbo].[M_Wardroom] on [dbo].[T_DailyExtraSales].wardroomCode = [dbo].[M_Wardroom].wardroomCode
  where [dbo].[T_DailyExtraSales].offNo = @officialNo and officerSailor = @officerSailor and saleDate = @date and T_DailyExtraSales.wardroomCode = @wardRoom  and  isPrinted = 'N' 
  group by saleQty,unitPrice,totalCost,billNo,offNo,item,wardroomName


   SELECT sum(convert(float, td.totalCost)) as totalBill 
   from [dbo].[T_DailyExtraSales] as td   
  where td.offNo = @officialNo and officerSailor = @officerSailor and saleDate = @date and td.wardroomCode = @wardRoom  and  isPrinted = 'N' 

end

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_selectToPrintIndividualReportTotal]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_selectToPrintIndividualReportTotal]


@officialNo int , @officerSailor varchar(10), @date datetime,@wardRoom varchar(500)
as
BEGIN

   SELECT sum(convert(float, td.totalCost)) as totalBill , billNo
   from [dbo].[T_DailyExtraSales] as td   
  where td.offNo = @officialNo and officerSailor = @officerSailor and saleDate = @date and td.wardroomCode = @wardRoom  and  isPrinted = 'N' group by billNo

end

--execute VICTULING_selectToPrintIndividualReportTotal '3352','O','2017-12-30','60000001'
--select * from [dbo].[T_DailyExtraSales]

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_T_BiteMenue]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to Update T_BiteMenue
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_T_BiteMenue] 

@isOrderCompleted bit,
@lastModifiedUser varchar(250),
@lastModifiedDate datetime,
@date date,
@reason varchar(50),
@wardroom varchar(50),
@groupType varchar(50)

AS


BEGIN


	UPDATE [dbo].[T_BiteMenue]
       set  

	   		isOrderCompleted = @isOrderCompleted,
			lastModifiedUser = @lastModifiedUser,
	        lastModifiedDate = @lastModifiedDate 

		where 
			date =@date and
			reason = @reason and
			wardroom = @wardroom and
			groupType = @groupType

END

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_TotalDailySummery]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get Daily Sale Summery Sheet
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_TotalDailySummery] 



as
BEGIN	


select td.itemCode,td.item,(sum(convert(float,td.saleQty))) as saleQty ,td.Messurment
from T_DailySaleSummary as td

group by td.itemCode,td.item,td.Messurment
order by td.item ASC

END

--execute [VICTULING_TotalDailySummery] 






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_TotalDailySummery_NEW]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get Daily Sale Summery Sheet
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_TotalDailySummery_NEW] 

@saleDate date 
,@wardroomCode varchar(50)

as
BEGIN	


select td.itemCode,td.item,round((sum(convert(float,td.saleQty))),4) as saleQty ,td.Messurment
from T_DailySaleSummary as td
where td.saleDate =@saleDate and td.wardroomCode = @wardroomCode
group by td.itemCode,td.item,td.Messurment
order by td.item ASC

END

--execute [VICTULING_TotalDailySummery] 






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_TotalDailySummery_NEW_withPrice]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		LCdr(IT) WHK Gunasoma,NRT 3147
-- Description: Get Daily Sale Summery Sheet
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_TotalDailySummery_NEW_withPrice] 

@saleDate date 
,@wardroomCode varchar(50)

as
BEGIN	


select td.itemCode,td.item,round((sum(convert(float,td.saleQty))),4) as saleQty ,td.Messurment,td.unitPrice, round((sum(convert(float,td.price))),4) as price
from  T_DailySaleSummary_withPrice as td
where td.saleDate =@saleDate and td.wardroomCode = @wardroomCode
group by td.itemCode,td.item,td.Messurment,td.unitPrice
order by td.item ASC

END

--execute [VICTULING_TotalDailySummery_NEW_withPrice] '2020-06-01','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_allOfficersExtraMenuCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to update total cost
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_allOfficersExtraMenuCost] 
	
@serviceType varchar(50),
@branch varchar(50),
@offNo varchar(50),
@wardroom varchar(50),
@year int,
@month int,
@extraCost varchar(50),
@createdUser varchar(250),
@createdDate datetime

AS

BEGIN

	UPDATE [dbo].[T_TotalMonthlyAllDetails]
    set  
	   	 
	extraCost = @extraCost,
	createdUser = @createdUser,
	createdDate = @createdDate

	
	WHERE serviceType =@serviceType and branch = @branch and offNo =@offNo and wardroom = @wardroom and year = @year and month = @month
	  
END

--execute [VICTULING_Update_TotalMenuCost] '40000197','50','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_allOfficersMenuCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to update total cost
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_allOfficersMenuCost] 
	
@serviceType varchar(50),
@branch varchar(50),
@offNo varchar(50),
@wardroom varchar(50),
@year int,
@month int,
@nVegMenuCost varchar(50),
@createdUser varchar(250),
@createdDate datetime

AS

BEGIN

	UPDATE [dbo].[T_TotalMonthlyAllDetails]
    set  
	   	 
	nVegMenuCost = @nVegMenuCost,
	createdUser = @createdUser,
	createdDate = @createdDate

	
	WHERE serviceType =@serviceType and branch = @branch and offNo =@offNo and wardroom = @wardroom and year = @year and month = @month
	  
END

--execute [VICTULING_Update_TotalMenuCost] '40000197','50','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_allOfficersPartyCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to update total cost
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_allOfficersPartyCost] 
	
@serviceType varchar(50),
@branch varchar(50),
@offNo varchar(50),
@wardroom varchar(50),
@year int,
@month int,
@partyCost varchar(50),
@createdUser varchar(250),
@createdDate datetime

AS

BEGIN

	UPDATE [dbo].[T_TotalMonthlyAllDetails]
    set  
	   	 
	partyCost = @partyCost,
	createdUser = @createdUser,
	createdDate = @createdDate

	
	WHERE serviceType =@serviceType and branch = @branch and offNo =@offNo and wardroom = @wardroom and year = @year and month = @month
	  
END

--execute [VICTULING_Update_TotalMenuCost] '40000197','50','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_allOfficersPlainTeaCount]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to update total cost
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_allOfficersPlainTeaCount] 
	
@serviceType varchar(50),
@branch varchar(50),
@offNo varchar(50),
@wardroom varchar(50),
@year int,
@month int,
@plainTeaCount varchar(50),
@createdUser varchar(250),
@createdDate datetime

AS

BEGIN

	UPDATE [dbo].[T_TotalMonthlyAllDetails]
    set  
	   	 
	plainTeaCount = @plainTeaCount,
	createdUser = @createdUser,
	createdDate = @createdDate

	
	WHERE serviceType =@serviceType and branch = @branch and offNo =@offNo and wardroom = @wardroom and year = @year and month = @month
	  
END

--execute [VICTULING_Update_TotalMenuCost] '40000197','50','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_allOfficersTeaCount]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to update total cost
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_allOfficersTeaCount] 
	
@serviceType varchar(50),
@branch varchar(50),
@offNo varchar(50),
@wardroom varchar(50),
@year int,
@month int,
@teaCount varchar(50),
@createdUser varchar(250),
@createdDate datetime

AS

BEGIN

	UPDATE [dbo].[T_TotalMonthlyAllDetails]
    set  
	   	 
	teaCount = @teaCount,
	createdUser = @createdUser,
	createdDate = @createdDate

	
	WHERE serviceType =@serviceType and branch = @branch and offNo =@offNo and wardroom = @wardroom and year = @year and month = @month
	  
END

--execute [VICTULING_Update_TotalMenuCost] '40000197','50','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_allOfficersVegMenuCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to update total cost
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_allOfficersVegMenuCost] 
	
@serviceType varchar(50),
@branch varchar(50),
@offNo varchar(50),
@wardroom varchar(50),
@year int,
@month int,
@vegMenuCost varchar(50),
@createdUser varchar(250),
@createdDate datetime

AS

BEGIN

	UPDATE [dbo].[T_TotalMonthlyAllDetails]
    set  
	   	 
	vegMenuCost = @vegMenuCost,
	createdUser = @createdUser,
	createdDate = @createdDate

	
	WHERE serviceType =@serviceType and branch = @branch and offNo =@offNo and wardroom = @wardroom and year = @year and month = @month
	  
END

--execute [VICTULING_Update_TotalMenuCost] '40000197','50','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_allOfficersVICDays]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to update total cost
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_allOfficersVICDays] 
	
@serviceType varchar(50),
@branch varchar(50),
@offNo varchar(50),
@wardroom varchar(50),
@year int,
@month int,
@noDaysInBase varchar(50),
@createdUser varchar(250),
@createdDate datetime,
@noDaysInSea varchar(50),
@noDaysInBaseNew varchar(50)

AS

BEGIN

	UPDATE [dbo].[T_TotalMonthlyAllDetails]
    set  
	   	 
	noDaysInBase = @noDaysInBase,
	createdUser = @createdUser,
	createdDate = @createdDate,
	noDaysInSea = @noDaysInSea,
	noDaysInBaseNew = @noDaysInBaseNew
	
	WHERE serviceType =@serviceType and branch = @branch and offNo =@offNo and wardroom = @wardroom and year = @year and month = @month
	  
END

--execute [VICTULING_Update_TotalMenuCost] '40000197','50','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_AuthorizationMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to save Authorization Menu
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_AuthorizationMenu] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@isAuthorized bit,
@authorizedUser varchar(70),
@authorizedDate datetime,
@vegiNonVegi varchar(50)

AS

BEGIN
	

	UPDATE [dbo].[T_DailyMenu]
    set  
	   	 
	isAuthorized = @isAuthorized,
	authorizedUser =@authorizedUser,
	authorizedDate = @authorizedDate

	
	WHERE [date] = @date and reasonCode =@reasonCode and wardroomCode =@wardroomCode and [vegiNonVegi] =@vegiNonVegi
	  
END


--execute [VICTULING_Update_AuthorizationMenu] '2018-12-05','30000001','60000001','70000001','Vegetarian'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_CabinAllocation]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to update cabin allocation
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_CabinAllocation] 
@officialNo varchar(50),
@serviceType varchar(50),
@toDate date,
@status bit,
@lastModifidUser varchar(50),
@lastModifiedDate datetime


AS

BEGIN
	

	UPDATE [dbo].[T_CabinAllocation]
    set  
	   	 
	toDate  = @toDate ,
	status =@status,
	lastModifidUser = @lastModifidUser,
	lastModifiedDate = @lastModifiedDate

	
	WHERE officialNo = @officialNo and serviceType =@serviceType and status is null
	  
END


--execute [VICTULING_Update_AuthorizationMenu] '2018-12-05','30000001','60000001','70000001','Vegetarian'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_MessSub]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_MessSub] 
	
@branchID varchar(50),
@officialNo int,
@Messsub decimal(18, 5),
@wardroom varchar(50),
@year int,
@month int,
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime

AS

BEGIN
	

	UPDATE [dbo].[T_FinalRecovery_Dining_Wine]
    set  
	

	Messsub = @Messsub,
	createdUser = @lastmodifiedUser,
	createdDate = @lastmodifiedDate
	
	WHERE branchID =@branchID and officialNo = @officialNo and wardroom = @wardroom and year = @year and month = @month
	  
END


--execute [VICTULING_Update_T_StockQty] '40000314','193.952','60000001','kal','2019-04-10 20:46:05.140'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_MessSub_new]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_MessSub_new] 
	
@branchID varchar(50),
@officialNo int,
--@rankRate varchar(50),
--@name varchar(200),
@individualTotalCost decimal(18, 2),
@creditDebit decimal(18, 2),
@Messsub decimal(18, 5),
@barBill decimal(18, 2),
@TotRecovery decimal(18, 2),
@wardroom varchar(50),
@year int,
@month int,
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime

AS

BEGIN
	
	--begin
	--UPDATE [dbo].[T_FinalRecovery_Dining_Wine]
 --   set  
	

	--Messsub = @Messsub,
	--createdUser = @lastmodifiedUser,
	--createdDate = @lastmodifiedDate
	
	--WHERE branchID =@branchID and officialNo = @officialNo and wardroom = @wardroom and year = @year and month = @month
	--end

--declare @cost  float 
--declare @qty int 	
--declare @unitPrice  float 

--set @cost =0
--set @qty =0
--set @unitPrice =0

--select @qty = (convert(float,ts.saleQty))
--from  [dbo].[T_DailyMenuSales] as ts
--where ts.date = @date and ts.wordRoomCode = @wardroom and ts.reasonCode =@reason 

--select @unitPrice = (convert(float,ts.unitPrice))
--from  [dbo].[T_DailyMenuSales] as ts
--where ts.date = @date and ts.wordRoomCode = @wardroom and ts.reasonCode =@reason

--set @cost = convert (varchar,(@qty*@unitPrice))

begin
	insert [dbo].[T_MonthlyMessSub]
	 (  branchID ,
		officialNo ,
		--rankRate ,
		--name ,
		individualTotalCost ,
		creditDebit ,
		Messsub ,
		barBill ,
		TotRecovery ,
		wardroom ,
		year ,
		month
	 )
	values
	(   @branchID ,
		@officialNo ,
		--@rankRate ,
		--@name ,
		@individualTotalCost,
		@creditDebit,
		@Messsub,
		@barBill ,
		@TotRecovery,
		@wardroom ,
		@year ,
		@month 
	 )

end

END


--execute [VICTULING_Update_T_StockQty] '40000314','193.952','60000001','kal','2019-04-10 20:46:05.140'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_CashBookDetails]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to Update [dbo].[T_DailyMenu] Details
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_CashBookDetails] 
	
@date date,
@wardroom varchar(50),
@description varchar(300),
@remarks varchar(500),
@creditDebit varchar(50),
@cost DECIMAL(18,2),
@isAuthorized bit,
@createdUser varchar(500),
@createdDate datetime

AS

BEGIN
	

	INSERT INTO [dbo].[T_CashBookDetails]
            (   date ,
				wardroom,
				description,
				remarks ,
				creditDebit,
				cost,
				[is Authorized],
				createdUser ,		
				createdDate
				

           )
VALUES
		(	DATEADD(DAY,1, @date)
			,@wardroom 
			,@description
			,''
			,@creditDebit
			,@cost
			,@isAuthorized
			,@createdUser 
			,@createdDate
			)
	

	
	 
	
  	    	
	
	  
END


--execute [VICTULING_Update_T_DailyMenu] '9/1/2017','50000004','30000001','60000001','Mini Burger one','kal','2017-09-11 16:38:45.000'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_DailyMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to Update [dbo].[T_DailyMenu] Details
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_DailyMenu] 
	
@date date,
@mainItemCode varchar(50),
@reasonCode varchar(50),
@wardroomCode varchar(50),
@remarks varchar(500),
@isActive bit,
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime

AS

BEGIN
	

	UPDATE [dbo].[T_DailyMenu]
    set  
	   	 
	remarks = @remarks,
	isActive =@isActive,
	createdUser = @lastmodifiedUser,
	createdDate = @lastmodifiedDate

	
	WHERE [date] = @date and id =@mainItemCode and reasonCode = @reasonCode and wardroomCode =@wardroomCode
	  
END


--execute [VICTULING_Update_T_DailyMenu] '9/1/2017','50000004','30000001','60000001','Mini Burger one','kal','2017-09-11 16:38:45.000'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_DailyMenu_PartyPotion]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to Update [dbo].[T_DailyMenu] Details for Party portion - Remarks
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_DailyMenu_PartyPotion] 

@id int,	
@date date,
@mainItemCode varchar(50),
@reasonCode varchar(50),
@wardroomCode varchar(50),
@remarks varchar(500),

@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime

AS

BEGIN
	

	UPDATE [dbo].[T_DailyMenu]
    set  
	   	 
	remarks = @remarks,
	
	createdUser = @lastmodifiedUser,
	createdDate = @lastmodifiedDate

	
	WHERE id = @id and [date] = @date and mainItemCode =@mainItemCode and reasonCode = @reasonCode and wardroomCode =@wardroomCode
	  
END


--execute [VICTULING_Update_T_DailyMenu] '9/1/2017','50000004','30000001','60000001','Mini Burger one','kal','2017-09-11 16:38:45.000'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_DailyMenuSaleBite]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_DailyMenuSaleBite] 
	
@id int,
@date date,
@reasonCode varchar(50),
@groupMenuCode varchar(50),
@wardroomCode varchar(50),
@vegiNonVegi varchar(50),
@isActive bit,
@remarks varchar(500),
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime

AS

BEGIN
	

UPDATE [dbo].[T_DailyMenu]
set  
	
isActive =  @isActive,
remarks = @remarks,
lastmodifiedUser = @lastmodifiedUser,
lastmodifiedDate = @lastmodifiedDate 
	
WHERE 
id = @id and
date =@date and 
reasonCode = @reasonCode and
groupMenuCode = @groupMenuCode and
wardroomCode = @wardroomCode and
vegiNonVegi = @vegiNonVegi 
	  
END


--execute [VICTULING_Update_T_StockQty] '40000314','193.952','60000001','kal','2019-04-10 20:46:05.140'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_GroupMenuAttendance]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to Update [dbo].[T_GroupMenuAttendance] Details
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_GroupMenuAttendance] 

@id int,	
@offNo int,
@serviceType varchar(50),
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@remarks varchar(500),
@isActive bit,
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime

AS

BEGIN
	

	UPDATE [dbo].[T_GroupMenuAttendance]
    set  
	   	 
	offNo = @offNo,
	serviceType = @serviceType,
	remarks =@remarks,
	isActive =@isActive,
	lastmodifiedUser = @lastmodifiedUser,
	lastmodifiedDate = @lastmodifiedDate

	
	WHERE [date] = @date and  reasonCode = @reasonCode and wardroomCode =@wardroomCode and id = @id
	  
END


--execute [VICTULING_Update_T_GroupMenuAttendance] '9/1/2017','50000004','30000001','60000001','Mini Burger one','kal','2017-09-11 16:38:45.000'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_GroupMenuItemByCA]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to Update [dbo].[T_GroupMenuItemByCA] Details
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_GroupMenuItemByCA] 

@id int,	
@offNo int,
@serviceType varchar(50),
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@qty varchar(50),
@itemMessurmentCode varchar(50),
@isActive bit,
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime

AS

BEGIN
	

	UPDATE [dbo].[T_GroupMenuItemByCA]
    set  
	   	 
	offNo = @offNo,
	serviceType = @serviceType,
	qty =@qty,
	itemMessurmentCode = @itemMessurmentCode,
	isActive =@isActive,
	lastmodifiedUser = @lastmodifiedUser,
	lastmodifiedDate = @lastmodifiedDate

	
	WHERE [date] = @date and  reasonCode = @reasonCode and wardroomCode =@wardroomCode and id = @id
	  
END


--execute [VICTULING_Update_T_GroupMenuAttendance] '9/1/2017','50000004','30000001','60000001','Mini Burger one','kal','2017-09-11 16:38:45.000'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_GroupMenuListItem]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to Update [dbo].[T_GroupMenuListItem] Details
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_GroupMenuListItem] 
	
--@id INT,
@date date,
@reasonCode varchar(50),
@groupTypeCode varchar(50),
@wardroomCode varchar(50),
@itemCode varchar(50),
@currentStock varchar(50),
@qty varchar(50),
@messurment varchar(50),
@isActive bit,
@lastModifiedUser varchar(70),
@lastModifiedDate datetime

AS

BEGIN
	

	UPDATE [dbo].[T_GroupMenuListItem]
    set  
	   	
	currentStock = @currentStock,
	qty = @qty,
	messurment = @messurment,
	isActive =@isActive,
	lastModifiedUser = @lastModifiedUser,
	lastModifiedDate = @lastModifiedDate

	
	WHERE	--id =@id and 
			[date] = @date and 
			itemCode = @itemCode and 
			reasonCode = @reasonCode and groupTypeCode =@groupTypeCode and 
			wardroomCode = @wardroomCode 
	  
END


--execute [VICTULING_Update_T_DailyMenu] '9/1/2017','50000004','30000001','60000001','Mini Burger one','kal','2017-09-11 16:38:45.000'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_IndividualExtraItemByCA]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to Update [dbo].[T_IndividualExtraItemByCA] Details
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_IndividualExtraItemByCA] 

@id int,	
@date date,
@reasonCode int,
@wardroomCode int,
@offNo int,
@serviceType varchar(50),
@itemCode varchar (50),
@qty varchar(50),
@itemMessurmentCode varchar(50),
@isActive bit,
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime

AS

BEGIN
	

	UPDATE [dbo].[T_IndividualExtraItemByCA]
    set  
	   	 
	offNo = @offNo,
	serviceType = @serviceType,
	qty =@qty,
	itemMessurmentCode =@itemMessurmentCode,
	isActive =@isActive,
	lastmodifiedUser = @lastmodifiedUser,
	lastmodifiedDate = @lastmodifiedDate

	
	WHERE [date] = @date and  reasonCode = @reasonCode and wardroomCode =@wardroomCode and itemCode = @itemCode and id = @id
	  
END


--execute [VICTULING_Update_T_DailyMenu] '9/1/2017','50000004','30000001','60000001','Mini Burger one','kal','2017-09-11 16:38:45.000'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_MealAttendance]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to Update [dbo].[T_MealAttendance] Details
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_MealAttendance] 

@mealDate date,	
@officialNo int,
@officerSailor varchar(10),
@serviceType varchar(10),
@reason varchar(50),
@groupMenuCode varchar(50),
@wardroom varchar(50),
@mealIn bit,
@mealOut bit,
@mealCount int,
@noneVegetarian bit,
@vegetarian bit,
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime

AS

BEGIN
	

	UPDATE [dbo].[T_MealAttendance]
    set  
	   	 
mealIn = @mealIn ,
mealOut = @mealOut ,
mealCount = @mealCount ,
noneVegetarian = @noneVegetarian ,
vegetarian = @vegetarian ,
lastmodifiedUser = @lastmodifiedUser,
lastmodifiedDate = @lastmodifiedDate

	
	WHERE mealDate=	@mealDate and  reason = @reason and groupMenuCode =@groupMenuCode and wardroom = @wardroom 
	and officialNo =@officialNo and officerSailor = @officerSailor and serviceType = @serviceType
	  
END


--execute [VICTULING_Update_T_GroupMenuAttendance] '9/1/2017','50000004','30000001','60000001','Mini Burger one','kal','2017-09-11 16:38:45.000'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_MenuListItem]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to Update [dbo].[T_DailyMenu] Details
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_MenuListItem] 
	
@date date,
@itemCode varchar(50),
@reasonCode varchar(50),
@wardroom varchar(50),
@qty varchar(50),
@messurment varchar(50),
@vegi varchar(50),
@isActive bit,
@lastModifiedUser varchar(70),
@lastModifiedDate datetime

AS

BEGIN
	

	UPDATE [dbo].[T_MenuListItem]
    set  
	   	 
	qty = @qty,
	messurment = @messurment,
	isActive =@isActive,
	lastModifiedUser = @lastModifiedUser,
	lastModifiedDate = @lastModifiedDate

	
	WHERE [date] = @date and itemCode =@itemCode and reasonCode = @reasonCode and wardroom =@wardroom and vegi = @vegi
	  
END


--execute [VICTULING_Update_T_DailyMenu] '9/1/2017','50000004','30000001','60000001','Mini Burger one','kal','2017-09-11 16:38:45.000'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_Mobile_MealAttendance_Status]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_Update_T_Mobile_MealAttendance_Status] 
	-- Add the parameters for the stored procedure here
	@mealId int,
	@lastmodifiedUser nvarchar(70),
	@lastmodifiedDate datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[T_Mobile_MealAttendance_Status]
   SET [acknowledgeStatus] = 1
      ,[lastmodifiedUser] = @lastmodifiedUser
      ,[lastmodifiedDate] = @lastmodifiedDate
 WHERE mealId = @mealId
END


GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_PartyCostByIndividual_Extra]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to update total cost
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_PartyCostByIndividual_Extra] 
	
					 

@partyDate date,
@wardroom varchar(50),
@reason varchar(50),
@groupType varchar(50),
@veg varchar(50),
@offNo varchar(50),
@OS varchar(50),
@partyCost varchar(50),
@noOfPerson decimal(18, 2),
@perHeadCost decimal(18, 2),
@createdUser varchar(250),
@createdDate datetime

AS

BEGIN

	UPDATE [dbo].[T_PartyCostByIndividual]
    set  
	   	 
	OS = @OS,
	totalMenuCost = @partyCost,
	noOfPerson = @noOfPerson,
	perHeadCost = @perHeadCost,
	createdUser = @createdUser,
	createdDate = @createdDate

	
	WHERE  partyDate= @partyDate and @wardroom = wardroom and reason = @reason and groupType = @groupType and veg = @veg and offNo =@offNo 
	  
END

--execute [VICTULING_Update_TotalMenuCost] '40000197','50','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_Stock]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to Update [dbo].[T_Stock] Details
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_Stock] 
	
@itemId int,
@itemCode varchar(50),
@CurrentQty float,
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime

AS

BEGIN
	

	UPDATE [dbo].[T_Stock]
    set  
	   	 
      CurrentQty			=
		(
			CASE
				WHEN
					((@CurrentQty) <= 0.000)
				THEN
					0
				ELSE
					(@CurrentQty)
			END
		)
			--@CurrentQty
			,
	lastmodifiedUser	=	@lastmodifiedUser,
	lastmodifiedDate	=	@lastmodifiedDate

	  WHERE 
	  itemId = @itemId and itemCode = @itemCode
	  
END








GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_Stock_forMenuSale]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to on charge items when delete in to T_Stock table
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_Stock_forMenuSale] 
	
@itemCode varchar(50),
--@itemId varchar (50),
@currentStock varchar(50),
@unitPrice varchar(50),
@wordRoomCode varchar(50),
@recevedFrom varchar(50),
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime

AS

BEGIN
	
declare @preStock  float 
declare @currentStock1  float
declare @newStock  varchar(50)

set @preStock =0
set @currentStock1 =0
set @newStock =0

select top(1) @preStock = isnull((convert(float,ts.CurrentQty)),0)
from  [dbo].[T_Stock] as ts
where ts.itemCode = @itemCode and ts.wordRoomCode = @wordRoomCode and ts.recevedFrom =@recevedFrom and unitPrice =@unitPrice
order by ts.itemId asc

print(@preStock)


set @currentStock1 = (convert(float,@currentStock))

set @newStock = convert (varchar,(@preStock+@currentStock))

print(@newStock)

	UPDATE top(1)[dbo].[T_Stock] 
    set  
	   	 
	CurrentQty = @newStock,
	createdUser = @lastmodifiedUser,
	createdDate = @lastmodifiedDate

	
WHERE itemCode =@itemCode and  wordRoomCode = @wordRoomCode and recevedFrom =@recevedFrom and CurrentQty = @preStock 
and unitPrice =@unitPrice
print(@currentStock1)
END

--execute [VICTULING_Update_T_Stock_forMenuSale] '40000235','66.9','21.96','60000001','Cash','kal','2020-01-13 09:29:37.627'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_Stock_New]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to Update [dbo].[T_Stock] Details
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_Stock_New] 
	
@itemId int,
@itemCode varchar(50),
@CurrentQty varchar(50),
@recevedFrom varchar(50),
@unitPrice varchar(50),
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime

AS

BEGIN
	

	UPDATE [dbo].[T_Stock]
    set  
	   	 
    CurrentQty  = @CurrentQty,
	lastmodifiedUser = @lastmodifiedUser,
	lastmodifiedDate = @lastmodifiedDate


	  WHERE 
	  itemCode = @itemCode and 
	  recevedFrom = @recevedFrom and
	  unitPrice = @unitPrice 
END








GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_StockQty]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to Update [dbo].[T_StockQty] Details
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_StockQty] 
	
@itemCode varchar(50),
--@onchargedValue varchar(50),
--@saleValue varchar(50),
@currentStock float,
@wordRoomCode varchar(50),
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime

AS

BEGIN
	
	declare @currentStock1 as float
	declare @NewcurrentStock as float
	select @currentStock1 = (select currentStock from [T_StockQty] WHERE itemCode =@itemCode and wordRoomCode = @wordRoomCode) 
	select @NewcurrentStock =   @currentStock1 - @currentStock

	UPDATE [dbo].[T_StockQty]
    set  
	

		currentStock = 
		(
			CASE
				WHEN
					((@NewcurrentStock) <= 0.000)
				THEN
					0
				ELSE
					(@NewcurrentStock)
			END
		)
	--@NewcurrentStock
	,
	createdUser = @lastmodifiedUser,
	createdDate = @lastmodifiedDate
	
	WHERE itemCode =@itemCode and wordRoomCode = @wordRoomCode
	  
END


--execute [VICTULING_Update_T_StockQty] '40000314','193.952','60000001','kal','2019-04-10 20:46:05.140'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_StockQty_Depreciation]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to Update [dbo].[T_StockQty] Details
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_StockQty_Depreciation] 
	
@itemCode varchar(50),
--@onchargedValue varchar(50),
--@saleValue varchar(50),
@currentStock float,
@wordRoomCode varchar(50),
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime

AS

BEGIN
	
	--declare @currentStock1 as float
	--declare @NewcurrentStock as float
	--select @currentStock1 = (select currentStock from [T_StockQty] WHERE itemCode =@itemCode and wordRoomCode = @wordRoomCode) 
	--select @NewcurrentStock =   @currentStock1 - @currentStock

	UPDATE [dbo].[T_StockQty]
    set  
	

	--currentStock = @currentStock,
	  currentStock			=
		(
			CASE
				WHEN
					((@currentStock) <= 0.000)
				THEN
					0
				ELSE
					(@currentStock)
			END
		),
	createdUser = @lastmodifiedUser,
	createdDate = @lastmodifiedDate
	
	WHERE itemCode =@itemCode and wordRoomCode = @wordRoomCode
	  
END


--execute [VICTULING_Update_T_StockQty] '40000314','193.952','60000001','kal','2019-04-10 20:46:05.140'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_StockQty_forDelete]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to on charge items when delete in to T_StockQty table
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_StockQty_forDelete] 
	
@itemCode varchar(50),
@currentStock varchar(50),
@wordRoomCode varchar(50),
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime

AS

BEGIN
	
declare @preStock  float 
declare @currentStock1  float
declare @newStock  varchar(50)

set @preStock =0
set @currentStock1 =0
set @newStock =0

select @preStock = isnull((convert(float,ts.currentStock)),0)
from  [dbo].[T_StockQty] as ts
where ts.itemCode = @itemCode and ts.wordRoomCode = @wordRoomCode

set @currentStock1 = (convert(float,@currentStock))

set @newStock = convert (varchar,(@preStock-@currentStock1))

	UPDATE [dbo].[T_StockQty]
    set  
	   	 

		--   currentStock			=
		--(
		--	CASE
		--		WHEN
		--			((@newStock) <= 0.000)
		--		THEN
		--			0
		--		ELSE
		--			(@newStock)
		--	END
		--),
	currentStock = @newStock,
	createdUser = @lastmodifiedUser,
	createdDate = @lastmodifiedDate

	
	WHERE itemCode =@itemCode and wordRoomCode = @wordRoomCode
	  
END

--execute [VICTULING_Update_T_StockQty_forOnCharge] '40000197','50','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_StockQty_forMenuSale]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to Menu Sale items update in to T_StockQty table
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_StockQty_forMenuSale] 
	
@itemCode varchar(50),
@currentStock varchar(50),
@wordRoomCode varchar(50),
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime


AS

BEGIN
	
declare @preStock  float 
declare @currentStock1  float
declare @newStock  varchar(50)

set @preStock =0
set @currentStock1 =0
set @newStock =0

select @preStock = isnull((convert(float,ts.currentStock)),0)
from  [dbo].[T_StockQty] as ts
where ts.itemCode = @itemCode and ts.wordRoomCode = @wordRoomCode

set @currentStock1 = (convert(float,@currentStock))

set @newStock = convert (varchar,(@preStock+@currentStock1))



	UPDATE [dbo].[T_StockQty]
    set  
	   	 
	currentStock = @newStock,
	createdUser = @lastmodifiedUser,
	createdDate = @lastmodifiedDate

	
	WHERE itemCode =@itemCode and wordRoomCode = @wordRoomCode
	  
END

--execute [VICTULING_Update_T_StockQty_forOnCharge] '40000197','50','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_StockQty_forOnCharge]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to on charge items save in to T_StockQty table
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_StockQty_forOnCharge] 
	
@itemCode varchar(50),
@currentStock varchar(50),
@wordRoomCode varchar(50),
@createdUser varchar(70),
@createdDate datetime


AS

BEGIN
	
declare @preStock  float 
declare @currentStock1  float
declare @newStock  varchar(50)

set @preStock =0
set @currentStock1 =0
set @newStock =0

select @preStock = isnull((convert(float,ts.currentStock)),0)
from  [dbo].[T_StockQty] as ts
where ts.itemCode = @itemCode and ts.wordRoomCode = @wordRoomCode

set @currentStock1 = (convert(float,@currentStock))

set @newStock = convert (varchar,(@preStock+@currentStock1))



	UPDATE [dbo].[T_StockQty]
    set  
	   	 
	currentStock = @newStock,
	createdUser = @createdUser,
	createdDate = @createdDate

	
	WHERE itemCode =@itemCode and wordRoomCode = @wordRoomCode
	  
END

--execute [VICTULING_Update_T_StockQty_forOnCharge] '40000197','50','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_T_StockQty_Individual]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to Update [dbo].[T_StockQty] Details
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_T_StockQty_Individual] 
	
@itemCode varchar(50),
@currentStock float,
@wordRoomCode varchar(50),
@lastmodifiedUser varchar(70),
@lastmodifiedDate datetime

AS

BEGIN
	
	--declare @currentStock1 as float
	--declare @NewcurrentStock as float
	--select @currentStock1 = (select currentStock from [T_StockQty] WHERE itemCode =@itemCode and wordRoomCode = @wordRoomCode) 
	--select @NewcurrentStock =   @currentStock1 - @currentStock

	UPDATE [dbo].[T_StockQty]
    set  
	

	--currentStock = @currentStock,
		   currentStock			=
		(
			CASE
				WHEN
					((@currentStock) <= 0.000)
				THEN
					0
				ELSE
					(@currentStock)
			END
		),
	createdUser = @lastmodifiedUser,
	createdDate = @lastmodifiedDate
	
	WHERE itemCode =@itemCode and wordRoomCode = @wordRoomCode
	  
END


--execute [VICTULING_Update_T_StockQty] '40000314','193.952','60000001','kal','2019-04-10 20:46:05.140'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_TotalMenuCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to update total cost
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_TotalMenuCost] 
	
@date datetime,
@reason varchar(50),
@totalCost varchar(50),
@wardroom varchar(50),
@vegi varchar(50),
@groupMenuCode varchar(50),
@lastModifiedUser varchar(70),
@lastModifiedDate datetime

AS

BEGIN
declare @cost  float 
declare @qty int 	
declare @unitPrice  float 

set @cost =0
set @qty =0
set @unitPrice =0

select @qty = (convert(float,ts.saleQty))
from  [dbo].[T_DailyMenuSales] as ts
where ts.date = @date and ts.wordRoomCode = @wardroom and ts.reasonCode =@reason 

select @unitPrice = (convert(float,ts.unitPrice))
from  [dbo].[T_DailyMenuSales] as ts
where ts.date = @date and ts.wordRoomCode = @wardroom and ts.reasonCode =@reason

set @cost = convert (varchar,(@qty*@unitPrice))

	UPDATE [dbo].[T_TotalMenuCost]
    set  
	   	 
	totalCost = @totalCost,
	lastModifiedUser = @lastModifiedUser,
	lastModifiedDate = @lastModifiedDate

	
	WHERE [date] =@date and reason = @reason and wardroom =@wardroom and vegi =@vegi and groupMenuCode = @groupMenuCode
	  
END

--execute [VICTULING_Update_TotalMenuCost] '40000197','50','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_TotalMenuCost_Missed]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to update total cost
-- =============================================

CREATE PROCEDURE [dbo].[VICTULING_Update_TotalMenuCost_Missed] 
	
@date datetime,
@reason varchar(50),
@totalCost varchar(50),
@wardroom varchar(50),
@vegi varchar(50),
@groupMenuCode varchar(50),
@lastModifiedUser varchar(70),
@lastModifiedDate datetime

AS

BEGIN

--declare @cost  float 
--declare @qty int 	
--declare @unitPrice  float 

--set @cost =0
--set @qty =0
--set @unitPrice =0

--select @qty = (convert(float,ts.saleQty))
--from  [dbo].[T_DailyMenuSales] as ts
--where ts.date = @date and ts.wordRoomCode = @wardroom and ts.reasonCode =@reason 

--select @unitPrice = (convert(float,ts.unitPrice))
--from  [dbo].[T_DailyMenuSales] as ts
--where ts.date = @date and ts.wordRoomCode = @wardroom and ts.reasonCode =@reason

--set @cost = convert (varchar,(@qty*@unitPrice))

	UPDATE [dbo].[T_TotalMenuCost]
    set  
	   	 
	totalCost = @totalCost,
	lastModifiedUser = @lastModifiedUser,
	lastModifiedDate = @lastModifiedDate
	
	WHERE [date] =@date and reason = @reason and wardroom =@wardroom and vegi =@vegi and groupMenuCode = @groupMenuCode
	  
END

--execute [VICTULING_Update_TotalMenuCost] '40000197','50','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_TotalMenuCostExtra]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Description: Use to update total cost
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_TotalMenuCostExtra] 
	
@date datetime,
@reason varchar(50),
@totalCost varchar(50),
@wardroom varchar(50),
@vegi varchar(50),
@groupMenuCode varchar(50),
@lastModifiedUser varchar(70),
@lastModifiedDate datetime

AS

BEGIN
declare @cost  float 
declare @qty int 	
declare @unitPrice  float 

set @cost =0
set @qty =0
set @unitPrice =0

select @qty = (convert(float,ts.saleQty))
from  [dbo].[T_DailyMenuSales] as ts
where ts.date = @date and ts.wordRoomCode = @wardroom and ts.reasonCode =@reason 

select @unitPrice = (convert(float,ts.unitPrice))
from  [dbo].[T_DailyMenuSales] as ts
where ts.date = @date and ts.wordRoomCode = @wardroom and ts.reasonCode =@reason

set @cost = convert (varchar,(@qty*@unitPrice))

	UPDATE [dbo].[T_TotalMenuCost]
    set  
	   	 
	totalCost = (@totalCost+totalCost),
	lastModifiedUser = @lastModifiedUser,
	lastModifiedDate = @lastModifiedDate

	
	WHERE [date] =@date and reason = @reason and wardroom =@wardroom and vegi =@vegi and groupMenuCode = @groupMenuCode
	  
END

--execute [VICTULING_Update_TotalMenuCostExtra] '2019-10-01','30000001','1','60000001','Non-Vegetarian','70000000'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_Update_TotalMenuCostPerPerson]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) WHK Gunasoma,NRT 3147
-- Create date: <Create Date>
-- Description:	Use to Update [dbo].[T_TotalMenuCost]
-- =============================================


CREATE PROCEDURE [dbo].[VICTULING_Update_TotalMenuCostPerPerson] 
	
@date datetime,
@reason varchar(50),
@wardroom varchar(50),
@vegi varchar(50),
@noOfPersons int,
@costPerPerson float,
@groupMenuCode varchar(50),
@lastModifiedUser varchar(70),
@lastModifiedDate datetime,
@isAuthrized bit

AS

BEGIN
	

	UPDATE [dbo].[T_TotalMenuCost]
    set  
	   	 
    noOfPersons  = @noOfPersons,
	costPerPerson = @costPerPerson,
	lastModifiedUser = @lastModifiedUser,
	lastModifiedDate = @lastModifiedDate,
	isAuthrized = @isAuthrized


	  WHERE 
	  [date] = @date and reason = @reason and wardroom = @wardroom and vegi = @vegi and groupMenuCode = @groupMenuCode
	  
END








GO
/****** Object:  StoredProcedure [dbo].[VICTULING_UserRegistration]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VICTULING_UserRegistration]

@inserUpdate VARCHAR(30)

,@NicNo varchar(100)
,@Initial varchar (255)=NULL
,@SurName varchar (255)=NULL
,@RankCode varchar (255)=NULL
,@BrachCode varchar (255)=NULL
,@OffNo varchar(50)=NULL
,@serviceType varchar(50)=NULL
,@Email varchar (255)=NULL
,@UserName varchar(255)=null
,@Password varchar (255)=NULL
,@conPassword varchar (255)=NULL
,@createdUser varchar(100)=NULL
,@createdDate smalldatetime=NULL
,@lastModifiedUser	varchar(100)=NULL
,@lastModifiedDate smalldatetime=NULL
,@roll varchar(5)=null
,@wardroomCode varchar(50)=null
,@wardroom varchar(50)=null

                                                              
AS

BEGIN



IF(@inserUpdate='insert')
BEGIN
--IF NOT EXISTS (SELECT [nicNo] FROM [dbo].[T_Login] WHERE [nicNo] = NicNo)

BEGIN

	INSERT INTO [dbo].[T_Login]

           ([nicNo]
		   , [Initial]
			, [surName]
			, [rankCode]
			, [branchCode]
			, [offNo]
			, [serviceType]
			, [eMail]
			, [userName]
			, [password]
			, [rePassword]
			, [createdUser]
			, [createdDate]
			, [roll]
			,[baseCode]
			,[baseName]
           )
			VALUES
			(  
			@NicNo
			,@Initial
			,@SurName
			,@RankCode
			,@BrachCode
			,@OffNo
			,@serviceType
			,@Email
			,@UserName
			,@Password
			,@conPassword
			,@createdUser
			,GETDATE()
			,@roll
			,@wardroomCode
			,@wardroom
			)
END
END

IF(@inserUpdate='update')
BEGIN

	UPDATE  [dbo].[T_Login]
	SET [password] = @Password
	, [rePassword] = @conPassword
	, [lastModifiedUser] = @lastModifiedUser
	, [lastModifiedDate] = GETDATE()

	WHERE [nicNo] = @NicNo

END
END




GO
/****** Object:  StoredProcedure [dbo].[VICTULING_ViewAvailableFullStockItem]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Full Stock Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_ViewAvailableFullStockItem] 

as
BEGIN	

select ts.itemCode,mit.itemCatagory,mi.item
,round(convert(float,ts.currentStock),3) as currentStock
,mm.itemMessurment,ts.reOrderLevel

from [dbo].[T_StockQty] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,
[dbo].[M_Wardroom] as mw,[dbo].[M_ItemByCatagory] as mit

where mi.itemCode=ts.itemCode 
and mm.itemMessurmentCode = mi.itemMessurmentCode 
and mit.itemCatagoryCode = mi.itemCatagoryCode 
and mw.wardroomCode = ts.wordRoomCode 
and ts.currentStock !='0' 
--and ts.itemCode = '40001119'

order by mit.itemCatagory,mi.item ASC







END

--execute [VICTULING_ViewAvailableFullStockItem] 





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_ViewAvailableWithPrice]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Full Stock Item with price
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_ViewAvailableWithPrice] 

as
BEGIN	
select ts.itemCode,mit.itemCatagory,mi.item,mm.itemMessurment,tst.CurrentQty,tst.unitPrice
,ROUND((convert(float,tst.unitPrice)*convert(float,tst.CurrentQty)),2 ) as price
,tst.recevedFrom,ts.reOrderLevel,tst.itemID


from [dbo].[T_StockQty] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,
[dbo].[M_Wardroom] as mw,[dbo].[M_ItemByCatagory] as mit,[dbo].[T_Stock] as tst

where  mi.itemCode=ts.itemCode 
--and ts.itemCode = '40000222'
and mm.itemMessurmentCode = mi.itemMessurmentCode
and mit.itemCatagoryCode = mi.itemCatagoryCode 
and tst.CurrentQty !='0'
and tst.itemCode = ts.itemCode  
and mw.wardroomCode = ts.wordRoomCode

group by ts.itemCode,mit.itemCatagory,mi.item,mm.itemMessurment,ts.reOrderLevel,tst.unitPrice,tst.recevedFrom
,tst.CurrentQty,tst.itemID

order by mit.itemCatagory,mi.item ASC

end


--execute [VICTULING_ViewAvailableWithPrice]

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_viewBiteMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_viewBiteMenu] 
@type	int,
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)


as
BEGIN	

IF @type=1
BEGIN
select distinct mgm.GroupMenu,tb.groupType
from T_BiteMenue as tb,[dbo].[M_GroupMenu] as mgm
where tb.date = @date and tb.reason = @reasonCode and tb.wardroom = @wardroomCode and mgm.GroupMenuCode = tb.groupType
and tb.isActive = 'true' and tb.isOrderCompleted is null

END





END

--execute [VICTULING_GetAndBindDailyMenu] '1/1/2019','30000001','60000001','70000000'

--execute [VICTULING_viewBiteMenu] 1,'2020-11-11','30000023','60000001'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_viewBiteMenu_MA]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_viewBiteMenu_MA] 
@type	int,
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)


as
BEGIN	

IF @type=1
BEGIN
select distinct mgm.GroupMenu,tb.groupType
from T_BiteMenue as tb,[dbo].[M_GroupMenu] as mgm
where tb.date = @date and tb.reason = @reasonCode and tb.wardroom = @wardroomCode and mgm.GroupMenuCode = tb.groupType
and tb.isActive = 'true' 

END





END

--execute [VICTULING_GetAndBindDailyMenu] '1/1/2019','30000001','60000001','70000000'

--execute [VICTULING_viewBiteMenu] '2020-09-17','30000023','60000001','70000026'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_viewBiteMenu_New]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_viewBiteMenu_New] 
@type	int,
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)


as
BEGIN	

IF @type=1
BEGIN
select distinct mgm.GroupMenu,tb.groupType
from T_BiteMenue as tb,[dbo].[M_GroupMenu] as mgm
where tb.date = @date and tb.reason = @reasonCode and tb.wardroom = @wardroomCode and mgm.GroupMenuCode = tb.groupType
and tb.isActive = 'true' and tb.isOrderCompleted is null

END





END

--execute [VICTULING_GetAndBindDailyMenu] '1/1/2019','30000001','60000001','70000000'

--execute [VICTULING_viewBiteMenu] 1,'2020-11-11','30000023','60000001'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_viewBiteMenu_Print]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_viewBiteMenu_Print] 
@type	int,
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)


as
BEGIN	

IF @type=1
BEGIN
select distinct mgm.GroupMenu,tb.groupType
from T_BiteMenue as tb,[dbo].[M_GroupMenu] as mgm
where tb.date = @date and tb.reason = @reasonCode and tb.wardroom = @wardroomCode and mgm.GroupMenuCode = tb.groupType
and tb.isActive = 'true' 

END





END

--execute [VICTULING_GetAndBindDailyMenu] '1/1/2019','30000001','60000001','70000000'

--execute [VICTULING_viewBiteMenu] 1,'2020-11-11','30000023','60000001'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_viewBiteMenuDetails]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_viewBiteMenuDetails] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupType varchar(50)


as
BEGIN	




select tb.mealItem ,tb.remark,tb.offNo,mgm.GroupMenu,mi.reason,tb.remarksNew,mw.wardroomName
from T_BiteMenue as tb,[dbo].[M_GroupMenu] as mgm,[dbo].[M_ItemReason] as mi,[dbo].[M_Wardroom] as mw
where tb.date = @date and tb.reason = @reasonCode and tb.wardroom = @wardroomCode and mgm.GroupMenuCode = tb.groupType
and tb.groupType = @groupType and mi.reasonCode = tb.reason and tb.isActive = 'true'  
and mw.wardroomCode = tb.wardroom





END

--execute [VICTULING_viewBiteMenuDetails] '2020-09-05','30000023','60000001','70000026'



GO
/****** Object:  StoredProcedure [dbo].[VICTULING_ViewDailyMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu Not Authorized
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_ViewDailyMenu] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupMenuCode varchar(50),
@vegiNonVegi varchar(50)

--use for normal menu

as
BEGIN	
if(@groupMenuCode = '')

begin
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and tm.groupMenuCode  =@groupMenuCode and tm.vegiNonVegi =@vegiNonVegi
order by mm.mainItem,mc.mainItemCategory ASC
end

else
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[dbo].[M_MainItem] as mm,[dbo].[M_MainItemCategory] as mc,[dbo].[M_GroupMenu] as mgm
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive  = 'true' and isAuthorized = 'true' and mgm.GroupMenuCode = tm.groupMenuCode and tm.vegiNonVegi =@vegiNonVegi
and tm.groupMenuCode  =@groupMenuCode

order by mm.mainItem,mc.mainItemCategory ASC

END

--execute [VICTULING_GetDailyMenuNotAuthorized] '2018-12-05','30000001','60000001','70000001','Vegetarian'



--execute [VICTULING_GetDailyMenuNotAuthorized] '2018-12-05','30000001','60000001','','Vegetarian'
--execute [VICTULING_GetDailyMenuNotAuthorized] '2019-01-01','30000001','60000001','70000001','Vegetarian'
--execute [VICTULING_GetDailyMenuNotAuthorized] '2019-01-01','30000001','60000001','70000000','Non-Vegetarian'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_ViewDailyMenu_NHQ]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu Not Authorized
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_ViewDailyMenu_NHQ] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50),
@groupMenuCode varchar(50),
@vegiNonVegi varchar(50)

--use for normal menu

as
BEGIN	
if(@groupMenuCode = '')

begin
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [T_DailyMenu] as tm,[M_MainItem] as mm,[M_MainItemCategory] as mc
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive = 'true' and isAuthorized = 'true' and tm.groupMenuCode  =@groupMenuCode and tm.vegiNonVegi =@vegiNonVegi
order by mm.mainItem,mc.mainItemCategory ASC
end

else
select mm.mainItem,mc.mainItemCategory,tm.mainItemCode,tm.remarks
from [NHQ_VICTUALING].[dbo].[T_DailyMenu] as tm,[NHQ_VICTUALING].[dbo].[M_MainItem] as mm,[NHQ_VICTUALING].[dbo].[M_MainItemCategory] as mc,[NHQ_VICTUALING].[dbo].[M_GroupMenu] as mgm
where tm.date = @date and tm.reasonCode = @reasonCode  and wardroomCode = @wardroomCode and mm.mainItemCode = tm.mainItemCode
and mc.mainItemCategoryCode = tm.mealCategory and isActive  = 'true' and isAuthorized = 'true' and mgm.GroupMenuCode = tm.groupMenuCode and tm.vegiNonVegi =@vegiNonVegi
and tm.groupMenuCode  =@groupMenuCode

order by mm.mainItem,mc.mainItemCategory ASC

END

--execute [VICTULING_GetDailyMenuNotAuthorized] '2018-12-05','30000001','60000001','70000001','Vegetarian'



--execute [VICTULING_GetDailyMenuNotAuthorized] '2018-12-05','30000001','60000001','','Vegetarian'
--execute [VICTULING_GetDailyMenuNotAuthorized] '2019-01-01','30000001','60000001','70000001','Vegetarian'
--execute [VICTULING_GetDailyMenuNotAuthorized] '2019-01-01','30000001','60000001','70000000','Non-Vegetarian'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_ViewFullStockItem]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Full Stock Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_ViewFullStockItem] 

as
BEGIN	

select ts.itemCode,mit.itemCatagory,mi.item,ts.currentStock,mm.itemMessurment,ts.reOrderLevel
--,tst.unitPrice,(convert(float,tst.unitPrice)*convert(float,ts.currentStock)) as price

from [dbo].[T_StockQty] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,
[dbo].[M_Wardroom] as mw,[dbo].[M_ItemByCatagory] as mit
--,[dbo].[T_Stock] as tst

where mi.itemCode=ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode and 
mit.itemCatagoryCode = mi.itemCatagoryCode and mw.wardroomCode = ts.wordRoomCode
--and tst.itemCode = ts.itemCode

order by mit.itemCatagory,mi.item ASC

--and mw.wardroomName = 'NHQ' and mi.item = 'Cake Fruits' 




END

--execute [VICTULING_GetOnChargeItemList] '60000001','2017-08-01','309','1'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_ViewIndividualExtraItemByCA]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Menu item list
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_ViewIndividualExtraItemByCA] 
@date date,
@reasonCode varchar(50),
@wardroomCode varchar(50)



as
BEGIN	

select tm.offNo,tm.serviceType,tm.itemCode,mm.item,ts.currentStock ,tm.qty,mme.itemMessurment,tm.id
from [dbo].[T_IndividualExtraItemByCA] as tm,[dbo].[M_Item] as mm,[dbo].[T_StockQty] as ts,[dbo].[M_ItemByMessurment] as mme
where tm.date = @date and tm.reasonCode = @reasonCode  and tm.wardroomCode = @wardroomCode and mm.itemCode = tm.itemCode 
and ts.itemCode = tm.itemCode and mme.itemMessurmentCode = mm.itemMessurmentCode
--and tm.isActive ='true'




END
                                             
--execute [VICTULING_GetAndBindIndividualExtraItemByCA] '2018-09-05','30000001','60000001'






GO
/****** Object:  StoredProcedure [dbo].[VICTULING_ViewMonthlyTeaDetails]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Tea Details
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_ViewMonthlyTeaDetails] 
@wardroom varchar(50),
@year varchar(50),
@month varchar(50)

as
BEGIN	
select mb.branchID ,tp.officialNo,tp.serviceType,mr.rankRate,tp.initials +' ' +tp.surename as name ,tt.teaType ,tt.teaCount,tt.teaID,
CONVERT (varchar(4),DATEPART(Year, tt.teaDate)) + '/' + CONVERT (varchar(2), DATEPART(MONTH, tt.teaDate)) + '/' + CONVERT (varchar(2), DATEPART(DAY, tt.teaDate)) AS teaDate

from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[dbo].[T_TeaMark] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr

where tp.officialNo = tt.officialNo and tp.serviceType = tt.serviceType and tp.officerSailor = tt.officerSailor 
and mr.rankRateCode = tp.rankRateCode and mb.branchCode = tp.branchCode and tt.wardroom = @wardroom and year(tt.teaDate) = @year and month (tt.teaDate) = @month
and tp.isActive = 'true'
order by mr.[priority] ,tp.officialNo,tt.teaDate ASC

end

--execute [VICTULING_ViewMonthlyTeaDetails] '60000001','2020','8'

GO
/****** Object:  StoredProcedure [dbo].[VICTULING_ViewStockItem]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Stock Item
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_ViewStockItem] 
@itemCode varchar(50),
@wordRoomCode varchar(50)



as
BEGIN	

select ts.itemCode,mi.item,ts.currentStock,mm.itemMessurment,ts.reOrderLevel
from [dbo].[T_StockQty] as ts,[dbo].[M_Item] as mi,[dbo].[M_ItemByMessurment] as mm,[dbo].[M_Wardroom] as mw
where mi.itemCode=ts.itemCode and mm.itemMessurmentCode = mi.itemMessurmentCode 
and mw.wardroomCode = @wordRoomCode and mi.itemCode = @itemCode
--and mw.wardroomName = 'NHQ' and mi.item = 'Chicken Breast ' 




END

--execute [VICTULING_ViewStockItem] '40000635','60000001'





GO
/****** Object:  StoredProcedure [dbo].[VICTULING_ViewTeaDetails]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Lt(IT) WHK Gunasoma,NRT 3147
-- Description: View Tea Details
-- =============================================
CREATE PROCEDURE [dbo].[VICTULING_ViewTeaDetails] 
@wardroom varchar(50),
@teaDate date

as
BEGIN	
select mb.branchID ,tp.officialNo,tp.serviceType,mr.rankRate,tp.initials +' ' +tp.surename as name ,tt.teaType ,tt.teaCount,tt.teaID

from [10.10.1.215].[HRISLIVE].[dbo].[HRIS_T_personalData] as tp,[dbo].[T_TeaMark] as tt,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_branch] as mb
,[10.10.1.215].[HRISLIVE].[dbo].[HRIS_M_rankRate] as mr

where tp.officialNo = tt.officialNo and tp.serviceType = tt.serviceType and tp.officerSailor = tt.officerSailor 
and mr.rankRateCode = tp.rankRateCode and mb.branchCode = tp.branchCode and tt.wardroom = @wardroom and tt.teaDate = @teaDate
and tp.isActive = 'true'
order by mr.[priority] ,tp.officialNo ASC

end

GO
/****** Object:  StoredProcedure [dbo].[Victulling_Save_New_Curry_Item]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		LT(IT) KMUL Bandara,NRT 3352
-- Description: Use to create new curry item
-- =============================================
CREATE PROCEDURE [dbo].[Victulling_Save_New_Curry_Item]  
@itemCode varchar(50),
@item varchar(250),
@unitPrice float,
@remarks varchar(250),
@wardroomCode varchar(50),
@createdUser varchar(70),
@createdDate datetime,
@updateUser varchar (70),
@updateDate datetime,
@Type int
                                                              
AS

BEGIN

if(@Type = 1)
begin

	INSERT INTO [dbo].[T_CurryItem]
            (   itemCode ,
				item,	
				portionPrice,
				remarks,	
				wardroomCode,
				createdUser ,
				createdDate ,
				updateUser,
				updateDate

           )
VALUES
		( @itemCode ,
@item ,
@unitPrice ,
@remarks ,
@wardroomCode ,
@createdUser ,
@createdDate ,
@updateUser ,
@updateDate 
			 

)
end

if(@type = 2)
begin 
update [dbo].[T_CurryItem] set 
				
				portionPrice = @unitPrice,
				remarks = @remarks,
				wardroomCode = @wardroomCode ,				
				updateUser = @updateUser,
				updateDate = @updateDate
				where ItemCode = @itemCode and item = @item
end
END





GO
/****** Object:  Table [dbo].[a]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[a](
	[itemCode] [varchar](50) NOT NULL,
	[itemId] [varchar](50) NULL,
	[item] [varchar](250) NULL,
	[unitPrice] [varchar](50) NULL,
	[saleQty] [float] NULL,
	[itemMessurment] [varchar](100) NOT NULL,
	[recevedFrom] [varchar](50) NULL,
	[transID] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_BlockNo_List]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_BlockNo_List](
	[blockID] [int] NOT NULL,
	[blockNo] [varchar](50) NOT NULL,
	[createduser] [varchar](50) NULL,
	[cratedDate] [datetime] NULL,
 CONSTRAINT [PK_M_BlockNo_List] PRIMARY KEY CLUSTERED 
(
	[blockID] ASC,
	[blockNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_Branch]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Branch](
	[branchCode] [varchar](20) NOT NULL,
	[branchID] [varchar](20) NOT NULL,
	[branchName] [varchar](100) NOT NULL,
	[createUser] [varchar](30) NULL,
	[CreateDate] [datetime] NULL,
	[lastModifiedUser] [varchar](30) NULL,
	[lastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_HRIS_M_branch] PRIMARY KEY CLUSTERED 
(
	[branchCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_CabinNo_List]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_CabinNo_List](
	[blockID] [int] NOT NULL,
	[cabinID] [int] NOT NULL,
	[cabinNo] [varchar](50) NOT NULL,
	[cabinType] [varchar](50) NULL,
	[telephoneNo] [int] NULL,
	[createduser] [varchar](50) NULL,
	[cratedDate] [datetime] NULL,
 CONSTRAINT [PK_M_CabinNo_List_1] PRIMARY KEY CLUSTERED 
(
	[cabinID] ASC,
	[cabinNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_CashBookReason]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_CashBookReason](
	[cId] [int] IDENTITY(1,1) NOT NULL,
	[descriptionCode] [varchar](50) NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_M_CashBookReason] PRIMARY KEY CLUSTERED 
(
	[cId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_GroupMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_GroupMenu](
	[GroupMenuCode] [varchar](50) NULL,
	[GroupMenu] [varchar](50) NULL,
	[createdUser] [varchar](100) NULL,
	[createdDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_Ingredients]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Ingredients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mainItemCode] [varchar](50) NULL,
	[ingredientsCode] [varchar](50) NULL,
	[qty] [varchar](50) NULL,
	[messurment] [varchar](50) NULL,
	[wardroom] [varchar](50) NULL,
	[createdUser] [varchar](50) NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_M_Ingredients] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_Item]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Item](
	[itemCode] [varchar](50) NOT NULL,
	[item] [varchar](250) NULL,
	[itemCatagoryCode] [varchar](50) NULL,
	[itemMessurmentCode] [varchar](50) NULL,
	[mainItemCode] [varchar](50) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[m_item] [varchar](250) NULL,
	[isIngredients] [bit] NULL,
 CONSTRAINT [PK_T_Item] PRIMARY KEY CLUSTERED 
(
	[itemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_ItemByCatagory]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_ItemByCatagory](
	[itemCatagoryCode] [varchar](50) NOT NULL,
	[itemCatagory] [varchar](100) NOT NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_M_ItemByMessurment] PRIMARY KEY CLUSTERED 
(
	[itemCatagoryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_ItemByMessurment]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_ItemByMessurment](
	[itemMessurmentCode] [varchar](50) NOT NULL,
	[itemMessurment] [varchar](100) NOT NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_M_ItemByMessurment_1] PRIMARY KEY CLUSTERED 
(
	[itemMessurmentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_ItemReason]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_ItemReason](
	[reasonCode] [varchar](50) NOT NULL,
	[reason] [varchar](100) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_M_ItemReason] PRIMARY KEY CLUSTERED 
(
	[reasonCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_MainItem]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_MainItem](
	[mainItemCode] [varchar](50) NULL,
	[mainItem] [varchar](100) NULL,
	[mainItemCategoryCode] [varchar](50) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_MainItemCategory]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_MainItemCategory](
	[mainItemCategoryCode] [varchar](50) NULL,
	[mainItemCategory] [varchar](70) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_Rank]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Rank](
	[rankCode] [varchar](20) NOT NULL,
	[rankShort] [varchar](20) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[isActive] [bit] NULL,
	[createUser] [varchar](30) NULL,
	[createDate] [datetime] NULL,
	[lastModifiedUser] [varchar](30) NULL,
	[lastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_HRIS_M_rankRate] PRIMARY KEY CLUSTERED 
(
	[rankCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_ServiceType]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_ServiceType](
	[serviceTypeCode] [varchar](10) NOT NULL,
	[serviceType] [varchar](25) NOT NULL,
	[isActive] [bit] NULL,
	[createUser] [varchar](30) NULL,
	[createDate] [datetime] NULL,
	[lastModifiedUser] [varchar](30) NULL,
	[lastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_M_ServiceType] PRIMARY KEY CLUSTERED 
(
	[serviceTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[M_Wardroom]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Wardroom](
	[wardroomCode] [varchar](50) NULL,
	[wardroomName] [varchar](150) NULL,
	[createdUser] [varchar](50) NULL,
	[createdDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Monthly304Data]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Monthly304Data](
	[O/S] [varchar](50) NULL,
	[S/T] [varchar](50) NULL,
	[OFFNO] [varchar](50) NULL,
	[S/A] [int] NULL,
	[RA] [int] NULL,
	[T/A] [int] NULL,
	[VIC] [int] NULL,
	[baseCode] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[priceChange]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[priceChange](
	[temp] [int] NULL,
	[price] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[priceList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[priceList](
	[recordID] [int] NULL,
	[item] [varchar](50) NULL,
	[qty] [int] NULL,
	[untPrice] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_309AnnualPriceList]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_309AnnualPriceList](
	[itemId] [int] IDENTITY(1,1) NOT NULL,
	[itemCode] [varchar](50) NOT NULL,
	[unitPrice] [varchar](50) NOT NULL,
	[denomination] [varchar](50) NULL,
	[itemMessurmentCode] [varchar](50) NOT NULL,
	[onChargeDate] [date] NOT NULL,
	[recevedFrom] [varchar](50) NOT NULL,
	[year] [int] NOT NULL,
	[wordRoomCode] [varchar](50) NOT NULL,
	[createdUser] [varchar](70) NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_BankDeposit]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BankDeposit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[depositType] [varchar](250) NULL,
	[slipNumber] [varchar](250) NULL,
	[depositValue] [decimal](18, 2) NULL,
	[depositDate] [date] NULL,
	[createdUser] [varchar](250) NULL,
	[createdDate] [varchar](250) NULL,
 CONSTRAINT [PK_T_BankDeposit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_BillDiscount]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BillDiscount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[billNo] [varchar](500) NULL,
	[recevedFrom] [varchar](500) NULL,
	[onChargeDate] [date] NULL,
	[discountPrice] [decimal](18, 2) NULL,
	[createdUser] [varchar](50) NULL,
	[createdDate] [date] NULL,
 CONSTRAINT [PK_T_BillDiscount] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_BiteMenue]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_BiteMenue](
	[date] [date] NULL,
	[wardroom] [varchar](50) NULL,
	[reason] [varchar](50) NULL,
	[vegNonVeg] [varchar](50) NULL,
	[groupType] [varchar](50) NULL,
	[mealItem] [varchar](50) NULL,
	[remark] [varchar](50) NULL,
	[offNo] [varchar](50) NULL,
	[createdDate] [datetime] NULL,
	[createdUser] [varchar](250) NULL,
	[isActive] [bit] NULL,
	[remarksNew] [nvarchar](4000) NULL,
	[isOrderCompleted] [bit] NULL,
	[lastModifiedUser] [varchar](250) NULL,
	[lastModifiedDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CabinAllocation]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CabinAllocation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[blockNo] [varchar](50) NOT NULL,
	[cabinNo] [varchar](50) NOT NULL,
	[cabinTelephoneNo] [nchar](10) NULL,
	[telephoneNo] [int] NULL,
	[officialNo] [varchar](50) NOT NULL,
	[branch] [int] NULL,
	[name] [varchar](500) NULL,
	[livingInOut] [varchar](50) NULL,
	[permanentTemporary] [varchar](50) NULL,
	[isActive] [bit] NULL,
	[remarks] [varchar](500) NULL,
	[fromDate] [date] NULL,
	[toDate] [date] NULL,
	[status] [bit] NULL,
	[serviceType] [varchar](50) NULL,
	[createdUser] [varchar](50) NULL,
	[craetdDate] [datetime] NULL,
	[lastModifidUser] [varchar](50) NULL,
	[lastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_T_CabinAllocation_1] PRIMARY KEY CLUSTERED 
(
	[cabinNo] ASC,
	[officialNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CashBook]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CashBook](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[BalanceBF] [decimal](18, 2) NULL,
	[Purchasing] [decimal](18, 2) NULL,
	[bankDeposit] [decimal](18, 2) NULL,
	[cashSale] [decimal](18, 2) NULL,
	[BalanceCF] [decimal](18, 2) NULL,
	[createdUser] [varchar](50) NULL,
	[createdDate] [date] NULL,
 CONSTRAINT [PK_T_CashBook] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CashBookDetails]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CashBookDetails](
	[transId] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[wardroom] [varchar](50) NOT NULL,
	[description] [varchar](300) NOT NULL,
	[remarks] [varchar](500) NOT NULL,
	[creditDebit] [varchar](50) NULL,
	[cost] [decimal](18, 2) NULL,
	[createdUser] [varchar](500) NULL,
	[createdDate] [datetime] NULL,
	[is Authorized] [bit] NULL,
	[lastModifiedUser] [varchar](500) NULL,
	[lastModifiedDate] [datetime] NULL,
	[specialRemark] [varchar](3000) NULL,
 CONSTRAINT [PK_T_CashBookDetails] PRIMARY KEY CLUSTERED 
(
	[transId] ASC,
	[date] ASC,
	[wardroom] ASC,
	[description] ASC,
	[remarks] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CivilPersonalDetails]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CivilPersonalDetails](
	[officialNo] [int] IDENTITY(1,1) NOT NULL,
	[initial] [varchar](50) NULL,
	[surname] [varchar](250) NULL,
	[rank] [varchar](50) NULL,
	[serviceType] [varchar](50) NULL,
	[permentBase] [varchar](200) NULL,
	[temporaryBase] [varchar](200) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_T_CivilPersonalDetails] PRIMARY KEY CLUSTERED 
(
	[officialNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_CurryItem]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_CurryItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ItemCode] [varchar](50) NULL,
	[item] [varchar](250) NULL,
	[portionPrice] [decimal](18, 2) NULL,
	[remarks] [varchar](500) NULL,
	[wardroomCode] [varchar](50) NULL,
	[createdUser] [varchar](150) NULL,
	[createdDate] [date] NULL,
	[updateUser] [varchar](150) NULL,
	[updateDate] [date] NULL,
 CONSTRAINT [PK_T_CurryItem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_customizeMealAttendance]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_customizeMealAttendance](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[mealDate] [date] NULL,
	[officialNo] [int] NULL,
	[officerSailor] [varchar](1) NULL,
	[serviceType] [varchar](10) NULL,
	[reason] [varchar](50) NULL,
	[vegetarian] [bit] NULL,
	[noneVegetarian] [bit] NULL,
	[mealIn] [bit] NULL,
	[mealOut] [bit] NULL,
	[mealCount] [int] NULL,
	[baseCode] [varchar](50) NULL,
	[wardroom] [varchar](50) NULL,
	[selectedMeal] [varchar](700) NULL,
	[remarks] [varchar](700) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_T_customizeMealAttendance] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DailyExtraSales]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DailyExtraSales](
	[transID] [int] IDENTITY(1,1) NOT NULL,
	[saleDate] [date] NULL,
	[itemCode] [varchar](50) NULL,
	[itemId] [varchar](50) NULL,
	[saleQty] [varchar](50) NULL,
	[unitPrice] [varchar](50) NULL,
	[totalCost] [varchar](50) NULL,
	[recevedFrom] [varchar](50) NULL,
	[reasonCode] [varchar](50) NULL,
	[nic] [varchar](20) NULL,
	[offNo] [int] NULL,
	[officerSailor] [varchar](1) NULL,
	[serviceType] [varchar](50) NULL,
	[wardroomCode] [varchar](50) NULL,
	[currentBase] [varchar](50) NULL,
	[permantBase] [varchar](50) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [smalldatetime] NULL,
	[billNo] [varchar](100) NULL,
	[isPrinted] [char](1) NULL,
	[groupType] [varchar](50) NULL,
	[takenBy] [varchar](250) NULL,
	[rankRate] [varchar](150) NULL,
	[offNoSailor] [varchar](50) NULL,
	[osSailor] [varchar](50) NULL,
	[serviceTypeSailor] [varchar](50) NULL,
	[vegNonVeg] [varchar](50) NULL,
	[NewBillID] [varchar](200) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DailyMenu]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DailyMenu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[mealCategory] [varchar](50) NULL,
	[mainItemCode] [varchar](50) NULL,
	[reasonCode] [varchar](50) NULL,
	[groupMenuCode] [varchar](50) NULL,
	[wardroomCode] [varchar](50) NULL,
	[vegiNonVegi] [varchar](50) NULL,
	[remarks] [varchar](500) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[lastmodifiedUser] [varchar](70) NULL,
	[lastmodifiedDate] [datetime] NULL,
	[isActive] [bit] NULL,
	[isAuthorized] [bit] NULL,
	[authorizedUser] [varchar](70) NULL,
	[authorizedDate] [datetime] NULL,
 CONSTRAINT [PK_T_DailyMenu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DailyMenuSales]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DailyMenuSales](
	[transID] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[itemCode] [varchar](50) NULL,
	[saleQty] [varchar](50) NULL,
	[unitPrice] [varchar](50) NULL,
	[price] [varchar](50) NULL,
	[vegi] [varchar](50) NULL,
	[recevedFrom] [varchar](50) NULL,
	[reasonCode] [varchar](50) NULL,
	[wordRoomCode] [varchar](50) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[lastModifiedUser] [varchar](70) NULL,
	[lastModifiedDate] [datetime] NULL,
	[partyName] [varchar](500) NULL,
	[menuType] [varchar](50) NULL,
 CONSTRAINT [PK_T_DailyMenuSales] PRIMARY KEY CLUSTERED 
(
	[transID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DailySaleSummary]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DailySaleSummary](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[serialNo] [int] NULL,
	[ItemCode] [int] NOT NULL,
	[Item] [varchar](100) NOT NULL,
	[SaleQty] [decimal](18, 3) NOT NULL,
	[Messurment] [varchar](100) NOT NULL,
	[reason] [varchar](100) NOT NULL,
	[groupMenue] [varchar](100) NOT NULL,
	[saleDate] [date] NOT NULL,
	[wardroomCode] [varchar](50) NOT NULL,
	[createdUser] [varchar](100) NULL,
	[craetdDate] [datetime] NULL,
 CONSTRAINT [PK_T_DailySaleSummary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DailySaleSummary_withPrice]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DailySaleSummary_withPrice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[serialNo] [int] NULL,
	[ItemCode] [int] NOT NULL,
	[Item] [varchar](100) NOT NULL,
	[SaleQty] [decimal](18, 3) NOT NULL,
	[Messurment] [varchar](100) NOT NULL,
	[unitPrice] [decimal](18, 3) NULL,
	[price] [decimal](18, 3) NULL,
	[reason] [varchar](100) NOT NULL,
	[groupMenue] [varchar](100) NOT NULL,
	[saleDate] [date] NOT NULL,
	[wardroomCode] [varchar](50) NOT NULL,
	[createdUser] [varchar](100) NULL,
	[craetdDate] [datetime] NULL,
 CONSTRAINT [PK_T_DailySaleSummary_withPrice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_DepreciationItems]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_DepreciationItems](
	[depreciationID] [int] IDENTITY(1,1) NOT NULL,
	[depreciationDate] [date] NULL,
	[itemCode] [varchar](50) NULL,
	[depreciationQty] [varchar](50) NULL,
	[unitPrice] [varchar](50) NULL,
	[price] [varchar](50) NULL,
	[recevedFrom] [varchar](50) NULL,
	[reasonCode] [varchar](50) NULL,
	[wordRoomCode] [varchar](50) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[isAuthorized] [bit] NULL,
	[authorizedBy] [varchar](70) NULL,
	[authorizedDate] [datetime] NULL,
	[remarks] [varchar](500) NULL,
	[billNo] [int] NULL,
 CONSTRAINT [PK_T_DepreciationItems] PRIMARY KEY CLUSTERED 
(
	[depreciationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_FinalRecovery]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_FinalRecovery](
	[SysCode] [varchar](50) NULL,
	[CatCode] [varchar](50) NULL,
	[OfficialNo] [int] NULL,
	[Amount] [decimal](18, 3) NULL,
	[createdUser] [varchar](250) NULL,
	[createdDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_FinalRecovery_Dining_Wine]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_FinalRecovery_Dining_Wine](
	[branchID] [varchar](50) NOT NULL,
	[officialNo] [int] NOT NULL,
	[rankRate] [varchar](50) NULL,
	[name] [varchar](200) NULL,
	[individualTotalCost] [decimal](18, 2) NULL,
	[noOfDays] [int] NULL,
	[costPerDay] [decimal](18, 2) NULL,
	[creditDebit] [decimal](18, 2) NULL,
	[Messsub] [decimal](18, 2) NULL,
	[barBill] [decimal](18, 2) NULL,
	[TotRecovery] [decimal](18, 2) NULL,
	[priority] [int] NULL,
	[isAuthorized] [bit] NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[wardroom] [varchar](50) NULL,
	[year] [int] NOT NULL,
	[month] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_GroupMenuAttendance]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_GroupMenuAttendance](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[offNo] [int] NULL,
	[serviceType] [varchar](50) NULL,
	[officerSailor] [varchar](50) NULL,
	[date] [date] NULL,
	[mealCategory] [varchar](50) NULL,
	[mainItemCode] [varchar](50) NULL,
	[reasonCode] [varchar](50) NULL,
	[wardroomCode] [varchar](50) NULL,
	[remarks] [varchar](500) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[lastmodifiedUser] [varchar](70) NULL,
	[lastmodifiedDate] [datetime] NULL,
	[isActive] [bit] NULL,
 CONSTRAINT [PK_T_GroupMenuAttendance] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_GroupMenuItemByCA]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_GroupMenuItemByCA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[serviceType] [varchar](50) NULL,
	[offNo] [int] NULL,
	[date] [date] NULL,
	[reasonCode] [int] NULL,
	[wardroomCode] [int] NULL,
	[itemCode] [varchar](50) NULL,
	[qty] [varchar](50) NULL,
	[itemMessurmentCode] [varchar](50) NULL,
	[isActive] [bit] NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[lastmodifiedUser] [varchar](70) NULL,
	[lastmodifiedDate] [datetime] NULL,
 CONSTRAINT [PK_T_GroupMenuItem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_GroupMenuListItem]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_GroupMenuListItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[reasonCode] [varchar](50) NULL,
	[groupTypeCode] [varchar](50) NULL,
	[wardroomCode] [varchar](50) NULL,
	[itemCode] [varchar](50) NULL,
	[currentStock] [varchar](50) NULL,
	[qty] [varchar](50) NULL,
	[messurment] [varchar](50) NULL,
	[isActive] [bit] NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[lastModifiedUser] [varchar](70) NULL,
	[lastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_T_GroupMenuListItem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_IndividualBasic]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_IndividualBasic](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[officialNo] [varchar](250) NULL,
	[serviceType] [varchar](250) NULL,
	[OS] [char](10) NULL,
	[vegetarian] [bit] NULL,
	[mealIn] [bit] NULL,
	[baseCode] [varchar](250) NULL,
	[wardroom] [varchar](250) NULL,
	[createdUser] [varchar](250) NULL,
	[createdDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_IndividualExtraItemByCA]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_IndividualExtraItemByCA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[serviceType] [varchar](50) NULL,
	[offNo] [int] NULL,
	[date] [date] NULL,
	[reasonCode] [int] NULL,
	[wardroomCode] [int] NULL,
	[itemCode] [varchar](50) NULL,
	[qty] [varchar](50) NULL,
	[itemMessurmentCode] [varchar](50) NULL,
	[isActive] [bit] NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[lastmodifiedUser] [varchar](70) NULL,
	[lastmodifiedDate] [datetime] NULL,
 CONSTRAINT [PK_T_IndividualExtraItemByCA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_ItemSummary]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_ItemSummary](
	[itemCode] [varchar](50) NULL,
	[item] [varchar](50) NULL,
	[saleQty] [varchar](20) NULL,
	[itemMessurment] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Login]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Login](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[nicNo] [varchar](50) NOT NULL,
	[Initial] [varchar](50) NULL,
	[surName] [varchar](50) NULL,
	[rankCode] [varchar](50) NULL,
	[branchCode] [varchar](50) NULL,
	[offNo] [varchar](50) NOT NULL,
	[serviceType] [varchar](15) NULL,
	[eMail] [varchar](100) NULL,
	[userName] [varchar](100) NOT NULL,
	[password] [varchar](max) NULL,
	[rePassword] [varchar](max) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[lastModifiedUser] [varchar](50) NULL,
	[lastModifiedDate] [date] NULL,
	[roll] [varchar](5) NULL,
	[baseCode] [nchar](50) NULL,
	[baseName] [nchar](100) NULL,
 CONSTRAINT [PK_T_Login_1] PRIMARY KEY CLUSTERED 
(
	[nicNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_MealAttendance]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_MealAttendance](
	[mealId] [int] IDENTITY(1,1) NOT NULL,
	[mealDate] [date] NULL,
	[officialNo] [int] NULL,
	[officerSailor] [varchar](1) NULL,
	[serviceType] [varchar](10) NULL,
	[reason] [varchar](50) NULL,
	[groupMenuCode] [varchar](50) NULL,
	[vegetarian] [bit] NULL,
	[noneVegetarian] [bit] NULL,
	[mealIn] [bit] NULL,
	[mealOut] [bit] NULL,
	[mealCount] [int] NULL,
	[baseCode] [varchar](50) NULL,
	[wardroom] [varchar](50) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[lastmodifiedUser] [varchar](70) NULL,
	[lastmodifiedDate] [datetime] NULL,
	[mealInCheck] [bit] NULL,
 CONSTRAINT [PK_T_MealAttendance] PRIMARY KEY CLUSTERED 
(
	[mealId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_MealItemsSaleBySA]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_MealItemsSaleBySA](
	[date] [date] NULL,
	[wardroom] [varchar](70) NULL,
	[reason] [varchar](70) NULL,
	[menuType] [varchar](70) NULL,
	[vegNveg] [varchar](70) NULL,
	[itemCode] [int] NULL,
	[item] [varchar](500) NULL,
	[qty] [decimal](18, 5) NULL,
	[itemMessurment] [varchar](50) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[lastModifiedUser] [varchar](70) NULL,
	[lastModifiedDate] [datetime] NULL,
	[GroupMenuCode] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_MenuListItem]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_MenuListItem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[reasonCode] [varchar](50) NOT NULL,
	[wardroom] [varchar](50) NOT NULL,
	[vegi] [varchar](50) NULL,
	[itemCode] [varchar](50) NOT NULL,
	[currentStock] [varchar](50) NULL,
	[qty] [varchar](50) NULL,
	[messurment] [varchar](50) NULL,
	[isActive] [bit] NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[lastModifiedUser] [varchar](70) NULL,
	[lastModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_T_MenuListItem_1] PRIMARY KEY CLUSTERED 
(
	[date] ASC,
	[reasonCode] ASC,
	[wardroom] ASC,
	[itemCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Mobile_MealAttendance_Status]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Mobile_MealAttendance_Status](
	[mealId] [int] NOT NULL,
	[acknowledgeStatus] [bit] NULL,
	[createdUser] [nvarchar](70) NULL,
	[createdDate] [datetime] NULL,
	[lastmodifiedUser] [nvarchar](70) NULL,
	[lastmodifiedDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_MonthlyBarBill]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_MonthlyBarBill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[offno] [int] NOT NULL,
	[rank] [varchar](50) NULL,
	[initial] [varchar](50) NULL,
	[name] [varchar](100) NULL,
	[barBill] [decimal](18, 2) NULL,
	[baseCode] [int] NOT NULL,
	[year] [int] NOT NULL,
	[month] [int] NOT NULL,
	[insert] [bit] NULL,
	[createdUser] [varchar](100) NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_T_MonthlyBarBill] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[offno] ASC,
	[baseCode] ASC,
	[year] ASC,
	[month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_MonthlyMessSub]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_MonthlyMessSub](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[branchID] [varchar](50) NOT NULL,
	[officialNo] [int] NOT NULL,
	[rankRate] [varchar](50) NULL,
	[name] [varchar](100) NULL,
	[individualTotalCost] [nchar](10) NULL,
	[creditDebit] [nchar](10) NULL,
	[messsub] [decimal](18, 2) NULL,
	[barBill] [nchar](10) NULL,
	[TotRecovery] [nchar](10) NULL,
	[wardroom] [varchar](100) NULL,
	[year] [int] NOT NULL,
	[month] [int] NOT NULL,
	[createdUser] [varchar](100) NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_T_MonthlyMessSub_1] PRIMARY KEY CLUSTERED 
(
	[branchID] ASC,
	[officialNo] ASC,
	[year] ASC,
	[month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_MonthlyTeaCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_MonthlyTeaCost](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NULL,
	[month] [int] NULL,
	[teaCost] [varchar](50) NULL,
	[plainTeaCost] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_PartyCostByIndividual]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_PartyCostByIndividual](
	[partyDate] [date] NOT NULL,
	[wardroom] [varchar](50) NOT NULL,
	[reason] [varchar](50) NOT NULL,
	[groupType] [varchar](50) NOT NULL,
	[veg] [varchar](50) NOT NULL,
	[totalMenuCost] [decimal](18, 2) NULL,
	[noOfPerson] [int] NULL,
	[offNo] [int] NOT NULL,
	[OS] [varchar](10) NULL,
	[perHeadCost] [decimal](18, 2) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[partyName] [varchar](100) NULL,
 CONSTRAINT [PK_T_PartyCostByIndividual_1] PRIMARY KEY CLUSTERED 
(
	[partyDate] ASC,
	[wardroom] ASC,
	[reason] ASC,
	[groupType] ASC,
	[veg] ASC,
	[offNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_PendingRecovery]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_PendingRecovery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[offno] [int] NULL,
	[serviceType] [varchar](50) NULL,
	[prndingDinning] [varchar](50) NULL,
	[pendingWine] [varchar](50) NULL,
	[pendingYear] [int] NULL,
	[pendingMonth] [varchar](50) NULL,
	[recoverDiningAmmount] [varchar](50) NULL,
	[recoverWineAmmount] [varchar](50) NULL,
	[recoverYear] [int] NULL,
	[recoverMonth] [varchar](50) NULL,
	[wardroom] [varchar](50) NULL,
	[createdUser] [varchar](500) NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_T_PendingRecovery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_RejectedMeal]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_RejectedMeal](
	[rejectedDate] [varchar](50) NULL,
	[officerSailor] [varchar](1) NULL,
	[serviceType] [varchar](10) NULL,
	[officialNo] [int] NULL,
	[itemCode] [varchar](50) NULL,
	[reasonCode] [varchar](50) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Stock]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Stock](
	[itemId] [int] IDENTITY(1,1) NOT NULL,
	[itemCode] [varchar](50) NULL,
	[onChargeDate] [date] NULL,
	[recevedFrom] [varchar](50) NULL,
	[billNo] [varchar](50) NULL,
	[unitPrice] [varchar](50) NULL,
	[onChargeQty] [varchar](50) NULL,
	[itemMessurmentCode] [varchar](50) NULL,
	[CurrentQty] [varchar](50) NULL,
	[wordRoomCode] [varchar](50) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[isActive] [bit] NULL,
	[lastmodifiedUser] [varchar](70) NULL,
	[lastmodifiedDate] [datetime] NULL,
	[reason] [varchar](70) NULL,
	[takenBy] [varchar](250) NULL,
	[offNo] [varchar](50) NULL,
	[serviceType] [varchar](50) NULL,
	[os] [varchar](50) NULL,
	[rankRate] [varchar](150) NULL,
	[ToOffNo] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_StockQty]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_StockQty](
	[itemID] [int] IDENTITY(1,1) NOT NULL,
	[itemCode] [varchar](50) NULL,
	[currentStock] [varchar](50) NULL,
	[reOrderLevel] [varchar](50) NULL,
	[wordRoomCode] [varchar](50) NULL,
	[createdUser] [varchar](100) NULL,
	[createdDate] [datetime] NULL,
	[lastmodifiedUser] [varchar](70) NULL,
	[lastmodifiedDate] [datetime] NULL,
 CONSTRAINT [PK_T_StockQty] PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_TeaMark]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_TeaMark](
	[teaID] [int] IDENTITY(1,1) NOT NULL,
	[officialNo] [int] NULL,
	[officerSailor] [varchar](1) NULL,
	[serviceType] [varchar](5) NULL,
	[teaDate] [date] NULL,
	[wardroom] [varchar](50) NULL,
	[teaCount] [int] NULL,
	[teaType] [varchar](20) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Temp_Victualing]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Temp_Victualing](
	[itemCode] [nvarchar](50) NULL,
	[itemId] [nvarchar](50) NULL,
	[item] [nvarchar](50) NULL,
	[unitPrice] [decimal](18, 2) NULL,
	[saleQty] [decimal](18, 5) NULL,
	[itemMessurment] [nvarchar](50) NULL,
	[recevedFrom] [nvarchar](50) NULL,
	[transID] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_TotalIndividualCostPerMonth]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_TotalIndividualCostPerMonth](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[officialNo] [int] NOT NULL,
	[serviceType] [varchar](10) NOT NULL,
	[OS] [varchar](1) NOT NULL,
	[wardroom] [varchar](50) NOT NULL,
	[year] [int] NOT NULL,
	[month] [varchar](50) NOT NULL,
	[totalMenuCost] [float] NULL,
	[extraTotalCost] [float] NULL,
	[plainTeaCost] [float] NULL,
	[TeaCost] [float] NULL,
	[individualTotalCost] [float] NULL,
	[noOfDays] [int] NULL,
	[costPerDay] [float] NULL,
	[creditDebit] [float] NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[noOfSeaDays] [int] NULL,
	[costPerSeaDay] [float] NULL,
 CONSTRAINT [PK_T_TotalIndividualCostPerMonth] PRIMARY KEY CLUSTERED 
(
	[officialNo] ASC,
	[serviceType] ASC,
	[OS] ASC,
	[wardroom] ASC,
	[year] ASC,
	[month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_TotalMenuCost]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_TotalMenuCost](
	[costId] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[reason] [varchar](50) NOT NULL,
	[groupMenuCode] [varchar](50) NOT NULL,
	[wardroom] [varchar](50) NULL,
	[vegi] [varchar](50) NOT NULL,
	[totalCost] [float] NULL,
	[noOfPersons] [int] NULL,
	[costPerPerson] [float] NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[lastModifiedUser] [varchar](70) NULL,
	[lastModifiedDate] [datetime] NULL,
	[isAuthrized] [bit] NULL,
 CONSTRAINT [PK_T_TotalMenuCost_1] PRIMARY KEY CLUSTERED 
(
	[date] ASC,
	[reason] ASC,
	[groupMenuCode] ASC,
	[vegi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_TotalMonthlyAllDetails]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_TotalMonthlyAllDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[serviceType] [varchar](50) NOT NULL,
	[branch] [varchar](50) NOT NULL,
	[offNo] [varchar](50) NOT NULL,
	[rank] [varchar](50) NULL,
	[name] [varchar](500) NULL,
	[wardroom] [varchar](50) NOT NULL,
	[year] [int] NOT NULL,
	[month] [int] NOT NULL,
	[vegMenuCost] [varchar](50) NULL,
	[nVegMenuCost] [varchar](50) NULL,
	[extraCost] [varchar](50) NULL,
	[partyCost] [varchar](50) NULL,
	[teaCount] [varchar](50) NULL,
	[teaCost] [varchar](50) NULL,
	[plainTeaCount] [int] NULL,
	[plainTeaCost] [varchar](50) NULL,
	[totalCost] [varchar](50) NULL,
	[noDaysInBase] [varchar](50) NULL,
	[creditDebit] [varchar](50) NULL,
	[createdUser] [varchar](250) NULL,
	[createdDate] [datetime] NULL,
	[noDaysInSea] [varchar](50) NULL,
	[noDaysInBaseNew] [varchar](50) NULL,
 CONSTRAINT [PK_T_TotalMonthlyAllDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[serviceType] ASC,
	[branch] ASC,
	[offNo] ASC,
	[wardroom] ASC,
	[year] ASC,
	[month] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tempA8]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempA8](
	[transID] [int] IDENTITY(1,1) NOT NULL,
	[saleDate] [date] NULL,
	[itemCode] [varchar](50) NULL,
	[itemId] [varchar](50) NULL,
	[saleQty] [varchar](50) NULL,
	[unitPrice] [varchar](50) NULL,
	[totalCost] [varchar](50) NULL,
	[recevedFrom] [varchar](50) NULL,
	[reasonCode] [varchar](50) NULL,
	[nic] [varchar](20) NULL,
	[offNo] [int] NULL,
	[officerSailor] [varchar](1) NULL,
	[serviceType] [varchar](50) NULL,
	[wardroomCode] [varchar](50) NULL,
	[currentBase] [varchar](50) NULL,
	[permantBase] [varchar](50) NULL,
	[createdUser] [varchar](70) NULL,
	[createdDate] [datetime] NULL,
	[billNo] [varchar](100) NULL,
	[isPrinted] [char](1) NULL,
	[groupType] [varchar](50) NULL,
	[takenBy] [varchar](250) NULL,
	[rankRate] [varchar](150) NULL,
	[offNoSailor] [varchar](50) NULL,
	[osSailor] [varchar](50) NULL,
	[serviceTypeSailor] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TempMonthly304Data]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TempMonthly304Data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SN] [int] NULL,
	[OS] [varchar](50) NULL,
	[ST] [varchar](50) NULL,
	[NAME] [varchar](100) NULL,
	[INITIAL] [varchar](50) NULL,
	[OFFNO] [int] NOT NULL,
	[RANK] [varchar](50) NULL,
	[SM] [varchar](50) NULL,
	[INDATE] [varchar](50) NULL,
	[OUTDATE] [varchar](50) NULL,
	[INFORM] [varchar](50) NULL,
	[OUTTO] [varchar](50) NULL,
	[SC] [varchar](50) NULL,
	[SA] [varchar](50) NULL,
	[RA] [int] NULL,
	[TA] [int] NULL,
	[VIC] [int] NULL,
	[BASE] [varchar](50) NULL,
	[YEAR] [int] NOT NULL,
	[MONTH] [int] NOT NULL,
	[createdDate] [datetime] NULL,
	[createdUser] [varchar](100) NULL,
	[noDaysInSea] [varchar](50) NULL,
	[noDaysInBaseNew] [varchar](50) NULL,
 CONSTRAINT [PK_TempMonthly304Data] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[OFFNO] ASC,
	[YEAR] ASC,
	[MONTH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tempRecovery_Dining_Wine]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempRecovery_Dining_Wine](
	[branchID] [varchar](50) NULL,
	[officialNo] [int] NULL,
	[rankRate] [varchar](50) NULL,
	[name] [varchar](200) NULL,
	[individualTotalCost] [decimal](18, 2) NULL,
	[noOfDays] [int] NULL,
	[costPerDay] [decimal](18, 2) NULL,
	[creditDebit] [decimal](18, 2) NULL,
	[Messsub] [decimal](18, 2) NULL,
	[barBill] [decimal](18, 2) NULL,
	[TotRecovery] [decimal](18, 2) NULL,
	[priority] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VICTULING_Reset_Password]    Script Date: 9/30/2024 11:51:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VICTULING_Reset_Password]
AS
SELECT        dbo.T_Login.nicNo, dbo.T_Login.Initial, dbo.T_Login.surName, dbo.M_Rank.rankShort, dbo.M_Branch.branchID, dbo.T_Login.offNo, dbo.M_ServiceType.serviceTypeCode, dbo.T_Login.eMail, 
                         dbo.T_Login.userName, dbo.T_Login.roll
FROM            dbo.T_Login INNER JOIN
                         dbo.M_Branch ON dbo.T_Login.branchCode = dbo.M_Branch.branchCode INNER JOIN
                         dbo.M_Rank ON dbo.T_Login.rankCode = dbo.M_Rank.rankCode INNER JOIN
                         dbo.M_ServiceType ON dbo.T_Login.serviceType = dbo.M_ServiceType.serviceTypeCode

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[13] 2[23] 3) )"
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
         Begin Table = "T_Login"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 217
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "M_Branch"
            Begin Extent = 
               Top = 121
               Left = 321
               Bottom = 251
               Right = 500
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M_Rank"
            Begin Extent = 
               Top = 35
               Left = 514
               Bottom = 165
               Right = 693
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M_ServiceType"
            Begin Extent = 
               Top = 3
               Left = 703
               Bottom = 133
               Right = 882
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
      Begin ColumnWidths = 11
         Width = 284
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VICTULING_Reset_Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VICTULING_Reset_Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VICTULING_Reset_Password'
GO
USE [master]
GO
ALTER DATABASE [NHQ_VICTUALING] SET  READ_WRITE 
GO
