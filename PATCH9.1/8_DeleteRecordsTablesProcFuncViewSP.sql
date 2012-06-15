
--8.5 B

--select * from userrights
delete from userrights where rightid=''

delete from grouprights where rightid in 
(select rightid from userrights where upper(RightName) = 'Apply Claim' 
 and RightCategory='Employee')
delete from grouprights where rightid in 
(select rightid from userrights where upper(RightName) = 'Claim Status' 
 and RightCategory='Employee')
delete from grouprights where rightid in 
(select rightid from userrights where upper(RightName) = 'Approved Claims' 
 and RightCategory='Employee')
delete from grouprights where rightid in 
(select rightid from userrights where upper(RightName) = 'Pending Approval for Claim' 
 and RightCategory='Employee')
delete from grouprights where rightid in 
(select rightid from userrights where upper(RightName) = 'Rejected Claims' 
 and RightCategory='Employee')

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'''smile_focus_emp_temp''' AND xtype='U')
	DROP TABLE dbo.['smile_focus_emp_temp']
GO

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'Sheet1$' AND xtype='U')
	DROP TABLE dbo.[Sheet1$]
GO

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'test' AND xtype='U')
	DROP TABLE [test]
GO


IF EXISTS(SELECT name FROM sysobjects WHERE name = N'testing' AND xtype='U')
	DROP TABLE [testing]
GO

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'temp_import_tab' AND xtype='U')
	DROP TABLE temp_import_tab
GO


IF EXISTS(SELECT name FROM sysobjects WHERE name = N'zTest' AND xtype='U')
	DROP TABLE zTest
GO

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'nationalitybackup' AND xtype='U')
	DROP TABLE nationalitybackup
GO

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'santyquery' AND xtype='V')
	DROP View santyquery
GO

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'sp_emp_delete' AND xtype='P')
	DROP PROC sp_emp_delete
GO


IF EXISTS(SELECT name FROM sysobjects WHERE name = N'sp_emp_get' AND xtype='P')
	DROP PROC sp_emp_get
GO


IF EXISTS(SELECT name FROM sysobjects WHERE name = N'sp_gen_payroll' AND xtype='P')
	DROP PROC sp_gen_payroll
GO


IF EXISTS(SELECT name FROM sysobjects WHERE name = N'chequebooks' AND xtype='U')
	DROP TABLE [chequebooks]
GO

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'cheques' AND xtype='U')
	DROP TABLE [cheques]
GO


IF EXISTS(SELECT name FROM sysobjects WHERE name = N'currencies' AND xtype='U')
	DROP TABLE [currencies]
GO

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'Dim_Date' AND xtype='U')
	DROP TABLE [Dim_Date]
GO

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'IR8A' AND xtype='U')
	DROP TABLE [IR8A]
GO

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'MonthDays' AND xtype='U')
	DROP TABLE [MonthDays]
GO

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'wptype' AND xtype='U')
	DROP TABLE [wptype]
GO

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'Payroll_status' AND xtype='U')
	DROP TABLE [Payroll_status]
GO

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'z_employee' AND xtype='U')
	DROP TABLE [z_employee]
GO


IF EXISTS(SELECT name FROM sysobjects WHERE name = N'timesheet' AND xtype='U')
	DROP TABLE [timesheet]
GO


IF EXISTS(SELECT name FROM sysobjects WHERE name = N'OVERTIME' AND xtype='U')
	DROP TABLE [OVERTIME]
GO


IF EXISTS(SELECT name FROM sysobjects WHERE name = N'BANK_ACCOUNTS' AND xtype='U')
	DROP TABLE [BANK_ACCOUNTS]
GO

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'hsm_temp' AND xtype='U')
	DROP TABLE [hsm_temp]
GO

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'interblast_temp' AND xtype='U')
	DROP TABLE [interblast_temp]
GO
