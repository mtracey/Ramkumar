GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'StockTransferDetails' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[StockTransferDetails](
	[TransSubId] [int] IDENTITY(1,1) NOT NULL,
	[MasterTransID] [nvarchar](50) NOT NULL,
	[ItemId] [nvarchar](50) NULL,
	[BarCodeId] [nvarchar](50) NULL,
	[StoreIn] [nchar](10) NULL,
	[StoreOut] [nchar](10) NULL,
	[Quantity] [nchar](10) NULL,
	[comp_id] [nchar](10) NULL,
 CONSTRAINT [PK_StockTransferDetails] PRIMARY KEY CLUSTERED 
(
	[TransSubId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'TransactionDetails' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[TransactionDetails](
	[TransSubId] [bigint] NOT NULL,
	[ItemCode] [nvarchar](50) NOT NULL,
	[Quantity] [nchar](10) NOT NULL,
	[Price] [nchar](10) NOT NULL,
	[ChildTransId] [bigint] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO


GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'TransactionMaster' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[TransactionMaster](
	[TransId] [bigint] IDENTITY(1,1) NOT NULL,
	[TransDate] [datetime] NOT NULL,
	[OrderNumber] [nvarchar](50) NULL,
	[TransactionRemarks] [nvarchar](500) NULL,
	[StoreId] [nvarchar](50) NULL,
	[SupplierId] [nvarchar](50) NULL,
	[EmployeeId] [nchar](50) NULL,
	[TransType] [nvarchar](4) NULL,
	[CompId] [nchar](10) NULL,
 CONSTRAINT [PK_TransactionMaster] PRIMARY KEY CLUSTERED 
(
	[TransId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'StockOutDetails' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[StockOutDetails](
	[TranssubId] [int] IDENTITY(1,1) NOT NULL,
	[MasterTransId] [nvarchar](50) NOT NULL,
	[EmpId] [nchar](10) NULL,
	[ProjectId] [nchar](10) NULL,
	[StoreId] [nvarchar](50) NULL,
	[ItemId] [nvarchar](50) NULL,
	[Quantity] [nvarchar](50) NULL,
	[IssueType] [nchar](10) NULL
) ON [PRIMARY]

GO
--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Issutype  :  Employee : 1 Project :2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StockOutDetails', @level2type=N'COLUMN',@level2name=N'IssueType'
GO


GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'IssueDetails' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[IssueDetails](
	[IssueId] [bigint] IDENTITY(1,1) NOT NULL,
	[TransSubId] [varchar](10) NULL,
	[MasterTransId] [varchar](10) NULL,
	[IssueType] [varchar](10) NULL,
	[DiscountType] [varchar](10) NULL,
	[DeductionType] [varchar](10) NULL,
	[Quantity] [varchar](50) NULL,
	[Price] [varchar](10) NULL,
	[DiscountAmount] [varchar](10) NULL,
	[TotalAmount] [varchar](10) NULL
) ON [PRIMARY]
GO

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'ItemHistory' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[ItemHistory](
	[HistoryId] [int] IDENTITY(1,1) NOT NULL,
	[MasterTransactionId] [nchar](10) NULL,
	[ItemCode] [nchar](10) NULL,
	[BarCodeId] [nvarchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[StoreId] [nchar](10) NULL,
	[EmployeeId] [nchar](50) NULL,
	[ProjectId] [nchar](50) NULL,
	[StockStatus] [nchar](50) NULL,
	[Condition] [nchar](50) NULL,
	[RecentTransId] [nchar](10) NULL,
	[RecentSubTransId] [nchar](10) NULL,
 CONSTRAINT [PK_ItemHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'BarcodeDetails' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)

CREATE TABLE [dbo].[BarcodeDetails](
	[TransId] [nchar](10) NOT NULL,
	[ItemCode] [nchar](10) NOT NULL,
	[BarcodeId] [int] IDENTITY(1,1) NOT NULL,
	[Barcode] [nvarchar](500) NULL,
	[StockStatus] [nchar](10) NULL,
	[RecentTransId] [nchar](10) NULL,
	[StoreId] [nchar](10) NULL,
	[RecSubTransId] [nchar](10) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[BarcodeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'StockIn -SIStoc Out To Employee : ESOStoc Transfered  : STStock Return From Employee : ESRStoc Out To Project : PSOStock Return From Project : PSR' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BarcodeDetails', @level2type=N'COLUMN',@level2name=N'StockStatus'
GO

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmailTrack' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[EmailTrack](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DocID] [varchar](50) NOT NULL,
	[MonthYear] [int] NOT NULL,
	[EventView] [int] NOT NULL,
	[SentOn] [datetime] NOT NULL CONSTRAINT [DF_EmailTrack_SentOn]  DEFAULT (getdate()),
	[SentBy] [int] NOT NULL,
	[SentTo] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Remarks] [text] NULL,
 CONSTRAINT [PK_EmailTrack] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'YOSEmpTransfered' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[YOSEmpTransfered](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmpID] [int] NULL ,
	[YOS] [int] NULL ,
	[Transferdate] [datetime] NULL,
	[Status] [int] NULL 
) ON [PRIMARY]

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'MedicalCSN' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[MedicalCSN](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CSN] [varchar](50) NULL,
	[ROC] [varchar](50) NULL,
	[TYPE] [varchar](50) NULL,
	[SLNO] [varchar](50) NULL,
	[FormulaId] [nchar](10) NULL,
	[FormulaType] [varchar](50) NULL,
	[Formula] [char](10) NULL,
	[Comp_id] [char](10) NULL,
 CONSTRAINT [PK_MedicalCSN] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'AMCDetails' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[AMCDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EMPID] [char](10) NULL,
	[EMPNAME] [varchar](100) NULL,
	[NRIC] [varchar](50) NULL,
	[OPTIONSELECTED] [varchar](50) NULL,
	[FORMULA] [varchar](50) NULL,
	[BASICPAY] [varchar](50) NULL,
	[NETPAY] [varchar](50) NULL,
	[Total_Gross] [varchar](50) NULL,
	[Start_Period] [varchar](50) NULL,
	[End_Period] [varchar](50) NULL,
	[AMCS_AMOUNT] [varchar](50) NULL,
 CONSTRAINT [PK_AMCDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'AmcAssignedEmployee' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[AmcAssignedEmployee](
	[EmpCode] [char](10) NOT NULL,
	[AssignedAMCId] [char](10) NULL,
	[Comp_Id] [char](10) NULL
) ON [PRIMARY]

GO

IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeBulkImportMachine' AND
                    xtype = 'U' ) 
Drop Table EmployeeBulkImportMachine
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeBulkImport' AND
                    xtype = 'U' ) 
Drop Table EmployeeBulkImport

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeBulkImportMachine' AND
                    xtype = 'U' ) 
SET @exist = 1

IF (@exist = 0)
CREATE TABLE [dbo].[EmployeeBulkImportMachine]
(
TimeCardNo [varchar](200) NULL,
FirstName [varchar](200) NULL,
LastName [varchar](200) NULL,
Department [varchar](200) NULL,
Trade [varchar](200) NULL,
Designation [varchar](200) NULL,
Phone [varchar](200) NULL,
HandPhone [varchar](200) NULL,
email [varchar](200) NULL,
ConfirmationDate [varchar](200) NULL,
CpfEntitlement [varchar](200) NULL,
OTEntilement [varchar](200) NULL,
wpnumber [varchar](200) NULL,
wpexpdate [varchar](200) NULL,
EmpType [varchar](200) NULL,
NRIC [varchar](200) NULL,
FIN [varchar](200) NULL,
prdate [varchar](200) NULL,
dateofbirth [varchar](200) NULL,
passportno [varchar](200) NULL,
ppissuedate [varchar](200) NULL,
passportexpiry [varchar](200) NULL,
Nationality [varchar](200) NULL,
JoiningDate [varchar](200) NULL,
wpapplicationdate [varchar](200) NULL,
wpissuedate [varchar](200) NULL,
workerlevy [varchar](200) NULL,
blockno [varchar](200) NULL,
unitno [varchar](200) NULL,
levelno [varchar](200) NULL,
streetname [varchar](200) NULL,
PostalCode [varchar](200) NULL,
payfrequency [varchar](200) NULL,
Salary [varchar](200) NULL,
wdayperweek [varchar](200) NULL,
hourlyRateMode [varchar](200) NULL,
hourlyRate [varchar](200) NULL,
dailyRateMode [varchar](200) NULL,
dailyRate [varchar](200) NULL,
Sex [varchar](200) NULL,
maritalstatus [varchar](200) NULL,
race [varchar](200) NULL,
SAFETYTYPE1 [varchar](200) NULL,
SAFETYPASSNO1 [varchar](200) NULL,
SAFETYPASSEXP1 [varchar](200) NULL,
religion [varchar](200) NULL,
[isReq] [varchar](200) NULL
)    
GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeBulkImport' AND
                    xtype = 'U' ) 
SET @exist = 1
--Drop Table [EmployeeBulkImportMachine]
IF (@exist = 0)
CREATE TABLE [dbo].[EmployeeBulkImport]
(
[id] [int] IDENTITY(1,1) NOT NULL,
TimeCardNo [varchar](200) NULL,
FirstName [varchar](200) NULL,
LastName [varchar](200) NULL,
Department [varchar](200) NULL,
Trade [varchar](200) NULL,
Designation [varchar](200) NULL,
Phone [varchar](200) NULL,
HandPhone [varchar](200) NULL,
email [varchar](200) NULL,
ConfirmationDate [varchar](200) NULL,
CpfEntitlement [varchar](200) NULL,
OTEntilement [varchar](200) NULL,
wpnumber [varchar](200) NULL,
wpexpdate [varchar](200) NULL,
EmpType [varchar](200) NULL,
NRIC [varchar](200) NULL,
FIN [varchar](200) NULL,
prdate [varchar](200) NULL,
dateofbirth [varchar](200) NULL,
passportno [varchar](200) NULL,
ppissuedate [varchar](200) NULL,
passportexpiry [varchar](200) NULL,
Nationality [varchar](200) NULL,
JoiningDate [varchar](200) NULL,
wpapplicationdate [varchar](200) NULL,
wpissuedate [varchar](200) NULL,
workerlevy [varchar](200) NULL,
blockno [varchar](200) NULL,
unitno [varchar](200) NULL,
levelno [varchar](200) NULL,
streetname [varchar](200) NULL,
PostalCode [varchar](200) NULL,
payfrequency [varchar](200) NULL,
Salary [varchar](200) NULL,
wdayperweek [varchar](200) NULL,
hourlyRateMode [varchar](200) NULL,
hourlyRate [varchar](200) NULL,
dailyRateMode [varchar](200) NULL,
dailyRate [varchar](200) NULL,
Sex [varchar](200) NULL,
maritalstatus [varchar](200) NULL,
race [varchar](200) NULL,
SAFETYTYPE1 [varchar](200) NULL,
SAFETYPASSNO1 [varchar](200) NULL,
SAFETYPASSEXP1 [varchar](200) NULL,
religion [varchar](200) NULL,
isReq [varchar](5) NULL,
[Deleted] [int] NULL CONSTRAINT [DF_EmployeeBulkImport_Deleted]  DEFAULT ((0)),
[Status] [varchar](20) NULL,
[ErrorContent] [varchar](8000) NULL,
[CreatedDate] [datetime] CONSTRAINT [DF_EmployeeBulkImport_CreatedDate]  DEFAULT (getdate()),
[CompanyId]   [int] NULL,
[EmpGroupId] [int] NULL,
[GroupID]      [int] NULL
)
GO


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'YOSLeavesAllowed' AND
                    xtype = 'U' ) 
SET @exist = 1

IF (@exist = 0)
CREATE TABLE YOSLeavesAllowed
(
	[id] [int] IDENTITY(1,1) NOT NULL,
    [yosyear]		INT,    
    emp_id			INT,    
    yos				INT,
    actual_yos		INT,
    startdate		datetime,
    enddate			datetime,
	LY_Leaves_Bal   float NULL ,
    leavesallowed	float,
	[CreatedDate] [datetime] CONSTRAINT [DF_YOSLeavesAllowed_CreatedDate]  DEFAULT (getdate())
)    
GO
/****** Object:  Table [dbo].[UserRights]    Script Date: 12/04/2009 16:47:16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HourTransfer]') AND type in (N'U'))
DROP TABLE [dbo].[HourTransfer]
/****** Object:  Table [dbo].[HourTransfer]    Script Date: 12/04/2009 16:47:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HourTransfer]
(
	[ID] [int] NULL,
	[TranferName]  VARCHAR(30) NULL,
) 
GO
/****** Object:  Table [dbo].[UserRights]    Script Date: 12/04/2009 16:47:16 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PayrollMonthlyDetail]') AND type in (N'U'))
DROP TABLE [dbo].[PayrollMonthlyDetail]
/****** Object:  Table [dbo].[UserRights]    Script Date: 12/04/2009 16:47:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

BEGIN            
DECLARE @select VARCHAR(200)
        
Select ROWID = IDENTITY( INT,1,1),*,Day(paystartdate) PayStartDay,Day(PayEndDate) PayEndDay,Day(PaySubStartDate) PaySubStartDay,Day(PaySubEndDate) PaySubEndDay 
,CPFCalculate =Case When Convert(datetime,PayEndDate,103) <= Convert(datetime,'31/08/2010',103) Then 1
					When (PayEndDate >= Convert(datetime,'01/09/2010',103) And PayEndDate <= Convert(datetime,'28/02/2011',103)) Then 2
					Else 3 End
Into #DY From         
(        
Select *,         
(Select Min(DateInYear) From DateInYear DI Where DY.[Year] = Year(DI.DateInYear) And Month(DI.DateInYear)=DY.[Month]) PayStartDate,         
(Select Max(DateInYear) From DateInYear DI Where DY.[Year] = Year(DI.DateInYear) And Month(DI.DateInYear)=DY.[Month]) PayEndDate,         
(Select Min(DateInYear) From DateInYear DI Where DY.[Year] = Year(DI.DateInYear) And Month(DI.DateInYear)=DY.[Month]) PaySubStartDate,         
(Select Max(DateInYear) From DateInYear DI Where DY.[Year] = Year(DI.DateInYear) And Month(DI.DateInYear)=DY.[Month]) PaySubEndDate         
From        
(        
 Select Distinct 1 [PayType],Year(DateInYear) [Year],Month(DateInYear) [Month],DATENAME(month,DateInYear) [MonthName]        
 From DateInYear         
)        
DY         
Union        
Select *,        
(Select Min(DateInYear) From DateInYear DI Where DY.[Year] = Year(DI.DateInYear) And Month(DI.DateInYear)=DY.[Month]) PayStartDate,         
(Select Max(DateInYear) From DateInYear DI Where DY.[Year] = Year(DI.DateInYear) And Month(DI.DateInYear)=DY.[Month]) PayEndDate,         
(Select Min(DateInYear) From DateInYear DI Where DY.[Year] = Year(DI.DateInYear) And Month(DI.DateInYear)=DY.[Month]) PaySubStartDate,         
(Select Max(DateInYear) From DateInYear DI Where DY.[Year] = Year(DI.DateInYear) And Month(DI.DateInYear)=DY.[Month] And DateName(day,DateInYear) <=15) PaySubEndDate         
From        
(        
 Select Distinct 2 [PayType],Year(DateInYear) [Year],Month(DateInYear) [Month],DATENAME(month,DateInYear) + ' First Half' [MonthName]        
 From DateInYear         
)        
DY         
Union        
Select *,        
(Select Min(DateInYear) From DateInYear DI Where DY.[Year] = Year(DI.DateInYear) And Month(DI.DateInYear)=DY.[Month]) PayStartDate,         
(Select Max(DateInYear) From DateInYear DI Where DY.[Year] = Year(DI.DateInYear) And Month(DI.DateInYear)=DY.[Month]) PayEndDate,         
(Select Min(DateInYear) From DateInYear DI Where DY.[Year] = Year(DI.DateInYear) And Month(DI.DateInYear)=DY.[Month] And DateName(day,DateInYear) >=16) PaySubStartDate,         
(Select Max(DateInYear) From DateInYear DI Where DY.[Year] = Year(DI.DateInYear) And Month(DI.DateInYear)=DY.[Month]) PaySubEndDate         
From        
(        
 Select Distinct 2 [PayType],Year(DateInYear) [Year],Month(DateInYear) [Month],DATENAME(month,DateInYear) + ' Second Half' [MonthName]        
 From DateInYear         
)    
DY    
) DY    
Order By DY.[PayType],DY.[Year],DY.[Month]

--Select *,ISEOM=CASE When [MonthName] Like '%First%' Then 'FH' When [MonthName] Like '%Second%' Then 'SH' Else 'FM' End From #DY        
  
Select * Into PayrollMonthlyDetail From #DY        
  
      
Drop Table #DY 
  
  
END 

GO
/****** Object:  Table [dbo].[UserRights]    Script Date: 12/04/2009 16:47:16 ******/
--DROP TABLE [dbo].[UserRights]
/****** Object:  Table [dbo].[UserRights]    Script Date: 12/04/2009 16:47:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRights]') AND type in (N'U'))
CREATE TABLE [dbo].[UserRights](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Rightid] [int] NULL,
	[RightName] [nvarchar](max) NULL,
	[RightCategory] [nvarchar](max) NULL,
	[RightSubCategory] [nvarchar](max) NULL,
	[HeaderID] [int] NULL CONSTRAINT [DF_UserRights_HeaderId]  DEFAULT ((0)),
	[RightOrder] [int] NULL,
	[DisplayID] [int] NULL,
	[ParentId] [int] NULL,
	[GParentid] [int] NULL,
	[ActualRightName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[PRODUCT] [int] default(0)
) ON [PRIMARY]
GO

DECLARE @exist INT
SET ANSI_PADDING OFF
SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON

SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'leaves_forefited' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[leaves_forefited]
                (
                 [row_id] [bigint] IDENTITY(1, 1)
                                   NOT NULL ,
                 [emp_id] [int] NOT NULL ,
                 [leave_year] [int] NOT NULL ,
                 [leave_allowed] [float] NULL ,
                 [leave_forefited] [float] NULL ,
                 [leave_forward] [float] NULL ,
                 [created_id] [varchar](50) NULL ,
                 [created_date] [datetime] NULL
                                           CONSTRAINT [DF_leaves_forefit_created_date] DEFAULT (GETDATE()) ,
                 [update_id] [varchar](50) NULL ,
                 [update_date] [datetime] NULL ,
                 CONSTRAINT [leaves_forefit] PRIMARY KEY CLUSTERED ([emp_id] ASC, [leave_year] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
                )
         ON     [PRIMARY]
   END
GO


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Nationality' AND
                    xtype = 'U' ) 
   SET @exist = 1

IF EXISTS ( SELECT  name
            FROM    SysColumns
            WHERE   ID IN (SELECT   ID
                           FROM     sysobjects
                           WHERE    name = N'Nationality' AND
                                    xtype = 'U') AND
                    name = N'ir8a_Code' ) 
   SET @exist = 1

IF (@exist = 0) 
   BEGIN
         DROP TABLE Nationality
         CREATE TABLE [dbo].[Nationality]
                (
                 [id] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Nationality] [varchar](50) NOT NULL ,
                 [ir8a_code] [int] NULL
                ) 
   END
GO


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'ApprovedTimeSheet' AND
                    xtype = 'U' ) 
   SET @exist = 1

IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[ApprovedTimeSheet]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Roster_ID] [int] NOT NULL ,
                 [Time_Card_No] [varchar](50) NOT NULL ,
                 [Sub_Project_ID] [varchar](50) NOT NULL ,
                 [TimeEntryStart] [datetime] NOT NULL ,
                 [TimeEntryEnd] [datetime] NOT NULL ,
                 [NH] [varchar](5) NOT NULL ,
                 [OT1] [varchar](5) NOT NULL ,
                 [OT2] [varchar](5) NOT NULL ,
                 [TotalHrsWrk] [varchar](50) NOT NULL ,
                 [SoftDelete] [int] NOT NULL
                                    CONSTRAINT [DF_ApprovedTimeSheet_SoftDelete] DEFAULT ((0))
                )
         ON     [PRIMARY]

   END
GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'country' AND
                    xtype = 'U' ) 
   SET @exist = 1

IF EXISTS ( SELECT  name
            FROM    SysColumns
            WHERE   ID IN (SELECT   ID
                           FROM     sysobjects
                           WHERE    name = N'country' AND
                                    xtype = 'U') AND
                    name = N'ir8a_Code' ) 
   SET @exist = 1

IF (@exist = 0) 
   BEGIN
         DROP TABLE country
         CREATE TABLE [dbo].[country]
                (
                 [id] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Country] [varchar](50) NOT NULL ,
                 [ir8a_code] [int] NULL,
	          )
   END
GO


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeItemIssued' AND
                    xtype = 'U' ) 
   SET @exist = 1

IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[EmployeeItemIssued]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Emp_ID] [int] NOT NULL ,
                 [ItemID] [int] NOT NULL ,
                 [SerialNumber] [varchar](50) NOT NULL ,
                 [Quantity] [int] NOT NULL ,
                 [Remarks] [varchar](50) NULL ,
                 [ItemReturn] [int] NULL ,
                 CONSTRAINT [PK_EmployeeItemIssued] PRIMARY KEY CLUSTERED ([ID] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
                )
         ON     [PRIMARY]
   END

IF (@exist = 0) 
   BEGIN
         CREATE UNIQUE NONCLUSTERED INDEX [IX_EmployeeItemIssuedSerial] ON [dbo].[EmployeeItemIssued] 
         (
         [SerialNumber] ASC
         )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
   END
Go

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'employee_ir8a' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[employee_ir8a]
                (
                 [row_id] [bigint] IDENTITY(1, 1)
                                   NOT NULL ,
                 [ir8a_year] [int] NULL ,
                 [emp_id] [int] NULL ,
                 [addr_type] [varchar](3) NULL ,
                 [tax_borne_employer] [varchar](3) NULL ,
                 [tax_borne_employer_options] [varchar](3) NULL ,
                 [tax_borne_employer_amount] [float] NULL ,
                 [pension_out_singapore] [varchar](3) NULL ,
                 [pension_out_singapore_amount] [float] NULL ,
                 [excess_voluntary_cpf_employer] [varchar](3) NULL ,
                 [excess_voluntary_cpf_employer_amount] [float] NULL ,
                 [stock_options] [varchar](3) NULL ,
                 [stock_options_amount] [float] NULL ,
                 [benefits_in_kind] [varchar](3) NULL ,
                 [benefits_in_kind_amount] [float] NULL ,
                 [retirement_benefits] [varchar](3) NULL ,
                 [retirement_benefits_fundName] [varchar](200) NULL ,
                 [retirement_benefits_amount] [float] NULL ,
                 [s45_tax_on_directorFee] [varchar](3) NULL ,
                 [cessation_provision] [varchar](3) NULL ,
                 [dateofcessation] [datetime] NULL ,
                 [dateofcommencement] [datetime] NULL ,
                 [tax_borne_employee_amount] [float] NULL ,
                 CONSTRAINT [PK_employee_ir8a] PRIMARY KEY CLUSTERED ([row_id] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
                )
         ON     [PRIMARY]
   END
GO

DECLARE @exist INT
SET @exist = 0
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'religion' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[religion]
                (
                 [id] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Religion] [varchar](50) NOT NULL ,
                 CONSTRAINT [PK_religion] PRIMARY KEY CLUSTERED ([id] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY] ,
                 CONSTRAINT [IX_religion] UNIQUE NONCLUSTERED ([Religion] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
                )
         ON     [PRIMARY]
   END
GO

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'GroupRightsAllocated' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[GroupRightsAllocated]
                (
                 [groupid] [int] NOT NULL ,
                 [rightid] [int] NOT NULL
                )
         ON     [PRIMARY]
   END
GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'CPFFiles' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[CPFFiles]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_ID] [int] NULL ,
                 [ROC] [varchar](12) NULL ,
                 [Type] [varchar](12) NULL ,
                 [Srno] [varchar](12) NULL ,
                 [CSN] [varchar](36) NULL ,
                 [Created] [datetime] NULL
                                      CONSTRAINT [DF_CPFFiles_Created] DEFAULT (GETDATE()) ,
                 [LastModified] [datetime] NULL
                                           CONSTRAINT [DF_CPFFiles_LastModified] DEFAULT (GETDATE())
                )
         ON     [PRIMARY]
   END
Go

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Project' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[Project]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_ID] [int] NOT NULL ,
                 [Location_ID] [int] NOT NULL ,
                 [Project_ID] [varchar](50) NOT NULL ,
                 [Project_Name] [varchar](50) NOT NULL ,
                 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED ([ID] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
                )
         ON     [PRIMARY]
         CREATE UNIQUE NONCLUSTERED INDEX [IX_Project_ID] ON [dbo].[Project] 
         (
         [Project_ID] ASC
         )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
   END
Go

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'DocumentCategory' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[DocumentCategory]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_Id] [int] NULL ,
                 [Category_Name] [varchar](50) NOT NULL ,
                 CONSTRAINT [PK_ID] PRIMARY KEY CLUSTERED ([ID] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
                )
         ON     [PRIMARY]
         CREATE UNIQUE NONCLUSTERED INDEX [IX_CatName] ON [dbo].[DocumentCategory] 
         (
         [Category_Name] ASC
         )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Location' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[Location]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_Id] [int] NULL ,
                 [Location_Name] [varchar](50) NOT NULL ,
                 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED ([ID] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
                )
         ON     [PRIMARY]
         CREATE UNIQUE NONCLUSTERED INDEX [IX_LocName] ON [dbo].[Location] 
         (
         [Location_Name] ASC
         )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'SubProject' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[SubProject]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Parent_Project_ID] [int] NOT NULL ,
                 [Sub_Project_ID] [varchar](50) NOT NULL ,
                 [Sub_Project_Name] [varchar](50) NOT NULL ,
                 CONSTRAINT [PK_SubProject] PRIMARY KEY CLUSTERED ([ID] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
                )
         ON     [PRIMARY]
         CREATE UNIQUE NONCLUSTERED INDEX [IX_Sub_Project_ID] ON [dbo].[SubProject] 
         (
         [Sub_Project_ID] ASC
         )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeAssignedToProject' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[EmployeeAssignedToProject]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Sub_Project_ID] [int] NOT NULL ,
                 [Emp_ID] [int] NOT NULL
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'DocumentMappedToEmployee' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[DocumentMappedToEmployee]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Category_ID] [int] NOT NULL ,
                 [Emp_ID] [int] NOT NULL ,
                 [Document_Name] [varchar](50) NOT NULL ,
                 [FileName] [varchar](100) NOT NULL
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'ProjectAssigneds' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[ProjectAssigneds]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_ID] [int] NOT NULL ,
                 [Sub_Project_ID] [int] NOT NULL
                )
         ON     [PRIMARY]
   END
Go

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Roster' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[Roster]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_Id] [int] NULL ,
                 [Roster_Name] [varchar](50) NOT NULL ,
                 CONSTRAINT [PK_Roster] PRIMARY KEY CLUSTERED ([ID] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
                )
         ON     [PRIMARY]
         CREATE UNIQUE NONCLUSTERED INDEX [IX_RosName] ON [dbo].[Roster] 
         (
         [Roster_Name] ASC
         )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeAgent' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[EmployeeAgent]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_ID] [int] NOT NULL ,
                 [Agent_Name] [varchar](50) NOT NULL ,
                 [Phone1] [varchar](50) NULL ,
                 [Phone2] [varchar](50) NULL ,
                 [Address] [varchar](50) NULL
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'MYECertificate' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[MYECertificate]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_ID] [int] NOT NULL ,
                 [CertificateNo] [varchar](50) NOT NULL ,
                 [IssueDate] [datetime] NULL ,
                 [PriorAppRefNo] [varchar](50) NULL ,
                 [PriorAppGranted] [int] NULL ,
                 [PriorType1] [varchar](50) NULL ,
                 [PriorType2] [varchar](50) NULL ,
                 [ValidityDateStart] [datetime] NULL ,
                 [ValidityDateEnd] [datetime] NULL ,
                 [FileName] [varchar](100) NULL ,
                 CONSTRAINT [PK_MYECertificate] PRIMARY KEY CLUSTERED ([CertificateNo] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Family' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[Family]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Emp_ID] [int] NOT NULL ,
                 [Name] [varchar](50) NOT NULL ,
                 [dateofbirth] [datetime] NULL ,
                 [Sex] [varchar](1) NULL ,
                 [Relation] [int] NULL ,
                 [Marriage_Date] [datetime] NULL ,
                 [Phone] [varchar](50) NULL ,
                 [UIDN] [varchar](50) NULL ,
                 [Status] [varchar](50) NULL
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Unit' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[Unit]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_ID] [int] NOT NULL ,
                 [UnitType] [int] NOT NULL ,
                 [UnitName] [varchar](50) NOT NULL
                )
         ON     [PRIMARY]

         CREATE UNIQUE NONCLUSTERED INDEX [IX_Unit] ON [dbo].[Unit] 
         (
         [UnitName] ASC
         )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'ItemSubCategory' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[ItemSubCategory]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Parent_ItemCategoryID] [int] NOT NULL ,
                 [ItemSubCategoryID] [varchar](50) NOT NULL ,
                 [ItemSubCategoryName] [varchar](50) NOT NULL ,
                 CONSTRAINT [PK_ItemSubCategory] PRIMARY KEY CLUSTERED ([ID] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'ItemCategory' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[ItemCategory]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_ID] [int] NULL ,
                 [ItemCategoryID] [varchar](50) NULL ,
                 [ItemCategoryName] [varchar](50) NULL ,
                 CONSTRAINT [PK_ItemCategory] PRIMARY KEY CLUSTERED ([ID] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Store' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[Store]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_ID] [int] NULL ,
                 [StoreID] [varchar](50) NULL ,
                 [StoreName] [varchar](50) NULL ,
                 [Location] [varchar](50) NULL ,
                 [Address1] [varchar](50) NULL ,
                 [Address2] [varchar](50) NULL ,
                 [PostalCode] [varchar](50) NULL ,
                 [City] [varchar](50) NULL ,
                 [Country] [int] NULL
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Supplier' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[Supplier]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_ID] [int] NULL ,
                 [SupplierID] [varchar](50) NULL ,
                 [SupplierName] [varchar](50) NULL ,
                 [Address1] [varchar](50) NULL ,
                 [Address2] [varchar](50) NULL ,
                 [City] [varchar](50) NULL ,
                 [Country] [int] NULL ,
                 [PostalCode] [varchar](50) NULL ,
                 [Phone] [varchar](50) NULL ,
                 [Fax] [varchar](50) NULL ,
                 [Mobile] [varchar](50) NULL ,
                 [Email] [varchar](100) NULL
                )
         ON     [PRIMARY]
   END
Go



DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Item' AND
                    xtype = 'U' ) 
   SET @exist = 1

IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[Item]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_ID] [int] NULL ,
                 [ItemID] [varchar](50) NOT NULL ,
                 [ItemName] [varchar](50) NOT NULL ,
                 [UOM] [int] NULL ,
                 [UnitPrice] [int] NULL ,
                 [ItemType] [int] NULL
                                  CONSTRAINT [DF_Item_ItemType] DEFAULT ((1)) ,
                 [ItemSubCatID] [int] NULL
                )
         ON     [PRIMARY]
   END
Go

IF NOT EXISTS ( SELECT  name
                FROM    sys.indexes
                WHERE   name = N'IX_Item_Code' ) 
   CREATE UNIQUE NONCLUSTERED INDEX [IX_Item_Code] ON [dbo].[Item] 
   (
   [ItemID] ASC
   )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
Go
IF NOT EXISTS ( SELECT  name
                FROM    sys.indexes
                WHERE   name = N'IX_Item_Name' ) 
   CREATE UNIQUE NONCLUSTERED INDEX [IX_Item_Name] ON [dbo].[Item] 
   (
   [ItemName] ASC
   )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
Go

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'ItemParameter' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[ItemParameter]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [ItemID] [int] NULL ,
                 [ParameterID] [int] NULL ,
                 [ParameterVar] [varchar](50) NULL
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Parameter' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[Parameter]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [ParameterName] [varchar](50) NOT NULL ,
                 [Company_ID] [int] NULL
                )
         ON     [PRIMARY]
         CREATE UNIQUE NONCLUSTERED INDEX [IX_ParName] ON [dbo].[Parameter] 
         (
         [ParameterName] ASC
         )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'StockIn' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[StockIn]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_ID] [int] NULL ,
                 [TransactionDate] [datetime] NULL ,
                 [SupplierID] [int] NULL ,
                 [StoreID] [int] NULL ,
                 [ItemID] [int] NULL ,
                 [Quantity] [numeric](18, 0) NULL ,
                 [UnitPrice] [numeric](18, 0) NULL ,
                 [Remarks] [varchar](50) NULL
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'StockOut' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[StockOut]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_ID] [int] NULL ,
                 [TransactionDate] [datetime] NULL ,
                 [StoreID] [int] NULL ,
                 [ItemID] [int] NULL ,
                 [Emp_ID] [int] NULL ,
                 [ProjectID] [int] NULL ,
                 [Quantity] [numeric](18, 0) NULL ,
                 [TypeofStock] [int] NULL ,
                 [Remarks] [varchar](50) NULL
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'StockTransfer' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[StockTransfer]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_ID] [int] NULL ,
                 [TransactionDate] [datetime] NULL ,
                 [StoreIDSource] [int] NULL ,
                 [StoreIDDestination] [int] NULL ,
                 [ItemID] [int] NULL ,
                 [Quantity] [numeric](18, 0) NULL ,
                 [Remarks] [varchar](50) NULL
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'StockReturn' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[StockReturn]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_ID] [int] NULL ,
                 [TransactionDate] [datetime] NULL ,
                 [StoreID] [int] NULL ,
                 [ItemID] [int] NULL ,
                 [Emp_ID] [int] NULL ,
                 [ProjectID] [int] NULL ,
                 [Quantity] [numeric](18, 0) NULL ,
                 [Remarks] [varchar](50) NULL
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'CertificateCategory' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[CertificateCategory]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Company_Id] [int] NULL ,
                 [Category_Name] [varchar](50) NOT NULL ,
                 CONSTRAINT [PK_CertificateCategory] PRIMARY KEY CLUSTERED ([ID] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
                )
         ON     [PRIMARY]
         CREATE UNIQUE NONCLUSTERED INDEX [IX_CatName] ON [dbo].[CertificateCategory] 
         (
         [Category_Name] ASC
         )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeCertificate' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[EmployeeCertificate]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Emp_ID] [int] NULL ,
                 [CertificateCategoryID] [int] NULL ,
                 [CertificateNumber] [varchar](50) NULL ,
                 [TestDate] [datetime] NULL ,
                 [IssueDate] [datetime] NULL ,
                 [ExpiryDate] [datetime] NULL ,
                 [IssueLocation] [varchar](50) NULL ,
                 [IssuedBy] [varchar](50) NULL ,
                 [Remarks] [varchar](50) NULL
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeePayHistory' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[EmployeePayHistory]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Emp_ID] [int] NULL ,
                 [FromDate] [datetime] NULL ,
                 [ToDate] [datetime] NULL ,
                 [ConfirmationDate] [datetime] NULL ,
                 [DepartmentID] [int] NULL ,
                 [DesignationID] [int] NULL ,
                 [TradeID] [int] NULL ,
                 [OT_Entitlement] [char](1) NULL ,
                 [CPF_Entitlement] [char](1) NULL ,
                 [OT1Rate] [float] NULL ,
                 [OT2Rate] [float] NULL ,
                 [Pay_Frequency] [char](1) NULL ,
                 [WDays_Per_Week] [float] NULL ,
                 [PayRate] [varbinary](128) NULL ,
                 [Hourly_Rate_Mode] [varchar](3) NULL ,
                 [Hourly_Rate] [float] NULL ,
                 [Daily_Rate_Mode] [varchar](3) NULL ,
                 [Daily_Rate] [float] NULL ,
                 [SoftDelete] [int] NULL
                                    CONSTRAINT [DF_EmployeePayHistory_SoftDelete] DEFAULT ((0)) ,
                 [Createddate] [datetime] NULL
                                          CONSTRAINT [DF_EmployeePayHistory_Createddate] DEFAULT (GETDATE())
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeLeavesAllowed' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[EmployeeLeavesAllowed]
                (
                 [id] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Emp_ID] [int] NOT NULL ,
                 [Leave_Type] [int] NOT NULL ,
                 [LY_Leaves_Bal] [float] NULL ,
                 [Leaves_Allowed] [float] NULL ,
                 [leave_year] [int] NOT NULL ,
                 CONSTRAINT [PK_EmployeeLeavesAllowed] PRIMARY KEY CLUSTERED
                    ([Emp_ID] ASC, [Leave_Type] ASC, [leave_year] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'PayrollGroup' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[PayrollGroup]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [GroupName] [varchar](50) NOT NULL ,
                 [Company_ID] [int] NOT NULL ,
                 CONSTRAINT [PK_PayrollGroup] PRIMARY KEY CLUSTERED ([ID] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeAssignedToPayrollGroup' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[EmployeeAssignedToPayrollGroup]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [PayrollGroupID] [int] NOT NULL ,
                 [Emp_ID] [int] NOT NULL
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeWorkFlow' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[EmployeeWorkFlow]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [WorkFlowName] [varchar](50) NOT NULL ,
                 [Company_ID] [int] NOT NULL ,
                 CONSTRAINT [PK_EmployeeWorkFlow] PRIMARY KEY CLUSTERED ([ID] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeWorkFlowLevel' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[EmployeeWorkFlowLevel]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [WorkFlowID] [int] NOT NULL ,
                 [RowID] [int] NOT NULL ,
                 [PayRollGroupID] [int] NOT NULL ,
                 [FlowType] [int] NULL
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'RosterDetail' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[RosterDetail]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Roster_ID] [int] NOT NULL ,
                 [Roster_Date] [datetime] NOT NULL ,
                 [InTime] [varchar](5) NULL ,
                 [OutTime] [varchar](5) NULL ,
                 [EarlyInBy] [varchar](5) NULL ,
                 [LateInBy] [varchar](5) NULL ,
                 [EarlyOutBy] [varchar](5) NULL ,
                 [LateOutBy] [varchar](5) NULL ,
                 [ClockInBefore] [int] NULL ,
                 [ClockInAfter] [int] NULL ,
                 [ClockOutBefore] [int] NULL ,
                 [ClockOutAfter] [int] NULL ,
                 [BreakTime] [int] NULL ,
                 [CreateDate] [datetime]  NOT NULL
                                         CONSTRAINT [DF_Table_1_createdate] DEFAULT (GETDATE())
                )
         ON     [PRIMARY]
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeAssignedToRoster' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[EmployeeAssignedToRoster]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Roster_ID] [int] NOT NULL ,
                 [Emp_ID] [int] NOT NULL
                )
         ON     [PRIMARY]
   END
Go


/****** Object:  Table [dbo].[wptype]    Script Date: 10/01/2009 14:49:24 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'wptype' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[wptype]
                (
                 [Id] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [Wptype] [varchar](50) NOT NULL ,
                 CONSTRAINT [PK_wptype] PRIMARY KEY CLUSTERED ([Id] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
                )
         ON     [PRIMARY]
   END

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'SubProjectProxy' AND
                    xtype = 'U' ) 
   SET @exist = 1

IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[SubProjectProxy]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [SubProjectID] [varchar](50) NOT NULL ,
                 [Sub_Project_Proxy_ID] [varchar](50) NOT NULL
                )
         ON     [PRIMARY]
   END
GO

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'ACTATEK_LOGS_MACHINE' AND
                    xtype = 'U' ) 
   SET @exist = 1

IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[ACTATEK_LOGS_MACHINE]
                (
                 [userID] [varchar](20) NOT NULL ,
                 [timeentry] [datetime] NOT NULL ,
                 [eventID] [varchar](20) NULL ,
                 [terminalSN] [varchar](20) NOT NULL ,
                 [jpegPhoto] [image] NULL ,
                 PRIMARY KEY CLUSTERED ([userID] ASC, [timeentry] ASC, [terminalSN] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
                )
         ON     [PRIMARY] TEXTIMAGE_ON [PRIMARY]
   END
GO

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'TS_FileUploaded' AND
                    xtype = 'U' ) 
   SET @exist = 1

IF (@exist = 0) 
   BEGIN
		CREATE TABLE [dbo].[TS_FileUploaded]
		(
			[ID] [int] IDENTITY(1,1) NOT NULL,
			[company_id] [int] NULL,
			[Month] [int] NULL,
			[Year] [int] NULL,
			[TranID] [varchar](20) NULL,
			[FileName] [varchar](100) NULL,
			[status] [int] NULL CONSTRAINT [DF_TS_FileUploaded_status]  DEFAULT ((0)),
			[createddate] [datetime] NULL CONSTRAINT [DF_TS_FileUploaded_createdate]  DEFAULT (getdate()),
			[ErrorMsg] [varchar](1000) NULL,
			[OriFileName] [varchar](200) NULL,
			[TypeNum] [int] NULL
			CONSTRAINT [PK_TS_FileUploaded] PRIMARY KEY CLUSTERED 
			(
				[ID] ASC
			)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) 		ON [PRIMARY]
		) ON [PRIMARY]
   END
GO

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'actatek_logs' AND
                    xtype = 'U' ) 
   SET @exist = 1

IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[ACTATEK_LOGS]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [userID] [varchar](20) NOT NULL ,
                 [timeentry] [varchar](20) NOT NULL ,
                 [eventID] [varchar](20) NULL ,
                 [terminalSN] [varchar](20) NULL ,
                 [jpegPhoto] [image] NULL ,
                 [company_id] [int] NULL ,
                 [tranid] [varchar](20) NULL ,
                 [Inserted] [varchar](1) NULL
                                         CONSTRAINT [DF_ACTATEK_LOGS_Inserted] DEFAULT ('A') ,
                 [softdelete] [int] NULL
                                    CONSTRAINT [DF_ACTATEK_LOGS_softdelete] DEFAULT ((0)) ,
                 CONSTRAINT [PK_ACTATEK_LOGS] PRIMARY KEY CLUSTERED ([ID] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
                )
         ON     [PRIMARY] TEXTIMAGE_ON [PRIMARY]
   END
GO

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  *
            FROM    sys.triggers
            WHERE   object_id = OBJECT_ID(N'[dbo].[ACTATEK_LOGS_MACHINE_TRIGGER]') )    
	SET @exist =1
	
IF (@exist = 0) 
   BEGIN
         EXEC dbo.sp_executesql @statement = N'CREATE TRIGGER [dbo].[ACTATEK_LOGS_MACHINE_TRIGGER]
				  ON [dbo].[ACTATEK_LOGS_MACHINE]
				 AFTER INSERT
				AS
				Declare @ProxySubProjID as varchar(50)
				Declare @SubProjID as varchar(50)

				BEGIN
					Select @ProxySubProjID=I.terminalSN From Inserted I
					if (len(@ProxySubProjID) > 0)
					BEGIN
						--Select Top 1 @SubProjID=SubProjectID From SubProjectProxy Where Sub_Project_Proxy_ID = @ProxySubProjID
						SELECT @SubProjID=SuB_PROJECT_ID FROM SubProject WHERE ID IN (Select Top 1 SubProjectID From SubProjectProxy Where Sub_Project_Proxy_ID = @ProxySubProjID)
						IF (@SubProjID is null Or len(@SubProjID) <= 0)
						BEGIN
							INSERT INTO ACTATEK_LOGS  (userid, timeentry, eventID, terminalSN, TranID)
							SELECT  i.userid, convert(varchar, i.timeentry, 103) + '' '' + convert(varchar, i.timeentry, 8), i.eventID, i.terminalSN, ''0''  FROM INSERTED i
						END
						ELSE
						BEGIN
							INSERT INTO ACTATEK_LOGS  (userid, timeentry, eventID, terminalSN, TranID)
							SELECT  i.userid, convert(varchar, i.timeentry, 103) + '' '' + convert(varchar, i.timeentry, 8), i.eventID, @SubProjID, ''0''  FROM INSERTED i
						END
					END
				END'
   END
GO


GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'claimCaping' AND
                    xtype = 'U' ) 
   SET @exist = 1

IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[claimCaping]
                (
                 [id] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [emp_code] [nvarchar](50) NULL ,
                 [trx_date] [nvarchar](50) NULL ,
                 [status] [nvarchar](50) NULL ,
                 [txt_month] [nvarchar](50) NULL ,
                 [trx_year] [nvarchar](50) NULL ,
                 [ClaimId] [nvarchar](50) NULL ,
                 [ClaimAmount] [nvarchar](50) NULL
                )
         ON     [PRIMARY]
   END
GO


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'InsertDataTemp' AND
                    xtype = 'U' ) 
   SET @exist = 1

IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[InsertDataTemp]
                (
                 [RecordType1] [varchar](50) NULL ,
                 [Source] [varchar](50) NULL ,
                 [BasisYear] [varchar](50) NULL ,
                 [PaymentType] [varchar](50) NULL ,
                 [OrganizationID] [varchar](50) NULL ,
                 [OrganizationIDNo] [varchar](50) NULL ,
                 [AuthorisedPersonName] [varchar](50) NULL ,
                 [AuthorisedPersonDesignation] [varchar](50) NULL ,
                 [EmployerName] [varchar](50) NULL ,
                 [Telephone] [varchar](50) NULL ,
                 [AuthorisedPersonEmail] [varchar](50) NULL ,
                 [BatchIndicator] [varchar](50) NULL ,
                 [BatchDate] [varchar](50) NULL ,
                 [DivisionOrBranchName] [varchar](50) NULL ,
                 [RecordType] [varchar](50) NULL ,
                 [IDType] [varchar](50) NULL ,
                 [IDNo] [varchar](50) NULL ,
                 [NameLine1] [varchar](50) NULL ,
                 [NameLine2] [varchar](50) NULL ,
                 [AddressType] [varchar](50) NULL ,
                 [BlockNo] [varchar](50) NULL ,
                 [StName] [varchar](50) NULL ,
                 [LevelNo] [varchar](50) NULL ,
                 [UnitNo] [varchar](50) NULL ,
                 [PostalCode] [varchar](50) NULL ,
                 [AddressLine1] [varchar](50) NULL ,
                 [AddressLine2] [varchar](50) NULL ,
                 [AddressLine3] [varchar](50) NULL ,
                 [TX_UF_POSTAL_CODE] [varchar](50) NULL ,
                 [CountryCode] [varchar](50) NULL ,
                 [Nationality] [varchar](50) NULL ,
                 [Sex] [varchar](50) NULL ,
                 [DateOfBirth] [varchar](50) NULL ,
                 [Amount] [varchar](50) NULL ,
                 [PaymentPeriodFromDate] [varchar](50) NULL ,
                 [PaymentPeriodToDate] [varchar](50) NULL ,
                 [MBF] [varchar](50) NULL ,
                 [Donation] [varchar](50) NULL ,
                 [CPF] [varchar](50) NULL ,
                 [Insurance] [varchar](50) NULL ,
                 [pay_frequency] [varchar](50) NULL ,
                 [Bonus] [varchar](50) NULL ,
                 [DirectorsFees] [varchar](50) NULL ,
                 [Others] [varchar](50) NULL ,
                 [ShareOptionGainsS101g] [varchar](50) NULL ,
                 [ExemptIncome] [varchar](50) NULL ,
                 [IncomeForTaxBorneByEmployer] [varchar](50) NULL ,
                 [IncomeForTaxBorneByEmployee] [varchar](50) NULL ,
                 [BenefitsInKind] [varchar](50) NULL ,
                 [S45Applicable] [varchar](50) NULL ,
                 [IncomeTaxBorneByEmployer] [varchar](50) NULL ,
                 [GratuityNoticePymExGratiaPaid] [varchar](50) NULL ,
                 [CompensationRetrenchmentBenefitsPaid] [varchar](50) NULL ,
                 [ApprovalObtainedFromIRAS] [varchar](50) NULL ,
                 [ApprovalDate] [varchar](50) NULL ,
                 [CessationProvisions] [varchar](50) NULL ,
                 [IR8SApplicable] [varchar](50) NULL ,
                 [ExemptOrRemissionIncomeIndicator] [varchar](50) NULL ,
                 [CompensationAndGratuity] [varchar](50) NULL ,
                 [GrossCommissionAmount] [varchar](50) NULL ,
                 [GrossCommissionPeriodFrom] [varchar](50) NULL ,
                 [GrossCommissionPeriodTo] [varchar](50) NULL ,
                 [GrossCommissionIndicator] [varchar](50) NULL ,
                 [Pension] [varchar](50) NULL ,
                 [TransportAllowance] [varchar](50) NULL ,
                 [EntertainmentAllowance] [varchar](50) NULL ,
                 [OtherAllowance] [varchar](50) NULL ,
                 [GratuityNoticePymExGratia] [varchar](50) NULL ,
                 [RetrenchmentBenefits] [varchar](50) NULL ,
                 [RetrenchmentBenefitsUpto311292] [varchar](50) NULL ,
                 [RetrenchmentBenefitsFrom1993] [varchar](50) NULL ,
                 [EmployerContributionToPensionOrPFOutsideSg] [varchar](50) NULL ,
                 [ExcessEmployerContributionToCPF] [varchar](50) NULL ,
                 [ShareOptionGainsS101b] [varchar](50) NULL ,
                 [BenefitsInKindValue] [varchar](50) NULL ,
                 [EmployeesVoluntaryContributionToCPF] [varchar](50) NULL ,
                 [Designation] [varchar](50) NULL ,
                 [CommencementDate] [varchar](50) NULL ,
                 [CessationDate] [varchar](50) NULL ,
                 [BonusDecalrationDate] [varchar](50) NULL ,
                 [DirectorsFeesApprovalDate] [varchar](50) NULL ,
                 [RetirementBenefitsFundName] [varchar](50) NULL ,
                 [DesignatedPensionOrProvidentFundName] [varchar](50) NULL ,
                 [BankName] [varchar](50) NULL ,
                 [PayrollDate] [varchar](50) NULL ,
                 [Filler] [varchar](50) NULL ,
                 [GratuityOrCompensationDetailedInfo] [varchar](50) NULL ,
                 [ShareOptionGainsDetailedInfo] [varchar](50) NULL ,
                 [Remarks] [varchar](50) NULL ,
                 [RecordType2] [varchar](50) NULL ,
                 [NoOfReCords] [varchar](50) NULL ,
                 [TotalPayment] [varchar](50) NULL ,
                 [TotalSalary] [varchar](50) NULL ,
                 [TotalBonus] [varchar](50) NULL ,
                 [TotalDirectorsFees] [varchar](50) NULL ,
                 [TotalOthers] [varchar](50) NULL ,
                 [TotalExemptIncome] [varchar](50) NULL ,
                 [TotalIncomeForTaxBorneByEmployer] [varchar](50) NULL ,
                 [TotalIncomeForTaxBorneByEmployee] [varchar](50) NULL ,
                 [TotalDonation] [varchar](50) NULL ,
                 [TotalCPF] [varchar](50) NULL ,
                 [TotalInsurace] [varchar](50) NULL ,
                 [TotalMBF] [varchar](50) NULL ,
                 [Filler2] [varchar](50) NULL
                )
         ON     [PRIMARY]

   END
GO


GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'ir8aApendix_employee' AND
                    xtype = 'U' ) 
   SET @exist = 1

IF (@exist = 0) 
   BEGIN
		CREATE TABLE [dbo].[ir8aApendix_employee](
			[id] [int] IDENTITY(1,1) NOT NULL,
			[emp_id] [nvarchar](50) NULL,
			[RecordType] [nvarchar](50) NULL,
			[IDType] [nvarchar](50) NULL,
			[IDNo] [nvarchar](50) NULL,
			[NameLine1] [nvarchar](50) NULL,
			[NameLine2] [nvarchar](50) NULL,
			[ResidencePlaceValue] [nvarchar](50) NULL,
			[ResidenceAddressLine1] [nvarchar](50) NULL,
			[ResidenceAddressLine2] [nvarchar](50) NULL,
			[ResidenceAddressLine3] [nvarchar](50) NULL,
			[OccupationFromDate] [nvarchar](50) NULL,
			[OccupationToDate] [nvarchar](50) NULL,
			[NoOfDays] [nvarchar](50) NULL,
			[AVOrRentByEmployer] [nvarchar](50) NULL,
			[RentByEmployee] [nvarchar](50) NULL,
			[FurnitureValue] [nvarchar](50) NULL,
			[HardOrsoftFurnitureItemsValue] [nvarchar](50) NULL,
			[RefrigeratorValue] [nvarchar](50) NULL,
			[NoOfRefrigerators] [nvarchar](50) NULL,
			[VideoRecorderValue] [nvarchar](50) NULL,
			[NoOfVideoRecorders] [nvarchar](50) NULL,
			[WashingMachineDryerDishWasherValue] [nvarchar](50) NULL,
			[NoOfWashingMachines] [nvarchar](50) NULL,
			[NoOfDryers] [nvarchar](50) NULL,
			[NoOfDishWashers] [nvarchar](50) NULL,
			[AirConditionerValue] [nvarchar](50) NULL,
			[NoOfAirConditioners] [nvarchar](50) NULL,
			[NoOfCentralACDining] [nvarchar](50) NULL,
			[NoOfCentralACSitting] [nvarchar](50) NULL,
			[NoOfCentralACAdditional] [nvarchar](50) NULL,
			[TVRadioAmpHiFiStereoElectriGuitarValue] [nvarchar](50) NULL,
			[NoOfTVs] [nvarchar](50) NULL,
			[NoOfRadios] [nvarchar](50) NULL,
			[NoOfAmplifiers] [nvarchar](50) NULL,
			[NoOfHiFiStereos] [nvarchar](50) NULL,
			[NoOfElectriGuitar] [nvarchar](50) NULL,
			[ComputerAndOrganValue] [nvarchar](50) NULL,
			[NoOfComputers] [nvarchar](50) NULL,
			[NoOfOrgans] [nvarchar](50) NULL,
			[SwimmingPoolValue] [nvarchar](50) NULL,
			[NoOfSwimmingPools] [nvarchar](50) NULL,
			[PublicUtilities] [nvarchar](50) NULL,
			[Telephone] [nvarchar](50) NULL,
			[Pager] [nvarchar](50) NULL,
			[Suitcase] [nvarchar](50) NULL,
			[GolfBagAndAccessories] [nvarchar](50) NULL,
			[Camera] [nvarchar](50) NULL,
			[Servant] [nvarchar](50) NULL,
			[Driver] [nvarchar](50) NULL,
			[GardenerOrCompoundUpkeep] [nvarchar](50) NULL,
			[OtherBenefitsInKindValue] [nvarchar](50) NULL,
			[HotelAccommodationValue] [nvarchar](50) NULL,
			[SelfWifeChildAbove20NoOfPersons] [nvarchar](50) NULL,
			[SelfWifeChildAbove20NoOfDays] [nvarchar](50) NULL,
			[SelfWifeChildAbove20Value] [nvarchar](50) NULL,
			[ChildBetween8And20NoOfPersons] [nvarchar](50) NULL,
			[ChildBetween8And20NoOfDays] [nvarchar](50) NULL,
			[ChildBetween8And20Value] [nvarchar](50) NULL,
			[ChildBetween3And7NoOfPersons] [nvarchar](50) NULL,
			[ChildBetween3And7NoOfDays] [nvarchar](50) NULL,
			[ChildBetween3And7Value] [nvarchar](50) NULL,
			[ChildBelow3NoOfPersons] [nvarchar](50) NULL,
			[ChildBelow3NoOfDays] [nvarchar](50) NULL,
			[ChildBelow3Value] [nvarchar](50) NULL,
			[Percent2OfBasic] [nvarchar](50) NULL,
			[CostOfLeavePassageAndIncidentalBenefits] [nvarchar](50) NULL,
			[NoOfLeavePassageSelf] [nvarchar](50) NULL,
			[NoOfLeavePassageWife] [nvarchar](50) NULL,
			[NoOfLeavePassageChildren] [nvarchar](50) NULL,
			[OHQStatus] [nvarchar](50) NULL,
			[InterestPaidByEmployer] [nvarchar](50) NULL,
			[LifeInsurancePremiumsPaidByEmployer] [nvarchar](50) NULL,
			[FreeOrSubsidisedHoliday] [nvarchar](50) NULL,
			[EducationalExpenses] [nvarchar](50) NULL,
			[NonMonetaryAwardsForLongService] [nvarchar](50) NULL,
			[EntranceOrTransferFeesToSocialClubs] [nvarchar](50) NULL,
			[GainsFromAssets] [nvarchar](50) NULL,
			[FullCostOfMotorVehicle] [nvarchar](50) NULL,
			[CarBenefit] [nvarchar](50) NULL,
			[OthersBenefits] [nvarchar](50) NULL,
			[TotalBenefitsInKind] [nvarchar](50) NULL,
			[NoOfEmployeesSharingQRS] [nvarchar](50) NULL,
			[Filler] [nvarchar](50) NULL,
			[Remarks] [nvarchar](50) NULL,
			[Year] [nchar](10) NULL,
			[comp_id] [nvarchar](50) NULL
		) ON [PRIMARY]
END
GO


GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'IR8aList' AND
                    xtype = 'U' ) 
   SET @exist = 1

IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[IR8aList]
                (
                 [id] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [FurnitureHard] [nchar](10) NULL ,
                 [FurnitureSoft] [nchar](10) NULL ,
                 [Refigerator] [nchar](10) NULL ,
                 [VideoPlayer] [nchar](10) NULL ,
                 [WashingMachine] [nchar](10) NULL ,
                 [Dryer] [nchar](10) NULL ,
                 [DishWasher] [nchar](10) NULL ,
                 [AirConditionerUnit] [nchar](10) NULL ,
                 [AirConditionerCentral] [nchar](10) NULL ,
                 [AirConditionerDining] [nchar](10) NULL ,
                 [AirConditionerSitting] [nchar](10) NULL ,
                 [AirConditionerAdditional] [nchar](10) NULL ,
                 [Airpurifier] [nchar](10) NULL ,
                 [HomeTheater] [nchar](10) NULL ,
                 [Radio] [nchar](10) NULL ,
                 [HIFiStereo] [nchar](10) NULL ,
                 [ElectricGuitar] [nchar](10) NULL ,
                 [SurveillanceSystem] [nchar](10) NULL ,
                 [Computer] [nchar](10) NULL ,
                 [Organ] [nchar](10) NULL ,
                 [SwimmingPool] [nchar](10) NULL ,
                 [PublicUtilities] [nchar](10) NULL ,
                 [Telephone] [nchar](10) NULL ,
                 [Pager] [nchar](10) NULL ,
                 [Suitcase] [nchar](10) NULL ,
                 [GlofBag] [nchar](10) NULL ,
                 [Camera] [nchar](10) NULL ,
                 [Servant] [nchar](10) NULL ,
                 [Driver] [nchar](10) NULL ,
                 [Gardener] [nchar](10) NULL ,
                 [SelfAccomodation] [nchar](10) NULL ,
                 [WifeAccomodation] [nchar](10) NULL ,
                 [ElderChildAccomodation] [nchar](10) NULL ,
                 [Children2yrAccomodation] [nchar](10) NULL ,
                 [Children7yrAccomodation] [nchar](10) NULL ,
                 [Children20yrAccomodation] [nchar](10) NULL ,
                 CONSTRAINT [PK_FurnitureList] PRIMARY KEY CLUSTERED ([id] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
                )
         ON     [PRIMARY]
   END
GO


GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'RightsHeader' AND
                    xtype = 'U' ) 
   SET @exist = 1

IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[RightsHeader]
                (
                 [RightId] [int] IDENTITY(1, 1)
                                 NOT NULL ,
                 [RightHeader] [nvarchar](50) NULL ,
                 CONSTRAINT [PK_RightsHeader] PRIMARY KEY CLUSTERED ([RightId] ASC)
                    WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
                          ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
                )
         ON     [PRIMARY]

   END
GO


GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'TABLEOBJ' AND
                    xtype = 'U' ) 
   SET @exist = 1

IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[TABLEOBJ]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [TABLEID] [int] NOT NULL ,
                 [TABLENAME] [varchar](50) NOT NULL
                )
         ON     [PRIMARY]
   END
GO


GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    SysObjects
            WHERE   name = N'TABLEOBJATTRIB' AND
                    xtype = 'U' ) 
	DROP TABLE TABLEOBJATTRIB
   --SET @exist = 1

IF (@exist <= 2)
   CREATE TABLE [dbo].[TABLEOBJATTRIB]
          (
           [ID] [int] IDENTITY(1, 1)
                      NOT NULL ,
           [TableID] [int] NOT NULL ,
           [Field_Type] [varchar](50) NOT NULL ,
           [Field_Width] [int] NOT NULL ,
           [Field_Name] [varchar](50) NOT NULL ,
           [Alias_Name] [varchar](50) NOT NULL ,
           [Table_Source] [varchar](8000) NULL ,
           [Group_Source] [varchar](250) NULL ,
           [GroupColumn] [nvarchar](50) NULL
          )
   ON     [PRIMARY]
GO

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'AWAudit' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0)
	CREATE TABLE [dbo].[AWAudit](
           [ID] [int] IDENTITY(1, 1)
                      NOT NULL ,
		[trx_id] [int] NOT NULL,
		[emp_id] [int] NOT NULL,
		[CMOW] [float] NULL,
		[LYOW] [float] NULL,
		[CYOW] [float] NULL,
		[CPFAWCIL] [float] NULL,
		[EST_AWCIL] [float] NULL,
		[ACTCIL] [float] NULL,
		[AWCM] [float] NULL,
		[AWB4CM] [float] NULL,
		[AWCM_AWB4CM] [float] NULL,
		[AWSUBJCPF] [float] NULL,
		[createdate] [datetime] NULL CONSTRAINT [DF_AWAudit_createdate]  DEFAULT (getdate())
	) ON [PRIMARY]
GO

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'IR8AppendixB' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0)
	CREATE TABLE [dbo].[IR8AppendixB](
		[Emp_Code] [nvarchar](50) NULL,
		[NRIC] [nvarchar](50) NULL,
		[CompanyCode] [nvarchar](50) NULL,
		[TypeOfPlan] [nvarchar](50) NULL,
		[SectionType] [nvarchar](50) NULL,
		[DateOfGrant] [datetime] NULL,
		[DateOfExcercise] [datetime] NULL,
		[ExcercisePrice] [nvarchar](50) NULL,
		[OpenMarketShareValueAtDateGrant] [nvarchar](50) NULL,
		[OpenMarketShareValue] [nvarchar](50) NULL,
		[NoOfSharesAcquired] [nvarchar](50) NULL,
		[GrossAmountQualifyingForIncomeTax] [nvarchar](50) NULL,
		[GrossAmountNotQualifyingForTaxExemption] [nvarchar](50) NULL,
		[GrossAmountOfGainsFromPlans] [nvarchar](50) NULL,
		[Year] [nchar](10) NULL
	) ON [PRIMARY]
GO

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'empPayslipRemarks' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0)
	CREATE TABLE [dbo].[empPayslipRemarks](
		[rowid] [nvarchar](50) NULL,
		[emp_code] [nchar](10) NULL,
		[StartDate] [nchar](10) NULL,
		[EndDate] [nchar](10) NULL,
		[Remarks] [nvarchar](500) NULL,
		[RemarksBy] [nvarchar](50) NULL
	) ON [PRIMARY]
GO

GO
	DECLARE @exist INT
	SET @exist = 0 
	IF EXISTS ( SELECT  name
				FROM    sysobjects
				WHERE   name = N'LeavesAllowedInYears' AND
						xtype = 'U' ) 
	   SET @exist = 1
	IF (@exist = 0)
	Select 
		--C.Company_Name, 
		F.Years, F.Emp_ID, 
		--(Em.Emp_Name+' ' + Em.Emp_Lname) FullName, 
		F.LeavesAvailable
	Into LeavesAllowedInYears
	  From
	(
		Select LA.Emp_ID, LA.leave_year Years,(isnull(Leave_Remaining,0) + isnull(R.PL,0)) LeavesAvailable
		From Leaves_Annual LA 
		Left Outer Join
		(
			Select D.Emp_ID, Years, PL From
			(	SELECT    D.Emp_ID, leave_type, Years, SUM(PaidLeaves) PL
				FROM      
				(	SELECT El.Emp_ID, el.leave_type, Year(Eld.leave_date) Years,                  
					CONVERT(DECIMAL(8, 1), CONVERT(DECIMAL(8, 2), COUNT(Eld.halfday_leave)) /                  
					2) PaidLeaves                  
					FROM   Emp_Leaves el                  
					INNER JOIN emp_Leaves_Detail Eld ON el.trx_id = eld.trx_id                  
					WHERE  --(year(Eld.Leave_Date) = 2009) AND                  
					(Eld.unpaid_leave = 0 AND                  
					eld.halfday_leave = 1) AND         
					El.Status = 'Approved'                  
					GROUP BY El.Emp_Id, el.leave_type, Year(Eld.leave_date) 
					UNION ALL                  
					SELECT El.Emp_Id, el.leave_type, Year(Eld.leave_date) Years,                  
					COUNT(Eld.unpaid_leave) PaidLeaves                  
					FROM   Emp_Leaves el                  
					INNER JOIN emp_Leaves_Detail Eld ON el.trx_id = eld.trx_id                  
					WHERE               
					--(year(Eld.Leave_Date) = 2009) AND                  
					(Eld.unpaid_leave = 0 AND                  
					eld.halfday_leave = 0 ) AND                  
					El.Status = 'Approved'                  
					GROUP BY El.Emp_Id, el.leave_type, Year(Eld.leave_date)                  
				) D 
				Where D.Leave_Type = 8
				GROUP BY  D.Emp_ID, D.leave_type, D. Years
			) D
		) R On LA.Emp_ID = R.Emp_ID  And LA.Leave_Year = R.Years
	) F 
	Inner Join Employee EM On F.Emp_ID=EM.Emp_Code
	Inner Join Company  C  On C.Company_ID=EM.Company_ID
	Order By C.Company_Name, Years, Em.emp_Name
	GO


GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'AccomodationMasterTable' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[AccomodationMasterTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccCode] [nvarchar](100) NULL,
	[AccomodationName] [nvarchar](100) NULL,
	[AssetType] [nvarchar](5) NULL,
	[AssetAmount] [nchar](10) NULL,
	[AccAddressLine1] [nvarchar](50) NULL,
	[AccAddressLine2] [nvarchar](50) NULL,
	[AccPostalCode] [nvarchar](50) NULL,
	[AccAuthPerson1] [nvarchar](50) NULL,
	[AccAuthPersonPhone] [nvarchar](50) NULL,
	[AccAuthPerson2] [nvarchar](50) NULL,
	[AccAuthPerson2Phone] [nvarchar](50) NULL,
	[AccAssistantName] [nvarchar](50) NULL,
	[AccAssistantPhone] [nvarchar](50) NULL,
	[ArchitectCompanyName] [nvarchar](50) NULL,
	[ArchitectCompanyAddress] [nvarchar](50) NULL,
	[ArchitectCompanyPhone] [nvarchar](50) NULL,
	[ArchitectCompanyFax] [nvarchar](50) NULL,
	[ArchitectAuthPersonName] [nvarchar](50) NULL,
	[ArchitectAuthPersonEmail] [nvarchar](50) NULL,
	[Cooking] [nvarchar](50) NULL,
	[CookingType] [nvarchar](50) NULL,
	[CookingCost] [nvarchar](50) NULL,
	[Laundry] [nvarchar](50) NULL,
	[LaundryCost] [nvarchar](50) NULL,
	[Aircon] [nvarchar](50) NULL,
	[AirconCost] [nvarchar](50) NULL,
	[TotalRooms] [nvarchar](50) NULL,
	[Capacity] [nvarchar](50) NULL,
	[singleBedNo] [nvarchar](50) NULL,
	[DoubleBedNo] [nvarchar](50) NULL,
	[TripleBedNo] [nvarchar](50) NULL,
	[NEAApproval] [nvarchar](50) NULL,
	[NEADateOfApproval] [nvarchar](50) NULL,
	[NEADateOfExpiry] [nvarchar](50) NULL,
	[NEAAppRefNo] [nvarchar](50) NULL,
	[NEAAppCapacity] [nvarchar](50) NULL,
	[PUBapproval] [nvarchar](50) NULL,
	[PUBdateOfApproval] [nvarchar](50) NULL,
	[PUBDateOfExpiry] [nvarchar](50) NULL,
	[PUBAppRefNo] [nvarchar](50) NULL,
	[PUBappCapacity] [nvarchar](50) NULL,
	[PropertyType] [nvarchar](50) NULL,
	[PropertyMonthlyRental] [nvarchar](50) NULL,
	[PropertydateOfApproval] [nvarchar](50) NULL,
	[PropertyDateOfExpiry] [nvarchar](50) NULL,
	[PropertyApprRefNo] [nvarchar](50) NULL,
	[PropertyApprCapacity] [nvarchar](50) NULL,
	[EmpRent] [nvarchar](50) NULL,
	[CompId] [nchar](10) NOT NULL
) ON [PRIMARY]
GO

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmpAccomadationDetails' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[EmpAccomadationDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Code] [nchar](10) NOT NULL,
	[AccomadationCode] [nchar](10) NULL,
	[EffectiveCheckInDate] [nvarchar](50) NULL,
	[EffectiveCheckOutDate] [nvarchar](50) NULL,
	[AssignedBy] [nchar](10) NULL
) ON [PRIMARY]
GO

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'ProductVersion' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[ProductVersion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [varchar](5) NULL,
	[VersionNumber] [varchar](20) NULL,
	[VersionDate] [datetime] NULL,
	[ReleaseDate] [datetime] NULL,
 CONSTRAINT [PK_ProductVersion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Trade' AND
                    xtype = 'U' ) 
SET @exist = 1

IF (@exist = 0)
CREATE TABLE [dbo].[Trade](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Trade] [varchar](100) NOT NULL,
	[Company_id] [int] NOT NULL,
 CONSTRAINT [PK_Trade] PRIMARY KEY CLUSTERED 
(
	[Trade] ASC,
	[Company_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO



GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'DataBaseBackupLog' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
	CREATE TABLE [dbo].[DataBaseBackupLog]
	(
		[LogId] [int] IDENTITY(1,1) NOT NULL,
		[LogDetails] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[ErrorLogDateTime] [datetime] NULL,
		[Log_Type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
	) ON [PRIMARY]
GO

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeBankInfo' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[EmployeeBankInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_ID] [int] NOT NULL,
	[Payment_From] [int] NOT NULL,
	[Giro_Bank_ID] [int] NOT NULL,
	[Giro_Acct_Number] [varchar](50) NULL,
	[Giro_Branch] [varchar](50) NULL,
	[Giro_Acc_Name] [varchar](50) NULL,
	[Percentage] [float] NOT NULL,
	[Remarks] [varchar](100) NULL,
	[Createddate] [datetime] NOT NULL CONSTRAINT [DF_EmployeeBankInfo_Createddate]  DEFAULT (getdate())
) ON [PRIMARY]

GO

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeEarning' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[EmployeeEarning](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IRYear] [int] NOT NULL,
	[Emp_ID] [int] NOT NULL,
	[GrossPay] [float] NULL,
	[Bonus] [float] NULL,
	[DirectorFee] [float] NULL,
	[Commission] [float] NULL,
	[Pension] [float] NULL,
	[TransAllow] [float] NULL,
	[EntAllow] [float] NULL,
	[OtherAllow] [float] NULL,
	[EmployeeCPF] [float] NULL,
	[Funds] [float] NULL,
	[MBMF] [float] NULL,
 CONSTRAINT [PK_EmployeeEarning] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeAssignedToWorkersList' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[EmployeeAssignedToWorkersList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RefID] [int] NOT NULL,
	[Emp_ID] [int] NOT NULL
) ON [PRIMARY]
GO

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'MultiProjectAssigned' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[MultiProjectAssigned](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubProjectID] [int] NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[Emp_ID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_MultiProjectAssigned_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_MultiProjectAssigned] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]


GO
/****** Object:  Table [dbo].[Actatek_Logs_Validate]    Script Date: 01/04/2011 10:38:02 ******/
GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Actatek_Logs_Validate' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[Actatek_Logs_Validate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SrNo] [int] NULL,
	[Emp_ID] [int] NULL,
	[TSDate] [datetime] NULL,
	[InTime] [varchar](50) NULL,
	[OutTime] [varchar](50) NULL,
	[Valid] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
/****** Object:  Table [dbo].[MultiProjectAssignedEOY]    Script Date: 01/19/2011 11:04:33 ******/
GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'MultiProjectAssignedEOY' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[MultiProjectAssignedEOY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubProjectID] [int] NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[Emp_ID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_MultiProjectAssignedEOY_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_MultiProjectAssignedEOY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MultiProjectUnAssignedEOY]    Script Date: 01/19/2011 11:06:17 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'MultiProjectUnAssignedEOY' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[MultiProjectUnAssignedEOY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SubProjectID] [int] NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[Emp_ID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_MultiProjectUnAssignedEOY_CreatedDate]  DEFAULT (getdate()),
	[EntryType] [varchar](1) NULL,
 CONSTRAINT [PK_MultiProjectUnAssignedEOY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
/****** Object:  Table [dbo].[ProjectAssignedOnMultiDate]    Script Date: 01/19/2011 11:08:02 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'ProjectAssignedOnMultiDate' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[ProjectAssignedOnMultiDate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FromDate] [datetime] NOT NULL,
	[ToDate] [datetime] NULL,
	[Emp_Code] [int] NOT NULL,
	[SubProjectID] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL CONSTRAINT [DF_ProjectAssignedOnMultiDate_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_ProjectAssignedOnMultiDate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'MasterCompany_User' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[MasterCompany_User](
	[CompanyId] [int] NULL,
	[UserID] [int] NULL
) ON [PRIMARY]

GO

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'ACTATEK_LOGS_TEMP' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[ACTATEK_LOGS_TEMP](
	[WorkerID] [varchar](20) NULL,
	[ProjectCode] [varchar](200) NULL,
	[DateIn] [varchar](20) NULL,
	[TimeIn] [varchar](20) NULL,
	[DateOut] [varchar](20) NULL,
	[TimeOut] [varchar](20) NULL,
	[Company_Id] [varchar](20) NULL,
	[TranId] [varchar](20) NULL,
	[timesheetdate] [varchar](20) NULL,
	[Company] [varchar](200) NULL,
	[WorkerName] [varchar](200) NULL,
	[InterCoProjectCode] [varchar](200) NULL,
	[BusinessUnit] [varchar](200) NULL
) ON [PRIMARY]
GO



DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'ACTATEK_LOGS_BC' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[ACTATEK_LOGS_BC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](20) NOT NULL,
	[timeentry] [varchar](20) NOT NULL,
	[eventID] [varchar](20) NULL,
	[terminalSN] [varchar](20) NULL,
	[jpegPhoto] [image] NULL,
	[company_id] [int] NULL,
	[tranid] [varchar](20) NULL,
	[Inserted] [varchar](1) NULL CONSTRAINT [DF_ACTATEK_LOGS_BC_Inserted]  DEFAULT ('A'),
	[softdelete] [int] NULL CONSTRAINT [DF_ACTATEK_LOGS_BC_softdelete]  DEFAULT ((0)),
	[NightShift] [bit] NULL CONSTRAINT [DF_ACTATEK_LOGS_NightShift]  DEFAULT ((0)),
	[SessionID] [int] NULL,
	[Roster_ID] [int] NULL,
	[Remarks] [varchar](200) NULL,
 CONSTRAINT [PK_ACTATEK_LOGS_BC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


/****** Object:  Table [dbo].[ACTATEK_LOGS_PROXY]    Script Date: 05/10/2011 11:34:42 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'ACTATEK_LOGS_PROXY' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[ACTATEK_LOGS_PROXY]
(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](20) NOT NULL,
	[timeentry] [varchar](20) NOT NULL,
	[eventID] [varchar](20) NULL,
	[terminalSN] [varchar](20) NULL,
	[jpegPhoto] [image] NULL,
	[company_id] [int] NULL,
	[tranid] [varchar](20) NULL,
	[Inserted] [varchar](1) NULL CONSTRAINT [DF_ACTATEK_LOGS_Inserted_PX]  DEFAULT ('A'),
	[softdelete] [int] NULL CONSTRAINT [DF_ACTATEK_LOGS_softdelete_PX]  DEFAULT ((0)),
	[NightShift] [bit] NULL CONSTRAINT [DF_NightShift_PX]  DEFAULT ((0)),
	[SessionID] [int] NULL,
	[Roster_ID] [int] NULL,
	[Remarks] [varchar](200) NULL,
	[ID_FK] numeric(18, 0) NULL
 CONSTRAINT [PK_ACTATEK_LOGS_PX] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF


GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Grid_Persisting_Setting' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[Grid_Persisting_Setting](
	[Gid] [int] IDENTITY(1,1) NOT NULL,
	[Username_Grid_Page] [nvarchar](max) NULL,
	[PersistingGridSettings] [nvarchar](max) NULL,
	[Date] [datetime] NULL CONSTRAINT [DF_Grid_Persisting_Setting_Date]  DEFAULT (getdate())
) ON [PRIMARY]


GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'GridHeader' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[GridHeader](
	[Gid] [int] IDENTITY(1,1) NOT NULL,
	[GridNo] [int] NULL,
	[ReportName] [varchar](500) NULL,
	[Other] [varchar](max) NULL,
	[GenerateBy] [bit] NULL
) ON [PRIMARY]
GO
----------------------------------------------------CPF Changes for 2011 New Configuation Tables----------------------
GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Company_CPF_CEILING' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[Company_CPF_CEILING](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[monthly_cpf_celi] [int] NOT NULL,
	[annual_cpf_ceil] [int] NOT NULL,
	[EffectiveDateFrom] [datetime] NOT NULL,
	[EffectiveDateTo] [datetime] NOT NULL,
 CONSTRAINT [PK_Company_CPF_CEILING] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

/****** Object:  Table [dbo].[CPF_AdditionalWages_CEILING]    Script Date: 07/20/2011 17:08:03 ******/
GO
DECLARE @exist INT
SET @exist = 0
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'CPF_AdditionalWages_CEILING' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[CPF_AdditionalWages_CEILING](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Additional_Wage_Ceiling] [int] NOT NULL,
	[EffectiveDateFrom] [datetime] NOT NULL,
	[EffectiveDateTo] [datetime] NOT NULL,
 CONSTRAINT [PK_CPF_AdditionalWages_CEILING] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



----------------------------------------------------------------------------------------------------------------

----One Time Job for client --Do not delete and uncomment
--IF EXISTS ( SELECT  *
--            FROM    sys.triggers
--            WHERE   object_id = OBJECT_ID(N'[dbo].[trg_Insert_Actatek]') ) 
--   DROP TRIGGER [dbo].[trg_Insert_Actatek]
--/****** Object:  Trigger [dbo].[trg_Insert_Actatek]    Script Date: 02/08/2011 17:30:08 ******/
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
-- =============================================
-- Author:       <Shashank>
-- Create date    : <08 FEB 2011>
-- Description    :   <Insert trigger for Actatek to insert data into WMS.ACTATEK_LOGS>
-- =============================================
--CREATE  TRIGGER [dbo].[trg_Insert_Actatek]
--   ON  [dbo].[DOORLOG]
--   AFTER INSERT
--AS 
--BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
--      SET NOCOUNT ON;
--      DECLARE @userID varchar(20);
--      DECLARE @timeentry DATETIME;
--      DECLARE @timeday   DATETIME;
--      DECLARE @timelog   DATETIME;
--      DECLARE @eventID VARCHAR(20);
--      DECLARE @terminalSN VARCHAR(20);
--      DECLARE @Inserted VARCHAR(1); 
--      BEGIN
--            INSERT INTO WMS.dbo.ACTATEK_LOGS  (userid, timeentry, eventID, terminalSN, TranID)
--                  SELECT  
--                  i.[USER_ID], 
--                  convert(varchar, i.[LOG_DAY], 103) + ' ' + convert(varchar, i.[LOG_TIME], 8), i.[ACCESS_INDICATION], 
--                  i.[DOOR_NUMBER], 
--                  '0'  
--                  FROM INSERTED i --Insert statements for trigger here
--      END
--END
--GO


---------------------------------------------------------------------------------------------------------------------------------------------


----------Invoice New  table -------------------------

GO
/****** Object:  Table [dbo].[Order_hourly]    Script Date: 11/22/2011 15:27:59 ******/
GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Order_hourly' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[Order_hourly](
	[Qid] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [int] NULL,
	[QuotationNo] [int] NULL,
	[Trade] [varchar](50) NULL,
	[NH] [decimal](18, 2) NULL,
	[OT1] [decimal](18, 2) NULL,
	[OT2] [decimal](18, 2) NULL,
	[TransAccomod] [decimal](18, 2) NULL,
	[company_id] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order_Info]    Script Date: 11/22/2011 15:28:01 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Order_Info' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[Order_Info](
	[Oid] [int] IDENTITY(1,1) NOT NULL,
	[Prefix] [varchar](50) NULL,
	[OrderNo] [int] NULL,
	[ClientId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Remark] [varchar](max) NULL,
	[SalesRep] [varchar](max) NULL,
	[QuotationNo] [int] NULL,
	[company_id] [int] NULL,
	[EffectiveDate] [datetime] NULL,
	[Documentpath] [varchar](max) NULL,
	[Project] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientProject]    Script Date: 11/22/2011 15:27:51 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'ClientProject' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[ClientProject](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[ClientId] [int] NULL,
	[ProjectId] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuoationMaster_hourly]    Script Date: 11/22/2011 15:28:06 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'QuoationMaster_hourly' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[QuoationMaster_hourly](
	[Qid] [int] IDENTITY(1,1) NOT NULL,
	[QuotationNo] [int] NOT NULL,
	[Trade] [varchar](50) NULL,
	[NH] [decimal](18, 2) NULL,
	[OT1] [decimal](18, 2) NULL,
	[OT2] [decimal](18, 2) NULL,
	[company_id] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quotation_Info]    Script Date: 11/22/2011 15:28:10 ******/

/*****Check old table exist in old invoice and delete***/
if Exists(select * from sys.columns where Name = N'Flag' and Object_ID = Object_ID(N'Quotation_Info')) 
begin     
 -- Column Exists  
drop table Quotation_Info 
end
Go
/********/

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Quotation_Info' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[Quotation_Info](
	[IID] [int] IDENTITY(1,1) NOT NULL,
	[Prefix] [varchar](50) NULL,
	[QuotationNo] [int] NOT NULL,
	[ClientId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Remark] [varchar](max) NULL,
	[SalesRep] [varchar](max) NULL,
	[company_id] [int] NULL,
	[Project] [varchar](100) NULL,
	[Text] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClientDetails]    Script Date: 11/22/2011 15:27:51 ******/
/****check already Exist in old invoice***/
if Exists(select * from sys.columns where Name = N'Address1' and Object_ID = Object_ID(N'ClientDetails')) 
begin     
 -- Column Exists  
drop table ClientDetails 
end
GO
/*******/

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'ClientDetails' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[ClientDetails](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[ClientName] [varchar](100) NOT NULL,
	[Block] [varchar](max) NULL,
	[StreetBuilding] [varchar](max) NULL,
	[Level] [varchar](max) NULL,
	[Unit] [varchar](max) NULL,
	[PostalCode] [varchar](max) NULL,
	[Phone1] [varchar](100) NULL,
	[Phone2] [varchar](100) NULL,
	[Fax] [varchar](100) NULL,
	[Email] [varchar](500) NULL,
	[ContactPerson1] [varchar](100) NULL,
	[ContactPerson2] [varchar](100) NULL,
	[Remark] [varchar](max) NULL,
	[company_id] [int] NULL,
 CONSTRAINT [PK_ClientDetails] PRIMARY KEY CLUSTERED 
(
	[ClientName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Variable_Type]    Script Date: 11/22/2011 15:28:12 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Variable_Type' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[Variable_Type](
	[VarId] [int] NULL,
	[Type] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order_Variable]    Script Date: 11/22/2011 15:28:04 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Order_Variable' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[Order_Variable](
	[OVid] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [int] NULL,
	[Amount] [decimal](18, 0) NULL,
	[QuotationNo] [int] NULL,
	[company_id] [int] NULL,
	[VariableId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice_Hourly]    Script Date: 11/22/2011 15:27:53 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Invoice_Hourly' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[Invoice_Hourly](
	[IHId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [varchar](150) NULL,
	[Project] [varchar](150) NULL,
	[Trade] [varchar](150) NULL,
	[Amount] [decimal](18, 0) NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuoationMaster_Monthly]    Script Date: 11/22/2011 15:28:08 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'QuoationMaster_Monthly' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[QuoationMaster_Monthly](
	[HId] [int] IDENTITY(1,1) NOT NULL,
	[QuotationNo] [int] NULL,
	[Trade] [varchar](100) NULL,
	[EmpCode] [int] NULL,
	[Monthly] [decimal](18, 2) NULL,
	[Workingdays] [decimal](18, 1) NULL,
	[DailyRate] [decimal](18, 2) NULL,
	[OT1] [decimal](18, 2) NULL,
	[OT2] [decimal](18, 2) NULL,
	[company_id] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order_Monthly]    Script Date: 11/22/2011 15:28:03 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Order_Monthly' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[Order_Monthly](
	[HId] [int] IDENTITY(1,1) NOT NULL,
	[OrderNo] [int] NULL,
	[QuotationNo] [int] NULL,
	[Trade] [varchar](100) NULL,
	[EmpCode] [int] NULL,
	[Monthly] [decimal](18, 2) NULL,
	[Workingdays] [decimal](18, 1) NULL,
	[DailyRate] [decimal](18, 2) NULL,
	[OT1] [decimal](18, 2) NULL,
	[OT2] [decimal](18, 2) NULL,
	[company_id] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Variable_Preference]    Script Date: 11/22/2011 15:28:12 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Variable_Preference' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[Variable_Preference](
	[Vid] [int] IDENTITY(1,1) NOT NULL,
	[VarName] [varchar](200) NOT NULL,
	[Company_id] [int] NULL,
	[VariableId] [int] NULL,
	[DailyOneTime] [varchar](200) NULL,
 CONSTRAINT [PK_Variable_Preference] PRIMARY KEY CLUSTERED 
(
	[VarName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Invoice_variable]    Script Date: 11/22/2011 15:27:57 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Invoice_variable' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[Invoice_variable](
	[Ovid] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [varchar](150) NULL,
	[variableName] [varchar](max) NULL,
	[Amount] [decimal](18, 0) NULL,
	[AddSubType] [varchar](150) NULL,
	[Project] [varchar](150) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Invoice_Monthly]    Script Date: 11/22/2011 15:27:56 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Invoice_Monthly' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[Invoice_Monthly](
	[IMId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [varchar](150) NULL,
	[Project] [varchar](150) NULL,
	[Trade] [varchar](150) NULL,
	[Empcode] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[Amount] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Invoice_Info]    Script Date: 11/22/2011 15:27:55 ******/

/****Check already table exist in old invoice****/
if Exists(select * from sys.columns where Name = N'Trade_Selected' and Object_ID = Object_ID(N'Invoice_Info')) 
begin     
 -- Column Exists  
drop table Invoice_Info 
end
Go
/********/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Invoice_Info' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[Invoice_Info](
	[IId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceNo] [varchar](100) NOT NULL,
	[CreateDate] [datetime] NULL,
	[ClientID] [int] NULL,
	[PaymentTerms] [varchar](max) NULL,
	[SubTotal] [decimal](18, 2) NULL,
	[GST] [decimal](18, 2) NULL,
	[Total] [decimal](18, 2) NULL,
	[Company_Id] [int] NULL,
	[Confirm] [int] NULL,
	[FooterText] [text] NULL,
 CONSTRAINT [PK_Invoice_Info] PRIMARY KEY CLUSTERED 
(
	[InvoiceNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Quotation_Variable]    Script Date: 11/22/2011 15:28:11 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Quotation_Variable' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[Quotation_Variable](
	[Vid] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[QuotationNo] [int] NULL,
	[company_id] [int] NULL,
	[VariableId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentTerms]    Script Date: 11/22/2011 15:28:05 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'PaymentTerms' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[PaymentTerms](
	[Ip] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTerms] [varchar](200) NOT NULL,
	[Company_id] [int] NULL,
 CONSTRAINT [PK_PaymentTerms] PRIMARY KEY CLUSTERED 
(
	[PaymentTerms] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

GO
/****** Object:  Table [dbo].[StartNumber]    Script Date: 12/13/2011 09:46:54 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'StartNumber' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[StartNumber](
	[SID] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [varchar](200) NULL,
	[Prefix] [varchar](200) NULL,
	[StartNumber] [int] NULL,
	[Company_id] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[ReportText]    Script Date: 12/13/2011 09:48:30 ******/
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'ReportText' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[ReportText](
	[RId] [int] IDENTITY(1,1) NOT NULL,
	[Desc] [varchar](200) NULL,
	[Text] [text] NULL,
	[Company_Id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
----------Invoice table End -------------------------------------
--WorkfFlow 2

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeAssignedToWorkFlow2Sup' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[EmployeeAssignedToWorkFlow2Sup]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [PayrollGroupID] [int] NOT NULL ,
                 [Emp_ID] [int] NOT NULL
                )
         ON     [PRIMARY]
   END
Go

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'EmployeeAssignedToWorkFlow2Emp' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[EmployeeAssignedToWorkFlow2Emp]
                (
                 [ID] [int] IDENTITY(1, 1)
                            NOT NULL ,
                 [PayrollGroupID] [int] NOT NULL ,
                 [Emp_ID] [int] NOT NULL
                )
         ON     [PRIMARY]
   END
Go

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'MapAdditions' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
	CREATE TABLE [dbo].[MapAdditions](
	[Aid] [int] IDENTITY(1,1) NOT NULL,
	[Additions_Id] [int] NULL,
	[MapVariable] [varchar](50) NULL,
	[Company_id] [int] NULL
    ) ON [PRIMARY] 
  
   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Temp_Emp_Additions' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
      CREATE TABLE [dbo].[Temp_Emp_Additions](
			[Tid] [int] IDENTITY(1,1) NOT NULL,
			[Emp_code] [int] NULL,
			[trx_type] [int] NULL,
			[trx_amount] [decimal](18, 2) NULL,
			[BulkAddInMonth] [int] NULL
		) ON [PRIMARY]
   END
Go



DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'MapDeductions' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
      CREATE TABLE [dbo].[MapDeductions](
			[Aid] [int] IDENTITY(1,1) NOT NULL,
			[Deductions_Id] [int] NULL,
			[MapVariable] [varchar](50) NULL,
			[Company_id] [int] NULL
		) ON [PRIMARY]

	   END
Go


DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Temp_emp_deductions' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
   BEGIN
    CREATE TABLE [dbo].[Temp_emp_deductions](
			[Tid] [int] IDENTITY(1,1) NOT NULL,
			[Emp_code] [int] NULL,
			[trx_type] [int] NULL,
			[trx_amount] [decimal](18, 2) NULL,
			[BulkDedInMonth] [int] NULL
		) ON [PRIMARY]
   END
Go

DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'TimeSheetDailyData' AND
                    xtype = 'U' ) 
   SET @exist = 1

IF (@exist = 0) 
   BEGIN
         CREATE TABLE [dbo].[TimeSheetDailyData]
                (
                 [ID] [int] IDENTITY(1, 1)NOT NULL,
                 [Emp_Code]		[int] NOT NULL,
                 [ProjectId]	[int] NOT NULL,
                 [SubmitDate]	Datetime,
                 [NH] [nvarchar](100) NULL,
				 [OT1] [nvarchar](100) NULL,
				 [OT2] [nvarchar](100) NULL,
                 [Shift] INT, --0 Day , 1 night
                 --0 Submit , 1 Approve
                )
         ON     [PRIMARY]

   END
GO

GO
IF EXISTS(SELECT name FROM sysobjects WHERE name = N'DateInYear' AND xtype='U')
DROP TABLE DateInYear
GO
/****** Object:  Table [dbo].[Country]    Script Date: 01/09/2009 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DateInYear](
	[DateInYear] DateTime NOT NULL
)
GO



DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'Report_Settings' AND
                    xtype = 'U' ) 
   SET @exist = 1
IF (@exist = 0) 
BEGIN

/****** Object:  Table [dbo].[Report_Settings]    Script Date: 03/21/2012 11:40:09 ******/

		CREATE TABLE [dbo].[Report_Settings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PAYSLIPFORMAT] [int] NOT NULL,
	[NAME] [nvarchar](max) NOT NULL,
	[IDNO] [nvarchar](max) NOT NULL,
	[SALFORMONTH] [nvarchar](max) NOT NULL,
	[YEAR] [nvarchar](max) NOT NULL,
	[EARNINGS] [ntext] NULL,
	[DEDUCTIONS] [nvarchar](max) NOT NULL,
	[TOTALGROSS] [nvarchar](max) NOT NULL,
	[CPFGROSS] [nvarchar](max) NOT NULL,
	[EMPLOYERCPF] [nvarchar](max) NOT NULL,
	[TOTALDEDUCTION] [nvarchar](max) NOT NULL,
	[NETPAYMENT] [nvarchar](max) NOT NULL,
	[YEARTODATE] [nvarchar](max) NOT NULL,
	[YEATODATEEMPLOYERCPF] [nvarchar](max) NOT NULL,
	[COMPANYID] [int] NOT NULL,
	[LOGOMGT] [int] NULL CONSTRAINT [DF_Report_Settings_LOGOMGT]  DEFAULT ((1)),
	[DEPTNAME] [nvarchar](max) NULL,
	[TRADE] [nvarchar](max) NULL,
	[DESIGNATION] [nvarchar](max) NULL,
	[LEAVEDETAILS] [int] NULL,
	[ADDITIONSDETAILS] [int] NULL,
	 CONSTRAINT [PK_Report_Settings] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

END
GO

GO
DECLARE @exist INT
SET @exist = 0 
IF EXISTS ( SELECT  name
            FROM    sysobjects
            WHERE   name = N'leaves_forefited_new' AND
                    xtype = 'U' ) 
SET @exist = 1
IF (@exist = 0)
CREATE TABLE [dbo].[leaves_forefited_New](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LeaveType] [int] NULL,
	[Year] [int] NULL,
	[Company_Id] [int] NULL,
	[lastYearLeaves] [int] NULL,
	[leaves_anaualTaken] [int] NULL,
	[emp_code] [int] NULL
 CONSTRAINT [PK_leaves_forefited_New] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO