GO
IF EXISTS(SELECT name FROM sysobjects WHERE name = N'GroupRightsTemp' AND xtype='U')
Drop Table GroupRightsTemp
GO
Select * Into GroupRightsTemp From GroupRights Where GroupID In
(Select GroupID from UserGroups Where GroupName != 'Super Admin')
GO
	DELETE FROM HourTransfer
	Insert Into HourTransfer values (0,  'NONE')
	Insert Into HourTransfer values (1,  'NH To OT1')
	Insert Into HourTransfer values (2,  'NH To OT2')
	Insert Into HourTransfer values (3,  'OT1 To NH')
	Insert Into HourTransfer values (4,  'OT1 To OT2')
	Insert Into HourTransfer values (5,  'OT2 To NH')
	Insert Into HourTransfer values (6,  'OT2 To OT1')
	Insert Into HourTransfer values (7,  'NH+OT1 To NH')
	Insert Into HourTransfer values (8,  'NH+OT1 To OT1')
	Insert Into HourTransfer values (9,  'NH+OT1 To OT2')
	Insert Into HourTransfer values (10, 'NH+OT2 To OT1')
	Insert Into HourTransfer values (11, 'NH+OT2 To OT2')
	Insert Into HourTransfer values (12, 'NH+OT2 To NH')
	Insert Into HourTransfer values (13, 'OT1+OT2 To NH')
	Insert Into HourTransfer values (14, 'OT1+OT2 To OT1')
	Insert Into HourTransfer values (15, 'OT1+OT2 To OT2')
	Insert Into HourTransfer values (16, 'NH+OT1+OT2 To NH')
	Insert Into HourTransfer values (17, 'NH+OT1+OT2 To OT1')
	Insert Into HourTransfer values (18, 'NH+OT1+OT2 To OT2')
GO

DELETE FROM TABLEOBJ
SET IDENTITY_INSERT TABLEOBJ ON
INSERT TABLEOBJ(ID,TABLEID,TABLENAME)       VALUES('1','1','EMPLOYEE')
INSERT TABLEOBJ(ID,TABLEID,TABLENAME)       VALUES('2','2','PAYROLLVIEW')
SET IDENTITY_INSERT TABLEOBJ OFF
GO
DELETE FROM TABLEOBJATTRIB
SET IDENTITY_INSERT TABLEOBJATTRIB ON
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('1','1','Alpha Numeric','4','emp_code','Employee Code','','','')
--INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('2','1','General','50','emp_name','Employee First Name','','','')
--INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('3','1','General','50','emp_lname','Employee Last Name','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('4','1','General','50','emp_alias','Alias Name','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('5','1','General','4','nationality_id','Nationality','(SELECT NATIONALITY FROM NATIONALITY WHERE ID=e1.NATIONALITY_ID)','Nationality','1')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('6','1','General','50','emp_type','Employee Type','','','1')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('7','1','Alpha Numeric','50','ic_pp_number','IC / FIN Number','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('8','1','Date','8','pr_date','PR Date','convert(nvarchar(10),pr_date,103)','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('9','1','General','4','country_id','Country','(SELECT COUNTRY FROM COUNTRY WHERE ID=e1.country_ID)','Country','1')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('10','1','Number','50','postal_code','Postal Code','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('11','1','Number','50','phone','Phone Number','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('12','1','Number','50','hand_phone','Mobile Number','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('13','1','General','50','email','Email Address','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('14','1','Number','50','time_card_no','Time Card Number','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('15','1','General','50','sex','Sex','case  sex When ''M'' Then ''Male'' Else ''Female'' End  ','','1')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('16','1','General','4','religion_id','Religion','(SELECT RELIGION FROM RELIGION WHERE ID=e1.RELIGION_ID)','Religion','1')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('17','1','General','4','race_id','Race','(SELECT RACE FROM RACE WHERE ID=e1.RACE_ID)','Race','1')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('18','1','General','50','marital_status','Marital Status','case  marital_status When ''M'' Then ''Married'' when ''S'' Then ''Single''  Else ''Divorce'' End ','','1')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('19','1','General','50','place_of_birth','Place of birth','(SELECT COUNTRY FROM COUNTRY WHERE ID=e1.country_ID) ','','1')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('20','1','Date','8','date_of_birth','Date of birth','convert(nvarchar(10),date_of_birth,103)','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('21','1','Number','50','income_taxid','Income Tax ID','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('22','1','General','50','giro_code','Giro Bank Name','(SELECT [desc] FROM Bank WHERE bank_code=e1.giro_bank)','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('23','1','Number','50','giro_bank','Giro Bank Code','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('24','1','Number','50','giro_branch','Giro Branch Number','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('25','1','Number','50','giro_acct_number','Giro Bank Account Number','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('26','1','General','4','desig_id','Designation','(SELECT designation FROM designation WHERE ID=e1.Desig_ID) ','Designation','1')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('27','1','General','4','dept_id','Department','(SELECT DeptName FROM Department WHERE ID=e1.Dept_ID and Dept_ID is not NULL)','Department','1')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('28','1','Date','8','joining_date','Joining Date','convert(nvarchar(10),joining_date,103)','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('29','1','months','4','probation_period','Probation Period','Case probation_period when -1 then 0 else probation_period End','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('30','1','Date','8','confirmation_date','Confirmation Date','convert(nvarchar(10),confirmation_date,103)','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('31','1','Date','8','termination_date','Termination Date','convert(nvarchar(10),termination_date,103)','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('32','1','Y/N','10','cpf_entitlement','CPF Entitiled','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('33','1','General','4','emp_group_id','Employee Group','(SELECT EmpGroupName FROM emp_group WHERE ID=e1.emp_group_id )','Emp_Group','1')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('34','1','General','4','emp_supervisor','Leave Supervisor','(SELECT emp_name FROM employee WHERE emp_code=e1.emp_supervisor)','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('35','1','Y/N','10','ot_entitlement','Overtime Entitlement','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('36','1','General','50','payment_mode','Payment Mode','(Select Giro_Acc_Name From (Select id,(giro_acc_name+''-''+bank_accountno) giro_acc_name From GiroBanks Union Select -2, ''Cheque'' Union Select -1, ''Cash'') D Where D.ID=e1.payment_mode)','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('37','1','Number','50','fw_code','Foreignworker Code','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('38','1','Amount','8','fw_levy','Foreignworker Levy','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('39','1','Y/N','10','email_payslip','Eamil Payslip ','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('40','1','General','50','termination_reason','Termination Reason','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('41','1','General','10','pay_frequency','Pay Frequency','case  pay_frequency When ''M'' Then ''Monthly''  Else ''Hourly'' end ','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('42','1','General','-1','remarks','Remarks','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('43','1','General','100','Giro_acc_name','Employer Giro Account Name','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('44','1','General','300','foreignaddress1','Foreign Address Line 1','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('45','1','General','50','foreignaddress2','Foreign Address Line 2','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('46','1','Number','50','foreignpostalcode','Foreign Address Postal Code','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('47','1','Date','8','wp_application_date','Work Permit application Date','convert(nvarchar(10),wp_application_date,103)','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('48','1','General','3','hourly_rate_mode','Hourly Rate mode','case  hourly_rate_mode When ''M'' Then ''Manual''   Else ''Automatic'' end ','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('49','1','Number','8','hourly_rate','Hourly Rate','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('50','1','General','3','Replace(daily_rate_mode,''A'',''Auto'')','Daily Rate mode','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('51','1','Number','8','daily_rate','Daily Rate','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('52','1','Number','50','block_no','Block Number','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('53','1','General','100','street_name','Street Name','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('54','1','Number','50','level_no','Level Number','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('55','1','Number','50','unit_no','Unit Number','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('56','1','Number','8','wdays_per_week','Working days per week','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('57','1','Number','8','v1rate','Varibale 1 Value','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('58','1','Number','8','v2rate','Varibale 2 Value','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('59','1','Number','8','v3rate','Varibale 3 Value','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('60','1','Number','8','v4rate','Varibale 4 Value','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('61','1','General','4','emp_clsupervisor','Claim Supervisor','(SELECT emp_name FROM employee WHERE emp_code=e1.emp_clsupervisor)','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('62','1','date','8','wp_issue_date','Work Permit Issue Date','convert(nvarchar(10),wp_issue_date,103)','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('63','1','Number','50','wp_number','Work Permit Number','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('64','1','Number','8','ot1rate','Overtime 1 ','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('65','1','Number','8','ot2rate','Overtime 2','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('66','1','Alpha Numeric','50','bloodgroup','Blood Group','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('67','1','General','4','agent_id','Agent name','(Select Agent_Name From EmployeeAgent A Where ID = e1.agent_id)','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('68','1','Date','8','wp_arrival_date','Worker Arrival Date','convert(nvarchar(10),wp_arrival_date,103)','','')
--INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('69','2','Number','4','emp_code','Employee Code','','','')
--INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('70','2','General','50','emp_name','Employee First Name','','','')
--INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('71','2','General','50','emp_lname','Employee Last Name','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('72','0','datetime','8','start_period','From Date','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('73','0','datetime','8','end_period','To Date','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('74','2','varbinary','128','basic_pay','Basic Pay','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('75','2','Amount','8','OT1_e','OT1 Amount','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('76','2','Amount','8','OT2_e','OT2 Amount','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('77','2','Number','8','Wdays','Working Days','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('78','2','varbinary','128','NetPay','Net Pay','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('79','2','Amount','8','total_additions','Total Additions','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('80','2','Amount','8','total_deductions','Total Deductions','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('81','2','Number','8','cpfAdd_Ordinary','CPF Addition Ordinary','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('82','2','Number','8','cpfAdd_Additional','CPF Addition Wages','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('83','2','Amount','8','cpfNet','CPF Net','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('84','2','Amount','8','empCPF','Employee Cont CPF','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('85','2','Amount','8','employerCPF','Employer Cont CPF','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('86','2','Amount','8','cpfAmount','CPF Amount','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('87','2','Number','8','unpaid_leaves_amount','Unpaid Amount','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('88','2','Number','8','unpaid_leaves','Unpaid Leaves','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('89','2','Number','8','total_gross','Total Gross','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('90','2','Number','8','SDL','SDL','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('91','2','Number','8','FWL','FWL','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('92','2','Amount','8','OT1Rate','OT1 Rate','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('93','2','Amount','8','OT2Rate','OT2 Rate','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('94','2','Amount','8','OT1_wh','OT1 Hours','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('95','2','Amount','8','OT2_wh','OT2 Hours','','','')
INSERT TABLEOBJATTRIB(ID,TableID,Field_Type,Field_Width,Field_Name,Alias_Name,Table_Source,Group_Source,GroupColumn)       VALUES('96','1','General','4','email','Supervisor Email','(SELECT email FROM employee WHERE emp_code=e1.emp_supervisor)','','')
SET IDENTITY_INSERT TABLEOBJATTRIB OFF
GO
Set Identity_Insert [RightsHeader] On
if not exists(select * from [RightsHeader] where [RightId]=1) INSERT INTO [RightsHeader]([RightId],[RightHeader])VALUES(1,'Employee')
if not exists(select * from [RightsHeader] where [RightId]=2) INSERT INTO [RightsHeader]([RightId],[RightHeader])VALUES(2,'Leaves')
if not exists(select * from [RightsHeader] where [RightId]=3) INSERT INTO [RightsHeader]([RightId],[RightHeader])VALUES(3,'Claims')
if not exists(select * from [RightsHeader] where [RightId]=4) INSERT INTO [RightsHeader]([RightId],[RightHeader])VALUES(4,'Timesheet')
if not exists(select * from [RightsHeader] where [RightId]=5) INSERT INTO [RightsHeader]([RightId],[RightHeader])VALUES(5,'Payroll')
if not exists(select * from [RightsHeader] where [RightId]=6) INSERT INTO [RightsHeader]([RightId],[RightHeader])VALUES(6,'Reports')
if not exists(select * from [RightsHeader] where [RightId]=7) INSERT INTO [RightsHeader]([RightId],[RightHeader])VALUES(7,'Admin')
if not exists(select * from [RightsHeader] where [RightId]=8) INSERT INTO [RightsHeader]([RightId],[RightHeader])VALUES(8,'Inventory')
Set Identity_Insert [RightsHeader] Off
GO
--------DELETE FROM USERRIGHTS
--------Insert Into UserRights values(1,'View Reminders','Reminders','Reminders',0,null,1,null,null,'Reminder Module','Right to the main Reminder module',2)
--------Insert Into UserRights values(2,'View  Employee Leaves','Reminders','Reminders',0,null,2,1,null,'Employees on Leave Reminder','Right to view list of employees on leave',2)
--------Insert Into UserRights values(3,'View Pending Leaves','Reminders','Reminders',0,null,3,1,null,'Employees Requesting for Leave Reminder','Right to view list of employees requesting for leave ',2)
--------Insert Into UserRights values(4,'View WP Expiry','Reminders','Reminders',0,null,4,1,null,'Pass Expiring Reminder','Right to view list of employees whose pass is expiring',2)
--------Insert Into UserRights values(5,'View Passport Expiry','Reminders','Reminders',0,null,5,1,null,'Passport Expiring Reminder','Right to view list of employees whose passport is expiring',2)
--------Insert Into UserRights values(6,'View CSOC Expiry','Reminders','Reminders',0,null,6,1,null,'CSOC Expiring Reminder','Right to view list of employees whose csoc is expiring',2)
--------Insert Into UserRights values(7,'View Insurance Expiry','Reminders','Reminders',0,null,7,1,null,'Insurance Expiring Reminder','Right to view list of employees whose insurance is expiring',2)
--------Insert Into UserRights values(8,'View Birthday Dates','Reminders','Reminders',0,null,8,1,null,'Employees Birthday Reminder','Right to view list of employees birthday',2)
--------Insert Into UserRights values(9,'View Probation Expiry','Reminders','Reminders',0,null,9,1,null,'Probation Expiring Reminder','Right to view list of employees whose probation is expiring',2)
--------Insert Into UserRights values(10,'Other Certificate Expiry','Reminders','Reminders',0,null,10,1,null,'Other Certificates Expiring Reminder','Right to view list of employees whose other certificates are expiring',2)
--------Insert Into UserRights values(11,'Year Of Service','Reminders','Reminders',0,null,11,1,null,'Year of Service Reminder','Right to view list of employees  with year of service',2)
--------
--------Insert Into UserRights values(12,'Employee Management','Employee','Employee',null,null,1,null,null,'Employee Module','Right to the main employee module',2)
--------Insert Into UserRights values(13,'View Employees','Employee','Employee',1,1,2,12,null,'View Employee','Right to view employee profile',2)
--------Insert Into UserRights values(14,'Add Employee','Employee','Employee',null,null,3,13,12,'Add Employee','Right to add new employee',2)
--------Insert Into UserRights values(15,'Edit Employee','Employee','Employee',null,null,4,13,12,'Edit Employee','Right to edit existing employee',2)
--------Insert Into UserRights values(17,'View Salary','Employee','Employee',null,null,6,13,12,'View Employee Salary','Right to view employee salary and other related details which otherwise are encrypted',2)
--------Insert Into UserRights values(18,'View Employee Groups','Employee','Employee Group',1,2,8,12,null,'View Employee Groups','Right to view employee group',2)
--------Insert Into UserRights values(19,'Manage Employee Groups','Employee','Employee Group',null,null,7,18,12,'Manage Employee Groups','Right to add, edit or delete employee group ',2)
--------Insert Into UserRights values(20,'Leave Management','Leave','Leave',null,null,1,null,null,'Leave Module','Right to the main leave module',2)
--------Insert Into UserRights values(21,'Leave Request','Leave','Leave',2,1,2,20,null,'Apply Leave','Right to apply/request leave for individual employee (leave types like annual, medical, etc)',2)
--------Insert Into UserRights values(22,'Apply Leaves for all','Leave','Leave',null,null,3,20,null,'Apply Leave For All','Right to apply/request leave for all employees (leave types like annual, medical, etc)',2)
--------Insert Into UserRights values(23,'View Applied Leaves','Leave','Leave',2,2,4,20,null,'Leave Status','Right to view leave status - approved and rejected leaves, remarks etc',2)
--------Insert Into UserRights values(24,'View Approved Leaves','Leave','Leave',2,3,5,20,null,'View Approved Leave','Right to view leave status - approved leaves, remarks etc',2)
--------Insert Into UserRights values(25,'View Rejected Leaves','Leave','Leave',2,4,6,20,null,'View Rejected Leave','Right to view leave status - approved and rejected leaves, remarks etc',2)
--------Insert Into UserRights values(26,'Approve and Reject Leaves','Leave','Leave',2,5,7,20,null,'Approve or Reject Leaves','Right to approve or reject applied leave of the employee by their supervisor',2)
--------Insert Into UserRights values(27,'Approve and Reject Leaves for all','Leave','Leave',null,null,8,20,null,'Approve or Reject Leaves  For All','Right to approve or reject applied leave of all employees',2)
--------Insert Into UserRights values(28,'Manage Leaves Allowed','Leave','Leave',2,6,9,20,null,'Manage Group leaves Allowed','Right to set company policy leaves for employee group',2)
--------Insert Into UserRights values(29,'View Leave Types','Leave','Leave',2,7,10,20,null,'Manage Leave Types','Right to add, edit or delete leave types, default  system defined leave types cannot be deleted or edited.',2)
--------Insert Into UserRights values(30,'Leave Transfer','Leave','Leave',2,8,11,20,null,'Manage Leaves transfer','Right to transfer leave for employee from one year to another',2)
--------Insert Into UserRights values(31,'View Public Holidays','Leave','Leave',2,9,12,20,null,'View Public / Company Holidays','Right to view public holidays / company holidays',2)
--------Insert Into UserRights values(32,'Manage Public Holidays','Leave','Leave',null,null,13,20,null,'Manage Public / Company Holidays','Right to add / edit public holidays / company holidays',2)
--------Insert Into UserRights values(33,'View Manage Leaves','Leave','Leave',2,10,14,20,null,'Manage leaves Additions or Deductios','Right to add or deduct leaves for employee',2)
--------Insert Into UserRights values(34,'Claims Management','Claims','Claims',null,null,1,null,null,'Claim Module','Right to the main claims module',2)
--------Insert Into UserRights values(35,'Apply Claim','Claims','Claims',3,1,2,34,null,'Apply Claim','Right to apply claim',2)
--------Insert Into UserRights values(36,'Apply Claim for all','Claims','Claims',null,null,3,34,null,'Apply Claim For All','Right to apply claim for all employees',2)
--------Insert Into UserRights values(37,'Claim Status','Claims','Claims',3,2,4,34,null,'Claim Status','Right to view applied claims status',2)
--------Insert Into UserRights values(38,'Approved Claims','Claims','Claims',3,3,5,34,null,'Approved Claims','Right to view approved claims',2)
--------Insert Into UserRights values(39,'Rejected Claims','Claims','Claims',3,4,6,34,null,'Rejected Claims','Right to view rejected claims',2)
--------Insert Into UserRights values(40,'Pending Approval for Claim','Claims','Claims',3,5,7,34,null,'Approve or Reject Claims','Right to approve and reject claims',2)
--------Insert Into UserRights values(41,'Claims Capping','Claims','Claims',3,5,7,34,null,'Claims Capping','Right to apply claims capping to employee',2)
--------Insert Into UserRights values(42,'Timesheet Management','Timesheet','Timesheet',null,null,1,null,1,'Timesheet Module','Right to ',1)
--------Insert Into UserRights values(43,'Roster','Timesheet','Timesheet',4,1,2,42,null,'Manage Roaster','Right to add, edit or delete roasters',1)
--------Insert Into UserRights values(44,'Roster Settings','Timesheet','Timesheet',4,2,3,42,null,'Manage Roster Settings','Right to add, edit or delete roasters settings',1)
--------Insert Into UserRights values(45,'Roster Assignment','Timesheet','Timesheet',4,3,4,42,null,'Manage Roster Assignment','Right to assign employees to roaster',1)
--------Insert Into UserRights values(46,'Automatic Timesheet','Timesheet','Timesheet',4,4,5,42,null,'Import Timesheet','Right to import timesheet from external source',1)
--------Insert Into UserRights values(47,'Manage Employee Timesheet','Timesheet','Timesheet',4,5,6,42,null,'Manual Timesheet - For Employee','Right to submit timesheet for individual employee',1)
--------Insert Into UserRights values(48,'Manage Project Timesheet','Timesheet','Timesheet',4,6,7,42,null,'Manual Timesheet - For Project','Right to submit timesheet for project (all employees under that project)',1)
--------Insert Into UserRights values(49,'Submit Timesheet for All','Timesheet','Timesheet',null,null,8,42,null,'Manual Timesheet For All','Right to submit timesheet for all',1)
--------Insert Into UserRights values(50,'Approve Timesheet','Timesheet','Timesheet',null,null,9,42,null,'Approve Timesheet','Right to approve timesheet',1)
--------Insert Into UserRights values(51,'Approve Timesheet for All','Timesheet','Timesheet',null,null,10,42,null,'Approve Timesheet For All','Right to approve timesheet for all',1)
--------Insert Into UserRights values(52,'Compare Timesheet','Timesheet','Timesheet',4,7,11,42,null,'Compare Timesheet ( Automatic & Manual)','Right to view compare timesheet',1)
--------Insert Into UserRights values(53,'Payroll Management','Payroll','Payroll',null,null,1,null,null,'Payroll Module','Right to the main payroll module',2)
--------Insert Into UserRights values(54,'View Additions','Payroll','Payroll',null,null,3,53,null,'View Payroll Additions','Right to view payroll additions',2)
--------Insert Into UserRights values(55,'Manage Payroll Additions','Payroll','Payroll',5,1,2,54,53,'Manage Payroll Additions','Right to manage (add, edit or delete) payroll additions',2)
--------Insert Into UserRights values(56,'View Deductions','Payroll','Payroll',null,null,5,53,null,'View Payroll Deductions','Right to view payroll deduction',2)
--------Insert Into UserRights values(57,'Manage Payroll Deductions','Payroll','Payroll',5,2,4,56,53,'Manage Payroll Deductions','Right to manage (add, edit or delete) payroll deduction',2)
--------Insert Into UserRights values(58,'View overtimepay','Payroll','Payroll',null,null,7,53,null,'View Payroll Overtime /  Variables','Right to view payroll overtime',2)
--------Insert Into UserRights values(59,'Manage Overtime Payroll','Payroll','Payroll',5,3,6,58,53,'Manage Payroll Overtime /  Variables','Right to manage (add, edit or delete) payroll overtime',2)
--------Insert Into UserRights values(60,'Generate or Submit Payroll','Payroll','Payroll',5,4,12,53,null,'Submit Payroll','Right to submit payroll for approval',2)
--------Insert Into UserRights values(61,'Approve or Reject Payroll','Payroll','Payroll',5,5,9,53,null,'Approve / Reject Payroll','Right to approve or reject submitted payroll',2)
--------Insert Into UserRights values(62,'View Generate Payroll','Payroll','Payroll',5,6,11,53,null,'Generate Payroll ','Right to generate approved payroll',2)
--------Insert Into UserRights values(63,'print payroll','Payroll','Payroll',5,7,14,53,null,'Print Payroll','Right to print generated payroll',2)
--------Insert Into UserRights values(64,'Unlock Payroll','Payroll','Payroll',5,8,15,53,null,'Unlock Payroll','Right to unlock approved or generated payroll',2)
--------Insert Into UserRights values(65,'Reports Management','Reports','Reports',null,null,1,null,null,'Reports Module','Right to the main reports module',2)
--------Insert Into UserRights values(66,'View CPF information','Reports','Reports',6,1,2,65,null,'CPF File Generation','Right to generate CPF file to be submitted to CPF Board',2)
--------Insert Into UserRights values(67,'View Giro information','Reports','Reports',6,2,3,65,null,'Bank Giro File Generation','Right to generate bank Giro file for salary transfer via bank',2)
--------Insert Into UserRights values(68,'View IRAS information','Reports','Reports',6,3,5,65,null,'IRAS Forms Generation','Right to generate IRAS forms - IR8A, IR8A (Appendix A), IR8A (Appendix B), IR8S, IR21',2)
--------Insert Into UserRights values(69,'View Reports','Reports','Reports',6,4,4,65,null,'View Reports','Right to view different types of reports - Reminders, payroll, leaves, Employee',2)
--------Insert Into UserRights values(70,'View Custom Reports','Reports','Reports',6,5,5,65,null,'View Custom Reports','Right to view custom report writer to create your own reports',2)
--------Insert Into UserRights values(71,'Manage IR8A information','Reports','IRAS Reports',null,null,6,68,65,'Manage IR8A information','Right to view, print or submit IR8A form',2)
--------Insert Into UserRights values(72,'Manage IR8A Appdx A Information','Reports','IRAS Reports',null,null,7,68,65,'Manage IR8A Appdx A Information','Right to view, print or submit IR8A Appendix A form',2)
--------Insert Into UserRights values(73,'Manage IR8A Appdx B Information','Reports','IRAS Reports',null,null,8,68,65,'Manage IR8A Appdx B Information','Right to view, print or submit IR8A Appendix b form',2)
--------Insert Into UserRights values(74,'Manage IR8S Information','Reports','IRAS Reports',null,null,9,68,65,'Manage IR8S Information','Right to view, print or submit IR8S form',2)
--------Insert Into UserRights values(75,'Manage IR21 information','Reports','IRAS Reports',null,null,10,68,65,'Manage IR21 information','Right to view, print or submit IR21 form',2)
----------Insert Into UserRights values(76,'View Pass Expiry Report','Reports','Reminder Reports',null,null,11,69,65,'View Pass Expiry Report','Right to view pass expiry report',2)
----------Insert Into UserRights values(77,'View Passport Expiry Report','Reports','Reminder Reports',null,null,12,69,65,'View Passport Expiry Report','Right to view passport expiry report',2)
----------Insert Into UserRights values(78,'View Insurance Expiry Report','Reports','Reminder Reports',null,null,13,69,65,'View Insurance Expiry Report','Right to view insurance expiry report',2)
----------Insert Into UserRights values(79,'View CSOC Expiry Report','Reports','Reminder Reports',null,null,14,69,65,'View CSOC Expiry Report','Right to view csoc expiry report',2)
--------Insert Into UserRights values(80,'View Levy Report','Reports','Reminder Reports',null,null,15,69,65,'View Levy Report','Right to view levy report',2)
--------Insert Into UserRights values(81,'View Payroll Details Report','Reports','Payroll Reports',null,null,16,69,65,'View Payroll Details Report','Right to view payroll details report',2)
--------Insert Into UserRights values(82,'View Payroll Summary Report','Reports','Payroll Reports',null,null,17,69,65,'View Payroll Summary Report','Right to view payroll summary report',2)
--------Insert Into UserRights values(83,'View Payroll Summary(detail) Report','Reports','Payroll Reports',null,null,18,69,65,'View Payroll Summary(detail) Report','Right to view payroll summary(detail) report',2)
--------Insert Into UserRights values(84,'View CPF Report','Reports','Payroll Reports',null,null,19,69,65,'View CPF Report','Right to view cpf report',2)
--------Insert Into UserRights values(85,'View Funds Summary Report','Reports','Payroll Reports',null,null,20,69,65,'View Funds Summary Report','Right to view funds summary report',2)
--------Insert Into UserRights values(86,'View Funds Detail Report','Reports','Payroll Reports',null,null,21,69,65,'View Funds Detail Report','Right to view funds detail report',2)
--------Insert Into UserRights values(87,'View SDL Summary Report','Reports','Payroll Reports',null,null,22,69,65,'View SDL Summary Report','Right to view funds detail report',2)
--------Insert Into UserRights values(88,'View SDL Detail Report','Reports','Payroll Reports',null,null,23,69,65,'View SDL Detail Report','Right to view sdl detail report',2)
--------Insert Into UserRights values(89,'View Individual  Monthly Leave Report','Reports','Leave Reports',null,null,24,69,65,'View Individual  Monthly Leave Report','Right to view individual  monthly leave report',2)
--------Insert Into UserRights values(90,'View Individual  Monthly Details  Leave Report','Reports','Leave Reports',null,null,25,69,65,'View Individual  Monthly Details  Leave Report','Right to view individual  monthly details  leave report',2)
--------Insert Into UserRights values(91,'View Individual  Yearly  Leave Report','Reports','Leave Reports',null,null,26,69,65,'View Individual  Yearly  Leave Report','Right to view individual  yearly  leave report',2)
--------Insert Into UserRights values(92,'View Individual  Yearly Detail  Leave Report','Reports','Leave Reports',null,null,27,69,65,'View Individual  Yearly Detail  Leave Report','Right to view individual  yearly detail  leave report',2)
--------Insert Into UserRights values(93,'View Summary Yearly  Leave Report','Reports','Leave Reports',null,null,28,69,65,'View Summary Yearly  Leave Report','Right to view summary yearly  leave report',2)
--------Insert Into UserRights values(94,'View Summary Yearly Detail  Leave Report','Reports','Leave Reports',null,null,29,69,65,'View Summary Yearly Detail  Leave Report','Right to view summary yearly detail  leave report',2)
--------Insert Into UserRights values(95,'View Summary Monthly  Leave Report','Reports','Leave Reports',null,null,30,69,65,'View Summary Monthly  Leave Report','Right to view summary monthly  leave report',2)
--------Insert Into UserRights values(96,'View Summary Monthly  Detail Leave Report','Reports','Leave Reports',null,null,31,69,65,'View Summary Monthly  Detail Leave Report','Right to view summary monthly  detail leave report',2)
----------Insert Into UserRights values(97,'View Employee Details','Reports','Employee Reports',null,null,32,69,65,'View Employee Details','Right to view employee details report',2)
----------Insert Into UserRights values(98,'View Employee Personal Details','Reports','Employee Reports',null,null,33,69,65,'View Employee Personal Details','Right to view employee personal details report',2)
----------Insert Into UserRights values(99,'View Employee Job Details','Reports','Employee Reports',null,null,34,69,65,'View Employee Job Details','Right to view employee job details report',2)
----------Insert Into UserRights values(100,'View Employee Salary Details','Reports','Employee Reports',null,null,35,69,65,'View Employee Salary Details','Right to view employee salary details report',2)
----------Insert Into UserRights values(101,'View Employee Certs Details','Reports','Employee Reports',null,null,36,69,65,'View Employee Certs Details','Right to view employee certs details report',2)
----------Insert Into UserRights values(102,'View Employee Address Details','Reports','Employee Reports',null,null,37,69,65,'View Employee Address Details','Right to view employee address details report',2)
--------Insert Into UserRights values(103,'View TimeCard Details','Reports','Reports',null,null,38,69,65,'View TimeCard Details','Right to view timecard details report',2)
----------Insert Into UserRights values(104,'View Cheque Print','Reports','Reports',null,null,39,69,65,'View Cheque Print','Right to view cheque to be printed report',2)
--------Insert Into UserRights values(105,'Admin Rights','Admin','',null,null,null,null,null,'Admin Module','Right to the main admin module',2)
--------Insert Into UserRights values(106,'View Company','Admin','Company',7,1,1,105,null,'View Company Info','Right to view company info',2)
--------Insert Into UserRights values(107,'Add Company','Admin','Company',null,null,2,106,105,'Add New Company','Right to add new company',2)
--------Insert Into UserRights values(108,'Edit Company','Admin','Company',null,null,3,106,105,'Edit Existing Company','Right to edit existing company',2)
--------Insert Into UserRights values(109,'Delete Company','Admin','Company',null,null,4,106,105,'Delete Existing Company','Right to delete existing company',2)
--------Insert Into UserRights values(110,'Manage Users','Admin','Company',null,null,5,106,105,'Manage Users','Right to manage users under the company',2)
--------Insert Into UserRights values(111,'View Users','Admin','Security Management',7,2,6,105,null,'Security Management','Right to security groups',2)
--------Insert Into UserRights values(112,'Manage User Groups','Admin','Security Management',null,null,7,111,105,'Manage Security Groups','Right to add, edit or delete security groups',2)
--------Insert Into UserRights values(113,'View Lookups','Admin','DropDowns',7,3,8,null,null,'DropDowns','Right to dropdowns',2)
--------Insert Into UserRights values(114,'Manage Addition Types','Admin','DropDowns',null,null,9,113,105,'Manage Addition Types','Right to add, edit or delete payroll addition type',2)
--------Insert Into UserRights values(115,'Manage Deduction Types','Admin','DropDowns',null,null,10,113,105,'Manage Deduction Types','Right to add, edit or delete payroll deduction type',2)
--------Insert Into UserRights values(116,'Manage Race Types','Admin','DropDowns',null,null,11,113,105,'Manage Race Types','Right to add, edit or delete race type',2)
--------Insert Into UserRights values(117,'Manage Religion Types','Admin','DropDowns',null,null,12,113,105,'Manage Religion Types','Right to add, edit or delete religion type',2)
--------Insert Into UserRights values(118,'Manage Departments','Admin','DropDowns',null,null,13,113,105,'Manage Departments','Right to add, edit or delete departments',2)
--------Insert Into UserRights values(119,'Manage Designation Types','Admin','DropDowns',null,null,14,113,105,'Manage Designation Types','Right to add, edit or delete designations',2)
--------Insert Into UserRights values(120,'Manage Country Types','Admin','DropDowns',null,null,15,113,105,'Manage Country Types','Right to add, edit or delete country',2)
--------Insert Into UserRights values(121,'Manage Nationality Types','Admin','DropDowns',null,null,16,113,105,'Manage Nationality Types','Right to add, edit or delete nationality',2)
--------Insert Into UserRights values(122,'Manage WPTypes','Admin','DropDowns',null,null,17,113,105,'Manage WPTypes','Right to add, edit or delete work permit type',2)
--------Insert Into UserRights values(123,'Manage Course Types','Admin','DropDowns',null,null,18,113,105,'Manage Course Types','Right to add, edit or delete course type',2)
--------Insert Into UserRights values(124,'Manage SafetyPass Types','Admin','DropDowns',null,null,19,113,105,'Manage SafetyPass Types','Right to add, edit or delete safety pass type',2)
--------Insert Into UserRights values(125,'Manage Document Category','Admin','DropDowns',null,null,20,113,105,'Manage Document Category','Right to add, edit or delete document category',2)
--------Insert Into UserRights values(126,'Manage Certificate Category','Admin','DropDowns',null,null,21,113,105,'Manage Certificate Category','Right to add, edit or delete Certificate Category',2)
--------Insert Into UserRights values(127,'Manage Agent','Admin','DropDowns',null,null,22,113,105,'Manage Agent','Right to add, edit or delete Agents',2)
--------Insert Into UserRights values(128,'Manage MYE','Admin','DropDowns',null,null,23,113,105,'Manage MYE','Right to add, edit or delete MYE certificate',2)
--------Insert Into UserRights values(129,'Manage Leave Types','Admin','DropDowns',null,null,24,113,105,'Manage Leave Types','Right to add, edit or delete Leave types',2)
--------Insert Into UserRights values(130,'Project Management','Admin','Project Management',7,4,25,null,105,'Project Management','Right to project management',1)
--------Insert Into UserRights values(131,'Project','Admin','Project Management',null,null,26,130,105,'Manage Project','Right to add, edit or delete projects',1)
--------Insert Into UserRights values(132,'Sub Project','Admin','Project Management',null,null,27,130,105,'Manage Sub Project','Right to add, edit or delete sub projects',1)
--------Insert Into UserRights values(133,'Location','Admin','Project Management',null,null,28,130,105,'Manage Location','Right to add, edit or delete location',1)
--------Insert Into UserRights values(134,'Project Assignment','Admin','Project Management',null,null,29,130,105,'Manage Project Assignment','Right to assign employees to project',1)
--------Insert Into UserRights values(135,'Workflow Management','Admin','Workflow Management',7,5,30,null,null,'Workflow Management','Right to workflow management',2)
--------Insert Into UserRights values(136,'Workflow','Admin','Workflow Management',null,null,32,135,105,'Manage Workflow','Right to add, edit or delete workflows',2)
--------Insert Into UserRights values(137,'Workflow Level','Admin','Workflow Management',null,null,33,135,105,'Manage Workflow Level','Right to add, edit or delete workflow levels for workflow',2)
--------Insert Into UserRights values(138,'Workflow Group','Admin','Workflow Management',null,null,34,135,105,'Manage Workflow Group','Right to add, edit or delete workflow Groups of workflow',2)
--------Insert Into UserRights values(139,'Workflow Employee Assignment','Admin','Workflow Management',null,null,35,135,105,'Manage Workflow Employee Assignment','Right to assign employees to workflow',2)
--------Insert Into UserRights values(140,'Items Management','Admin','Items Management',7,6,36,null,null,'Items Management','Right to items management',1)
--------Insert Into UserRights values(141,'UOM','Admin','Items Management',null,null,37,140,105,'Manage UOM','Right to add, edit or delete unit of measure',1)
--------Insert Into UserRights values(142,'Item Category','Admin','Items Management',null,null,38,140,105,'Manage Item Category','Right to add, edit or delete item category',1)
--------Insert Into UserRights values(143,'Item Sub Category','Admin','Items Management',null,null,39,140,105,'Manage Item Sub Category','Right to add, edit or delete item sub category',1)
--------Insert Into UserRights values(144,'Item Parameter','Admin','Items Management',null,null,40,140,105,'Manage Item Parameter','Right to add, edit or delete item parameter',1)
--------Insert Into UserRights values(145,'Supplier','Admin','Items Management',null,null,41,140,105,'Manage Supplier','Right to add, edit or delete suppliers',1)
--------Insert Into UserRights values(146,'Store','Admin','Items Management',null,null,42,140,105,'Manage Store','Right to add, edit or delete stores',1)
--------Insert Into UserRights values(147,'Item','Admin','Items Management',null,null,43,140,105,'Manage Item','Right to add, edit or delete items',1)
--------Insert Into UserRights values(148,'Assignment Management','Admin','Assignment Management',7,7,44,null,null,'Assignment Management','Right to assignment management',2)
--------Insert Into UserRights values(149,'Department Assignment','Admin','Assignment Management',null,null,45,148,105,'Assign Department to Employees','Right to assign department to employees',2)
--------Insert Into UserRights values(150,'Leave Supervisor Assignment','Admin','Assignment Management',null,null,46,148,105,'Assign Leave Supervisor to Employees','Right to assign leave supervisor to employees',2)
--------Insert Into UserRights values(151,'Claim Supervisor Assignment','Admin','Assignment Management',null,null,47,148,105,'Assign Claim Supervisor to Employees','Right to assign claim supervisor to employees',2)
--------Insert Into UserRights values(152,'Payroll Workflow Assignment','Admin','Assignment Management',null,null,48,148,105,'Assign Payroll Workflow to Employees','Right to assign payroll workflow to employees',2)
--------Insert Into UserRights values(153,'Bulk Import','Admin','Import Management',7,8,49,null,null,'Import Management','Right to import management ',2)
--------Insert Into UserRights values(154,'Employee Detail Import','Admin','Import Management',null,null,50,153,105,'Employee Detail Import','Right to import employee details after employee profile is created',2)
--------Insert Into UserRights values(155,'Bulk Payroll Additions Import','Admin','Import Management',null,null,51,153,105,'Bulk Payroll Additions Import','Right to bulk import payroll additions',2)
--------Insert Into UserRights values(156,'Bulk Payroll Deductions Import','Admin','Import Management',null,null,52,153,105,'Bulk Payroll Deductions Import','Right to bulk import payroll deductions',2)
--------Insert Into UserRights values(157,'Bulk Claims Import','Admin','Import Management',null,null,53,153,105,'Bulk Claims Import','Right to bulk import claims',2)
--------Insert Into UserRights values(158,'Inventory Management','Inventory','Inventory Management',null,null,1,null,null,'Inventory Module','Right to the main inventory module',1)
--------Insert Into UserRights values(159,'Stock In','Inventory','Inventory Management',8,1,2,158,null,'Manage Stock In','Right to add, edit or delete stock in from suppliers',1)
--------Insert Into UserRights values(160,'Stock Out','Inventory','Inventory Management',8,2,3,158,null,'Manage Stock Out','Right to add, edit or delete stock out to  project or employee',1)
--------Insert Into UserRights values(161,'Stock Transfer','Inventory','Inventory Management',8,3,4,158,null,'Manage Stock Transfer','Right to add, edit or delete stock transfer between different stores',1)
--------Insert Into UserRights values(162,'Stock Return','Inventory','Inventory Management',8,4,5,158,null,'Manage Stock Return','Right to add, edit or delete stock return from project or employee',1)
--------Insert Into UserRights values(163,'Invoice Management','Invoice','Invoice',null,null,1,null,null,'Invoicing Module','Right to the main invoicing module',1)
--------
--------Insert Into UserRights values(164,'Pending Approval Claim for All','Claims','Claims',null,null,9,34,null,'Approve or Reject Claims For All','Right to approve or reject applied claims of all employees',2)
--------Insert Into UserRights values(165,'Accomadation Management','Admin','Accomadation Management',7,9,54,null,null,'Accomadation Management','Right to the Accomadation Management',2)									
--------Insert Into UserRights values(166,'Accomadation Management','Admin','Accomadation Management',null,null,55,165,null,'Accomadation Management','Right to manage accomadtions info',2)									
--------Insert Into UserRights values(167,'Accomadation Assignment','Admin','Accomadation Management',null,null,56,165,null,'Accomadation Assignment','Right to assign, unassign or transfer employees to accomadation',2)									
--------Insert Into UserRights values(168,'Other Managements','Admin','Other Managements',7,10,57,null,null,'Other Managements','Right to Other Managements',2)									
--------Insert Into UserRights values(169,'Manage Payslip Remarks','Admin','Other Managements',null,null,58,168,null,'Manage Payslip Remarks','Right to add, edit or delete payslip remarks for employees',2)									
--------Insert Into UserRights values(170,'Custom Reports - Employee ','Reports','Reports',null,null,40,70,null,'Custom Reports - Employee ','Right to view Employee based custom reports',2)									
--------Insert Into UserRights values(171,'Custom Reports - Payroll','Reports','Reports',null,null,41,70,null,'Custom Reports - Payroll','Right to view Payroll based custom reports',2)									
--------Insert Into UserRights values(172,'Custom Reports - Additions','Reports','Reports',null,null,42,70,null,'Custom Reports - Additions','Right to view Payroll Additions based custom reports',2)									
--------Insert Into UserRights values(173,'Custom Reports - Deductions','Reports','Reports',null,null,43,70,null,'Custom Reports - Deductions','Right to view Payroll Deductions based custom reports',2)									
--------Insert Into UserRights values(174,'Custom Reports - Claims ','Reports','Reports',null,null,44,70,null,'Custom Reports - Claims ','Right to view Payroll Claims based custom reports',2)									
--------Insert Into UserRights values(175,'Custom Reports - Grouping','Reports','Reports',null,null,45,70,null,'Custom Reports - Grouping','Right to view Group based custom reports',2)									
--------Insert Into UserRights values(176,'Custom Reports - Leaves','Reports','Reports',null,null,46,70,null,'Custom Reports - Leaves','Right to view Leave based custom reports',2)									
--------Insert Into UserRights values(177,'Custom Reports - Timesheet','Reports','Reports',null,null,47,70,null,'Custom Reports - Timesheet','Right to view Timesheet / Project based custom reports',2)
--------Insert Into UserRights values(178,'Apply Date On','Leave','Leave',null,null,15,20,null,'Apply Date On','Right to apply date/request leave with respect to apply date on',2)
--------Insert Into UserRights values(179,'Manage Trade Types','Admin','DropDowns',null,null,14,113,105,'Manage Trade Types','Right to add, edit or delete Trade',2)
--------Insert Into UserRights values(180,'Custom Reports - EmailTrack','Reports','Reports',null,null,48,70,null,'Custom Reports - EmailTrack','Right to view Email Tracking on various actions',2)
--------
--------Insert Into UserRights values(181,'Manage Logo','Admin','Other Managements',null,null,58,168,null,'Manage Logo','Right to Logo Management',2)
--------Insert Into UserRights values(182,'Manage Year of Assesment','Admin','Other Managements',null,null,58,168,null,'Manage Year of Assesment','Right to add, edit Year of Assesment for employees',2)									
--------Insert Into UserRights values(183,'Manage Previous Year Wages','Admin','Other Managements',null,null,58,168,null,'Manage Previous Year Wages','Right to add, edit Manage Previous Year Wages for employees',2)									
--------
--------Delete From UserRights Where RightID In (41, 71,72,73,74,75, 89,90,91,92,93,94,95,96, 103,109)
GO

Declare @countnew int
set @countnew=0
Declare @count int
Set @count = 0
Select @count=COUNT(ID) from religion where UPPER([religion])  = 'HINDU'
If (@count = 0)
Begin
	Insert into religion(religion) values('Hindu')
End


Set @count = 0
Select @count=COUNT(ID) from religion where UPPER([religion])  = 'MUSLIM'
If (@count = 0)
Begin
	Insert into religion(religion) values('Muslim')
End

Set @count = 0
Select @count=COUNT(ID) from religion where UPPER([religion])  = 'CHRISTIAN'
If (@count = 0)
Begin
	Insert into religion(religion) values('Christian')
End

Set @count = 0
Select @count=COUNT(ID) from religion where UPPER([religion])  = 'BUDHIST'
If (@count = 0)
Begin
	Insert into religion(religion) values('Budhist')
End

Set @count = 0
Select @count=COUNT(ID) from religion where UPPER([religion])  = 'OTHERS'
If (@count = 0)
Begin
	Insert into religion(religion) values('Others')
End


Set @count = 0
Select @count=Count(ID) From deductions_types Where Upper([Desc])='Item Issue/Sold'
If (@count = 0)
Begin
	Insert into deductions_types([desc], company_id) values('Item Issue/Sold', -1)
End

Set @count = 0
Select @count=COUNT(ID) from RACE where UPPER([RACE])  = 'INDIAN'
If (@count = 0)
Begin
	Insert into RACE(RACE) values('Indian')
End

Set @count = 0
Select @count=COUNT(ID) from RACE where UPPER([RACE])  = 'CHINESE'
If (@count = 0)
Begin
	Insert into RACE(RACE) values('Chinese')
End

Set @count = 0
Select @count=COUNT(ID) from RACE where UPPER([RACE])  = 'MALAY'
If (@count = 0)
Begin
	Insert into RACE(RACE) values('Malay')
End



Update CertificateCategory Set Category_Name = 'FIN (EP/WP)-1' where UPPER(Category_Name)  = 'FIN (EP/WP)' And Company_Id=-1 And ID != 6

Select @count=COUNT(ID) from CertificateCategory where UPPER(Category_Name)  = 'FIN (EP/WP)' And Company_Id=-1
If (@count = 0)
Begin
--		Insert Into CertificateCategory (ID,Company_ID, Category_Name) Values (1,-1, 'Insurance')
--		Insert Into CertificateCategory (ID,Company_ID, Category_Name) Values (2,-1, 'Certificate')
--		Insert Into CertificateCategory (ID,Company_ID, Category_Name) Values (3,-1, 'Passport')
--		Insert Into CertificateCategory (ID,Company_ID, Category_Name) Values (4,-1, 'NRIC')
--		Insert Into CertificateCategory (ID,Company_ID, Category_Name) Values (5,-1, 'License')
		Insert Into CertificateCategory (Company_ID, Category_Name, ColID) Values (-1, 'FIN (EP/WP)',6)
End



Set @count = 0
Select @count=COUNT(ID) from DocumentCategory where UPPER(Category_Name)  = 'IMAGES'
If (@count >= 1)
Begin
	Update DocumentCategory Set Category_Name = 'Academic Education' Where Category_Name='Images'
	Update DocumentCategory Set Category_Name = 'Award & Achievment' Where Category_Name='Others'
	Update DocumentCategory Set Category_Name = 'Professional Services' Where Category_Name='Word'
	Update DocumentCategory Set Category_Name = 'Social Services' Where Category_Name='Excel'
	Update DocumentCategory Set Category_Name = 'Technical Education' Where Category_Name='PDF'
	Update DocumentCategory Set Category_Name = 'Vocational Education' Where Category_Name='Text'
	Update DocumentCategory Set Category_Name = 'Others' Where Category_Name='PPP'
End

Set @count = 0
Select @count=COUNT(ID) from DocumentCategory where UPPER(Category_Name)  = 'ACADEMIC EDUCATION'
If (@count = 0)
Begin
	Insert Into DocumentCategory	(Company_ID, Category_Name) Values (-1, 'Academic Education')
	Insert Into DocumentCategory	(Company_ID, Category_Name) Values (-1, 'Award & Achievment')
	Insert Into DocumentCategory	(Company_ID, Category_Name) Values (-1, 'Professional Services')
	Insert Into DocumentCategory	(Company_ID, Category_Name) Values (-1, 'Social Services')
	Insert Into DocumentCategory	(Company_ID, Category_Name) Values (-1, 'Technical Education')
	Insert Into DocumentCategory	(Company_ID, Category_Name) Values (-1, 'Vocational Education')
	Insert Into DocumentCategory	(Company_ID, Category_Name) Values (-1, 'Others')
End


Set @count = 0
Select @count=COUNT(ID) from Parameter where UPPER(ParameterName)  = 'COLOR'
If (@count = 0)
Begin
	Insert Into Parameter			(Company_ID, ParameterName) Values (-1, 'Color')
End

Set @count = 0
Select @count=COUNT(ID) from Parameter where UPPER(ParameterName)  = 'HEIGHT'
If (@count = 0)
Begin
	Insert Into Parameter			(Company_ID, ParameterName) Values (-1, 'Height')
End

Set @count = 0
Select @count=COUNT(ID) from Parameter where UPPER(ParameterName)  = 'SIZE'
If (@count = 0)
Begin
	Insert Into Parameter			(Company_ID, ParameterName) Values (-1, 'Size')
End

Set @count = 0
Select @count=COUNT(ID) from Parameter where UPPER(ParameterName)  = 'VOLUMNE'
If (@count = 0)
Begin
	Insert Into Parameter			(Company_ID, ParameterName) Values (-1, 'Volumne')
End

Set @count = 0
Select @count=COUNT(ID) from Parameter where UPPER(ParameterName)  = 'DIMENSION'
If (@count = 0)
Begin
	Insert Into Parameter			(Company_ID, ParameterName) Values (-1, 'Dimension')
End


Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'DOCUMENT CATEGORY'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Document Category', '../Management/ManageDocumentCategory.aspx')
End

Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'MYE CERTIFICATE'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('MYE Certificate', '../Management/ManageMYE.aspx')
End

Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'WORKFLOW LEVEL'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Workflow Level', '../Management/EmployeeWorkFlowLevel.aspx')
End

Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'WORKFLOW'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Workflow', '../Management/EmployeeWorkFlow.aspx')
End

Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'PAYROLL GROUP'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Payroll Group', '../Management/ManagePayrollGroup.aspx')
End

Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'LEAVE TYPES'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Leave Types', '../Leaves/LeaveTypes.aspx')
End

Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'AGENT'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Agent', '../Management/ManageAgent.aspx')
End

Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'CERTIFICATE CATEGORY'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Certificate Category', '../Management/ManageCertificateCategory.aspx')
End


Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'LOCATION'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Location', '../Management/ManageLocation.aspx')
End

Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'PARAMETER'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Parameter', '../Management/ManageParameter.aspx')
End

Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'ROSTER'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Roster', '../Management/ManageRoster.aspx')
End

Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'ITEM'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Item', '../Management/ManageItem.aspx')
End

Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'STORE'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Store', '../Management/ManageStore.aspx')
End


Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'SUPPLIER'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Supplier', '../Management/ManageSupplier.aspx')
End

Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'PROJECT'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Project', '../Management/ManageProject.aspx')
End

Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'SUB PROJECT'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Sub Project', '../Management/ManageSubProject.aspx')
End

Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'Item Category'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Item Category', '../Management/ManageItemCategory.aspx')
End

Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'Item Sub Category'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Item Sub Category', '../Management/ManageItemSubCategory.aspx')
End

Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'Units for Measurement'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Units for Measurement', '../Management/ManageUOM.aspx')
End


Set @count = 0
Select @count=COUNT(ID) from DropDowns where UPPER([DropDown])  = 'Trade'
If (@count = 0)
Begin
	Insert into DropDowns(DropDown, Navigate) values('Trade', '../Management/ManageTrade.aspx')
End

set @count = 0
Select @count=COUNT(ID) from nationality where UPPER([nationality])  = 'AFGHAN'
if (@count = 0)
Begin
Set Identity_Insert Nationality On
Insert Into Nationality (id, ir8a_code, nationality) values(192,351,'AFGHAN')
Insert Into Nationality (id, ir8a_code, nationality) values(193,201,'ALBANIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(194,401,'ALGERIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(195,503,'AMERICAN')
Insert Into Nationality (id, ir8a_code, nationality) values(196,721,'AMERICAN SAMOAN')
Insert Into Nationality (id, ir8a_code, nationality) values(197,153,'ANDORRAN')
Insert Into Nationality (id, ir8a_code, nationality) values(198,451,'ANGOLAN')
Insert Into Nationality (id, ir8a_code, nationality) values(376,670,'ANGUILLA')
Insert Into Nationality (id, ir8a_code, nationality) values(377,641,'ANTIGUA')
Insert Into Nationality (id, ir8a_code, nationality) values(199,601,'ARGENTINIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(378,217,'ARMENIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(379,625,'ARUBA')
Insert Into Nationality (id, ir8a_code, nationality) values(200,701,'AUSTRALIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(201,131,'AUSTRIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(380,218,'AZERBAIJANI')
Insert Into Nationality (id, ir8a_code, nationality) values(381,899,'AZERBIJANI')
Insert Into Nationality (id, ir8a_code, nationality) values(202,642,'BAHAMIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(203,371,'BAHRAINI')
Insert Into Nationality (id, ir8a_code, nationality) values(204,352,'BANGLADESHI')
Insert Into Nationality (id, ir8a_code, nationality) values(205,643,'BARBADIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(382,211,'BELARUSSIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(206,101,'BELGIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(207,644,'BELIZEAN')
Insert Into Nationality (id, ir8a_code, nationality) values(383,452,'BENIN')
Insert Into Nationality (id, ir8a_code, nationality) values(208,645,'BERMUDAN')
Insert Into Nationality (id, ir8a_code, nationality) values(209,353,'BHUTANI')
Insert Into Nationality (id, ir8a_code, nationality) values(210,646,'BOLIVIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(384,994,'BOSNIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(385,453,'BOTSWANA')
Insert Into Nationality (id, ir8a_code, nationality) values(386,139,'BOUVET ISLAND')
Insert Into Nationality (id, ir8a_code, nationality) values(387,738,'BR NAT. OVERSEAS')
Insert Into Nationality (id, ir8a_code, nationality) values(388,995,'BR OVERSEAS CIT.')
Insert Into Nationality (id, ir8a_code, nationality) values(389,996,'BR PROTECTED PERS.')
Insert Into Nationality (id, ir8a_code, nationality) values(211,602,'BRAZILIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(212,110,'BRITISH, ISLAND OF GUERNSEY, CHANNEL ISLANDS, U.K')
Insert Into Nationality (id, ir8a_code, nationality) values(213,708,'BRITISH, JERSEY CHANNEL ISLANDS (U.K.)')
Insert Into Nationality (id, ir8a_code, nationality) values(214,886,'BRITISH, UNITED KINGDOM')
Insert Into Nationality (id, ir8a_code, nationality) values(215,302,'BRUNEIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(216,202,'BULGARIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(390,454,'BURKINA FASO')
Insert Into Nationality (id, ir8a_code, nationality) values(217,311,'Burmese')
Insert Into Nationality (id, ir8a_code, nationality) values(218,455,'BURUNDIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(219,456,'CAMEROONIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(220,501,'CANADIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(221,457,'CAPE VERDEAN')
Insert Into Nationality (id, ir8a_code, nationality) values(222,647,'CAYMANESE')
Insert Into Nationality (id, ir8a_code, nationality) values(392,458,'CENTRAL AFRICAN REP')
Insert Into Nationality (id, ir8a_code, nationality) values(223,459,'CHADIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(224,603,'CHILEAN')
Insert Into Nationality (id, ir8a_code, nationality) values(225,336,'CHINESE')
Insert Into Nationality (id, ir8a_code, nationality) values(393,709,'CHRISTMAS ISLANDS')
Insert Into Nationality (id, ir8a_code, nationality) values(394,710,'COCOS KEELING ISLAND')
Insert Into Nationality (id, ir8a_code, nationality) values(227,604,'COLOMBIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(228,312,'COMBODIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(395,460,'COMOROS')
Insert Into Nationality (id, ir8a_code, nationality) values(396,461,'CONGO')
Insert Into Nationality (id, ir8a_code, nationality) values(397,722,'COOK ISLANDS')
Insert Into Nationality (id, ir8a_code, nationality) values(229,648,'COSTA RICAN')
Insert Into Nationality (id, ir8a_code, nationality) values(230,232,'CROATIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(391,898,'CTRAL AFRICAN REP')
Insert Into Nationality (id, ir8a_code, nationality) values(231,621,'CUBAN')
Insert Into Nationality (id, ir8a_code, nationality) values(232,372,'CYPRIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(233,234,'CZECHOSLOVAKIAN, CZECHOSLOVAKIA')
Insert Into Nationality (id, ir8a_code, nationality) values(234,203,'CZECHOSLOVAKIAN, SLOVAK REPUBLIC')
Insert Into Nationality (id, ir8a_code, nationality) values(235,102,'DANISH')
Insert Into Nationality (id, ir8a_code, nationality) values(398,407,'DJIBOUTI')
Insert Into Nationality (id, ir8a_code, nationality) values(236,649,'DOMINICAN, DOMINICA')
Insert Into Nationality (id, ir8a_code, nationality) values(237,622,'DOMINICAN, DOMINICAN REPUBLIC')
Insert Into Nationality (id, ir8a_code, nationality) values(238,991,'DUTCH, NETHERLANDS')
Insert Into Nationality (id, ir8a_code, nationality) values(239,623,'DUTCH, NETHERLANDS ANTILLES')
Insert Into Nationality (id, ir8a_code, nationality) values(399,887,'EAST TIMORESE')
Insert Into Nationality (id, ir8a_code, nationality) values(240,605,'ECUADORIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(241,402,'EGYPTIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(242,462,'EQUATORIAL GUINEAN')
Insert Into Nationality (id, ir8a_code, nationality) values(400,410,'ERITREA')
Insert Into Nationality (id, ir8a_code, nationality) values(401,897,'ERITREAN')
Insert Into Nationality (id, ir8a_code, nationality) values(402,213,'ESTONIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(243,408,'ETHIOPIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(403,141,'FAEROE ISLANDS')
Insert Into Nationality (id, ir8a_code, nationality) values(244,651,'FALKLAND ISLAND')
Insert Into Nationality (id, ir8a_code, nationality) values(245,702,'FIJIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(246,132,'FINNISH')
Insert Into Nationality (id, ir8a_code, nationality) values(247,103,'FRENCH')
Insert Into Nationality (id, ir8a_code, nationality) values(404,652,'FRENCH GUIANA')
Insert Into Nationality (id, ir8a_code, nationality) values(405,723,'FRENCH POLYNESIA')
Insert Into Nationality (id, ir8a_code, nationality) values(406,711,'FRENCH SOUTHERN TERR')
Insert Into Nationality (id, ir8a_code, nationality) values(249,463,'GABONESE')
Insert Into Nationality (id, ir8a_code, nationality) values(250,464,'GAMBIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(407,216,'GEORGIA')
Insert Into Nationality (id, ir8a_code, nationality) values(408,896,'GEORGIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(251,104,'GERMAN')
Insert Into Nationality (id, ir8a_code, nationality) values(252,421,'GHANAIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(253,154,'GIBRALTARIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(254,105,'GREEK')
Insert Into Nationality (id, ir8a_code, nationality) values(409,142,'GREENLAND')
Insert Into Nationality (id, ir8a_code, nationality) values(255,653,'GRENADIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(410,724,'GUAM')
Insert Into Nationality (id, ir8a_code, nationality) values(411,655,'GUATEMALA')
Insert Into Nationality (id, ir8a_code, nationality) values(256,654,'GUIANAN')
Insert Into Nationality (id, ir8a_code, nationality) values(412,895,'GUINEA-BISSAU')
Insert Into Nationality (id, ir8a_code, nationality) values(257,465,'GUINEAN')
Insert Into Nationality (id, ir8a_code, nationality) values(413,466,'GUINES BISSAU')
Insert Into Nationality (id, ir8a_code, nationality) values(258,656,'GUYANESE')
Insert Into Nationality (id, ir8a_code, nationality) values(259,657,'HAITIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(414,712,'HEARD MCDONALD ISLND')
Insert Into Nationality (id, ir8a_code, nationality) values(260,658,'HONDURAN')
Insert Into Nationality (id, ir8a_code, nationality) values(261,332,'HONG KONG RESIDENT')
Insert Into Nationality (id, ir8a_code, nationality) values(262,205,'HUNGARIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(263,133,'ICELANDIC')
Insert Into Nationality (id, ir8a_code, nationality) values(264,354,'INDIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(265,303,'INDONESIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(266,373,'IRANIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(267,374,'IRAQI')
Insert Into Nationality (id, ir8a_code, nationality) values(268,106,'IRISH')
Insert Into Nationality (id, ir8a_code, nationality) values(415,672,'ISLE OF MAN')
Insert Into Nationality (id, ir8a_code, nationality) values(269,375,'ISRAELI')
Insert Into Nationality (id, ir8a_code, nationality) values(270,107,'ITALIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(271,422,'IVORIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(272,659,'JAMAICAN')
Insert Into Nationality (id, ir8a_code, nationality) values(273,331,'JAPANESE')
Insert Into Nationality (id, ir8a_code, nationality) values(274,376,'JORDANIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(275,221,'KAZAKHSTAN')
Insert Into Nationality (id, ir8a_code, nationality) values(276,423,'KENYAN')
Insert Into Nationality (id, ir8a_code, nationality) values(416,219,'KIRGHIZ')
Insert Into Nationality (id, ir8a_code, nationality) values(277,725,'KIRIBATI')
Insert Into Nationality (id, ir8a_code, nationality) values(278,377,'KUWAITI')
Insert Into Nationality (id, ir8a_code, nationality) values(417,990,'KYRGHIS')
Insert Into Nationality (id, ir8a_code, nationality) values(418,894,'KYRGYZSTAN')
Insert Into Nationality (id, ir8a_code, nationality) values(279,313,'LAOTIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(280,214,'LATVIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(281,378,'LEBANESE')
Insert Into Nationality (id, ir8a_code, nationality) values(282,467,'LESOTHO')
Insert Into Nationality (id, ir8a_code, nationality) values(283,424,'LIBERIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(284,403,'LIBYAN')
Insert Into Nationality (id, ir8a_code, nationality) values(285,138,'LIECHTENSTEINER')
Insert Into Nationality (id, ir8a_code, nationality) values(286,215,'LITHUANIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(287,108,'LUXEMBOURG')
Insert Into Nationality (id, ir8a_code, nationality) values(419,335,'MACAO')
Insert Into Nationality (id, ir8a_code, nationality) values(288,210,'MACEDONIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(289,425,'MALAGASY CITIZEN')
Insert Into Nationality (id, ir8a_code, nationality) values(290,468,'MALAWIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(291,304,'MALAYSIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(292,355,'MALDIVIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(293,469,'MALIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(294,155,'MALTESE')
Insert Into Nationality (id, ir8a_code, nationality) values(295,891,'MARSHALL ISLANDS MH')
Insert Into Nationality (id, ir8a_code, nationality) values(420,735,'MARSHELLES')
Insert Into Nationality (id, ir8a_code, nationality) values(421,661,'MARTINIQUE')
Insert Into Nationality (id, ir8a_code, nationality) values(296,470,'MAURITANIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(297,426,'MAURITIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(298,606,'MEXICAN')
Insert Into Nationality (id, ir8a_code, nationality) values(422,736,'MICRONESIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(423,892,'MOLDAVIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(424,222,'MOLDOVIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(299,338,'MONGOLIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(300,662,'MONTSERRATIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(301,143,'MOROCCAN, MONACO')
Insert Into Nationality (id, ir8a_code, nationality) values(302,404,'MOROCCAN, MOROCCO')
Insert Into Nationality (id, ir8a_code, nationality) values(303,427,'MOZAMBIQUEAN')
Insert Into Nationality (id, ir8a_code, nationality) values(304,311,'MYANMAR')
Insert Into Nationality (id, ir8a_code, nationality) values(305,471,'NAMIBIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(306,703,'NAURUAN')
Insert Into Nationality (id, ir8a_code, nationality) values(307,356,'NEPALESE')
Insert Into Nationality (id, ir8a_code, nationality) values(425,109,'NETHERLANDS')
Insert Into Nationality (id, ir8a_code, nationality) values(426,704,'NEW CALEDONIA')
Insert Into Nationality (id, ir8a_code, nationality) values(309,705,'NEW ZEALANDER')
Insert Into Nationality (id, ir8a_code, nationality) values(310,660,'NICARAGUAN')
Insert Into Nationality (id, ir8a_code, nationality) values(311,472,'NIGERIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(312,428,'NIGERIEN')
Insert Into Nationality (id, ir8a_code, nationality) values(427,726,'NIUE ISLAND')
Insert Into Nationality (id, ir8a_code, nationality) values(428,997,'NON-SINGAPORE CITIZEN')
Insert Into Nationality (id, ir8a_code, nationality) values(429,713,'NORFOLK ISLAND')
Insert Into Nationality (id, ir8a_code, nationality) values(313,337,'NORTH KOREAN')
Insert Into Nationality (id, ir8a_code, nationality) values(430,734,'NORTHERN MARIANA ISL')
Insert Into Nationality (id, ir8a_code, nationality) values(314,134,'NORWEGIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(431,699,'OC CTRL STH AMERICA')
Insert Into Nationality (id, ir8a_code, nationality) values(432,499,'OC IN OTHER AFRICA')
Insert Into Nationality (id, ir8a_code, nationality) values(433,319,'OC IN S E ASIA')
Insert Into Nationality (id, ir8a_code, nationality) values(434,509,'OC NORTH AMERICA')
Insert Into Nationality (id, ir8a_code, nationality) values(435,799,'OC OCEANIA')
Insert Into Nationality (id, ir8a_code, nationality) values(315,379,'OMANI')
Insert Into Nationality (id, ir8a_code, nationality) values(316,999,'OTHERS')
Insert Into Nationality (id, ir8a_code, nationality) values(436,998,'PACIFIC IS TRUST T')
Insert Into Nationality (id, ir8a_code, nationality) values(317,357,'PAKISTANI')
Insert Into Nationality (id, ir8a_code, nationality) values(437,737,'PALAU')
Insert Into Nationality (id, ir8a_code, nationality) values(438,890,'PALAUAN')
Insert Into Nationality (id, ir8a_code, nationality) values(318,386,'PALESTANIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(319,624,'PANAMANIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(320,706,'PAPUAN')
Insert Into Nationality (id, ir8a_code, nationality) values(321,607,'PARAGUAYAN')
Insert Into Nationality (id, ir8a_code, nationality) values(322,608,'PERUVIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(323,305,'PHILIPPINES')
Insert Into Nationality (id, ir8a_code, nationality) values(439,727,'PITCAIRN')
Insert Into Nationality (id, ir8a_code, nationality) values(324,206,'POLISH')
Insert Into Nationality (id, ir8a_code, nationality) values(325,111,'PORTUGUESE')
Insert Into Nationality (id, ir8a_code, nationality) values(327,502,'PUERTO RICAN')
Insert Into Nationality (id, ir8a_code, nationality) values(328,380,'QATARI')
Insert Into Nationality (id, ir8a_code, nationality) values(440,429,'REUNION')
Insert Into Nationality (id, ir8a_code, nationality) values(329,207,'ROMANIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(330,223,'RUSSIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(331,473,'RWANDAN')
Insert Into Nationality (id, ir8a_code, nationality) values(441,663,'SAINT KITTS NEVIS')
Insert Into Nationality (id, ir8a_code, nationality) values(333,650,'SALVADOREAN')
Insert Into Nationality (id, ir8a_code, nationality) values(334,707,'SAMOAN')
Insert Into Nationality (id, ir8a_code, nationality) values(442,144,'SAN MARINO')
Insert Into Nationality (id, ir8a_code, nationality) values(443,888,'SAO TOME & PRINCI.')
Insert Into Nationality (id, ir8a_code, nationality) values(444,474,'SAO TOME PRINCI')
Insert Into Nationality (id, ir8a_code, nationality) values(335,381,'SAUDI ARABIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(336,475,'SENEGALESE')
Insert Into Nationality (id, ir8a_code, nationality) values(338,476,'SEYCHELLOIS')
Insert Into Nationality (id, ir8a_code, nationality) values(339,477,'SIERRA LEONEAN')
Insert Into Nationality (id, ir8a_code, nationality) values(340,300,'SINGAPORE P.R.')
Insert Into Nationality (id, ir8a_code, nationality) values(341,301,'SINGAPOREAN')
Insert Into Nationality (id, ir8a_code, nationality) values(445,233,'SLOVENIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(342,235,'SLOVENIAN(FORMERLY KNOWN AS YOUGOSLAVIAN)')
Insert Into Nationality (id, ir8a_code, nationality) values(446,728,'SOLOMON ISLANDS')
Insert Into Nationality (id, ir8a_code, nationality) values(343,409,'SOMALIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(344,478,'SOUTH AFRICAN')
Insert Into Nationality (id, ir8a_code, nationality) values(345,333,'SOUTH KOREAN')
Insert Into Nationality (id, ir8a_code, nationality) values(346,112,'SPANISH')
Insert Into Nationality (id, ir8a_code, nationality) values(347,358,'SRI LANKAN')
Insert Into Nationality (id, ir8a_code, nationality) values(447,484,'ST HELENA')
Insert Into Nationality (id, ir8a_code, nationality) values(448,739,'ST KITTS & NEVIS')
Insert Into Nationality (id, ir8a_code, nationality) values(449,664,'ST LUCIA')
Insert Into Nationality (id, ir8a_code, nationality) values(450,505,'ST PIERRE MIQUELON')
Insert Into Nationality (id, ir8a_code, nationality) values(451,665,'ST VINCENT')
Insert Into Nationality (id, ir8a_code, nationality) values(452,893,'ST. LUCIA')
Insert Into Nationality (id, ir8a_code, nationality) values(453,885,'ST. VINCENT')
Insert Into Nationality (id, ir8a_code, nationality) values(348,405,'SUDANESE')
Insert Into Nationality (id, ir8a_code, nationality) values(349,666,'SURINAMESE')
Insert Into Nationality (id, ir8a_code, nationality) values(454,135,'SVALBARD JAN MAYEN')
Insert Into Nationality (id, ir8a_code, nationality) values(350,480,'SWAZI')
Insert Into Nationality (id, ir8a_code, nationality) values(351,136,'SWEDISH')
Insert Into Nationality (id, ir8a_code, nationality) values(352,137,'SWISS')
Insert Into Nationality (id, ir8a_code, nationality) values(353,382,'SYRIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(455,224,'TADZHIK')
Insert Into Nationality (id, ir8a_code, nationality) values(354,334,'TAIWANESE')
Insert Into Nationality (id, ir8a_code, nationality) values(456,992,'TAJIKISTANI')
Insert Into Nationality (id, ir8a_code, nationality) values(355,430,'TANZANIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(356,306,'THAI')
Insert Into Nationality (id, ir8a_code, nationality) values(457,307,'TIMORENSE')
Insert Into Nationality (id, ir8a_code, nationality) values(357,481,'TOGOLESE')
Insert Into Nationality (id, ir8a_code, nationality) values(458,729,'TOKELAU ISLANDS')
Insert Into Nationality (id, ir8a_code, nationality) values(358,730,'TONGAN')
Insert Into Nationality (id, ir8a_code, nationality) values(359,667,'TRINIDADIAN, TOBAGAN')
Insert Into Nationality (id, ir8a_code, nationality) values(360,406,'TUNISIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(361,152,'TURKISH')
Insert Into Nationality (id, ir8a_code, nationality) values(459,225,'TURKMEN')
Insert Into Nationality (id, ir8a_code, nationality) values(460,668,'TURKS AND CAICOS IS')
Insert Into Nationality (id, ir8a_code, nationality) values(461,731,'TUVALU')
Insert Into Nationality (id, ir8a_code, nationality) values(462,504,'U S MINOR ISLANDS')
Insert Into Nationality (id, ir8a_code, nationality) values(362,431,'UGANDAN')
Insert Into Nationality (id, ir8a_code, nationality) values(363,212,'UKRAINE')
Insert Into Nationality (id, ir8a_code, nationality) values(364,383,'UNITED ARAB EMIRATES')
Insert Into Nationality (id, ir8a_code, nationality) values(463,889,'UNKNOWN')
Insert Into Nationality (id, ir8a_code, nationality) values(464,993,'UPPER VOLTA')
Insert Into Nationality (id, ir8a_code, nationality) values(365,609,'URUGUAYAN')
Insert Into Nationality (id, ir8a_code, nationality) values(465,226,'UZBEK')
Insert Into Nationality (id, ir8a_code, nationality) values(466,732,'VANUATU')
Insert Into Nationality (id, ir8a_code, nationality) values(467,145,'VATICAN CITY STATE')
Insert Into Nationality (id, ir8a_code, nationality) values(366,610,'VENEZUELAN')
Insert Into Nationality (id, ir8a_code, nationality) values(367,314,'VIETNAMESE')
Insert Into Nationality (id, ir8a_code, nationality) values(368,671,'VIRGIN ISLANDERS, BRITISH VIRGIN ISLANDS')
Insert Into Nationality (id, ir8a_code, nationality) values(369,669,'VIRGIN ISLANDERS, VIRGIN ISLANDS (U.S.)')
Insert Into Nationality (id, ir8a_code, nationality) values(468,733,'WALLIS AND FUTUNA')
Insert Into Nationality (id, ir8a_code, nationality) values(469,479,'WESTERN SAHARA')
Insert Into Nationality (id, ir8a_code, nationality) values(370,384,'YEMENI')
Insert Into Nationality (id, ir8a_code, nationality) values(371,385,'YEMENIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(372,209,'YUGOSLAVIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(373,482,'ZAIREAN')
Insert Into Nationality (id, ir8a_code, nationality) values(374,432,'ZAMBIAN')
Insert Into Nationality (id, ir8a_code, nationality) values(375,483,'ZIMBABWEAN')
Set Identity_Insert Nationality Off
ALTER TABLE [Nationality] ADD CONSTRAINT PK_Nationality PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
End

set @count = 0
Select @count=COUNT(ID) from country where UPPER([Country])  = 'SINGAPORE'
if (@count = 0)
Begin
Set Identity_Insert Country On
Insert Into Country (id, ir8a_code, country) values(1,301,'SINGAPORE')
Insert Into Country (id, ir8a_code, country) values(2,351,'AFGHANISTAN')
Insert Into Country (id, ir8a_code, country) values(3,201,'ALBANIA')
Insert Into Country (id, ir8a_code, country) values(4,401,'ALGERIA')
Insert Into Country (id, ir8a_code, country) values(5,451,'ANGOLA')
Insert Into Country (id, ir8a_code, country) values(6,null,'Antarctica')
Insert Into Country (id, ir8a_code, country) values(7,601,'ARGENTINA')
Insert Into Country (id, ir8a_code, country) values(8,217,'ARMENIA')
Insert Into Country (id, ir8a_code, country) values(9,625,'ARUBA')
Insert Into Country (id, ir8a_code, country) values(10,701,'AUSTRALIA')
Insert Into Country (id, ir8a_code, country) values(11,131,'AUSTRIA')
Insert Into Country (id, ir8a_code, country) values(12,218,'AZERBAIJAN')
Insert Into Country (id, ir8a_code, country) values(13,642,'BAHAMAS ISLAND')
Insert Into Country (id, ir8a_code, country) values(14,371,'BAHRAIN')
Insert Into Country (id, ir8a_code, country) values(15,352,'BANGLADESH')
Insert Into Country (id, ir8a_code, country) values(16,211,'BELARUS')
Insert Into Country (id, ir8a_code, country) values(17,101,'BELGIUM')
Insert Into Country (id, ir8a_code, country) values(18,644,'BELIZE')
Insert Into Country (id, ir8a_code, country) values(19,645,'BERMUDA')
Insert Into Country (id, ir8a_code, country) values(20,646,'BOLIVIA')
Insert Into Country (id, ir8a_code, country) values(21,null,'Bosnia Herzogovina')
Insert Into Country (id, ir8a_code, country) values(22,453,'BOTSWANA')
Insert Into Country (id, ir8a_code, country) values(23,602,'BRAZIL')
Insert Into Country (id, ir8a_code, country) values(24,202,'BULGARIA')
Insert Into Country (id, ir8a_code, country) values(25,455,'BURUNDI')
Insert Into Country (id, ir8a_code, country) values(26,312,'CAMBODIA')
Insert Into Country (id, ir8a_code, country) values(27,456,'CAMEROON UNITED REP')
Insert Into Country (id, ir8a_code, country) values(28,501,'CANADA')
Insert Into Country (id, ir8a_code, country) values(29,647,'CAYMAN ISLANDS')
Insert Into Country (id, ir8a_code, country) values(30,458,'CENTRAL AFRICAN REP')
Insert Into Country (id, ir8a_code, country) values(31,459,'CHAD')
Insert Into Country (id, ir8a_code, country) values(32,603,'CHILE')
Insert Into Country (id, ir8a_code, country) values(33,336,'PEO REP OF CHINA')
Insert Into Country (id, ir8a_code, country) values(34,604,'COLOMBIA')
Insert Into Country (id, ir8a_code, country) values(35,461,'CONGO')
Insert Into Country (id, ir8a_code, country) values(36,648,'COSTA RICA')
Insert Into Country (id, ir8a_code, country) values(37,232,'CROATIA')
Insert Into Country (id, ir8a_code, country) values(38,621,'CUBA')
Insert Into Country (id, ir8a_code, country) values(39,372,'CYPRUS')
Insert Into Country (id, ir8a_code, country) values(40,234,'CZECH REPUBLIC')
Insert Into Country (id, ir8a_code, country) values(41,102,'DENMARK')
Insert Into Country (id, ir8a_code, country) values(42,649,'DOMINICA')
Insert Into Country (id, ir8a_code, country) values(43,622,'DOMINICAN REPUBLIC')
Insert Into Country (id, ir8a_code, country) values(44,605,'ECUADOR')
Insert Into Country (id, ir8a_code, country) values(45,402,'EGYPT')
Insert Into Country (id, ir8a_code, country) values(46,650,'EL SALVADOR')
Insert Into Country (id, ir8a_code, country) values(47,213,'ESTONIA')
Insert Into Country (id, ir8a_code, country) values(48,408,'ETHIOPIA')
Insert Into Country (id, ir8a_code, country) values(49,132,'FINLAND')
Insert Into Country (id, ir8a_code, country) values(50,103,'FRANCE')
Insert Into Country (id, ir8a_code, country) values(51,463,'GABON')
Insert Into Country (id, ir8a_code, country) values(52,464,'GAMBIA')
Insert Into Country (id, ir8a_code, country) values(53,216,'GEORGIA')
Insert Into Country (id, ir8a_code, country) values(54,104,'GERMANY')
Insert Into Country (id, ir8a_code, country) values(55,421,'GHANA')
Insert Into Country (id, ir8a_code, country) values(56,154,'GIBRALTAR')
Insert Into Country (id, ir8a_code, country) values(57,105,'GREECE')
Insert Into Country (id, ir8a_code, country) values(58,142,'GREENLAND')
Insert Into Country (id, ir8a_code, country) values(59,655,'GUATEMALA')
Insert Into Country (id, ir8a_code, country) values(60,657,'HAITI')
Insert Into Country (id, ir8a_code, country) values(61,658,'HONDURAS')
Insert Into Country (id, ir8a_code, country) values(62,332,'HONG KONG')
Insert Into Country (id, ir8a_code, country) values(63,205,'HUNGARY')
Insert Into Country (id, ir8a_code, country) values(64,133,'ICELAND')
Insert Into Country (id, ir8a_code, country) values(65,354,'INDIA')
Insert Into Country (id, ir8a_code, country) values(66,303,'INDONESIA')
Insert Into Country (id, ir8a_code, country) values(67,373,'ISLAMIC REP OF IRAN')
Insert Into Country (id, ir8a_code, country) values(68,374,'IRAQ')
Insert Into Country (id, ir8a_code, country) values(69,106,'IRELAND')
Insert Into Country (id, ir8a_code, country) values(70,375,'ISRAEL')
Insert Into Country (id, ir8a_code, country) values(71,107,'ITALY')
Insert Into Country (id, ir8a_code, country) values(72,659,'JAMAICA')
Insert Into Country (id, ir8a_code, country) values(73,331,'JAPAN')
Insert Into Country (id, ir8a_code, country) values(74,376,'JORDAN')
Insert Into Country (id, ir8a_code, country) values(75,221,'KAZAKHSTAN')
Insert Into Country (id, ir8a_code, country) values(76,423,'KENYA')
Insert Into Country (id, ir8a_code, country) values(77,377,'KUWAIT')
Insert Into Country (id, ir8a_code, country) values(78,214,'LATVIA')
Insert Into Country (id, ir8a_code, country) values(79,378,'LEBANON')
Insert Into Country (id, ir8a_code, country) values(80,424,'LIBERIA')
Insert Into Country (id, ir8a_code, country) values(81,403,'LIBYA A JAMAHIRIYA')
Insert Into Country (id, ir8a_code, country) values(82,138,'LIECHSTENSTEIN')
Insert Into Country (id, ir8a_code, country) values(83,215,'LITHUANIA')
Insert Into Country (id, ir8a_code, country) values(84,108,'LUXEMBOURG')
Insert Into Country (id, ir8a_code, country) values(85,335,'MACAU')
Insert Into Country (id, ir8a_code, country) values(86,null,'Macedonia')
Insert Into Country (id, ir8a_code, country) values(87,425,'MADAGASCAR')
Insert Into Country (id, ir8a_code, country) values(88,304,'MALAYSIA')
Insert Into Country (id, ir8a_code, country) values(89,155,'MALTA')
Insert Into Country (id, ir8a_code, country) values(90,606,'MEXICO')
Insert Into Country (id, ir8a_code, country) values(91,736,'MICRONESIA')
Insert Into Country (id, ir8a_code, country) values(92,222,'MOLDOVA')
Insert Into Country (id, ir8a_code, country) values(93,143,'MONACO')
Insert Into Country (id, ir8a_code, country) values(94,338,'MONGOLIAN PEOPLE REP')
Insert Into Country (id, ir8a_code, country) values(95,662,'MONTSERRAT')
Insert Into Country (id, ir8a_code, country) values(96,404,'MOROCCO')
Insert Into Country (id, ir8a_code, country) values(97,427,'MOZAMBIQUE')
Insert Into Country (id, ir8a_code, country) values(98,356,'NEPAL')
Insert Into Country (id, ir8a_code, country) values(99,109,'NETHERLANDS')
Insert Into Country (id, ir8a_code, country) values(100,704,'NEW CALEDONIA')
Insert Into Country (id, ir8a_code, country) values(101,705,'NEW ZEALAND')
Insert Into Country (id, ir8a_code, country) values(102,660,'NICARAGUA')
Insert Into Country (id, ir8a_code, country) values(103,472,'NIGER')
Insert Into Country (id, ir8a_code, country) values(104,428,'NIGERIA')
Insert Into Country (id, ir8a_code, country) values(105,337,'KOREA NORTH DEM PEO')
Insert Into Country (id, ir8a_code, country) values(106,134,'NORWAY')
Insert Into Country (id, ir8a_code, country) values(107,379,'OMAN')
Insert Into Country (id, ir8a_code, country) values(108,999,'Other')
Insert Into Country (id, ir8a_code, country) values(109,357,'PAKISTAN')
Insert Into Country (id, ir8a_code, country) values(110,737,'PALAU')
Insert Into Country (id, ir8a_code, country) values(111,624,'PANAMA')
Insert Into Country (id, ir8a_code, country) values(112,607,'PARAGUAY')
Insert Into Country (id, ir8a_code, country) values(113,608,'PERU')
Insert Into Country (id, ir8a_code, country) values(114,305,'PHILIPPINES')
Insert Into Country (id, ir8a_code, country) values(115,206,'POLAND')
Insert Into Country (id, ir8a_code, country) values(116,111,'PORTUGAL')
Insert Into Country (id, ir8a_code, country) values(117,380,'QATAR')
Insert Into Country (id, ir8a_code, country) values(118,207,'ROMANIA')
Insert Into Country (id, ir8a_code, country) values(119,223,'RUSSIA')
Insert Into Country (id, ir8a_code, country) values(120,473,'RWANDA')
Insert Into Country (id, ir8a_code, country) values(121,707,'SAMOA')
Insert Into Country (id, ir8a_code, country) values(122,381,'SAUDI ARABIA')
Insert Into Country (id, ir8a_code, country) values(123,475,'SENEGAL')
Insert Into Country (id, ir8a_code, country) values(124,477,'SIERRA LEONE')
Insert Into Country (id, ir8a_code, country) values(125,235,'SLOVAK REPUBLIC')
Insert Into Country (id, ir8a_code, country) values(126,233,'SLOVENIA')
Insert Into Country (id, ir8a_code, country) values(127,null,'Somalia')
Insert Into Country (id, ir8a_code, country) values(128,478,'SOUTH AFRICA')
Insert Into Country (id, ir8a_code, country) values(129,333,'REP OF KOREA')
Insert Into Country (id, ir8a_code, country) values(130,112,'SPAIN')
Insert Into Country (id, ir8a_code, country) values(131,358,'SRI LANKA')
Insert Into Country (id, ir8a_code, country) values(132,405,'SUDAN')
Insert Into Country (id, ir8a_code, country) values(133,480,'SWAZILAND')
Insert Into Country (id, ir8a_code, country) values(134,136,'SWEDEN')
Insert Into Country (id, ir8a_code, country) values(135,137,'SWITZERLAND')
Insert Into Country (id, ir8a_code, country) values(136,382,'SYRIAN ARAB REP')
Insert Into Country (id, ir8a_code, country) values(137,334,'TAIWAN')
Insert Into Country (id, ir8a_code, country) values(138,224,'TAJIKISTAN')
Insert Into Country (id, ir8a_code, country) values(139,430,'TANZANIA')
Insert Into Country (id, ir8a_code, country) values(140,306,'THAILAND')
Insert Into Country (id, ir8a_code, country) values(141,667,'TRINIDAD AND TOBAGO')
Insert Into Country (id, ir8a_code, country) values(142,406,'TUNISIA')
Insert Into Country (id, ir8a_code, country) values(143,152,'TURKEY')
Insert Into Country (id, ir8a_code, country) values(144,225,'TURKMENISTAN')
Insert Into Country (id, ir8a_code, country) values(145,431,'UGANDA')
Insert Into Country (id, ir8a_code, country) values(146,212,'UKRAINE')
Insert Into Country (id, ir8a_code, country) values(147,383,'UNITED ARAB EMIRATES')
Insert Into Country (id, ir8a_code, country) values(148,110,'UNITED KINGDOM')
Insert Into Country (id, ir8a_code, country) values(149,609,'URUGUAY')
Insert Into Country (id, ir8a_code, country) values(150,503,'UNITED STATES')
Insert Into Country (id, ir8a_code, country) values(151,226,'UZBEKISTAN')
Insert Into Country (id, ir8a_code, country) values(152,610,'VENEZUELA')
Insert Into Country (id, ir8a_code, country) values(153,314,'VIETNAM SOC REP OF')
Insert Into Country (id, ir8a_code, country) values(154,671,'BRITISH VIRGIN ISLND')
Insert Into Country (id, ir8a_code, country) values(155,479,'WESTERN SAHARA')
Insert Into Country (id, ir8a_code, country) values(156,384,'YEMEN')
Insert Into Country (id, ir8a_code, country) values(157,209,'YUGOSLAVIA')
Insert Into Country (id, ir8a_code, country) values(158,null,'Zaire')
Insert Into Country (id, ir8a_code, country) values(159,432,'ZAMBIA')
Insert Into Country (id, ir8a_code, country) values(160,483,'ZIMBABWE')
Insert Into Country (id, ir8a_code, country) values(162,999,'OTHERS')
Insert Into Country (id, ir8a_code, country) values(163,721,'AMERICAN SAMOA')
Insert Into Country (id, ir8a_code, country) values(164,153,'ANDORRA')
Insert Into Country (id, ir8a_code, country) values(165,670,'ANGUILLA')
Insert Into Country (id, ir8a_code, country) values(166,641,'ANTIGUA AND BARBUDA')
Insert Into Country (id, ir8a_code, country) values(167,643,'BARBADOS')
Insert Into Country (id, ir8a_code, country) values(168,452,'BENIN')
Insert Into Country (id, ir8a_code, country) values(169,353,'BHUTAN')
Insert Into Country (id, ir8a_code, country) values(170,139,'BOUVET ISLAND')
Insert Into Country (id, ir8a_code, country) values(171,708,'BRITISH INDIAN OCEAN')
Insert Into Country (id, ir8a_code, country) values(172,302,'BRUNEI')
Insert Into Country (id, ir8a_code, country) values(173,454,'BURKINA FASO')
Insert Into Country (id, ir8a_code, country) values(174,457,'CAPE VERDE')
Insert Into Country (id, ir8a_code, country) values(175,709,'CHRISTMAS ISLANDS')
Insert Into Country (id, ir8a_code, country) values(176,710,'COCOS KEELING ISLAND')
Insert Into Country (id, ir8a_code, country) values(177,460,'COMOROS ISLAND')
Insert Into Country (id, ir8a_code, country) values(178,722,'COOK ISLAND')
Insert Into Country (id, ir8a_code, country) values(179,422,'COTE DIVOIRE')
Insert Into Country (id, ir8a_code, country) values(180,203,'CZECHOSLOVAKIA')
Insert Into Country (id, ir8a_code, country) values(181,409,'DEM REP OF SOMALI')
Insert Into Country (id, ir8a_code, country) values(182,385,'DEMOCRATIC YEMEN')
Insert Into Country (id, ir8a_code, country) values(183,407,'DJIBOUTI')
Insert Into Country (id, ir8a_code, country) values(184,307,'EAST TIMOR')
Insert Into Country (id, ir8a_code, country) values(185,462,'EQUATORIAL GUINEA')
Insert Into Country (id, ir8a_code, country) values(186,410,'ERITREA')
Insert Into Country (id, ir8a_code, country) values(187,141,'FAEROE ISLANDS')
Insert Into Country (id, ir8a_code, country) values(188,651,'FALKLAND IS')
Insert Into Country (id, ir8a_code, country) values(189,702,'FIJI')
Insert Into Country (id, ir8a_code, country) values(190,652,'FRENCH GUIANA')
Insert Into Country (id, ir8a_code, country) values(191,723,'FRENCH POLYNESIA')
Insert Into Country (id, ir8a_code, country) values(192,711,'FRENCH SOUTHERN TERR')
Insert Into Country (id, ir8a_code, country) values(193,653,'GRENADA')
Insert Into Country (id, ir8a_code, country) values(194,654,'GUADELOUPE')
Insert Into Country (id, ir8a_code, country) values(195,724,'GUAM')
Insert Into Country (id, ir8a_code, country) values(196,465,'GUINEA')
Insert Into Country (id, ir8a_code, country) values(197,466,'GUINES BISSAU')
Insert Into Country (id, ir8a_code, country) values(198,656,'GUYANA')
Insert Into Country (id, ir8a_code, country) values(199,712,'HEARD MCDONALD ISLND')
Insert Into Country (id, ir8a_code, country) values(200,672,'ISLE OF MAN')
Insert Into Country (id, ir8a_code, country) values(201,725,'KIRIBATI')
Insert Into Country (id, ir8a_code, country) values(202,219,'KYRGYZSTAN')
Insert Into Country (id, ir8a_code, country) values(203,313,'LAOS PEO DEM REP')
Insert Into Country (id, ir8a_code, country) values(204,467,'LESOTHO')
Insert Into Country (id, ir8a_code, country) values(205,468,'MALAWI')
Insert Into Country (id, ir8a_code, country) values(206,355,'MALDIVES')
Insert Into Country (id, ir8a_code, country) values(207,469,'MALI')
Insert Into Country (id, ir8a_code, country) values(208,735,'MARSHALL ISLANDS')
Insert Into Country (id, ir8a_code, country) values(209,661,'MARTINIQUE')
Insert Into Country (id, ir8a_code, country) values(210,470,'MAURITANIA')
Insert Into Country (id, ir8a_code, country) values(211,426,'MAURITIUS')
Insert Into Country (id, ir8a_code, country) values(212,311,'MYANMAR')
Insert Into Country (id, ir8a_code, country) values(213,471,'NAMIBIA')
Insert Into Country (id, ir8a_code, country) values(214,703,'NAURU')
Insert Into Country (id, ir8a_code, country) values(215,623,'NETHERLANDS ANTILLES')
Insert Into Country (id, ir8a_code, country) values(216,732,'NEW HERBRIDES')
Insert Into Country (id, ir8a_code, country) values(217,726,'NIUE')
Insert Into Country (id, ir8a_code, country) values(218,713,'NORFOLK ISLAND')
Insert Into Country (id, ir8a_code, country) values(219,734,'NORTHERN MARIANA ISLANDS')
Insert Into Country (id, ir8a_code, country) values(220,499,'O C IN OTHER AFRICA')
Insert Into Country (id, ir8a_code, country) values(221,319,'O C IN S E ASIA')
Insert Into Country (id, ir8a_code, country) values(222,699,'OC CTRL STH AMERICA')
Insert Into Country (id, ir8a_code, country) values(223,509,'OC NORTH AMERICA')
Insert Into Country (id, ir8a_code, country) values(224,799,'OC OCEANIA')
Insert Into Country (id, ir8a_code, country) values(225,386,'PALESTINE')
Insert Into Country (id, ir8a_code, country) values(226,706,'PAPUA NEW GUINEA')
Insert Into Country (id, ir8a_code, country) values(227,727,'PITCAIRN')
Insert Into Country (id, ir8a_code, country) values(228,502,'PUERTO RICO')
Insert Into Country (id, ir8a_code, country) values(229,482,'REP OF ZAIRE')
Insert Into Country (id, ir8a_code, country) values(230,429,'REUNION ISLAND')
Insert Into Country (id, ir8a_code, country) values(231,663,'SAINT KITTS NEVIS')
Insert Into Country (id, ir8a_code, country) values(232,664,'SAINT LUCIA')
Insert Into Country (id, ir8a_code, country) values(233,665,'SAINT VINCENT')
Insert Into Country (id, ir8a_code, country) values(234,144,'SAN MARINO')
Insert Into Country (id, ir8a_code, country) values(235,474,'SAO TOME PRINCIPE')
Insert Into Country (id, ir8a_code, country) values(236,476,'SEYCHELLES')
Insert Into Country (id, ir8a_code, country) values(237,728,'SOLOMON ISLANDS')
Insert Into Country (id, ir8a_code, country) values(238,484,'ST HELENA')
Insert Into Country (id, ir8a_code, country) values(239,505,'ST PIERRE MIQUELON')
Insert Into Country (id, ir8a_code, country) values(240,666,'SURINAM')
Insert Into Country (id, ir8a_code, country) values(241,135,'SVALBARD JAN MAYEN')
Insert Into Country (id, ir8a_code, country) values(242,481,'TOGO')
Insert Into Country (id, ir8a_code, country) values(243,729,'TOKELAU')
Insert Into Country (id, ir8a_code, country) values(244,730,'TONGA')
Insert Into Country (id, ir8a_code, country) values(245,668,'TURKS AND CAICOS IS')
Insert Into Country (id, ir8a_code, country) values(246,731,'TUVALU')
Insert Into Country (id, ir8a_code, country) values(247,504,'U S MINOR ISLANDS')
Insert Into Country (id, ir8a_code, country) values(248,145,'VATICAN CITY STATE')
Insert Into Country (id, ir8a_code, country) values(249,669,'VIRGIN ISLANDS US')
Insert Into Country (id, ir8a_code, country) values(250,733,'WALLIS AND FUTUNA')
Set Identity_Insert Country Off
ALTER TABLE [Country] ADD CONSTRAINT PK_Country PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]

End



set @count = 0
Select @count=COUNT(ID) from bank where UPPER([DESC]) LIKE   UPPER('%FAR EASTERN BANK%')
if (@count = 0)
Begin 
	insert into bank ([desc], code, bank_code) values ('FAR EASTERN BANK', '0010', '7199' )
End
if (@count > 0)
Begin 
	uPDATE bank SET code='0010', bank_code='7199' WHERE UPPER([DESC]) LIKE   UPPER('%FAR EASTERN BANK%')
End


set @count = 0
Select @count=COUNT(ID) from bank where UPPER([DESC]) LIKE   UPPER('%mizUHO%')
if (@count = 0)
Begin 
	insert into bank ([desc], code, bank_code) values ('Mizuho', '0007', '7621' )
End
if (@count > 0)
Begin 
	uPDATE bank SET code='0007', bank_code='7621' WHERE UPPER([DESC]) LIKE   UPPER('%mizUHO%')
End


SET @count = 0
Select @count = count(id) from bank where bank_code = '7010'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('ABN AMRO BANK', '7010')
End


set @count = 0
Select @count = count(id) from bank where bank_code = '7454'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('AMERICAN EXPRESS BANK LTD', '7454')
End

set @count = 0
Select @count = count(id) from bank where bank_code = '7047'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('BANGKOK BANK PUBLIC CO LTD', '7047')
End



set @count = 0
Select @count = count(id) from bank where bank_code = '7065'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('BANK OF AMERICA', '7065')
End

set @count = 0
Select @count = count(id) from bank where bank_code = '7083'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('BANK OF CHINA LIMITED', '7083')
End

set @count = 0
Select @count = count(id) from bank where bank_code = '7108'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('BANK OF INDIA', '7108')
End


set @count = 0
Select @count = count(id) from bank where bank_code = '7117'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('BANK OF SINGAPORE LTD', '7117')
End


set @count = 0
Select @count = count(id) from bank where bank_code = '7418'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('BNP PARIBAS', '7418')
End


set @count = 0
Select @count = count(id) from bank where bank_code = '7135'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('CALYON', '7135')
End

set @count = 0
Select @count = count(id) from bank where bank_code = '7986'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('CIMB BANK BERHAD', '7986')
End

set @count = 0
Select @count = count(id) from bank where bank_code = '7214'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('CITIBANK', '7214')
End


set @count = 0
Select @count = count(id) from bank where bank_code = '7737'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('DNB NOR BANK ASA', '7737')
End

set @count = 0
Select @count = count(id) from bank where bank_code = '7393'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('DRESDNER BANK AG', '7393')
End


set @count = 0
Select @count = count(id) from bank where bank_code = '7764'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('FIRST COMMERCIAL BANK', '7764')
End



set @count = 0
Select @count = count(id) from bank where bank_code = '7287'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('HL BANK', '7287')
End



set @count = 0
Select @count = count(id) from bank where bank_code = '7241'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('INDIAN BANK', '7241')
End


set @count = 0
Select @count = count(id) from bank where bank_code = '7250'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('INDIAN OVERSEAS BANK', '7250')
End


set @count = 0
Select @count = count(id) from bank where bank_code = '8450'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('INTESA SANPAOLO S.P.A', '8450')
End


set @count = 0
Select @count = count(id) from bank where bank_code = '7153'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('JPMORGAN CHASE BANK', '7153')
End



set @count = 0
Select @count = count(id) from bank where bank_code = '7490'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('KOREA EXCHANGE BANK', '7490')
End



set @count = 0
Select @count = count(id) from bank where bank_code = '7302'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('MALAYAN BANKING BERHAD', '7302')
End



set @count = 0
Select @count = count(id) from bank where bank_code = '8518'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('NORDEA BANK FINLAND PLC', '8518')
End


set @count = 0
Select @count = count(id) from bank where bank_code = '7056'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('PT BANK NEGARA INDONESIA (PERSERO) TBK', '7056')
End

set @count = 0
Select @count = count(id) from bank where bank_code = '7366'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('RHB BANK BERHAD', '7366')
End



set @count = 0
Select @count = count(id) from bank where bank_code = '8527'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('SKANDINAVISKA ENSKILDA BANKEN', '8527')
End



set @count = 0
Select @count = count(id) from bank where bank_code = '7852'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('SOCIETE GENERALE', '7852')
End


set @count = 0
Select @count = count(id) from bank where bank_code = '7791'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('STATE BANK OF INDIA', '7791')
End


set @count = 0
Select @count = count(id) from bank where bank_code = '7472'
if (@count = 0)
Begin
	insert into bank ([desc], bank_code, code) values ('SUMITOMO MITSUI BANKING CORPORATION', '7472', '0008')
End


set @count = 0
Select @count = count(id) from bank where bank_code = '8493'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('SVENSKA HANDELSBANKEN AB (PUBL)', '8493')
End


set @count = 0
Select @count = count(id) from bank where bank_code = '7092'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('THE BANK OF EAST ASIA LTD', '7092')
End


set @count = 0
Select @count = count(id) from bank where bank_code = '7126'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('THE BANK OF TOKYO-MITSUBISHI UFJ LTD', '7126')
End


set @count = 0
Select @count = count(id) from bank where bank_code = '7232'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('THE HONG KONG AND SHANGHAI BANKING CORPORATION LTD', '7232')
End



set @count = 0
Select @count = count(id) from bank where bank_code = '7357'
if (@count = 0)
Begin 
	insert into bank ([desc], bank_code) values ('UCO BANK', '7357')
End



set @count = 0
Select @count = count(id) from dropdowns where dropdown = 'Banks'
if (@count = 0)
Begin 
	insert into dropdowns(dropdown,Navigate) values('Banks','../Management/Banks.aspx')
End



--------set @count = 0
--------DELETE FROM GroupRightsAllocated
--------Select @count=COUNT(groupid) from GroupRightsAllocated where UPPER([groupid])  = 1
--------if (@count = 0)
--------Begin
--------	Insert Into GroupRightsAllocated 
--------	Select UG.GroupID,UR.RightID From UserRights UR
--------	CROSS JOIN  UserGroups UG WHERE UG.GroupName='Super Admin'
--------End
--------
--------set @count = 0
--------DELETE FROM GroupRights
--------Select @count=COUNT(groupid) from GroupRights where UPPER([groupid])  = 1
--------if (@count = 0)
--------Begin
--------	Insert Into GroupRights 
--------	Select UG.GroupID,UR.RightID From UserRights UR
--------	CROSS JOIN  UserGroups UG WHERE UG.GroupName='Super Admin'
--------End
--------
--------set @count = 0
--------Select @count=Count(ID) From ProductVersion
--------if (@count > 0)
--------Begin
--------	Insert into GroupRights Select  * From GroupRightsTemp
--------END
--Public Holid

SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '01/01/2009'
if (@count = 0)
Begin 
	insert public_holidays values('01/01/2009','New Year Day',-1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '01/26/2009'
if (@count = 0)
Begin 
	insert public_holidays values('01/26/2009','Chinese New Year',-1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '01/27/2009'
if (@count = 0)
Begin 
	insert public_holidays values('01/27/2009','Chinese New Year',-1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '04/10/2009'
if (@count = 0)
Begin 
	insert public_holidays values('04/10/2009','Good Friday',-1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '05/01/2009'
if (@count = 0)
Begin 
	insert public_holidays values('05/01/2009','Labour Day',-1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '05/09/2009'
if (@count = 0)
Begin 
	insert public_holidays values('05/09/2009','Vesak Day',-1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '08/09/2009'
if (@count = 0)
Begin 
	insert public_holidays values('08/09/2009','National Day',-1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '09/20/2009'
if (@count = 0)
Begin 
	insert public_holidays values('09/20/2009','Hari Raya Puasa',-1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '11/15/2009'
if (@count = 0)
Begin 
	insert public_holidays values('11/15/2009','Deepavali',-1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '11/27/2009'
if (@count = 0)
Begin 
	insert public_holidays values('11/27/2009','Hari Raya Haji',-1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '12/25/2009'
if (@count = 0)
Begin 
	insert public_holidays values('12/25/2009','Christmas Day',-1)
End

SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '01/01/2010'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2010-01-01 00:00:00.000','New Year Day', -1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '02/15/2010'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2010-02-15 00:00:00.000','Chinese New Year', -1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '02/16/2010'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2010-02-16 00:00:00.000','Chinese New Year', -1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '04/02/2010'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2010-04-02 00:00:00.000','Good Friday', -1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '05/01/2010'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2010-05-01 00:00:00.000','Labour Day', -1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '05/28/2010'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2010-05-28 00:00:00.000','Vesak Day', -1)
END
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '08/09/2010'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2010-08-09 00:00:00.000','National Day', -1)
END
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '09/10/2010'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2010-09-10 00:00:00.000','Hari Raya Puasa', -1)
END
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '11/05/2010'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2010-11-05 00:00:00.000','Deepavali', -1)
END
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '11/17/2010'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2010-11-17 00:00:00.000','Hari Raya Haji', -1)
END
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '12/25/2010'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2010-12-25 00:00:00.000','Christmas Day', -1)
END

--2011

SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '01/01/2011'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2011-01-01 00:00:00.000','New Year Day', -1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '02/03/2011'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2011-02-03 00:00:00.000','Chinese New Year', -1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '02/04/2011'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2011-02-04 00:00:00.000','Chinese New Year', -1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '04/22/2011'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2011-04-22 00:00:00.000','Good Friday', -1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '05/02/2011'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2011-05-02 00:00:00.000','Labour Day', -1)
End
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '05/17/2011'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2011-05-17 00:00:00.000','Vesak Day', -1)
END
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '08/09/2011'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2011-08-09 00:00:00.000','National Day', -1)
END
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '08/30/2011'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2011-08-30 00:00:00.000','Hari Raya Puasa', -1)
END
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '10/26/2011'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2011-10-26 00:00:00.000','Deepavali', -1)
END
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '11/07/2011'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2011-11-07 00:00:00.000','Hari Raya Haji', -1)
END
SET @count = 0
Select @count = count(id) from public_holidays where holiday_date = '12/26/2011'
if (@count = 0)
Begin 
	INSERT INTO dbo.public_holidays ( holiday_date, holiday_name, companyid ) VALUES  ( '2011-12-26 00:00:00.000','Christmas Day', -1)
END



	Delete From CPF_Calcs Where CPFCalculate>=2

	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (1,  35,  1, 1, 4, 5, 2)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (36, 50,  1, 1, 4, 5, 2)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (51, 55,  1, 1, 4, 5, 2)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (56, 60,  1, 1, 4, 5, 2)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (61, 65,  1, 1, 3.5,5, 2)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (66, 100, 1, 1, 3.5,5, 2)

	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (1,  35,  2, 1, 9, 15, 2)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (36, 50,  2, 1, 9, 15, 2)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (51, 55,  2, 1, 9, 15, 2)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (56, 60,  2, 1, 6, 12.5, 2)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (61, 65,  2, 1, 7.5,5, 2)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (66, 100, 2, 1, 3.5,5, 2)

	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (1,  35,  3, 1, 15, 20, 2)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (36, 50,  3, 1, 15, 20, 2)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (51, 55,  3, 1, 11, 18, 2)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (56, 60,  3, 1, 8,  12.5, 2)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (61, 65,  3, 1, 5.5, 7.5, 2)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (66, 100, 3, 1, 5.5, 5, 2)


	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (1,  35,  1, 1, 4, 5, 3)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (36, 50,  1, 1, 4, 5, 3)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (51, 55,  1, 1, 4, 5, 3)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (56, 60,  1, 1, 4, 5, 3)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (61, 65,  1, 1, 3.5,5, 3)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (66, 100, 1, 1, 3.5,5, 3)

	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (1,  35,  2, 1, 9, 15, 3)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (36, 50,  2, 1, 9, 15, 3)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (51, 55,  2, 1, 9, 15, 3)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (56, 60,  2, 1, 6, 12.5, 3)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (61, 65,  2, 1, 7.5,5, 3)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (66, 100, 2, 1, 3.5,5, 3)

	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (1,  35,  3, 1, 15.5, 20, 3)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (36, 50,  3, 1, 15.5, 20, 3)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (51, 55,  3, 1, 11.5, 18, 3)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (56, 60,  3, 1, 8.5,  12.5, 3)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (61, 65,  3, 1, 6, 7.5, 3)
	Insert Into Cpf_Calcs (age_from, age_to, pr_year, emp_group, employer_cpf, employee_cpf, CPFCalculate) values
						  (66, 100, 3, 1, 6, 5, 3)

	Delete From CPFAmount_Detail Where CPFCalculate >=2

	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (1,1,'0','@SAL * .04',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (1,2,'0','(@SAL - 50 )* .0265',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (1,3,'0','(@SAL - 50 )* .0265',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (1,4,'0','(@SAL - 50 )* .0265',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (1,5,'0','(@SAL - 50 )* .0232',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (1,6,'0','(@SAL - 50 )* .0232',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (2,1,'(@SAL - 500) * 0.12','@SAL * .04',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (2,2,'(@SAL - 500) * 0.12','(@SAL - 50 )* .0265',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (2,3,'(@SAL - 500) * 0.12','(@SAL - 50 )* .0265',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (2,4,'(@SAL - 500) * 0.12','(@SAL - 50 )* .0265',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (2,5,'(@SAL - 500) * 0.12','(@SAL - 50 )* .0232',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (2,6,'(@SAL - 500) * 0.12','(@SAL - 50 )* .0232',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (3,1,'((@SAL - 750) * 0.06)+30','@SAL * .04',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (3,2,'((@SAL - 750) * 0.06)+30','((@SAL -750)  * 0.0541) + 18.60',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (3,3,'((@SAL - 750) * 0.06)+30','((@SAL -750)  * 0.0498) + 18.60',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (3,4,'((@SAL - 750) * 0.06)+30','((@SAL -750)  * 0.044)  + 18.60',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (3,5,'((@SAL - 750) * 0.06)+30','((@SAL -750) * 0.0291 )+ 16.275',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (3,6,'((@SAL - 750) * 0.06)+30','((@SAL -750) * 0.0291 )+ 16.275',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (4,1,'((@SAL - 750) * 0.06)+30','@SAL * .04',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (4,2,'((@SAL - 750) * 0.06)+30','((@SAL -1200) * 0.0568)+ 42.96',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (4,3,'((@SAL - 750) * 0.06)+30','((@SAL -1200) * 0.0632)+ 41.04',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (4,4,'((@SAL - 750) * 0.06)+30','((@SAL -1200) * 0.072 )+ 38.40',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (4,5,'((@SAL - 750) * 0.06)+30','((@SAL -1200) * 0.077 )+ 29.40',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (4,6,'((@SAL - 750) * 0.06)+30','((@SAL -1200) * 0.077 )+ 29.40',2)

	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (5,1,'0','@SAL * 0.09',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (5,2,'0','(@SAL - 50) * 0.0597',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (5,3,'0','(@SAL - 50) * 0.0597',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (5,4,'0','(@SAL - 50) * 0.0398',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (5,5,'0','(@SAL - 50) * 0.0232',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (5,6,'0','(@SAL - 50) * 0.0232',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (6,1,'(@SAL - 500) * 0.36','@SAL * 0.09',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (6,2,'(@SAL - 500) * 0.36','(@SAL - 50) * 0.0597',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (6,3,'(@SAL - 500) * 0.36','(@SAL - 50) * 0.0597',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (6,4,'(@SAL - 500) * 0.3','(@SAL - 50) * 0.0398',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (6,5,'(@SAL - 500) * 0.18','(@SAL - 50) * 0.0232',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (6,6,'(@SAL - 500) * 0.12','(@SAL - 50) * 0.0232',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (7,1,'((@SAL - 750) * 0.18)+90','@SAL * 0.09',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (7,2,'((@SAL - 750) * 0.18)+90','((@SAL -750) * 0.1219 )+ 41.85',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (7,3,'((@SAL - 750) * 0.18)+90',' ((@SAL -750) * 0.1126)+ 41.85',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (7,4,'((@SAL - 750) * 0.15)+75','((@SAL -750) * 0.066 )+27.90',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (7,5,'((@SAL - 750) * 0.09)+45','((@SAL -750) * 0.0291 )+ 16.275',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (7,6,'((@SAL - 750) * 0.06)+30','((@SAL -750) * 0.0291 )+ 16.275',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (8,1,'((@SAL - 750) * 0.18)+90','@SAL * 0.09',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (8,2,'((@SAL - 750) * 0.18)+90','((@SAL -1200) * 0.1276)+96.72',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (8,3,'((@SAL - 750) * 0.18)+90','((@SAL -1200) * 0.1416)+ 92.52',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (8,4,'((@SAL - 750) * 0.15)+75','((@SAL -1200) * 0.108)  + 57.60',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (8,5,'((@SAL - 750) * 0.09)+45','((@SAL -1200) * 0.077 )+29.40',2)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (8,6,'((@SAL - 750) * 0.06)+30','((@SAL -1200) * 0.077 )+29.40',2)


	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (9,1,'0','@SAL * 0.15',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (9,2,'0','(@SAL - 50) * 0.0997',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (9,3,'0','(@SAL - 50) * 0.0730',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (9,4,'0','(@SAL - 50) * 0.0531',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (9,5,'0','(@SAL - 50) * 0.0365',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (9,6,'0','(@SAL - 50) * 0.0365',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (10,1,'(@SAL - 500) * 0.48','@SAL * 0.15',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (10,2,'(@SAL - 500) * 0.48','(@SAL - 50) * 0.0997',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (10,3,'(@SAL - 500) * 0.432','(@SAL - 50) * 0.0730',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (10,4,'(@SAL - 500) * 0.3','(@SAL - 50) * 0.0531',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (10,5,'(@SAL - 500) * 0.18','(@SAL - 50) * 0.0365',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (10,6,'(@SAL - 500) * 0.12','(@SAL - 50) * 0.0365',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (11,1,'((@SAL - 750) * 0.24)+120','@SAL * 0.15',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (11,2,'((@SAL - 750) * 0.24)+120','((@SAL -750)  * 0.2035) + 69.825',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (11,3,'((@SAL - 750) * 0.216)+108','((@SAL -750) * 0.1378) + 51.15',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (11,4,'((@SAL - 750) * 0.15)+75','((@SAL -750) * 0.088 ) + 37.20',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (11,5,'((@SAL - 750) * 0.09)+45','((@SAL -750) * 0.0458) + 25.575',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (11,6,'((@SAL - 750) * 0.06)+30','((@SAL -750) * 0.0458) + 25.575',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (12,1,'((@SAL - 750) * 0.24)+120','@SAL * 0.15',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (12,2,'((@SAL - 750) * 0.24)+120','((@SAL -1200) * 0.212)+ 161.4',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (12,3,'((@SAL - 750) * 0.216)+108','((@SAL -1200) * 0.1728)+ 113.16',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (12,4,'((@SAL - 750) * 0.15)+75','((@SAL -1200) * 0.144)+76.8',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (12,5,'((@SAL - 750) * 0.09)+45','((@SAL -1200) * 0.121)+46.2',2)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (12,6,'((@SAL - 750) * 0.06)+30','((@SAL -1200) * 0.121)+46.2',2)

	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (1,1,'0','@SAL * .04',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (1,2,'0','(@SAL - 50 )* .0265',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (1,3,'0','(@SAL - 50 )* .0265',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (1,4,'0','(@SAL - 50 )* .0265',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (1,5,'0','(@SAL - 50 )* .0232',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (1,6,'0','(@SAL - 50 )* .0232',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (2,1,'(@SAL - 500) * 0.12','@SAL * .04',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (2,2,'(@SAL - 500) * 0.12','(@SAL - 50 )* .0265',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (2,3,'(@SAL - 500) * 0.12','(@SAL - 50 )* .0265',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (2,4,'(@SAL - 500) * 0.12','(@SAL - 50 )* .0265',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (2,5,'(@SAL - 500) * 0.12','(@SAL - 50 )* .0232',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (2,6,'(@SAL - 500) * 0.12','(@SAL - 50 )* .0232',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (3,1,'((@SAL - 750) * 0.06)+30','@SAL * .04',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (3,2,'((@SAL - 750) * 0.06)+30','((@SAL -750)  * 0.0541) + 18.60',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (3,3,'((@SAL - 750) * 0.06)+30','((@SAL -750)  * 0.0498) + 18.60',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (3,4,'((@SAL - 750) * 0.06)+30','((@SAL -750)  * 0.044)  + 18.60',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (3,5,'((@SAL - 750) * 0.06)+30','((@SAL -750) * 0.0291 )+ 16.275',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (3,6,'((@SAL - 750) * 0.06)+30','((@SAL -750) * 0.0291 )+ 16.275',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (4,1,'((@SAL - 750) * 0.06)+30','@SAL * .04',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (4,2,'((@SAL - 750) * 0.06)+30','((@SAL -1200) * 0.0568)+ 42.96',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (4,3,'((@SAL - 750) * 0.06)+30','((@SAL -1200) * 0.0632)+ 41.04',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (4,4,'((@SAL - 750) * 0.06)+30','((@SAL -1200) * 0.072 )+ 38.40',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (4,5,'((@SAL - 750) * 0.06)+30','((@SAL -1200) * 0.077 )+ 29.40',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (4,6,'((@SAL - 750) * 0.06)+30','((@SAL -1200) * 0.077 )+ 29.40',3)

	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (5,1,'0','@SAL * 0.09',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (5,2,'0','(@SAL - 50) * 0.0597',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (5,3,'0','(@SAL - 50) * 0.0597',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (5,4,'0','(@SAL - 50) * 0.0398',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (5,5,'0','(@SAL - 50) * 0.0232',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (5,6,'0','(@SAL - 50) * 0.0232',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (6,1,'(@SAL - 500) * 0.36','@SAL * 0.09',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (6,2,'(@SAL - 500) * 0.36','(@SAL - 50) * 0.0597',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (6,3,'(@SAL - 500) * 0.36','(@SAL - 50) * 0.0597',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (6,4,'(@SAL - 500) * 0.3','(@SAL - 50) * 0.0398',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (6,5,'(@SAL - 500) * 0.18','(@SAL - 50) * 0.0232',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (6,6,'(@SAL - 500) * 0.12','(@SAL - 50) * 0.0232',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (7,1,'((@SAL - 750) * 0.18)+90','@SAL * 0.09',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (7,2,'((@SAL - 750) * 0.18)+90','((@SAL -750) * 0.1219 )+ 41.85',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (7,3,'((@SAL - 750) * 0.18)+90',' ((@SAL -750) * 0.1126)+ 41.85',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (7,4,'((@SAL - 750) * 0.15)+75','((@SAL -750) * 0.066 )+27.90',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (7,5,'((@SAL - 750) * 0.09)+45','((@SAL -750) * 0.0291 )+ 16.275',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (7,6,'((@SAL - 750) * 0.06)+30','((@SAL -750) * 0.0291 )+ 16.275',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (8,1,'((@SAL - 750) * 0.18)+90','@SAL * 0.09',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (8,2,'((@SAL - 750) * 0.18)+90','((@SAL -1200) * 0.1276)+96.72',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (8,3,'((@SAL - 750) * 0.18)+90','((@SAL -1200) * 0.1416)+ 92.52',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (8,4,'((@SAL - 750) * 0.15)+75','((@SAL -1200) * 0.108)  + 57.60',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (8,5,'((@SAL - 750) * 0.09)+45','((@SAL -1200) * 0.077 )+29.40',3)
	 Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (8,6,'((@SAL - 750) * 0.06)+30','((@SAL -1200) * 0.077 )+29.40',3)

	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (9,1,'0','@SAL * 0.155',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (9,2,'0','(@SAL - 50) * 0.1030',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (9,3,'0','(@SAL - 50) * 0.0763',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (9,4,'0','(@SAL - 50) * 0.0564',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (9,5,'0','(@SAL - 50) * 0.0398',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (9,6,'0','(@SAL - 50) * 0.0398',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (10,1,'(@SAL - 500) * 0.48','@SAL * 0.155',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (10,2,'(@SAL - 500) * 0.48','(@SAL - 50) * 0.1030',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (10,3,'(@SAL - 500) * 0.432','(@SAL - 50) * 0.0763',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (10,4,'(@SAL - 500) * 0.3','(@SAL - 50) * 0.0564',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (10,5,'(@SAL - 500) * 0.18','(@SAL - 50) * 0.0398',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (10,6,'(@SAL - 500) * 0.12','(@SAL - 50) * 0.0398',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (11,1,'((@SAL - 750) * 0.24)+120','@SAL * 0.155',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (11,2,'((@SAL - 750) * 0.24)+120','((@SAL -750) * 0.2103)+72.15',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (11,3,'((@SAL - 750) * 0.216)+108','((@SAL -750) * 0.1441)+53.475',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (11,4,'((@SAL - 750) * 0.15)+75','((@SAL -750) * 0.0935)+39.525',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (11,5,'((@SAL - 750) * 0.09)+45','((@SAL -750) * 0.05 )+27.9',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (11,6,'((@SAL - 750) * 0.06)+30','((@SAL -750) * 0.05)+27.9',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (12,1,'((@SAL - 750) * 0.24)+120','@SAL * 0.155',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (12,2,'((@SAL - 750) * 0.24)+120','((@SAL -1200) * 0.219)+ 166.8',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (12,3,'((@SAL - 750) * 0.216)+108','((@SAL -1200) * 0.1806)+ 118.32',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (12,4,'((@SAL - 750) * 0.15)+75','((@SAL -1200) * 0.153)+81.6',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (12,5,'((@SAL - 750) * 0.09)+45','((@SAL -1200) * 0.132)+50.4',3)
	Insert Into CPFAmount_detail (hdr_id, age_group, employee_cpf, employer_cpf, CPFCalculate) values (12,6,'((@SAL - 750) * 0.06)+30','((@SAL -1200) * 0.132 )+50.4',3)


GO
declare @companyid int
declare sampcursor1 cursor for select [company_id] from company
open sampcursor1
fetch next from sampcursor1 into @companyid
while @@fetch_status = 0
begin

	BEGIN                    
		DECLARE @exists INT                    
		SET @exists = 0                    
		SELECT @exists = COUNT(company_id) FROM additions_types where company_id = @companyid And Optionselection = 'Variable'
	 IF @exists <= 0                    
	 BEGIN                    
		Insert into additions_types  
		([desc],cpf,company_id,type_of_wage,optionselection,Code,FormulaType)                              
		values ('V1','No',@companyid,'O','Variable','V1',1)  
		Insert into additions_types  
		([desc],cpf,company_id,type_of_wage,optionselection,Code,FormulaType)                              
		values ('V2','No',@companyid,'O','Variable','V2',1)  
		Insert into additions_types  
		([desc],cpf,company_id,type_of_wage,optionselection,Code,FormulaType)                              
		values ('V3','No',@companyid,'O','Variable','V3',1)  
		Insert into additions_types  
		([desc],cpf,company_id,type_of_wage,optionselection,Code,FormulaType)                              
		values ('V4','No',@companyid,'O','Variable','V4',1)  
		--print @companyid
	 END                     
	END                     
fetch next from sampcursor1 into @companyid
end
close sampcursor1
deallocate sampcursor1
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
SET ANSI_PADDING OFF

DECLARE @StartDate datetime, @EndDate datetime
--yyyy-mm-dd
SELECT @StartDate = '2007-01-01', @EndDate = '2020-12-31'
DECLARE @LoopVar int, @LoopEnd int    
SELECT @LoopEnd = DateDiff(dd, @StartDate, @EndDate), @LoopVar = 0
WHILE @LoopVar <= @LoopEnd
BEGIN  
INSERT INTO [DateInYear] (DateInYear)  
SELECT DateAdd(dd,@LoopVar,@StartDate)  
SET @LoopVar = @LoopVar + 1
END
GO

/****** Object:  Table [dbo].[Country]    Script Date: 01/09/2009 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
Insert Into CPFFiles (Company_ID, ROC, [Type], Srno, CSN ) 
(Select Company_ID, CPF_Ref_No, 'PTE', '01', (CPF_Ref_No+'-PTE'+'-01')  From Company Where CPF_Ref_No Not In (Select Distinct ROC From CPFFiles))
SET ANSI_PADDING OFF
Go


/****** Object:  Table [dbo].[Country]    Script Date: 01/09/2009 11:07:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
	Insert Into EmployeeCertificate
	Select Emp_code, 6, ic_pp_number,wp_application_date, wp_issue_Date , wp_exp_date,null,null,null from employee EM
		where (ic_pp_number is not null And (wp_application_date is not null or wp_exp_Date is not null))
		And ic_pp_number not in (Select CertificateNumber From EmployeeCertificate EC Where EM.Emp_Code = EC.Emp_ID)
	Insert Into EmployeeCertificate
	Select Emp_code, 1, Insurance_Number, null, null, Insurance_Expiry,null,null,null  from employee  EM  
		Where ((len(Insurance_Number)  > 0 And Insurance_Number is not null) Or Insurance_Expiry is not null)
		And Insurance_Number not in (Select CertificateNumber From EmployeeCertificate EC Where EM.Emp_Code = EC.Emp_ID)
	Insert Into EmployeeCertificate
	Select Emp_code, 2, CSOC_Number, null, null, CSOC_Expiry, null,null,null  from employee   EM
		Where ((len(CSOC_Number)  > 0 And CSOC_Number is not null) Or CSOC_Expiry is not null) 
		And CSOC_Number not in (Select CertificateNumber From EmployeeCertificate EC Where EM.Emp_Code = EC.Emp_ID)
	Insert Into EmployeeCertificate
	Select Emp_code, 3, Passport, null, pp_issue_date, Passport_Expiry, null,null,null  from employee   EM
		Where ((len(Passport)>0 And Passport is not null) Or pp_issue_date is not null Or Passport_Expiry is not null)
		And Passport not in (Select CertificateNumber From EmployeeCertificate EC Where EM.Emp_Code = EC.Emp_ID)
Go



GO
	DROP TABLE GroupRightsTemp
GO
Insert Into Prorated_Leaves
Select Company_ID, ID,1, 0 From Emp_Group Where ID Not In (Select Distinct Group_ID From Prorated_Leaves Where Year_Of_Service=1)

Insert Into Prorated_Leaves
Select Company_ID, ID,2, 0 From Emp_Group Where ID Not In (Select Distinct Group_ID From Prorated_Leaves Where Year_Of_Service=2)

Insert Into Prorated_Leaves
Select Company_ID, ID,3, 0 From Emp_Group Where ID Not In (Select Distinct Group_ID From Prorated_Leaves Where Year_Of_Service=3)

Insert Into Prorated_Leaves
Select Company_ID, ID,4, 0 From Emp_Group Where ID Not In (Select Distinct Group_ID From Prorated_Leaves Where Year_Of_Service=4)

Insert Into Prorated_Leaves
Select Company_ID, ID,5, 0 From Emp_Group Where ID Not In (Select Distinct Group_ID From Prorated_Leaves Where Year_Of_Service=5)

Insert Into Prorated_Leaves
Select Company_ID, ID,6, 0 From Emp_Group Where ID Not In (Select Distinct Group_ID From Prorated_Leaves Where Year_Of_Service=6)

Insert Into Prorated_Leaves
Select Company_ID, ID,7, 0 From Emp_Group Where ID Not In (Select Distinct Group_ID From Prorated_Leaves Where Year_Of_Service=7)

Insert Into Prorated_Leaves
Select Company_ID, ID,8, 0 From Emp_Group Where ID Not In (Select Distinct Group_ID From Prorated_Leaves Where Year_Of_Service=8)

Insert Into Prorated_Leaves
Select Company_ID, ID,9, 0 From Emp_Group Where ID Not In (Select Distinct Group_ID From Prorated_Leaves Where Year_Of_Service=9)

Insert Into Prorated_Leaves
Select Company_ID, ID,10, 0 From Emp_Group Where ID Not In (Select Distinct Group_ID From Prorated_Leaves Where Year_Of_Service=10)
GO





Delete From DaysInMonth Where [Year] >= 2011
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2011,1,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2011,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2011,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2011,4,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2011,5,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2011,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2011,7,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2011,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2011,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2011,10,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2011,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2011,12,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2012,1,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2012,2,29,4,4,21,23,25,29)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2012,3,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2012,4,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2012,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2012,6,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2012,7,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2012,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2012,9,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2012,10,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2012,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2012,12,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2013,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2013,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2013,3,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2013,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2013,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2013,6,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2013,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2013,8,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2013,9,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2013,10,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2013,11,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2013,12,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2014,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2014,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2014,3,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2014,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2014,5,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2014,6,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2014,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2014,8,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2014,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2014,10,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2014,11,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2014,12,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2015,1,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2015,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2015,3,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2015,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2015,5,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2015,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2015,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2015,8,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2015,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2015,10,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2015,11,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2015,12,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2016,1,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2016,2,29,4,4,21,23,25,29)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2016,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2016,4,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2016,5,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2016,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2016,7,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2016,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2016,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2016,10,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2016,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2016,12,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2017,1,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2017,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2017,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2017,4,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2017,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2017,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2017,7,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2017,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2017,9,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2017,10,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2017,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2017,12,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2018,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2018,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2018,3,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2018,4,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2018,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2018,6,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2018,7,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2018,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2018,9,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2018,10,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2018,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2018,12,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2019,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2019,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2019,3,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2019,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2019,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2019,6,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2019,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2019,8,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2019,9,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2019,10,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2019,11,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2019,12,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2020,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2020,2,29,4,5,20,22.5,25,29)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2020,3,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2020,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2020,5,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2020,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2020,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2020,8,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2020,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2020,10,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2020,11,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2020,12,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2021,1,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2021,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2021,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2021,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2021,5,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2021,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2021,7,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2021,8,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2021,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2021,10,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2021,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2021,12,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2022,1,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2022,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2022,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2022,4,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2022,5,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2022,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2022,7,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2022,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2022,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2022,10,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2022,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2022,12,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2023,1,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2023,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2023,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2023,4,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2023,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2023,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2023,7,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2023,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2023,9,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2023,10,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2023,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2023,12,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2024,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2024,2,29,4,4,21,23,25,29)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2024,3,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2024,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2024,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2024,6,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2024,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2024,8,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2024,9,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2024,10,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2024,11,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2024,12,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2025,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2025,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2025,3,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2025,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2025,5,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2025,6,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2025,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2025,8,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2025,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2025,10,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2025,11,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2025,12,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2026,1,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2026,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2026,3,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2026,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2026,5,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2026,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2026,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2026,8,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2026,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2026,10,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2026,11,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2026,12,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2027,1,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2027,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2027,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2027,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2027,5,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2027,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2027,7,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2027,8,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2027,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2027,10,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2027,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2027,12,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2028,1,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2028,2,29,4,4,21,23,25,29)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2028,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2028,4,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2028,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2028,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2028,7,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2028,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2028,9,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2028,10,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2028,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2028,12,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2029,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2029,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2029,3,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2029,4,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2029,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2029,6,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2029,7,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2029,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2029,9,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2029,10,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2029,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2029,12,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2030,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2030,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2030,3,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2030,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2030,5,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2030,6,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2030,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2030,8,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2030,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2030,10,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2030,11,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2030,12,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2031,1,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2031,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2031,3,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2031,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2031,5,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2031,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2031,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2031,8,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2031,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2031,10,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2031,11,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2031,12,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2032,1,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2032,2,29,4,4,21,23,25,29)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2032,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2032,4,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2032,5,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2032,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2032,7,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2032,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2032,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2032,10,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2032,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2032,12,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2033,1,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2033,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2033,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2033,4,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2033,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2033,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2033,7,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2033,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2033,9,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2033,10,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2033,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2033,12,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2034,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2034,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2034,3,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2034,4,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2034,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2034,6,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2034,7,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2034,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2034,9,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2034,10,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2034,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2034,12,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2035,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2035,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2035,3,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2035,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2035,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2035,6,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2035,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2035,8,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2035,9,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2035,10,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2035,11,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2035,12,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2036,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2036,2,29,4,5,20,22.5,25,29)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2036,3,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2036,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2036,5,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2036,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2036,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2036,8,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2036,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2036,10,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2036,11,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2036,12,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2037,1,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2037,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2037,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2037,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2037,5,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2037,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2037,7,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2037,8,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2037,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2037,10,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2037,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2037,12,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2038,1,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2038,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2038,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2038,4,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2038,5,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2038,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2038,7,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2038,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2038,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2038,10,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2038,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2038,12,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2039,1,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2039,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2039,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2039,4,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2039,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2039,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2039,7,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2039,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2039,9,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2039,10,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2039,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2039,12,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2040,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2040,2,29,4,4,21,23,25,29)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2040,3,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2040,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2040,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2040,6,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2040,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2040,8,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2040,9,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2040,10,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2040,11,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2040,12,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2041,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2041,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2041,3,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2041,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2041,5,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2041,6,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2041,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2041,8,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2041,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2041,10,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2041,11,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2041,12,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2042,1,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2042,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2042,3,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2042,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2042,5,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2042,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2042,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2042,8,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2042,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2042,10,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2042,11,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2042,12,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2043,1,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2043,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2043,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2043,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2043,5,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2043,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2043,7,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2043,8,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2043,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2043,10,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2043,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2043,12,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2044,1,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2044,2,29,4,4,21,23,25,29)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2044,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2044,4,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2044,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2044,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2044,7,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2044,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2044,9,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2044,10,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2044,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2044,12,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2045,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2045,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2045,3,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2045,4,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2045,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2045,6,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2045,7,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2045,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2045,9,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2045,10,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2045,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2045,12,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2046,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2046,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2046,3,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2046,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2046,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2046,6,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2046,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2046,8,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2046,9,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2046,10,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2046,11,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2046,12,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2047,1,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2047,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2047,3,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2047,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2047,5,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2047,6,30,5,4,21,23,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2047,7,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2047,8,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2047,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2047,10,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2047,11,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2047,12,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2048,1,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2048,2,29,5,4,20,22,24,29)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2048,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2048,4,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2048,5,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2048,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2048,7,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2048,8,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2048,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2048,10,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2048,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2048,12,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2049,1,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2049,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2049,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2049,4,30,4,5,21,23.5,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2049,5,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2049,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2049,7,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2049,8,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2049,9,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2049,10,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2049,11,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2049,12,31,4,5,22,24.5,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2050,1,31,5,4,22,24,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2050,2,28,4,4,20,22,24,28)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2050,3,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2050,4,30,5,5,20,22.5,25,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2050,5,31,4,4,23,25,27,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2050,6,30,4,4,22,24,26,30)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2050,7,31,5,5,21,23.5,26,31)
Insert Into DaysInMonth([year],[month],calendar_days,sundays,saturdays,days_week5,days_week512,days_week6,days_week7) Values (2050,8,31,4,4,23,25,27,31)


GO
if not exists(select * from Deductions_Types where [desc]='CDAC -A' And Company_ID=-1) Insert Into Deductions_Types values ('CDAC -A',-1, 'No','Yes', null)
if not exists(select * from Deductions_Types where [desc]='CDAC -M' And Company_ID=-1) Insert Into Deductions_Types values ('CDAC -M',-1, 'No','Yes', null)
if not exists(select * from Deductions_Types where [desc]='ECF  -A' And Company_ID=-1) Insert Into Deductions_Types values ('ECF  -A',-1, 'No','Yes', null)
if not exists(select * from Deductions_Types where [desc]='ECF  -M' And Company_ID=-1) Insert Into Deductions_Types values ('ECF  -M',-1, 'No','Yes', null)
if not exists(select * from Deductions_Types where [desc]='MBMF -A' And Company_ID=-1) Insert Into Deductions_Types values ('MBMF -A',-1, 'No','Yes', null)
if not exists(select * from Deductions_Types where [desc]='MBMF -M' And Company_ID=-1) Insert Into Deductions_Types values ('MBMF -M',-1, 'No','Yes', null)
if not exists(select * from Deductions_Types where [desc]='SINDA-A' And Company_ID=-1) Insert Into Deductions_Types values ('SINDA-A',-1, 'No','Yes', null)
if not exists(select * from Deductions_Types where [desc]='SINDA-M' And Company_ID=-1) Insert Into Deductions_Types values ('SINDA-M',-1, 'No','Yes', null)
GO
Select * Into #GroupRightsTemp From GroupRights Where GroupID In
(Select GroupID from UserGroups Where GroupName != 'Super Admin')
GO
DELETE FROM USERRIGHTS
Insert Into UserRights values(1,'View Reminders','Reminders','Reminders',0,null,1,null,null,'Reminder Module','Right to the main Reminder module',2)
Insert Into UserRights values(2,'View  Employee Leaves','Reminders','Reminders',0,null,2,1,null,'Employees on Leave Reminder','Right to view list of employees on leave',2)
Insert Into UserRights values(3,'View Pending Leaves','Reminders','Reminders',0,null,3,1,null,'Employees Requesting for Leave Reminder','Right to view list of employees requesting for leave ',2)
Insert Into UserRights values(4,'View WP Expiry','Reminders','Reminders',0,null,4,1,null,'Pass Expiring Reminder','Right to view list of employees whose pass is expiring',2)
Insert Into UserRights values(5,'View Passport Expiry','Reminders','Reminders',0,null,5,1,null,'Passport Expiring Reminder','Right to view list of employees whose passport is expiring',2)
Insert Into UserRights values(6,'View CSOC Expiry','Reminders','Reminders',0,null,6,1,null,'CSOC Expiring Reminder','Right to view list of employees whose csoc is expiring',2)
Insert Into UserRights values(7,'View Insurance Expiry','Reminders','Reminders',0,null,7,1,null,'Insurance Expiring Reminder','Right to view list of employees whose insurance is expiring',2)
Insert Into UserRights values(8,'View Birthday Dates','Reminders','Reminders',0,null,8,1,null,'Employees Birthday Reminder','Right to view list of employees birthday',2)
Insert Into UserRights values(9,'View Probation Expiry','Reminders','Reminders',0,null,9,1,null,'Probation Expiring Reminder','Right to view list of employees whose probation is expiring',2)
Insert Into UserRights values(10,'Other Certificate Expiry','Reminders','Reminders',0,null,10,1,null,'Other Certificates Expiring Reminder','Right to view list of employees whose other certificates are expiring',2)
Insert Into UserRights values(11,'Year Of Service','Reminders','Reminders',0,null,11,1,null,'Year of Service Reminder','Right to view list of employees  with year of service',2)

Insert Into UserRights values(12,'Employee Management','Employee','Employee',null,null,1,null,null,'Employee Module','Right to the main employee module',2)
Insert Into UserRights values(13,'View Employees','Employee','Employee',1,1,2,12,null,'View Employee','Right to view employee profile',2)
Insert Into UserRights values(14,'Add Employee','Employee','Employee',null,null,3,13,12,'Add Employee','Right to add new employee',2)
Insert Into UserRights values(15,'Edit Employee','Employee','Employee',null,null,4,13,12,'Edit Employee','Right to edit existing employee',2)
Insert Into UserRights values(17,'View Salary','Employee','Employee',null,null,6,13,12,'View Employee Salary','Right to view employee salary and other related details which otherwise are encrypted',2)
Insert Into UserRights values(18,'View Employee Groups','Employee','Employee Group',1,2,8,12,null,'View Employee Groups','Right to view employee group',2)
Insert Into UserRights values(19,'Manage Employee Groups','Employee','Employee Group',null,null,7,18,12,'Manage Employee Groups','Right to add, edit or delete employee group ',2)
Insert Into UserRights values(20,'Leave Management','Leave','Leave',null,null,1,null,null,'Leave Module','Right to the main leave module',2)
Insert Into UserRights values(21,'Leave Request','Leave','Leave',2,1,2,20,null,'Apply Leave','Right to apply/request leave for individual employee (leave types like annual, medical, etc)',2)
Insert Into UserRights values(22,'Apply Leaves for all','Leave','Leave',null,null,3,20,null,'Apply Leave For All','Right to apply/request leave for all employees (leave types like annual, medical, etc)',2)
Insert Into UserRights values(23,'View Applied Leaves','Leave','Leave',2,2,4,20,null,'Leave Status','Right to view leave status - approved and rejected leaves, remarks etc',2)
Insert Into UserRights values(24,'View Approved Leaves','Leave','Leave',2,3,5,20,null,'View Approved Leave','Right to view leave status - approved leaves, remarks etc',2)
Insert Into UserRights values(25,'View Rejected Leaves','Leave','Leave',2,4,6,20,null,'View Rejected Leave','Right to view leave status - approved and rejected leaves, remarks etc',2)
Insert Into UserRights values(26,'Approve and Reject Leaves','Leave','Leave',2,5,7,20,null,'Approve or Reject Leaves','Right to approve or reject applied leave of the employee by their supervisor',2)
Insert Into UserRights values(27,'Approve and Reject Leaves for all','Leave','Leave',null,null,8,20,null,'Approve or Reject Leaves  For All','Right to approve or reject applied leave of all employees',2)
Insert Into UserRights values(28,'Manage Leaves Allowed','Leave','Leave',2,6,9,20,null,'Manage Group leaves Allowed','Right to set company policy leaves for employee group',2)
Insert Into UserRights values(29,'View Leave Types','Leave','Leave',2,7,10,20,null,'Manage Leave Types','Right to add, edit or delete leave types, default  system defined leave types cannot be deleted or edited.',2)
Insert Into UserRights values(30,'Leave Transfer','Leave','Leave',2,8,11,20,null,'Manage Leaves transfer','Right to transfer leave for employee from one year to another',2)
Insert Into UserRights values(31,'View Public Holidays','Leave','Leave',2,9,12,20,null,'View Public / Company Holidays','Right to view public holidays / company holidays',2)
Insert Into UserRights values(32,'Manage Public Holidays','Leave','Leave',null,null,13,20,null,'Manage Public / Company Holidays','Right to add / edit public holidays / company holidays',2)
Insert Into UserRights values(33,'View Manage Leaves','Leave','Leave',2,10,14,20,null,'Manage leaves Additions or Deductios','Right to add or deduct leaves for employee',2)
Insert Into UserRights values(34,'Claims Management','Claims','Claims',null,null,1,null,null,'Claim Module','Right to the main claims module',2)
Insert Into UserRights values(35,'Apply Claim','Claims','Claims',3,1,2,34,null,'Apply Claim','Right to apply claim',2)
Insert Into UserRights values(36,'Apply Claim for all','Claims','Claims',null,null,3,34,null,'Apply Claim For All','Right to apply claim for all employees',2)
Insert Into UserRights values(37,'Claim Status','Claims','Claims',3,2,4,34,null,'Claim Status','Right to view applied claims status',2)
Insert Into UserRights values(38,'Approved Claims','Claims','Claims',3,3,5,34,null,'Approved Claims','Right to view approved claims',2)
Insert Into UserRights values(39,'Rejected Claims','Claims','Claims',3,4,6,34,null,'Rejected Claims','Right to view rejected claims',2)
Insert Into UserRights values(40,'Pending Approval for Claim','Claims','Claims',3,5,7,34,null,'Approve or Reject Claims','Right to approve and reject claims',2)
Insert Into UserRights values(41,'Claims Capping','Claims','Claims',3,5,7,34,null,'Claims Capping','Right to apply claims capping to employee',2)
Insert Into UserRights values(42,'Timesheet Management','Timesheet','Timesheet',null,null,1,null,1,'Timesheet Module','Right to the main Timesheet module ',1)
Insert Into UserRights values(43,'Roster','Timesheet','Timesheet',4,1,2,42,null,'Manage Roaster','Right to add, edit or delete roasters',1)
Insert Into UserRights values(44,'Roster Settings','Timesheet','Timesheet',4,2,3,42,null,'Manage Roster Settings','Right to add, edit or delete roasters settings',1)
Insert Into UserRights values(45,'Roster Assignment','Timesheet','Timesheet',4,3,4,42,null,'Manage Roster Assignment','Right to assign employees to roaster',1)
Insert Into UserRights values(46,'Automatic Timesheet','Timesheet','Timesheet',4,4,5,42,null,'Import Timesheet','Right to import timesheet from external source',1)
Insert Into UserRights values(47,'Manage Employee Timesheet','Timesheet','Timesheet',4,5,6,42,null,'Manual Timesheet - For Employee','Right to submit timesheet for individual employee',1)
Insert Into UserRights values(48,'Manage Project Timesheet','Timesheet','Timesheet',4,6,7,42,null,'Manual Timesheet - For Project','Right to submit timesheet for project (all employees under that project)',1)
Insert Into UserRights values(49,'Submit Timesheet for All','Timesheet','Timesheet',null,null,8,42,null,'Manual Timesheet For All','Right to submit timesheet for all',1)
Insert Into UserRights values(50,'Approve Timesheet','Timesheet','Timesheet',null,null,9,42,null,'Approve Timesheet','Right to approve timesheet',1)
Insert Into UserRights values(51,'Approve Timesheet for All','Timesheet','Timesheet',null,null,10,42,null,'Approve Timesheet For All','Right to approve timesheet for all',1)
Insert Into UserRights values(52,'Compare Timesheet','Timesheet','Timesheet',4,7,11,42,null,'Compare Timesheet ( Automatic & Manual)','Right to view compare timesheet',1)
Insert Into UserRights values(53,'Payroll Management','Payroll','Payroll',null,null,1,null,null,'Payroll Module','Right to the main payroll module',2)
Insert Into UserRights values(54,'View Additions','Payroll','Payroll',null,null,3,53,null,'View Payroll Additions','Right to view payroll additions',2)
Insert Into UserRights values(55,'Manage Payroll Additions','Payroll','Payroll',5,1,2,54,53,'Manage Payroll Additions','Right to manage (add, edit or delete) payroll additions',2)
Insert Into UserRights values(56,'View Deductions','Payroll','Payroll',null,null,5,53,null,'View Payroll Deductions','Right to view payroll deduction',2)
Insert Into UserRights values(57,'Manage Payroll Deductions','Payroll','Payroll',5,2,4,56,53,'Manage Payroll Deductions','Right to manage (add, edit or delete) payroll deduction',2)
Insert Into UserRights values(58,'View overtimepay','Payroll','Payroll',null,null,7,53,null,'View Payroll Overtime /  Variables','Right to view payroll overtime',2)
Insert Into UserRights values(59,'Manage Overtime Payroll','Payroll','Payroll',5,3,6,58,53,'Manage Payroll Overtime /  Variables','Right to manage (add, edit or delete) payroll overtime',2)
Insert Into UserRights values(60,'Generate or Submit Payroll','Payroll','Payroll',5,4,12,53,null,'Submit Payroll','Right to submit payroll for approval',2)
Insert Into UserRights values(61,'Approve or Reject Payroll','Payroll','Payroll',5,5,9,53,null,'Approve / Reject Payroll','Right to approve or reject submitted payroll',2)
Insert Into UserRights values(62,'View Generate Payroll','Payroll','Payroll',5,6,11,53,null,'Generate Payroll ','Right to generate approved payroll',2)
Insert Into UserRights values(63,'print payroll','Payroll','Payroll',5,7,14,53,null,'Print Payroll','Right to print generated payroll',2)
Insert Into UserRights values(64,'Unlock Payroll','Payroll','Payroll',5,8,15,53,null,'Unlock Payroll','Right to unlock approved or generated payroll',2)
Insert Into UserRights values(65,'Reports Management','Reports','Reports',null,null,1,null,null,'Reports Module','Right to the main reports module',2)
Insert Into UserRights values(66,'View CPF information','Reports','Reports',6,1,2,65,null,'CPF File Generation','Right to generate CPF file to be submitted to CPF Board',2)
Insert Into UserRights values(67,'View Giro information','Reports','Reports',6,2,3,65,null,'Bank Giro File Generation','Right to generate bank Giro file for salary transfer via bank',2)
Insert Into UserRights values(68,'View IRAS information','Reports','Reports',6,3,5,65,null,'IRAS Forms Generation','Right to generate IRAS forms - IR8A, IR8A (Appendix A), IR8A (Appendix B), IR8S, IR21',2)
Insert Into UserRights values(69,'View Reports','Reports','Reports',6,4,4,65,null,'View Reports','Right to view different types of reports - Reminders, payroll, leaves, Employee',2)
Insert Into UserRights values(70,'View Custom Reports','Reports','Reports',6,5,5,65,null,'View Custom Reports','Right to view custom report writer to create your own reports',2)
Insert Into UserRights values(71,'Manage IR8A information','Reports','IRAS Reports',null,null,6,68,65,'Manage IR8A information','Right to view, print or submit IR8A form',2)
Insert Into UserRights values(72,'Manage IR8A Appdx A Information','Reports','IRAS Reports',null,null,7,68,65,'Manage IR8A Appdx A Information','Right to view, print or submit IR8A Appendix A form',2)
Insert Into UserRights values(73,'Manage IR8A Appdx B Information','Reports','IRAS Reports',null,null,8,68,65,'Manage IR8A Appdx B Information','Right to view, print or submit IR8A Appendix b form',2)
Insert Into UserRights values(74,'Manage IR8S Information','Reports','IRAS Reports',null,null,9,68,65,'Manage IR8S Information','Right to view, print or submit IR8S form',2)
Insert Into UserRights values(75,'Manage IR21 information','Reports','IRAS Reports',null,null,10,68,65,'Manage IR21 information','Right to view, print or submit IR21 form',2)
Insert Into UserRights values(76,'View Pass Expiry Report','Reports','Reminder Reports',null,null,11,69,65,'View Pass Expiry Report','Right to view pass expiry report',2)
Insert Into UserRights values(77,'View Passport Expiry Report','Reports','Reminder Reports',null,null,12,69,65,'View Passport Expiry Report','Right to view passport expiry report',2)
Insert Into UserRights values(78,'View Insurance Expiry Report','Reports','Reminder Reports',null,null,13,69,65,'View Insurance Expiry Report','Right to view insurance expiry report',2)
Insert Into UserRights values(79,'View CSOC Expiry Report','Reports','Reminder Reports',null,null,14,69,65,'View CSOC Expiry Report','Right to view csoc expiry report',2)
Insert Into UserRights values(80,'View Levy Report','Reports','Reminder Reports',null,null,15,69,65,'View Levy Report','Right to view levy report',2)
Insert Into UserRights values(81,'View Payroll Details Report','Reports','Payroll Reports',null,null,16,69,65,'View Payroll Details Report','Right to view payroll details report',2)
Insert Into UserRights values(82,'View Payroll Summary Report','Reports','Payroll Reports',null,null,17,69,65,'View Payroll Summary Report','Right to view payroll summary report',2)
Insert Into UserRights values(83,'View Payroll Summary(detail) Report','Reports','Payroll Reports',null,null,18,69,65,'View Payroll Summary(detail) Report','Right to view payroll summary(detail) report',2)
Insert Into UserRights values(84,'View CPF Report','Reports','Payroll Reports',null,null,19,69,65,'View CPF Report','Right to view cpf report',2)
Insert Into UserRights values(85,'View Funds Summary Report','Reports','Payroll Reports',null,null,20,69,65,'View Funds Summary Report','Right to view funds summary report',2)
Insert Into UserRights values(86,'View Funds Detail Report','Reports','Payroll Reports',null,null,21,69,65,'View Funds Detail Report','Right to view funds detail report',2)
Insert Into UserRights values(87,'View SDL Summary Report','Reports','Payroll Reports',null,null,22,69,65,'View SDL Summary Report','Right to view funds detail report',2)
Insert Into UserRights values(88,'View SDL Detail Report','Reports','Payroll Reports',null,null,23,69,65,'View SDL Detail Report','Right to view sdl detail report',2)
Insert Into UserRights values(89,'View Individual  Monthly Leave Report','Reports','Leave Reports',null,null,24,69,65,'View Individual  Monthly Leave Report','Right to view individual  monthly leave report',2)
Insert Into UserRights values(90,'View Individual  Monthly Details  Leave Report','Reports','Leave Reports',null,null,25,69,65,'View Individual  Monthly Details  Leave Report','Right to view individual  monthly details  leave report',2)
Insert Into UserRights values(91,'View Individual  Yearly  Leave Report','Reports','Leave Reports',null,null,26,69,65,'View Individual  Yearly  Leave Report','Right to view individual  yearly  leave report',2)
Insert Into UserRights values(92,'View Individual  Yearly Detail  Leave Report','Reports','Leave Reports',null,null,27,69,65,'View Individual  Yearly Detail  Leave Report','Right to view individual  yearly detail  leave report',2)
Insert Into UserRights values(93,'View Summary Yearly  Leave Report','Reports','Leave Reports',null,null,28,69,65,'View Summary Yearly  Leave Report','Right to view summary yearly  leave report',2)
Insert Into UserRights values(94,'View Summary Yearly Detail  Leave Report','Reports','Leave Reports',null,null,29,69,65,'View Summary Yearly Detail  Leave Report','Right to view summary yearly detail  leave report',2)
Insert Into UserRights values(95,'View Summary Monthly  Leave Report','Reports','Leave Reports',null,null,30,69,65,'View Summary Monthly  Leave Report','Right to view summary monthly  leave report',2)
Insert Into UserRights values(96,'View Summary Monthly  Detail Leave Report','Reports','Leave Reports',null,null,31,69,65,'View Summary Monthly  Detail Leave Report','Right to view summary monthly  detail leave report',2)
Insert Into UserRights values(97,'View Employee Details','Reports','Employee Reports',null,null,32,69,65,'View Employee Details','Right to view employee details report',2)
Insert Into UserRights values(98,'View Employee Personal Details','Reports','Employee Reports',null,null,33,69,65,'View Employee Personal Details','Right to view employee personal details report',2)
Insert Into UserRights values(99,'View Employee Job Details','Reports','Employee Reports',null,null,34,69,65,'View Employee Job Details','Right to view employee job details report',2)
Insert Into UserRights values(100,'View Employee Salary Details','Reports','Employee Reports',null,null,35,69,65,'View Employee Salary Details','Right to view employee salary details report',2)
Insert Into UserRights values(101,'View Employee Certs Details','Reports','Employee Reports',null,null,36,69,65,'View Employee Certs Details','Right to view employee certs details report',2)
Insert Into UserRights values(102,'View Employee Address Details','Reports','Employee Reports',null,null,37,69,65,'View Employee Address Details','Right to view employee address details report',2)
Insert Into UserRights values(103,'View TimeCard Details','Reports','Reports',null,null,38,69,65,'View TimeCard Details','Right to view timecard details report',2)
Insert Into UserRights values(104,'View Cheque Print','Reports','Reports',null,null,39,69,65,'View Cheque Print','Right to view cheque to be printed report',2)
Insert Into UserRights values(105,'Admin Rights','Admin','',null,null,null,null,null,'Admin Module','Right to the main admin module',2)
Insert Into UserRights values(106,'View Company','Admin','Company',7,1,1,105,null,'View Company Info','Right to view company info',2)
Insert Into UserRights values(107,'Add Company','Admin','Company',null,null,2,106,105,'Add New Company','Right to add new company',2)
Insert Into UserRights values(108,'Edit Company','Admin','Company',null,null,3,106,105,'Edit Existing Company','Right to edit existing company',2)
Insert Into UserRights values(109,'Delete Company','Admin','Company',null,null,4,106,105,'Delete Existing Company','Right to delete existing company',2)
Insert Into UserRights values(110,'Manage Users','Admin','Company',null,null,5,106,105,'Manage Users','Right to manage users under the company',2)
Insert Into UserRights values(111,'View Users','Admin','Security Management',7,2,6,105,null,'Security Management','Right to security groups',2)
Insert Into UserRights values(112,'Manage User Groups','Admin','Security Management',null,null,7,111,105,'Manage Security Groups','Right to add, edit or delete security groups',2)
Insert Into UserRights values(113,'View Lookups','Admin','DropDowns',7,3,8,null,null,'DropDowns','Right to dropdowns',2)
Insert Into UserRights values(114,'Manage Addition Types','Admin','DropDowns',null,null,9,113,105,'Manage Addition Types','Right to add, edit or delete payroll addition type',2)
Insert Into UserRights values(115,'Manage Deduction Types','Admin','DropDowns',null,null,10,113,105,'Manage Deduction Types','Right to add, edit or delete payroll deduction type',2)
Insert Into UserRights values(116,'Manage Race Types','Admin','DropDowns',null,null,11,113,105,'Manage Race Types','Right to add, edit or delete race type',2)
Insert Into UserRights values(117,'Manage Religion Types','Admin','DropDowns',null,null,12,113,105,'Manage Religion Types','Right to add, edit or delete religion type',2)
Insert Into UserRights values(118,'Manage Departments','Admin','DropDowns',null,null,13,113,105,'Manage Departments','Right to add, edit or delete departments',2)
Insert Into UserRights values(119,'Manage Designation Types','Admin','DropDowns',null,null,14,113,105,'Manage Designation Types','Right to add, edit or delete designations',2)
Insert Into UserRights values(120,'Manage Country Types','Admin','DropDowns',null,null,15,113,105,'Manage Country Types','Right to add, edit or delete country',2)
Insert Into UserRights values(121,'Manage Nationality Types','Admin','DropDowns',null,null,16,113,105,'Manage Nationality Types','Right to add, edit or delete nationality',2)
Insert Into UserRights values(122,'Manage WPTypes','Admin','DropDowns',null,null,17,113,105,'Manage WPTypes','Right to add, edit or delete work permit type',2)
Insert Into UserRights values(123,'Manage Course Types','Admin','DropDowns',null,null,18,113,105,'Manage Course Types','Right to add, edit or delete course type',2)
Insert Into UserRights values(124,'Manage SafetyPass Types','Admin','DropDowns',null,null,19,113,105,'Manage SafetyPass Types','Right to add, edit or delete safety pass type',2)
Insert Into UserRights values(125,'Manage Document Category','Admin','DropDowns',null,null,20,113,105,'Manage Document Category','Right to add, edit or delete document category',2)
Insert Into UserRights values(126,'Manage Certificate Category','Admin','DropDowns',null,null,21,113,105,'Manage Certificate Category','Right to add, edit or delete Certificate Category',2)
Insert Into UserRights values(127,'Manage Agent','Admin','DropDowns',null,null,22,113,105,'Manage Agent','Right to add, edit or delete Agents',2)
Insert Into UserRights values(128,'Manage MYE','Admin','DropDowns',null,null,23,113,105,'Manage MYE','Right to add, edit or delete MYE certificate',2)
Insert Into UserRights values(129,'Manage Leave Types','Admin','DropDowns',null,null,24,113,105,'Manage Leave Types','Right to add, edit or delete Leave types',2)
Insert Into UserRights values(130,'Project Management','Admin','Project Management',7,4,25,null,105,'Project Management','Right to project management',1)
Insert Into UserRights values(131,'Project','Admin','Project Management',null,null,26,130,105,'Manage Project','Right to add, edit or delete projects',1)
Insert Into UserRights values(132,'Sub Project','Admin','Project Management',null,null,27,130,105,'Manage Sub Project','Right to add, edit or delete sub projects',1)
Insert Into UserRights values(133,'Location','Admin','Project Management',null,null,28,130,105,'Manage Location','Right to add, edit or delete location',1)
Insert Into UserRights values(134,'Project Assignment','Admin','Project Management',null,null,29,130,105,'Manage Project Assignment','Right to assign employees to project',1)
Insert Into UserRights values(135,'Workflow Management','Admin','Workflow Management',7,5,30,null,null,'Workflow Management','Right to workflow management',2)
Insert Into UserRights values(136,'Workflow','Admin','Workflow Management',null,null,32,135,105,'Manage Workflow','Right to add, edit or delete workflows',2)
Insert Into UserRights values(137,'Workflow Level','Admin','Workflow Management',null,null,33,135,105,'Manage Workflow Level','Right to add, edit or delete workflow levels for workflow',2)
Insert Into UserRights values(138,'Workflow Group','Admin','Workflow Management',null,null,34,135,105,'Manage Workflow Group','Right to add, edit or delete workflow Groups of workflow',2)
Insert Into UserRights values(139,'Workflow Employee Assignment','Admin','Workflow Management',null,null,35,135,105,'Manage Workflow Employee Assignment','Right to assign employees to workflow',2)
Insert Into UserRights values(140,'Items Management','Admin','Items Management',7,6,36,null,null,'Items Management','Right to items management',1)
Insert Into UserRights values(141,'UOM','Admin','Items Management',null,null,37,140,105,'Manage UOM','Right to add, edit or delete unit of measure',1)
Insert Into UserRights values(142,'Item Category','Admin','Items Management',null,null,38,140,105,'Manage Item Category','Right to add, edit or delete item category',1)
Insert Into UserRights values(143,'Item Sub Category','Admin','Items Management',null,null,39,140,105,'Manage Item Sub Category','Right to add, edit or delete item sub category',1)
Insert Into UserRights values(144,'Item Parameter','Admin','Items Management',null,null,40,140,105,'Manage Item Parameter','Right to add, edit or delete item parameter',1)
Insert Into UserRights values(145,'Supplier','Admin','Items Management',null,null,41,140,105,'Manage Supplier','Right to add, edit or delete suppliers',1)
Insert Into UserRights values(146,'Store','Admin','Items Management',null,null,42,140,105,'Manage Store','Right to add, edit or delete stores',1)
Insert Into UserRights values(147,'Item','Admin','Items Management',null,null,43,140,105,'Manage Item','Right to add, edit or delete items',1)
Insert Into UserRights values(148,'Assignment Management','Admin','Assignment Management',7,7,44,null,null,'Assignment Management','Right to assignment management',2)
Insert Into UserRights values(149,'Department Assignment','Admin','Assignment Management',null,null,45,148,105,'Assign Department to Employees','Right to assign department to employees',2)
Insert Into UserRights values(150,'Leave Supervisor Assignment','Admin','Assignment Management',null,null,46,148,105,'Assign Leave Supervisor to Employees','Right to assign leave supervisor to employees',2)
Insert Into UserRights values(151,'Claim Supervisor Assignment','Admin','Assignment Management',null,null,47,148,105,'Assign Claim Supervisor to Employees','Right to assign claim supervisor to employees',2)
Insert Into UserRights values(152,'Payroll Workflow Assignment','Admin','Assignment Management',null,null,48,148,105,'Assign Payroll Workflow to Employees','Right to assign payroll workflow to employees',2)
Insert Into UserRights values(153,'Bulk Import','Admin','Import Management',7,8,49,null,null,'Import Management','Right to import management ',2)
Insert Into UserRights values(154,'Employee Detail Import','Admin','Import Management',null,null,50,153,105,'Employee Detail Import','Right to import employee details after employee profile is created',2)
Insert Into UserRights values(155,'Bulk Payroll Additions Import','Admin','Import Management',null,null,51,153,105,'Bulk Payroll Additions Import','Right to bulk import payroll additions',2)
Insert Into UserRights values(156,'Bulk Payroll Deductions Import','Admin','Import Management',null,null,52,153,105,'Bulk Payroll Deductions Import','Right to bulk import payroll deductions',2)
Insert Into UserRights values(157,'Bulk Claims Import','Admin','Import Management',null,null,53,153,105,'Bulk Claims Import','Right to bulk import claims',2)

Insert Into UserRights values(158,'Inventory Management','Inventory','Inventory Management',null,null,1,null,null,'Inventory Module','Right to the main inventory module',1)
Insert Into UserRights values(159,'Stock In','Inventory','Inventory Management',8,1,2,158,null,'Manage Stock In','Right to add, edit or delete stock in from suppliers',1)
Insert Into UserRights values(160,'Stock Out','Inventory','Inventory Management',8,2,3,158,null,'Manage Stock Out','Right to add, edit or delete stock out to  project or employee',1)
Insert Into UserRights values(161,'Stock Transfer','Inventory','Inventory Management',8,3,4,158,null,'Manage Stock Transfer','Right to add, edit or delete stock transfer between different stores',1)
Insert Into UserRights values(162,'Stock Return','Inventory','Inventory Management',8,4,5,158,null,'Manage Stock Return','Right to add, edit or delete stock return from project or employee',1)
Insert Into UserRights values(163,'Invoice Management','Invoice','Invoice',null,null,1,null,null,'Invoicing Module','Right to the main invoicing module',1)

Insert Into UserRights values(164,'Pending Approval Claim for All','Claims','Claims',null,null,9,34,null,'Approve or Reject Claims For All','Right to approve or reject applied claims of all employees',2)
Insert Into UserRights values(165,'Accomadation Management','Admin','Accomadation Management',7,9,54,null,null,'Accomadation Management','Right to the Accomadation Management',2)									
Insert Into UserRights values(166,'Accomadation Management','Admin','Accomadation Management',null,null,55,165,null,'Accomadation Management','Right to manage accomadtions info',2)									
Insert Into UserRights values(167,'Accomadation Assignment','Admin','Accomadation Management',null,null,56,165,null,'Accomadation Assignment','Right to assign, unassign or transfer employees to accomadation',2)									
Insert Into UserRights values(168,'Other Managements','Admin','Other Managements',7,10,57,null,null,'Other Managements','Right to Other Managements',2)									
Insert Into UserRights values(169,'Manage Payslip Remarks','Admin','Other Managements',null,null,58,168,null,'Manage Payslip Remarks','Right to add, edit or delete payslip remarks for employees',2)									
Insert Into UserRights values(170,'Custom Reports - Employee ','Reports','Reports',null,null,40,70,null,'Custom Reports - Employee ','Right to view Employee based custom reports',2)									
Insert Into UserRights values(171,'Custom Reports - Payroll','Reports','Reports',null,null,41,70,null,'Custom Reports - Payroll','Right to view Payroll based custom reports',2)									
Insert Into UserRights values(172,'Custom Reports - Additions','Reports','Reports',null,null,42,70,null,'Custom Reports - Additions','Right to view Payroll Additions based custom reports',2)									
Insert Into UserRights values(173,'Custom Reports - Deductions','Reports','Reports',null,null,43,70,null,'Custom Reports - Deductions','Right to view Payroll Deductions based custom reports',2)									
Insert Into UserRights values(174,'Custom Reports - Claims ','Reports','Reports',null,null,44,70,null,'Custom Reports - Claims ','Right to view Payroll Claims based custom reports',2)									
Insert Into UserRights values(175,'Custom Reports - Grouping','Reports','Reports',null,null,45,70,null,'Custom Reports - Grouping','Right to view Group based custom reports',2)									
Insert Into UserRights values(176,'Custom Reports - Leaves','Reports','Reports',null,null,46,70,null,'Custom Reports - Leaves','Right to view Leave based custom reports',2)									
Insert Into UserRights values(177,'Custom Reports - Timesheet','Reports','Reports',null,null,47,70,null,'Custom Reports - Timesheet','Right to view Timesheet / Project based custom reports',2)
Insert Into UserRights values(178,'Apply Date On','Leave','Leave',null,null,15,20,null,'Apply Date On','Right to apply date/request leave with respect to apply date on',2)
Insert Into UserRights values(179,'Manage Trade Types','Admin','DropDowns',null,null,14,113,105,'Manage Trade Types','Right to add, edit or delete Trade',2)
Insert Into UserRights values(180,'Custom Reports - EmailTrack','Reports','Reports',null,null,48,70,null,'Custom Reports - EmailTrack','Right to view Email Tracking on various actions',2)
Insert Into UserRights values(181,'View Custom Consolidate Reports','Reports','Reports',6,5,5,65,null,'View Custom Consolidate Reports','Right to view consolidate custom report writer to create your own reports',2)
Insert Into UserRights values(182,'Custom Consolidate Reports - Employee','Reports','Reports',null,null,49,181,null,'Custom Consolidate Reports - Employee','Right to view Employee based Consolidate custom reports',2)
Insert Into UserRights values(183,'Custom Consolidate Reports - Grouping','Reports','Reports',null,null,50,181,null,'Custom Consolidate Reports - Grouping','Right to view Group based custom consolidate reports',2)									
Insert Into UserRights values(184,'Custom Consolidate Reports - Payroll','Reports','Reports',null,null,51,181,null,'Custom Consolidate Reports - Payroll','Right to view Group based custom consolidate reports',2)
Insert Into UserRights values(185,'Custom Consolidate Reports - Additions','Reports','Reports',null,null,52,181,null,'Custom Consolidate Reports - Additions','Right to view Payroll Additions based custom consolidate reports',2)									
Insert Into UserRights values(186,'Custom Consolidate Reports - Deductions','Reports','Reports',null,null,53,181,null,'Custom Consolidate Reports - Deductions','Right to view Payroll Deductions based custom consolidate reports',2)									
Insert Into UserRights values(187,'Custom Consolidate Reports - Claims ','Reports','Reports',null,null,54,181,null,'Custom Consolidate Reports - Claims ','Right to view Payroll Claims based custom consolidate reports',2)									
Insert Into UserRights values(188,'Custom Consolidate Reports - Leaves','Reports','Reports',null,null,55,181,null,'Custom Consolidate Reports - Leaves','Right to view Leave based custom consolidate reports',2)									
Insert Into UserRights values(189,'Custom Consolidate Reports - Timesheet','Reports','Reports',null,null,56,181,null,'Custom Consolidate Reports - Timesheet','Right to view Timesheet / Project based custom Consolidate reports',2)
Insert Into UserRights values(190,'print my payroll','Payroll','Payroll',5,9,16,53,null,'Print My Payslip','Right to print my generated Payslip',2)
Insert Into UserRights values(191,'Manage Logo','Admin','Other Managements',null,null,59,168,null,'Manage Logo','Right to payslip logo for employees department wise',2)									
Insert Into UserRights values(192,'Multi Additions','Payroll','Payroll',5,10,17,53,null,'Multi Additions','Multi Additions ',2)
Insert Into UserRights values(193,'Multi Deductions','Payroll','Payroll',5,11,18,53,null,'Multi Deductions','Multi Deductions ',2)
Insert Into UserRights values(194,'Generate Ledger','Reports','Reports',6,2,3,65,null,'Generate Ledger','Right to Generate Ledger for Additions/Deduction/Salary/CPF/Funds/SDL',2)
Insert Into UserRights values(195,'Manage Year of Assesment','Admin','Other Managements',null,null,58,168,null,'Manage Year of Assesment','Right to add, edit Year of Assesment for employees',2)									
Insert Into UserRights values(196,'Manage Previous Year Wages','Admin','Other Managements',null,null,58,168,null,'Manage Previous Year Wages','Right to add, edit Manage Previous Year Wages for employees',2)

Insert Into UserRights values(197,'Help','Help','HelpManagement',null,null,null,null,null,'Help Management','Right to the main help management',2)
Insert Into UserRights values(198,'Help on this page','Help','Help Management',9,1,1,197,null,'Help on this page','Display help text for the respective page',2)
Insert Into UserRights values(199,'User Guide','Help','Help Management',9,2,2,197,null,'User Guide','Display User Guide(Usually PDF documentation)',2)
Insert Into UserRights values(200,'New in this version','Help','Help Management',9,3,3,197,null,'New in this version','Displays new features introduced in this version',2)
Insert Into UserRights values(201,'Check for update','Help','Help Management',9,4,4,197,null,'Check for update','Checks for any updates and updates the application',2)
Insert Into UserRights values(202,'License Information','Help','Help Management',9,5,5,197,null,'License Information','Displays license certificate information',2)
Insert Into UserRights values(203,'StatusBar','StatusBar','StatusBar',null,null,null,null,null,'StatusBar','Right to the main Status Bar',2)
Insert Into UserRights values(204,'Company Name','Status Bar','Status Bar',null,null,1,203,null,'Logged in Company Name','Displays company name the user has logged into',2)
Insert Into UserRights values(205,'Employee Name','Status Bar','Status Bar',null,null,2,203,null,'Logged in Employee Name','Displays employee name the user has logged with',2)
Insert Into UserRights values(206,'Employee Group','Status Bar','Status Bar',null,null,3,203,null,'Logged in Employee Rights','Displays employee right the user has logged with',2)
Insert Into UserRights values(207,'User Name','Status Bar','Status Bar',null,null,4,203,null,'Logged in User Name','Displays user name the user has logged with',2)
Insert Into UserRights values(208,'Last Backup','Status Bar','Status Bar',null,null,5,203,null,'Last Backup Taken on','Displays info about last successful backup taken',2)
Insert Into UserRights values(209,'License Info','Status Bar','Status Bar',null,null,6,203,null,'License Information','Display info about -Licenses purchased,Licenses  used,Licenses balance',2)
Insert Into UserRights values(210,'Maintenanc Expiry','Status Bar','Status Bar',null,null,7,203,null,'Maintenance Expiry','Display info about support and maintenance expirt date',2)
Insert Into UserRights values(211,'Backup logs','Reminders','Reminders',null,null,12,1,null,'Backup Logs','Right to view backup logs',2)

Delete From UserRights Where RightID In (41, 71,72,73,74,75,76,77,78,79,80,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,109)
-- merging 9.0
GO
Declare @count int
set @count = 0
DELETE FROM GroupRightsAllocated
Select @count=COUNT(groupid) from GroupRightsAllocated where UPPER([groupid])  = 1
if (@count = 0)
Begin
	Insert Into GroupRightsAllocated 
	Select UG.GroupID,UR.RightID From UserRights UR
	CROSS JOIN  UserGroups UG WHERE UG.GroupName='Super Admin'
End

set @count = 0
DELETE FROM GroupRights
Select @count=COUNT(groupid) from GroupRights where UPPER([groupid])  = 1
if (@count = 0)
Begin
	Insert Into GroupRights 
	Select UG.GroupID,UR.RightID From UserRights UR
	CROSS JOIN  UserGroups UG WHERE UG.GroupName='Super Admin'
End

set @count = 0
Select @count=Count(ID) From ProductVersion
if (@count > 0)
Begin
	Insert into GroupRights Select  * From #GroupRightsTemp
END
GO
DROP TABLE #GroupRightsTemp
GO

--------GO
--------Select * Into #GroupRightsTemp From GroupRights Where GroupID In
--------(Select GroupID from UserGroups Where GroupName != 'Super Admin')
--------
--------GO

--------DROP TABLE #GroupRightsTemp

GO

INSERT INTO RightsHeader VALUES ('Help')
GO

INSERT INTO RightsHeader VALUES ('Backup logs')
GO

INSERT INTO RightsHeader VALUES ('Status Bar')
GO

/****INSERT INTO table PayrollMonthlyDetail ***********************************/
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
----INSER DATA  IN MasterCompany_User
INSERT INTO [MasterCompany_User] VALUES (1,1)
GO