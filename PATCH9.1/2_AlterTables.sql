GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[leave_types]') AND name = N'IX_leave_types')
DROP INDEX [IX_leave_types] ON [dbo].[leave_types] WITH ( ONLINE = OFF )

GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_leave_types] ON [dbo].[leave_types] 
(
	[Type] ASC,
	[companyid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]

GO
IF Not Exists(select * from sys.columns where Name = N'CPFCalculate' and Object_ID = Object_ID(N'CPFAmount_detail'))
alter table CPFAmount_detail add CPFCalculate [int] null
GO
IF Not Exists(select * from sys.columns where Name = N'CPFCalculate' and Object_ID = Object_ID(N'cpf_calcs'))
alter table cpf_calcs add CPFCalculate [int] null
GO
IF Not Exists(select * from sys.columns where Name = N'email_leave_delete' and Object_ID = Object_ID(N'company'))
alter table company add email_leave_delete [varchar](max) NULL
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[girobanks]') AND name = N'PK_girobanks_1')
ALTER TABLE [dbo].[girobanks] DROP CONSTRAINT [PK_girobanks_1]
GO
ALTER TABLE girobanks ALTER COLUMN company_id int NOT NULL
GO
ALTER TABLE [dbo].[girobanks] ADD  CONSTRAINT [PK_girobanks_1] PRIMARY KEY CLUSTERED 
(
	[company_id] ASC,
	[bank_id] ASC,
	[bank_branch] ASC,
	[bank_accountno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
IF Not Exists(select * from sys.columns where Name = N'TradeID' and Object_ID = Object_ID(N'EmployeePayHistory'))
Alter table EmployeePayHistory add [TradeID]  Int null
GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[leaves_forefited]') AND name = N'leaves_forefit')
ALTER TABLE [dbo].[leaves_forefited] DROP CONSTRAINT [leaves_forefit]
Go
IF Not Exists(select * from sys.columns where Name = N'LY_Leaves_Bal' and Object_ID = Object_ID(N'LeavesAllowedInYears'))
Alter table LeavesAllowedInYears add LY_Leaves_Bal  float null
GO
IF Not Exists(select * from sys.columns where Name = N'LeaveType' and Object_ID = Object_ID(N'LeavesAllowedInYears'))
Alter table LeavesAllowedInYears add LeaveType  int null
GO
IF Not Exists(select * from sys.columns where Name = N'LY_Leaves_Bal' and Object_ID = Object_ID(N'YOSLeavesAllowed'))
Alter table YOSLeavesAllowed add LY_Leaves_Bal  float null
Go
IF Not Exists(select * from sys.columns where Name = N'LY_Leaves_Bal' and Object_ID = Object_ID(N'EmployeeLeavesAllowed'))
Alter table EmployeeLeavesAllowed add LY_Leaves_Bal  float null
Go
IF Not Exists(select * from sys.columns where Name = N'AMCSLimit' and Object_ID = Object_ID(N'MedicalCSN'))
Alter table MedicalCSN add [AMCSLimit]  float null
Go
IF Not Exists(select * from sys.columns where Name = N'AMCSRound' and Object_ID = Object_ID(N'MedicalCSN'))
Alter table MedicalCSN add [AMCSRound]  Int null
Go

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'DF_MedicalCSN_AMCSLimit'  AND type = 'D')
	ALTER TABLE MedicalCSN DROP CONSTRAINT DF_MedicalCSN_AMCSLimit
Go
	ALTER TABLE MedicalCSN ADD CONSTRAINT DF_MedicalCSN_AMCSLimit DEFAULT 1500 FOR [AMCSLimit]
Go

IF Exists(select * from sys.columns where Name = N'jpegPhoto' and Object_ID = Object_ID(N'Actatek_Logs_Machine'))
Alter table Actatek_Logs_Machine drop column jpegPhoto

Go
IF Not Exists(select * from sys.columns where Name = N'Leave_Model' and Object_ID = Object_ID(N'EMp_Leaves'))
Alter table Emp_Leaves add [Leave_Model]  int null

Go
IF Not Exists(select * from sys.columns where Name = N'cpf' and Object_ID = Object_ID(N'deductions_types'))
Alter table deductions_types add [cpf]  varchar(3) null

--GO
--If Not Exists(select * from sys.columns where Name = N'RightSubCategory' and Object_ID = Object_ID(N'UserRights'))
--Alter table UserRights add [ID] 
--GO
--If Not Exists(select * from sys.columns where Name = N'RightSubCategory' and Object_ID = Object_ID(N'UserRights'))
--Alter table UserRights add [RightSubCategory] NVARCHAR  NULL
--Go
--If Not Exists(select * from sys.columns where Name = N'HeaderId' and Object_ID = Object_ID(N'UserRights'))
--Alter table UserRights add [HeaderId] int
--Go
--If Not Exists(select * from sys.columns where Name = N'RightOrder' and Object_ID = Object_ID(N'UserRights'))
--Alter table UserRights add [RightOrder] int  NULL
--GO
--If Not Exists(select * from sys.columns where Name = N'DisplayID' and Object_ID = Object_ID(N'UserRights'))
--Alter table UserRights add [DisplayID] int  NULL
--GO
--If Not Exists(select * from sys.columns where Name = N'ParentId' and Object_ID = Object_ID(N'UserRights'))
--Alter table UserRights add [ParentId] int  NULL
--GO
--If Not Exists(select * from sys.columns where Name = N'GParentid' and Object_ID = Object_ID(N'UserRights'))
--Alter table UserRights add [GParentid] int  NULL
--GO
--If Not Exists(select * from sys.columns where Name = N'ActualRightName' and Object_ID = Object_ID(N'UserRights'))
--Alter table UserRights add [ActualRightName] NVARCHAR  NULL
--GO
--If Not Exists(select * from sys.columns where Name = N'Description' and Object_ID = Object_ID(N'UserRights'))
--Alter table UserRights add [Description] NVARCHAR  NULL
--GO
--IF EXISTS (SELECT name FROM sysobjects WHERE name = 'DF_UserRights_HeaderId'  AND type = 'D')
--	ALTER TABLE UserRights DROP CONSTRAINT DF_UserRights_HeaderId
--Go
--ALTER TABLE UserRights   ADD CONSTRAINT DF_UserRights_HeaderId DEFAULT 0 FOR HeaderId
--Go
Go
IF Not Exists(select * from sys.columns where Name = N'leave_forward' and Object_ID = Object_ID(N'leaves_forefited'))
	Alter table leaves_forefited add [leave_forward] float NULL
GO
IF Not Exists(select * from sys.columns where Name = N'remarks' and Object_ID = Object_ID(N'leaves_forefited'))
	Alter table leaves_forefited add [remarks] nvarchar(500) NULL
Go
If Not Exists(select * from sys.columns where Name = N'status' and Object_ID = Object_ID(N'leaves_forefited'))
	Alter table leaves_forefited add [status] int
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'PK_emp_leaves_detail'  AND type = 'K')
	ALTER TABLE emp_leaves_detail DROP CONSTRAINT PK_emp_leaves_detail
Go
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'DF_leaves_forefited_status'  AND type = 'D')
	ALTER TABLE leaves_forefited DROP CONSTRAINT DF_leaves_forefited_status
Go
	ALTER TABLE leaves_forefited   ADD CONSTRAINT DF_leaves_forefited_status DEFAULT 0 FOR [status]
Go
If Exists(select * from sys.columns where Name = N'BreakTime' and Object_ID = Object_ID(N'RosterDetail'))
Alter table RosterDetail drop column BreakTime

Go
If Not Exists(select * from sys.columns where Name = N'TypeNum' and Object_ID = Object_ID(N'TS_FileUploaded'))
Alter table TS_FileUploaded Add TypeNum int null

Go
If Not Exists(select * from sys.columns where Name = N'BreakTimeNHhr' and Object_ID = Object_ID(N'RosterDetail'))
Alter table RosterDetail Add BreakTimeNHhr varchar(5)

GO
If Not Exists(select * from sys.columns where Name = N'BreakTimeOThr' and Object_ID = Object_ID(N'RosterDetail'))
Alter table RosterDetail Add BreakTimeOThr varchar(5)

Go
If Not Exists(select * from sys.columns where Name = N'BreakTimeNH' and Object_ID = Object_ID(N'RosterDetail'))
Alter table RosterDetail Add BreakTimeNH int

GO
If Not Exists(select * from sys.columns where Name = N'BreakTimeOT' and Object_ID = Object_ID(N'RosterDetail'))
Alter table RosterDetail Add BreakTimeOT int

Go
If Not Exists(select * from sys.columns where Name = N'RosterType' and Object_ID = Object_ID(N'RosterDetail'))
Alter table RosterDetail Add RosterType varchar(50)

Go
If Not Exists(select * from sys.columns where Name = N'FlexibleWorkinghr' and Object_ID = Object_ID(N'RosterDetail'))
Alter table RosterDetail Add FlexibleWorkinghr int

Go
If Not Exists(select * from sys.columns where Name = N'PullWorkTimein' and Object_ID = Object_ID(N'RosterDetail'))
Alter table RosterDetail Add PullWorkTimein int

Go
If Not Exists(select * from sys.columns where Name = N'NightShift' and Object_ID = Object_ID(N'Actatek_Logs'))
Alter table Actatek_Logs Add NightShift bit null

Go
If Not Exists(select * from sys.columns where Name = N'SessionID' and Object_ID = Object_ID(N'Actatek_Logs'))
Alter table Actatek_Logs Add SessionID int null

Go
If Not Exists(select * from sys.columns where Name = N'Roster_ID' and Object_ID = Object_ID(N'Actatek_Logs'))
Alter table Actatek_Logs Add Roster_ID int null

GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'DF_NightShift'  AND type = 'D')
	ALTER TABLE Actatek_Logs DROP CONSTRAINT DF_NightShift
Go
ALTER TABLE Actatek_Logs   ADD CONSTRAINT DF_NightShift DEFAULT 0 FOR NightShift

GO
If Not Exists(select * from sys.columns where Name = N'NightShift' and Object_ID = Object_ID(N'RosterDetail'))
Alter table RosterDetail Add NightShift bit

GO
If Not Exists(select * from sys.columns where Name = N'ItemType' and Object_ID = Object_ID(N'Item'))
Alter table Item Add ItemType int null

GO
If Not Exists(select * from sys.columns where Name = N'ItemSubCatID' and Object_ID = Object_ID(N'Item'))
Alter table Item Add ItemSubCatID int null

GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'DF_Item_ItemType'  AND type = 'D')
	ALTER TABLE Item DROP CONSTRAINT DF_Item_ItemType
Go
ALTER TABLE Item   ADD CONSTRAINT DF_Item_ItemType DEFAULT 1 FOR ItemType

GO
IF Not Exists(select * from sys.columns where Name = N'trade_id' and Object_ID = Object_ID(N'employee'))
Alter table employee Add trade_id int null

GO
IF Not Exists(select * from sys.columns where Name = N'pay_supervisor' and Object_ID = Object_ID(N'employee'))
Alter table employee Add pay_supervisor int null

GO
IF Not Exists(select * from sys.columns where Name = N'bloodgroup' and Object_ID = Object_ID(N'employee'))
Alter table employee add bloodgroup varchar(50) null

GO
IF Not Exists(select * from sys.columns where Name = N'agent_id' and Object_ID = Object_ID(N'employee'))
Alter table employee add agent_id int null

GO
IF Not Exists(select * from sys.columns where Name = N'mye_cert_id' and Object_ID = Object_ID(N'employee'))
Alter table employee add mye_cert_id int null

GO
IF Not Exists(select * from sys.columns where Name = N'eme_cont_per' and Object_ID = Object_ID(N'employee'))
Alter table employee add eme_cont_per varchar(50) null

GO
IF Not Exists(select * from sys.columns where Name = N'eme_cont_per_rel' and Object_ID = Object_ID(N'employee'))
Alter table employee add eme_cont_per_rel varchar(50) null

GO
IF Not Exists(select * from sys.columns where Name = N'eme_cont_per_ph1' and Object_ID = Object_ID(N'employee'))
Alter table employee add eme_cont_per_ph1 varchar(50) null

GO
IF Not Exists(select * from sys.columns where Name = N'eme_cont_per_ph2' and Object_ID = Object_ID(N'employee'))
Alter table employee add eme_cont_per_ph2 varchar(50) null

GO
IF Not Exists(select * from sys.columns where Name = N'eme_cont_per_add' and Object_ID = Object_ID(N'employee'))
Alter table employee add eme_cont_per_add varchar(100) null

GO
IF Not Exists(select * from sys.columns where Name = N'eme_cont_per_rem' and Object_ID = Object_ID(N'employee'))
Alter table employee add eme_cont_per_rem varchar(200) null

GO
IF Not Exists(select * from sys.columns where Name = N'ot1rate' and Object_ID = Object_ID(N'employee'))
Alter table employee add ot1rate float null

GO
IF Not Exists(select * from sys.columns where Name = N'ot2rate' and Object_ID = Object_ID(N'employee'))
Alter table employee add ot2rate float null


GO
IF Not Exists(select * from sys.columns where Name = N'netpayrnd' and Object_ID = Object_ID(N'company'))
alter table company add netpayrnd int null

GO
IF Not Exists(select * from sys.columns where Name = N'basicrnd' and Object_ID = Object_ID(N'company'))
Alter table company add basicrnd int null

GO
IF Not Exists(select * from sys.columns where Name = N'additionsrnd' and Object_ID = Object_ID(N'company'))
Alter table company add additionsrnd int null

GO
IF Not Exists(select * from sys.columns where Name = N'deductionsrnd' and Object_ID = Object_ID(N'company'))
Alter table company add deductionsrnd int null

GO
IF Not Exists(select * from sys.columns where Name = N'ir8a_code' and Object_ID = Object_ID(N'country'))
Alter table country add ir8a_code int null

GO
IF Not Exists(select * from sys.columns where Name = N'days_week7' and Object_ID = Object_ID(N'DaysInMonth'))
Alter table DaysInMonth add days_week7 float null

GO
IF Not Exists(select * from sys.columns where Name = N'recpath' and Object_ID = Object_ID(N'emp_additions'))
Alter table emp_additions add recpath varchar(500)

GO
IF Not Exists(select * from sys.columns where Name = N'claimstatus' and Object_ID = Object_ID(N'emp_additions'))
Alter table emp_additions add claimstatus varchar(20)

GO
if Not Exists(select * from sys.columns where Name = N'approver' and Object_ID = Object_ID(N'emp_additions'))
Alter table emp_additions add approver varchar(50)

GO
if Not Exists(select * from sys.columns where Name = N'remarks' and Object_ID = Object_ID(N'emp_additions'))
Alter table emp_additions add remarks varchar(255)

GO
if Not Exists(select * from sys.columns where Name = N'basis_arriving_payment' and Object_ID = Object_ID(N'emp_additions'))
Alter table emp_additions add basis_arriving_payment varchar(100)

GO
if Not Exists(select * from sys.columns where Name = N'service_length' and Object_ID = Object_ID(N'emp_additions'))
alter table emp_additions add service_length float null

GO
if Not Exists(select * from sys.columns where Name = N'iras_approval' and Object_ID = Object_ID(N'emp_additions'))
alter table emp_additions add iras_approval varchar(3)

GO
if Not Exists(select * from sys.columns where Name = N'iras_approval_date' and Object_ID = Object_ID(N'emp_additions'))
alter table emp_additions add iras_approval_date datetime null

GO
if Not Exists(select * from sys.columns where Name = N'additionsforyear' and Object_ID = Object_ID(N'emp_additions'))
alter table emp_additions add additionsforyear varchar(10) null

GO
if Not Exists(select * from sys.columns where Name = N'timesession' and Object_ID = Object_ID(N'emp_leaves'))
alter table emp_leaves add timesession varchar(10)

GO
if Not Exists(select * from sys.columns where Name = N'nextyear' and Object_ID = Object_ID(N'emp_leaves_detail'))
alter table emp_leaves_detail add nextyear int

GO
if Not Exists(select * from sys.columns where Name = N'session' and Object_ID = Object_ID(N'emp_leaves_detail'))
alter table emp_leaves_detail add session varchar(2)

GO
if Not Exists(select * from sys.columns where Name = N'v1' and Object_ID = Object_ID(N'emp_overtime'))
alter table emp_overtime add v1 float

GO
if Not Exists(select * from sys.columns where Name = N'v2' and Object_ID = Object_ID(N'emp_overtime'))
alter table emp_overtime add v2 float

GO
if Not Exists(select * from sys.columns where Name = N'v3' and Object_ID = Object_ID(N'emp_overtime'))
alter table emp_overtime add v3 float

GO
if Not Exists(select * from sys.columns where Name = N'v4' and Object_ID = Object_ID(N'emp_overtime'))
alter table emp_overtime add v4 float

GO
if Not Exists(select * from sys.columns where Name = N'NH_Work' and Object_ID = Object_ID(N'emp_overtime'))
alter table emp_overtime add NH_Work float

GO
if Not Exists(select * from sys.columns where Name = N'payrollstdate' and Object_ID = Object_ID(N'emp_overtime'))
alter table emp_overtime add payrollstdate datetime


GO
if Not Exists(select * from sys.columns where Name = N'v1rate' and Object_ID = Object_ID(N'employee'))
alter table employee add v1rate float

GO
if Not Exists(select * from sys.columns where Name = N'v2rate' and Object_ID = Object_ID(N'employee'))
alter table employee add v2rate float

GO
if Not Exists(select * from sys.columns where Name = N'v3rate' and Object_ID = Object_ID(N'employee'))
alter table employee add v3rate float

GO
if Not Exists(select * from sys.columns where Name = N'v4rate' and Object_ID = Object_ID(N'employee'))
alter table employee add v4rate float

GO
if Not Exists(select * from sys.columns where Name = N'emp_clsupervisor' and Object_ID = Object_ID(N'employee'))
alter table employee add emp_clsupervisor int

GO
if Not Exists(select * from sys.columns where Name = N'wp_issue_date' and Object_ID = Object_ID(N'employee'))
alter table employee add wp_issue_date datetime

GO
if Not Exists(select * from sys.columns where Name = N'wp_arrival_date' and Object_ID = Object_ID(N'employee'))
alter table employee add wp_arrival_date datetime

GO
if Not Exists(select * from sys.columns where Name = N'wp_number' and Object_ID = Object_ID(N'employee'))
alter table employee add wp_number varchar(50)

GO
if Not Exists(select * from sys.columns where Name = N'batch_no' and Object_ID = Object_ID(N'employee'))
alter table employee add batch_no int

GO
if Not Exists(select * from sys.columns where Name = N'photo_no' and Object_ID = Object_ID(N'employee'))
alter table employee add photo_no int

GO
if Not Exists(select * from sys.columns where Name = N'shipyard_quota' and Object_ID = Object_ID(N'employee'))
alter table employee add shipyard_quota varchar(50)

GO
if Not Exists(select * from sys.columns where Name = N'ir8a_code' and Object_ID = Object_ID(N'nationality'))
alter table nationality add ir8a_code int null

GO
if Not Exists(select * from sys.columns where Name = N'operatorcode' and Object_ID = Object_ID(N'girobanks'))
alter table girobanks add operatorcode varchar(50)

GO
if Not Exists(select * from sys.columns where Name = N'approvercode' and Object_ID = Object_ID(N'girobanks'))
alter table girobanks add approvercode varchar(50)

GO
if Not Exists(select * from sys.columns where Name = N'optionselection' and Object_ID = Object_ID(N'additions_types'))
alter table additions_types add optionselection varchar(20)

GO
if Not Exists(select * from sys.columns where Name = N'code' and Object_ID = Object_ID(N'additions_types'))
alter table additions_types add code varchar(4)

GO
if Not Exists(select * from sys.columns where Name = N'formulatype' and Object_ID = Object_ID(N'additions_types'))
alter table additions_types add formulatype int

GO
if Not Exists(select * from sys.columns where Name = N'formulacalc' and Object_ID = Object_ID(N'additions_types'))
alter table additions_types add formulacalc varchar(50)

GO
if Not Exists(select * from sys.columns where Name = N'tax_payable' and Object_ID = Object_ID(N'additions_types'))
alter table additions_types add tax_payable varchar(3)

GO
if Not Exists(select * from sys.columns where Name = N'tax_payable_options' and Object_ID = Object_ID(N'additions_types'))
alter table additions_types add tax_payable_options int

GO
if Not Exists(select * from sys.columns where Name = N'sslrequired' and Object_ID = Object_ID(N'company'))
alter table company add sslrequired varchar(10)

GO
if Not Exists(select * from sys.columns where Name = N'pwdrequired' and Object_ID = Object_ID(N'company'))
alter table company add pwdrequired varchar(10)

GO
if Not Exists(select * from sys.columns where Name = N'email_claim_sender_name' and Object_ID = Object_ID(N'company'))
alter table company add email_claim_sender_name varchar(max)

GO
if Not Exists(select * from sys.columns where Name = N'email_claim_reply_name' and Object_ID = Object_ID(N'company'))
alter table company add email_claim_reply_name varchar(max)

GO
if Not Exists(select * from sys.columns where Name = N'email_claimalert' and Object_ID = Object_ID(N'company'))
alter table company add email_claimalert varchar(50)

GO
if Not Exists(select * from sys.columns where Name = N'company_roc' and Object_ID = Object_ID(N'company'))
alter table company add company_roc varchar(100)

GO
if Not Exists(select * from sys.columns where Name = N'company_type' and Object_ID = Object_ID(N'company'))
alter table company add company_type varchar(3)

GO
if Not Exists(select * from sys.columns where Name = N'ccmail' and Object_ID = Object_ID(N'company'))
alter table company add ccmail varchar(50)

GO
if Not Exists(select * from sys.columns where Name = N'ccalert_claims' and Object_ID = Object_ID(N'company'))
alter table company add ccalert_claims varchar(50)

GO
if Not Exists(select * from sys.columns where Name = N'ccalert_leaves' and Object_ID = Object_ID(N'company'))
alter table company add ccalert_leaves varchar(50)

GO
if Not Exists(select * from sys.columns where Name = N'day_minute' and Object_ID = Object_ID(N'company'))
alter table company add day_minute float

GO
IF Not Exists(select * from sys.columns where Name = N'payrolltype' and Object_ID = Object_ID(N'company'))
alter table company add payrolltype int null

GO
IF Not Exists(select * from sys.columns where Name = N'payrolltype' and Object_ID = Object_ID(N'employee'))
alter table employee add payrolltype int null


GO
if Not Exists(select * from sys.columns where Name = N'bank_code' and Object_ID = Object_ID(N'bank'))
alter table bank add bank_code varchar(50)

GO
if Not Exists(select * from sys.columns where Name = N'code' and Object_ID = Object_ID(N'leave_types'))
alter table leave_types add code varchar(50)
GO

alter table employee alter column CSOC_number varchar(50)
alter table employee alter column shipyard_quota varchar(50)
alter table employee alter column Insurance_number varchar(50)
alter table emp_leaves alter column remarks varchar(255)
alter table leave_types alter column companyid int not null
alter table company alter column designation varchar(50)
alter table emp_leaves			alter column remarks varchar(255)
alter table emp_additions	  alter column remarks varchar(255)
alter table emp_Leaves_Detail alter column unpaid_leave float
alter table emp_Leaves_Detail alter column halfday_leave float
alter table emp_Leaves_Detail alter column halfday_leave float
alter table bank   alter column bank_code int null

GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'DF_additions_types_formulatype'  AND type = 'D')
	ALTER TABLE additions_types DROP CONSTRAINT [DF_additions_types_formulatype]
Go
ALTER TABLE additions_types   ADD CONSTRAINT DF_additions_types_formulatype DEFAULT 0 FOR formulatype


GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'PK_leave_types_1'  AND type = 'K')
	ALTER TABLE leave_types DROP CONSTRAINT [PK_leave_types_1]
Go

GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'PK_leave_types'  AND type = 'K')
	ALTER TABLE leave_types DROP CONSTRAINT [PK_leave_types]
Go

ALTER TABLE leave_types ADD  CONSTRAINT [PK_leave_types] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]

Go

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_GroupRights_UserRights]') AND parent_object_id = OBJECT_ID(N'[dbo].[GroupRights]'))
ALTER TABLE [dbo].[GroupRights] DROP CONSTRAINT [FK_GroupRights_UserRights]

Go

/****** Object:  Index [PK_GroupRights]    Script Date: 03/25/2009 17:13:09 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[GroupRights]') AND name = N'PK_GroupRights')
ALTER TABLE [dbo].[GroupRights] DROP CONSTRAINT [PK_GroupRights]

GO

if Not Exists(select * from sys.columns where Name = N'LYTotalOW' and Object_ID = Object_ID(N'employee'))
Alter table employee add LYTotalOW float NULL
GO
if Not Exists(select * from sys.columns where Name = N'OWLastYear' and Object_ID = Object_ID(N'employee'))
Alter table employee add OWLastYear int null
GO

IF Not Exists(select * from sys.columns where Name = N'year' and Object_ID = Object_ID(N'IR8AAPENDIX_EMPLOYEE'))
Alter table IR8AAPENDIX_EMPLOYEE add [year] [nchar](10) NULL
GO
IF Not Exists(select * from sys.columns where Name = N'ColID' and Object_ID = Object_ID(N'CertificateCategory'))
Alter table CertificateCategory add ColID int null
GO
IF Exists(select * from sys.columns where Name = N'Source' and Object_ID = Object_ID(N'EmployeeCertificate'))
Alter Table EmployeeCertificate Drop Column [Source]
GO
IF Exists(select * from sys.columns where Name = N'Attempt' and Object_ID = Object_ID(N'EmployeeCertificate'))
Alter Table EmployeeCertificate Drop Column [Attempt]
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'DF_Source'  AND type = 'D')
	ALTER TABLE EmployeeCertificate DROP CONSTRAINT DF_Source
GO
if Not Exists(select * from sys.columns where Name = N'NHRate' and Object_ID = Object_ID(N'prepare_payroll_detail'))
Alter table prepare_payroll_detail add NHRate float NULL
GO
if Not Exists(select * from sys.columns where Name = N'NH_wh' and Object_ID = Object_ID(N'prepare_payroll_detail'))
Alter table prepare_payroll_detail add NH_wh float NULL
GO
if Not Exists(select * from sys.columns where Name = N'NH_e' and Object_ID = Object_ID(N'prepare_payroll_detail'))
Alter table prepare_payroll_detail add NH_e float NULL
GO
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'DF_Table_1_createdate'  AND type = 'D')
ALTER TABLE RosterDetail Drop Constraint DF_Table_1_createdate
Go
IF EXISTS (SELECT name FROM sysobjects WHERE name = 'DF_RosterDetail_CreateDate'  AND type = 'D')
ALTER TABLE RosterDetail Drop Constraint DF_RosterDetail_CreateDate
GO
Alter table RosterDetail Add InTime_Temp		 varchar(5) null
alter table RosterDetail Add OutTime_Temp		 varchar(5) null
alter table RosterDetail Add EarlyInBy_Temp		 varchar(5) null
alter table RosterDetail Add LateInBy_Temp		 varchar(5) null
alter table RosterDetail Add EarlyOutBy_Temp	 varchar(5) null
alter table RosterDetail Add LateOutBy_Temp		 varchar(5) null
alter table RosterDetail Add ClockInBefore_Temp	 int null
alter table RosterDetail Add ClockInAfter_Temp	 int null
alter table RosterDetail Add ClockOutBefore_Temp int null
alter table RosterDetail Add ClockOutAfter_Temp  int null
alter table RosterDetail Add BreakTimeNHhr_Temp  varchar(5) null
alter table RosterDetail Add BreakTimeOThr_Temp  varchar(5) null
alter table RosterDetail Add BreakTimeNH_Temp	 int null
alter table RosterDetail Add BreakTimeOT_Temp	 int null
alter table RosterDetail Add RosterType_Temp	 varchar(50) null
alter table RosterDetail Add PullWorkTimein_Temp varchar(5) null
alter table RosterDetail Add FlexibleWorkinghr_Temp varchar(5) null
alter table RosterDetail Add NightShift_Temp	 bit null
alter table RosterDetail Add CreateDate_Temp	 DateTime null
ALTER TABLE RosterDetail ADD CONSTRAINT DF_Table_1_createdate default getdate() FOR CreateDate_Temp
GO
Update RosterDetail Set
InTime_Temp= InTime
,OutTime_Temp= OutTime
,EarlyInBy_Temp= EarlyInBy
,LateInBy_Temp= LateInBy
,EarlyOutBy_Temp=EarlyOutBy
,LateOutBy_Temp= LateOutBy
,ClockInBefore_Temp= ClockInBefore
,ClockInAfter_Temp= ClockInAfter
,ClockOutBefore_Temp= ClockOutBefore
,ClockOutAfter_Temp= ClockOutAfter
,BreakTimeNHhr_Temp= BreakTimeNHhr
,BreakTimeOThr_Temp= BreakTimeOThr
,BreakTimeNH_Temp= BreakTimeNH
,BreakTimeOT_Temp= BreakTimeOT
,RosterType_Temp= RosterType
,FlexibleWorkinghr_Temp= FlexibleWorkinghr
,NightShift_Temp= NightShift
,PullWorkTimein_Temp= PullWorkTimein
,CreateDate_Temp=CreateDate
GO
alter table RosterDetail Drop Column InTime
alter table RosterDetail Drop Column OutTime
alter table RosterDetail Drop Column EarlyInBy
alter table RosterDetail Drop Column LateInBy
alter table RosterDetail Drop Column EarlyOutBy
alter table RosterDetail Drop Column LateOutBy
alter table RosterDetail Drop Column ClockInBefore
alter table RosterDetail Drop Column ClockInAfter
alter table RosterDetail Drop Column ClockOutBefore
alter table RosterDetail Drop Column ClockOutAfter
alter table RosterDetail Drop Column CreateDate 
alter table RosterDetail Drop Column BreakTimeNHhr
alter table RosterDetail Drop Column BreakTimeOThr
alter table RosterDetail Drop Column BreakTimeNH
alter table RosterDetail Drop Column BreakTimeOT
alter table RosterDetail Drop Column RosterType
alter table RosterDetail Drop Column FlexibleWorkinghr
alter table RosterDetail Drop Column NightShift
alter table RosterDetail Drop Column PullWorkTimein
Go
Exec sp_RENAME 'RosterDetail.[InTime_Temp]' , 'InTime', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[OutTime_Temp]' , 'OutTime', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[EarlyInBy_Temp]' , 'EarlyInBy', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[LateInBy_Temp]' , 'LateInBy', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[EarlyOutBy_Temp]' , 'EarlyOutBy', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[LateOutBy_Temp]' , 'LateOutBy', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[ClockInBefore_Temp]' , 'ClockInBefore', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[ClockInAfter_Temp]' , 'ClockInAfter', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[ClockOutBefore_Temp]' , 'ClockOutBefore', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[ClockOutAfter_Temp]' , 'ClockOutAfter', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[CreateDate_Temp]' , 'CreateDate', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[BreakTimeNHhr_Temp]' , 'BreakTimeNHhr', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[BreakTimeOThr_Temp]' , 'BreakTimeOThr', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[BreakTimeNH_Temp]' , 'BreakTimeNH', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[BreakTimeOT_Temp]' , 'BreakTimeOT', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[RosterType_Temp]' , 'RosterType', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[FlexibleWorkinghr_Temp]' , 'FlexibleWorkinghr', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[NightShift_Temp]' , 'NightShift', 'COLUMN'
Exec sp_RENAME 'RosterDetail.[PullWorkTimein_Temp]' , 'PullWorkTimein', 'COLUMN'
Go


GO
/****** Object:  Index [IX_CatName]    Script Date: 08/30/2010 18:57:33 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CertificateCategory]') AND name = N'IX_CatName')
DROP INDEX [IX_CatName] ON [dbo].[CertificateCategory] WITH ( ONLINE = OFF )

GO
IF Not Exists(select * from sys.columns where Name = N'FileName' and Object_ID = Object_ID(N'Department'))
Alter table Department add FileName varchar(200)

GO
IF Not Exists(select * from sys.columns where Name = N'Remarks' and Object_ID = Object_ID(N'ApprovedTimeSheet'))
Alter table ApprovedTimeSheet add Remarks varchar(200)

GO
IF Not Exists(select * from sys.columns where Name = N'isTSRemarks' and Object_ID = Object_ID(N'Company'))
alter table Company add isTSRemarks [bit] null

GO
IF Not Exists(select * from sys.columns where Name = N'timesupervisor' and Object_ID = Object_ID(N'Employee'))
Alter Table Employee Add timesupervisor int null

GO
IF Not Exists(select * from sys.columns where Name = N'timesupervisor' and Object_ID = Object_ID(N'SubProject'))
alter table SubProject add timesupervisor int null

GO
IF Not Exists(select * from sys.columns where Name = N'Remarks' and Object_ID = Object_ID(N'Actatek_Logs'))
alter table Actatek_Logs add Remarks varchar(200)

GO
IF Not Exists(select * from sys.columns where Name = N'isMaster' and Object_ID = Object_ID(N'Company'))
alter table Company add isMaster [bit] null

GO
IF Not Exists(select * from sys.columns where Name = N'isMasterEmpTemp' and Object_ID = Object_ID(N'Company'))
alter table Company add isMasterEmpTemp [bit] null

GO
IF Not Exists(select * from sys.columns where Name = N'isShared' and Object_ID = Object_ID(N'additions_types'))
alter table additions_types add isShared varchar(3)

GO
IF Not Exists(select * from sys.columns where Name = N'AccountCode' and Object_ID = Object_ID(N'additions_types'))
alter table additions_types add AccountCode varchar(20)


GO
IF Not Exists(select * from sys.columns where Name = N'isShared' and Object_ID = Object_ID(N'DEDUCTIONS_types'))
alter table DEDUCTIONS_types add isShared varchar(3)

GO
IF Not Exists(select * from sys.columns where Name = N'AccountCode' and Object_ID = Object_ID(N'DEDUCTIONS_types'))
Alter table DEDUCTIONS_types add AccountCode varchar(20)

GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[leave_types]') AND name = N'PK_leave_types')
ALTER TABLE [dbo].[leave_types] DROP CONSTRAINT [PK_leave_types]

GO
ALTER TABLE [dbo].[leave_types] ADD  CONSTRAINT [PK_leave_types] PRIMARY KEY CLUSTERED 
(
	[Type] ASC,
	[companyid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]

GO
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[leave_types]') AND name = N'IX_leave_types')
DROP INDEX [IX_leave_types] ON [dbo].[leave_types] WITH ( ONLINE = OFF )

GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_leave_types] ON [dbo].[leave_types] 
(
	[Type] ASC,
	[companyid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]

GO
IF Not Exists(select * from sys.columns where Name = N'BulkAddInMonth' and Object_ID = Object_ID(N'Emp_Additions'))
Alter Table Emp_Additions add BulkAddInMonth Int Null

GO
IF Not Exists(select * from sys.columns where Name = N'BulkDedInMonth' and Object_ID = Object_ID(N'Emp_Deductions'))
Alter Table Emp_Deductions add BulkDedInMonth Int Null

GO
IF Not Exists(select * from sys.columns where Name = N'ComputeCPFFH' and Object_ID = Object_ID(N'Employee'))
alter table Employee add ComputeCPFFH int null

GO
IF Not Exists(select * from sys.columns where Name = N'ComputeFundFH' and Object_ID = Object_ID(N'Employee'))
alter table Employee add ComputeFundFH int null

GO
IF Not Exists(select * from sys.columns where Name = N'isShared' and Object_ID = Object_ID(N'Location'))
Alter table Location add isShared varchar(3)

GO
IF Not Exists(select * from sys.columns where Name = N'HalfSalary' and Object_ID = Object_ID(N'Employee'))
Alter Table Employee add HalfSalary int null

GO
/****** Object:  Index [IX_CatName]    Script Date: 08/30/2010 18:57:33 ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CertificateCategory]') AND name = N'IX_CatName')
DROP INDEX [IX_CatName] ON [dbo].[CertificateCategory] WITH ( ONLINE = OFF )


GO
IF Not Exists(select * from sys.columns where Name = N'isShared' and Object_ID = Object_ID(N'Project'))
Alter Table Project add isShared varchar(3)

GO
if Not Exists(select * from sys.columns where Name = N'DHRate' and Object_ID = Object_ID(N'prepare_payroll_detail'))
Alter table prepare_payroll_detail add DHRate float NULL
GO

if Not Exists(select * from sys.columns where Name = N'DH_e' and Object_ID = Object_ID(N'prepare_payroll_detail'))
Alter table prepare_payroll_detail add DH_e float NULL
GO

IF Not Exists(select * from sys.columns where Name = N'ProjectAssign' and Object_ID = Object_ID(N'Company'))
Alter table Company add ProjectAssign [int] null

GO
IF Not Exists(select * from sys.columns where Name = N'Active' and Object_ID = Object_ID(N'SubProject'))
Alter Table SubProject Add Active int null

GO
IF Not Exists(select * from sys.columns where Name = N'SalaryGLCode' and Object_ID = Object_ID(N'Company'))
Alter table Company add SalaryGLCode varchar(20)

GO
IF Not Exists(select * from sys.columns where Name = N'EmployeeCPFGLCode' and Object_ID = Object_ID(N'Company'))
alter table Company add EmployeeCPFGLCode varchar(20)

GO
IF Not Exists(select * from sys.columns where Name = N'EmployerCPFGLCode' and Object_ID = Object_ID(N'Company'))
alter table Company add EmployerCPFGLCode varchar(20)

GO
IF Not Exists(select * from sys.columns where Name = N'FundAmtGLCode' and Object_ID = Object_ID(N'Company'))
alter table Company add FundAmtGLCode varchar(20)

GO
IF Not Exists(select * from sys.columns where Name = N'SDLAmtGLCode' and Object_ID = Object_ID(N'Company'))
Alter table Company add SDLAmtGLCode varchar(20)

GO
IF Not Exists(select * from sys.columns where Name = N'AccountGLCode' and Object_ID = Object_ID(N'Company'))
Alter table Company add AccountGLCode varchar(20)

GO
IF Not Exists(select * from sys.columns where Name = N'UnpaidLeaGLCode' and Object_ID = Object_ID(N'Company'))
Alter table Company add UnpaidLeaGLCode varchar(20)

--Update Company Set SalaryGLCode='123SALARY', EmployeeCPFGLCode='123EmployeeCPF', EmployerCPFGLCode='123EmployerCPF', FundAmtGLCode='123FundAmt',SDLAmtGLCode='123SDLAmt'
GO
IF Not Exists(select * from sys.columns where Name = N'FundType' and Object_ID = Object_ID(N'Emp_Deductions'))
Alter Table Emp_Deductions add FundType varchar(7) null
GO

/********Work Flow Leaves Starts*****************/

IF Not Exists(select * from sys.columns where Name = N'ExpiryDays' and Object_ID = Object_ID(N'EmployeeWorkFlowLevel'))
Alter table EmployeeWorkFlowLevel add ExpiryDays [int] NULL
GO


IF Not Exists(select * from sys.columns where Name = N'Action' and Object_ID = Object_ID(N'EmployeeWorkFlowLevel'))
Alter table EmployeeWorkFlowLevel add [Action]  varchar(20) NULL
GO

IF Not Exists(select * from sys.columns where Name = N'Leave_supervisor' and Object_ID = Object_ID(N'Employee'))
Alter table Employee add Leave_supervisor[int] NULL	
GO

IF Not Exists(select * from sys.columns where Name = N'ApproveDate' and Object_ID = Object_ID(N'emp_leaves'))
Alter table emp_leaves add [ApproveDate]  DateTime NULL
GO

/********Work Flow Leaves Ends*****************/

Update CPFAmount_hdr Set Sal_From = 50.01 Where Sal_From = 50
Update CPFAmount_hdr Set Sal_From = 500.01 Where Sal_From = 501
Update CPFAmount_hdr Set Sal_From = 750.01 Where Sal_From = 751
Update CPFAmount_hdr Set Sal_From = 1200.01 Where Sal_From = 1201

/********Work Flow Leaves Ends*****************/
Go
IF Not Exists(select * from sys.columns where Name = N'FileType' and Object_ID = Object_ID(N'TS_FileUploaded'))
Alter table TS_FileUploaded add [FileType] [varchar](20) NULL
GO




