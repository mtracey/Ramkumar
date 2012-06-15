GO
	Update Employee Set payrate = null where convert(varchar(10),DecryptByAsymKey(AsymKey_ID('AsymKey'), payrate))= '-999999999'
Go
	Update UserRights Set Product=1 where rightname like '%Custom Reports - Timesheet%'
Go
	Update UserRights Set Product=1 where rightname like '%Accomadation%'
GO
	Update CPFAmount_detail Set CPFCalculate = 1 Where CPFCalculate is null 
GO
	Update cpf_calcs Set CPFCalculate = 1 Where CPFCalculate is null 
GO
	Update funds_calcs Set Sal_From=200.01 Where Row_ID = 1
GO
	Update funds_calcs Set Sal_To=1000.99 Where Row_ID = 1
GO
	Update funds_calcs Set Sal_To=2000.99 Where Row_ID = 2
GO
	Update funds_calcs Set Sal_To=3000.99 Where Row_ID = 3
GO
	Update funds_calcs Set Sal_To=4000.99 Where Row_ID = 4
GO
	Update funds_calcs Set Sal_From=600.01 Where Row_ID = 7
GO
	Update funds_calcs Set Sal_From=1500.01 Where Row_ID = 8
GO
	Update funds_calcs Set Sal_From=2500.01 Where Row_ID = 9
GO
	Update funds_calcs Set Sal_To=10000000.00 Where Row_ID = 5
GO
	Update funds_calcs Set Sal_To=10000000.00 Where Row_ID = 9
GO
	Update funds_calcs Set Sal_To=10000000.00 Where Row_ID = 11
GO
	Update funds_calcs Set Sal_To=10000000.00 Where Row_ID = 16
GO
	Update funds_calcs Set Sal_To=10000000.00 Where Row_ID = 17
GO
	Update funds_calcs Set Sal_To=1999.99 Where Row_ID = 10
GO
	Update funds_calcs Set Sal_From=1000.01 Where Row_ID = 13
GO
	Update funds_calcs Set Sal_To=1500 Where Row_ID = 13
GO
	Update funds_calcs Set Sal_From=1500.01 Where Row_ID = 14
GO
	Update funds_calcs Set Sal_To=2500 Where Row_ID = 14
GO
	Update funds_calcs Set Sal_From=2500.01 Where Row_ID = 15
GO
	Update funds_calcs Set Sal_To=4000 Where Row_ID = 15
GO
	Update funds_calcs Set Sal_From=4000.01 Where Row_ID = 16
GO
	Update funds_calcs Set Sal_To = 10000000.00 Where Row_ID = 16
GO
	Update Company Set pwdrequired='No' Where pwdrequired is null
GO
	Update Company Set email_leave_delete='Greetings,  Leave Application Deleted of: @emp_name.  Type of Leave Applied:@leave_type.  Period of Leave Application: @from_date to @to_date.  Paid leave:@paid_leaves, Unpaid leave:@unpaid_leaves. Status: @status.  Thanks and Regards  ' Where email_leave_delete is null
GO
	Update CertificateCategory Set Category_Name='NRIC' Where Category_Name='NRIC/EP/WP'
GO
Update MedicalCSN Set AMCSLimit = 1500 Where AMCSLimit is null
GO
	Update Emp_leaves_Detail Set Session='AM' Where Session is null And HalfDay_Leave = 1
	Update Emp_leaves_Detail Set Session='PM' Where HalfDay_Leave = 1 And Trx_ID In (Select trx_ID From Emp_leaves Where TimeSession='PM')
	Update Emp_leaves_Detail Set Session='--' Where Session is null And HalfDay_Leave = 0
GO
Update EMployee Set joining_date='01/01/2001',confirmation_date = '01/01/2001' Where joining_date is null
GO
Update EMployee Set confirmation_date = joining_date Where confirmation_date is null
GO
if not exists (select * from Leave_Types where [type]='Compassionate Leave')
Update leave_types set [type]='Compassionate Leave' where id=14
GO
if not exists (select * from Company where Upper(Company_Name) like '%COMBA TELECOM%')
Update Employee Set sdf_required = 2 --where len(isnull(sdf_required,''))<=0 Or sdf_required=0
GO
Update Emp_Overtime Set [Trx_Month]=25 Where Trx_Month=1  And Trx_YEar=2009
GO
Update Emp_Overtime Set [Trx_Month]=26 Where Trx_Month=2  And Trx_YEar=2009
GO
Update Emp_Overtime Set [Trx_Month]=27 Where Trx_Month=3  And Trx_YEar=2009
GO
Update Emp_Overtime Set [Trx_Month]=28 Where Trx_Month=4  And Trx_YEar=2009
GO
Update Emp_Overtime Set [Trx_Month]=29 Where Trx_Month=5  And Trx_YEar=2009
GO
Update Emp_Overtime Set [Trx_Month]=30 Where Trx_Month=6  And Trx_YEar=2009
GO
Update Emp_Overtime Set [Trx_Month]=31 Where Trx_Month=7  And Trx_YEar=2009
GO
Update Emp_Overtime Set [Trx_Month]=32 Where Trx_Month=8  And Trx_YEar=2009
GO
Update Emp_Overtime Set [Trx_Month]=33 Where Trx_Month=9  And Trx_YEar=2009
GO
Update Emp_Overtime Set [Trx_Month]=34 Where Trx_Month=10 And Trx_YEar=2009
GO
Update Emp_Overtime Set [Trx_Month]=35 Where Trx_Month=11 And Trx_YEar=2009
GO
Update Emp_Overtime Set [Trx_Month]=36 Where Trx_Month=12 And Trx_YEar=2009
GO
Update Emp_Overtime Set [Trx_Month]=37 Where Trx_Month=1  And Trx_YEar=2010
GO
Update Emp_Overtime Set [Trx_Month]=38 Where Trx_Month=2  And Trx_YEar=2010
GO
Update Emp_Overtime Set [Trx_Month]=39 Where Trx_Month=3  And Trx_YEar=2010
GO
Update Emp_Overtime Set [Trx_Month]=40 Where Trx_Month=4  And Trx_YEar=2010
GO
Update Emp_Overtime Set [Trx_Month]=41 Where Trx_Month=5  And Trx_YEar=2010
GO
Update Emp_Overtime Set [Trx_Month]=42 Where Trx_Month=6  And Trx_YEar=2010
GO
Update Emp_Overtime Set [Trx_Month]=43 Where Trx_Month=7  And Trx_YEar=2010
GO
Update Emp_Overtime Set [Trx_Month]=44 Where Trx_Month=8  And Trx_YEar=2010
GO
Update Emp_Overtime Set [Trx_Month]=45 Where Trx_Month=9  And Trx_YEar=2010
GO
Update Emp_Overtime Set [Trx_Month]=46 Where Trx_Month=10 And Trx_YEar=2010
GO
Update Emp_Overtime Set [Trx_Month]=47 Where Trx_Month=11 And Trx_YEar=2010
GO
Update Emp_Overtime Set [Trx_Month]=48 Where Trx_Month=12 And Trx_YEar=2010
GO

UPDATE Emp_OverTime
SET  Emp_OverTime.payrollstdate =  Convert(Datetime,(Cast(PayrollMonthlyDetail.[PaySubStartDay] as varchar) + '/' + Cast(PayrollMonthlyDetail.[Month] as varchar) + '/'  + Cast(PayrollMonthlyDetail.[Year] as varchar)),103)
FROM Emp_OverTime
INNER JOIN PayrollMonthlyDetail 
ON Emp_OverTime.Trx_Month = PayrollMonthlyDetail.ROWID
--Where Emp_OverTime.payrollstdate is null

GO

UPDATE Emp_Leaves
SET  Emp_Leaves.Leave_Model = C.Leave_Model 
From Emp_Leaves
Inner Join (Select E.Emp_Code, E.Company_ID,C.Leave_Model From Employee E
Inner Join Company C On E.Company_ID = C.Company_ID) C
On Emp_Leaves.Emp_ID = C.Emp_Code 
Where Emp_Leaves.Leave_Model is null

Go
	Update deductions_types Set CPF='No' Where cpf is null
Go
	Update RosterDetail Set PullWorkTimein = 0 Where PullWorkTimein is null
Go
	Update CertificateCategory Set Category_Name='CSOC' Where ID=2
Go
	Update CertificateCategory set COLID = 10001 Where Company_ID != -1
GO
	--Update CertificateCategory set Category_Name='FIN (EP/WP)', COLID = 10000 Where Upper(Category_Name) = Upper('FIN (EP/WP)')
GO
	if not exists (select * from CertificateCategory Where Upper(Category_Name) = Upper('NRIC/EP/WP') And ID <= 6)
	Update CertificateCategory set Category_Name='NRIC/EP/WP', COLID = 6 Where Upper(Category_Name) = Upper('FIN (EP/WP)') And ID <= 6
GO
	Update CertificateCategory set COLID = 1 Where Upper(Category_Name) = Upper('Insurance')
Go
	Update CertificateCategory set COLID = 2 Where Upper(Category_Name) = Upper('CSOC')
GO
	Update CertificateCategory set COLID = 3 Where Upper(Category_Name) = Upper('Passport')
Go
	Update CertificateCategory set COLID = 4 Where Upper(Category_Name) = Upper('NRIC')
GO
	Update CertificateCategory set COLID = 5 Where Upper(Category_Name) = Upper('License')
Go
	Update CertificateCategory set COLID = 10000 Where COLID is null
GO
	--Delete From CertificateCategory Where Upper(Category_Name) = Upper('NRIC')
GO

Update RosterDetail Set BreakTimeOT = 0 Where BreakTimeOT is null
Update RosterDetail Set NightShift  = 0 Where NightShift is null
Go
Delete From DropDowns Where Upper(DropDown) = 'ROSTER'
Delete From DropDowns Where Upper(DropDown) = 'WORKFLOW LEVEL'
Delete From DropDowns Where Upper(DropDown) = 'WORKFLOW'
Delete From DropDowns Where Upper(DropDown) = 'PAYROLL GROUP'
Delete From DropDowns Where Upper(DropDown) = 'ITEM'
Delete From DropDowns Where Upper(DropDown) = 'STORE'
Delete From DropDowns Where Upper(DropDown) = 'SUPPLIER'
Delete From DropDowns Where Upper(DropDown) = 'PROJECT'
Delete From DropDowns Where Upper(DropDown) = 'SUB PROJECT'
Delete From DropDowns Where Upper(DropDown) = 'ITEM CATEGORY'
Delete From DropDowns Where Upper(DropDown) = 'ITEM SUB CATEGORY'
Delete From DropDowns Where Upper(DropDown) = 'UNITS FOR MEASUREMENT'
Delete From DropDowns Where Upper(DropDown) = 'PARAMETER'
Delete From DropDowns Where Upper(DropDown) = 'LOCATION'
Delete From DropDowns Where Upper(DropDown) = 'LEAVE TYPES'
Delete From DropDowns Where Upper(DropDown) = 'WPTYPE'

--Delete from UserRights Where Upper(RightName)='ROSTER SETTINGS'		And UPPER(RIGHTCATEGORY)='ROSTER'
--Delete from UserRights Where Upper(RightName)='ROSTER ASSIGNMENT'		And UPPER(RIGHTCATEGORY)='ROSTER'
--Delete from UserRights Where Upper(RightName)='MANAGE ROSTER'		And UPPER(RIGHTCATEGORY)='ROSTER'
--Delete from UserRights Where Upper(RightName)='WORKFLOW'		And UPPER(RIGHTCATEGORY)='DROPDOWNS'
--Delete from UserRights Where Upper(RightName)='WORKFLOW LEVEL' And UPPER(RIGHTCATEGORY)='DROPDOWNS'
--Delete from UserRights Where Upper(RightName)='MANAGE PROJECT' And UPPER(RIGHTCATEGORY)='DROPDOWNS'
--Delete from UserRights Where Upper(RightName)='MANAGE LOCATION' And UPPER(RIGHTCATEGORY)='DROPDOWNS'
--Delete from UserRights Where Upper(RightName)='PROJECT ASSIGNMENT' And UPPER(RIGHTCATEGORY)='PROJECT'
--Delete from UserRights Where Upper(RightName)='MANAGE SUB PROJECT' And UPPER(RIGHTCATEGORY)='DROPDOWNS'
--Delete from UserRights Where Upper(RightName)='MANAGE PAYROLL GROUP' And UPPER(RIGHTCATEGORY)='DROPDOWNS'
--Delete from UserRights Where Upper(RightName)='PAYROLL GROUP ASSIGNMENT' And UPPER(RIGHTCATEGORY)='PAYROLL'
--Delete from UserRights Where Upper(RightName)='MANAGE PARAMETER' And UPPER(RIGHTCATEGORY)='DROPDOWNS'
--Delete from UserRights Where Upper(RightName)='MANAGE ITEM' And UPPER(RIGHTCATEGORY)='DROPDOWNS'
--Delete from UserRights Where Upper(RightName)='MANAGE UOM' And UPPER(RIGHTCATEGORY)='DROPDOWNS'
--Delete from UserRights Where Upper(RightName)='MANAGE SUPPLIER' And UPPER(RIGHTCATEGORY)='DROPDOWNS'
--Delete from UserRights Where Upper(RightName)='MANAGE STORE' And UPPER(RIGHTCATEGORY)='DROPDOWNS'
--Delete from UserRights Where Upper(RightName)='MANAGE ITEM CATEGORY' And UPPER(RIGHTCATEGORY)='DROPDOWNS'
--Delete from UserRights Where Upper(RightName)='MANAGE ITEM SUB CATEGORY' And UPPER(RIGHTCATEGORY)='DROPDOWNS'
Go
Update Item Set ItemType=1 Where ItemType is null
Go
--Update UserRIghts Set Rightname='Automatic Timesheet' Where Rightname like 'Timesheet File Upload'
--Go
Update Bank Set Code='0015' Where upper([desc]) = 'NORDEA BANK FINLAND PLC'
Go
Update Bank Set Code='0013' Where upper([desc]) = 'MALAYAN BANKING BERHAD'
Go
Update Bank Set Code='0009' Where upper([desc]) = 'CITIBANK'
Go
Update Bank Set Code='0011' Where upper([desc]) = 'ABN AMRO BANK'
Go
Update Bank Set Code='0012' Where upper([desc]) = 'THE HONG KONG AND SHANGHAI BANKING CORPORATION LTD'
Go
Update Bank Set Code='0014' Where upper([desc]) = 'THE BANK OF TOKYO-MITSUBISHI UFJ LTD'
Go
--update userrights set rightcategory='Leave'		where Upper(rightcategory)	=Upper('Leaves')
--update userrights set rightcategory='Employee'	where Upper(rightname)		=Upper('Employee Management')
--update userrights set rightcategory='Rights'	where Upper(rightcategory)	=Upper('users')
--update userrights set rightcategory='Leave'		where Upper(rightname)		=Upper('Leave Management')
--update userrights set rightcategory='Payroll'	where Upper(rightname)		=Upper('Payroll Management')
--update userrights set rightcategory='Reports'	where Upper(rightname)		=Upper('Reports Management')
--update userrights set rightcategory='DropDowns' where Upper(rightcategory)	=Upper('management')
--Update UserRights Set RightCategory='DropDowns'  Where Upper(RightName)=Upper('Manage Leave Types')
--update userrights set rightcategory='Manage Employee Timesheet'		where Upper(rightcategory)	=Upper('Manage Timesheet Document')

Go

Update Funds_calcs set Fund_amount=3.5   where fund_type='MBMF' and (sal_from >= 1001 AND sal_to <= 2000)
Update Funds_calcs set Fund_amount=5     where fund_type='MBMF' and (sal_from >= 2001 AND sal_to <= 3000)
Update Funds_calcs set Fund_amount=12.50 where fund_type='MBMF' and (sal_from >= 3001 AND sal_to <= 4000)
Update Funds_calcs set Fund_amount=16.00 where fund_type='MBMF' and (sal_from >= 4001 )

Go
update cpfamount_detail set employer_cpf='((@SAL -750)  * 0.0541) + 18.60'  where row_id=14
update cpfamount_detail set employer_cpf='((@SAL -750)  * 0.0498) + 18.60'  where row_id=15
update cpfamount_detail set employer_cpf='((@SAL -750)  * 0.044)  + 18.60'  where row_id=16
update cpfamount_detail set employer_cpf='((@SAL -1200) * 0.108)  + 57.60'  where row_id=46
update cpfamount_detail set employer_cpf='((@SAL -750)  * 0.1966) + 67.50'  where row_id=62

Go
update additions_types set optionselection='General' where optionselection is null
update leave_types set code='0001' where Upper([Type]) = Upper('Annual Leave')
update leave_types set code='0002' where Upper([Type]) = Upper('Sick Leave')
update leave_types set code='0003' where Upper([Type]) = Upper('Maternity Leave')
update leave_types set code='0004' where Upper([Type]) = Upper('Paternity Leave')
update leave_types set code='0005' where Upper([Type]) = Upper('Child Care Leave')
update leave_types set code='0006' where Upper([Type]) = Upper('Hospitalisation Leave')
update leave_types set code='0007' where Upper([Type]) = Upper('Compassionate Leave')
update leave_types set code='0008' where Upper([Type]) = Upper('Marriage Leave')
update leave_types set code='0009' where Upper([Type]) = Upper('Leave1 Or Absence(LOA)')

update bank set [desc]='STANDARD CHARTERED BANK' where id=7
update bank set [desc]='Deutsche Bank'  where uPPER([desc]) = Upper('Deutsche Bank')
update bank set code='0005'  where code ='005'

update bank set bank_code = '7339' where upper([desc]) = Upper('OCBC')
update bank set bank_code = '7171' where upper([desc]) = Upper('DBS%')
update bank set bank_code = '7463' where upper([desc]) = Upper('DEUTSCHE%')
update bank set bank_code = '7144' where upper(RTRIM([desc])) = Upper('SC') Or upper([desc]) = upper('STANDARD CHARTERED BANK')
update bank set bank_code = '7375' where upper([desc]) = Upper('UOB')
GO
Declare @count int
set @count = 0
Select @count = count(id) from bank where upper([desc]) = 'MIZUHO'
if (@count > 0)
Begin 
	Update bank set code='0007', bank_code= '7621' where upper([desc]) = upper('MIZUHO')
End
Set @count=0
GO

GO
Declare @count int
set @count = 0
Select @count = count(id) from bank where upper([desc]) = upper('SUMITOMO MITSUI BANKING CORPORATION')
if (@count > 0)
Begin 
	Update bank set code='0008'  where upper([desc]) =('SUMITOMO MITSUI BANKING CORPORATION')
End
Set @count=0

--2007
update daysinmonth set days_week7=31 where year=2007 and month=1

update daysinmonth set days_week7=28 where year=2007 and month=2

update daysinmonth set days_week7=31 where year=2007 and month=3

update daysinmonth set days_week7=30 where year=2007 and month=4


update daysinmonth set days_week7=31 where year=2007 and month=5

update daysinmonth set days_week7=30 where year=2007 and month=6

update daysinmonth set days_week7=31 where year=2007 and month=7

update daysinmonth set days_week7=31 where year=2007 and month=8

update daysinmonth set days_week7=30 where year=2007 and month=9

update daysinmonth set days_week7=31 where year=2007 and month=10

update daysinmonth set days_week7=30 where year=2007 and month=11

update daysinmonth set days_week7=31 where year=2007 and month=12
--2009
update daysinmonth set days_week7=31 where year=2009 and month=1

update daysinmonth set days_week7=28 where year=2009 and month=2

update daysinmonth set days_week7=31 where year=2009 and month=3

update daysinmonth set days_week7=30 where year=2009 and month=4


update daysinmonth set days_week7=31 where year=2009 and month=5

update daysinmonth set days_week7=30 where year=2009 and month=6

update daysinmonth set days_week7=31 where year=2009 and month=7

update daysinmonth set days_week7=31 where year=2009 and month=8

update daysinmonth set days_week7=30 where year=2009 and month=9

update daysinmonth set days_week7=31 where year=2009 and month=10

update daysinmonth set days_week7=30 where year=2009 and month=11

update daysinmonth set days_week7=31 where year=2009 and month=12
--2010
update daysinmonth set days_week7=31 where year=2010 and month=1

update daysinmonth set days_week7=28 where year=2010 and month=2

update daysinmonth set days_week7=31 where year=2010 and month=3

update daysinmonth set days_week7=30 where year=2010 and month=4


update daysinmonth set days_week7=31 where year=2010 and month=5

update daysinmonth set days_week7=30 where year=2010 and month=6

update daysinmonth set days_week7=31 where year=2010 and month=7

update daysinmonth set days_week7=31 where year=2010 and month=8

update daysinmonth set days_week7=30 where year=2010 and month=9

update daysinmonth set days_week7=31 where year=2010 and month=10

update daysinmonth set days_week7=30 where year=2010 and month=11

update daysinmonth set days_week7=31 where year=2010 and month=12
     
GO

Update Employee Set Remarks = (Remarks + '-Old Address:' + [address] + ',' + [localaddress2])  Where  len(ltrim((rtrim([localaddress2]+[address])))) > 0 and remarks not like '%Old Address:%'
Go
Update Employee Set Ot1Rate=1.5 Where Ot1Rate is null
Go
Update Employee Set Ot2Rate=2   Where Ot2Rate is null
Go
Update Company Set basicrnd=-1, additionsrnd=2, deductionsrnd=2, netpayrnd=2 Where netpayrnd is null
Go
--Update Company Set Leave_Model=3 Where Leave_Model=5
--Go
Update prepare_payroll_detail Set NetPay=EncryptByAsymKey(AsymKey_ID('AsymKey'),cast('0' as varchar(50))) From prepare_payroll_detail
Where len(convert(varchar(10),DecryptByAsymKey(AsymKey_ID('AsymKey'), netpay)))= 0

Go

Update Employee Set EmpCPFType=1

Go

Update Employee Set Emp_Type='SPR' Where upper(rtrim(Emp_Type))= 'SDPR'

Go

Update Company Set payrolltype=1 Where payrolltype is null

Go
UPDATE prepare_payroll_detail
SET  prepare_payroll_detail.NHRate =  Employee.[hourly_rate] 
FROM prepare_payroll_detail
INNER JOIN Employee
ON prepare_payroll_detail.Emp_ID = Employee.Emp_Code
Where prepare_payroll_detail.NHRate is null

GO
DECLARE curse CURSOR FOR SELECT ph.start_period,pd.trx_id,salary_detail_id,emp_id,e.company_id FROM prepare_payroll_detail pd Inner Join prepare_payroll_hdr ph On pd.trx_id = ph.trx_id inner join employee e on pd.emp_id=e.emp_code Where status != 'R'
DECLARE @compid int
DECLARE @trx_id int
DECLARE @salid  int
DECLARE @empid  int
DECLARE @startperiod  datetime
DECLARE @nhwork  float
Declare @additionsrnd int
                                                  
	OPEN curse                                                  
	FETCH NEXT FROM curse INTO @startperiod, @trx_id, @salid, @empid, @compid                                                
                                          
	WHILE @@FETCH_STATUS = 0                                   
	BEGIN
		Select @nhwork = isnull(NH_Work,0) From Emp_Overtime Where Emp_Code=@empid And PayrollStDate=@startperiod 
		Update prepare_payroll_detail set Nh_Wh = @nhwork Where salary_detail_id = @salid And NH_wh is null  And [Status] != 'R'

		select @additionsrnd=additionsrnd from company Where Company_ID=@compid
        print @additionsrnd
		if (@additionsrnd > -1)
		BEGIN 
			
			Update Prepare_Payroll_Detail Set Nh_e = Round(dbo.ConvertToMinutes(Nh_Wh)*(NHRate/60),@additionsrnd) Where NH_e is null  And [Status] != 'R'
		END
		ELSE
		BEGIN
			Update Prepare_Payroll_Detail Set Nh_e = dbo.ConvertToMinutes(Nh_Wh)*(NHRate/60) Where NH_e is null And [Status] != 'R'
		END

		FETCH NEXT FROM curse INTO @startperiod, @trx_id, @salid, @empid, @compid                                                
	END
CLOSE curse                            
DEALLOCATE curse      

--
--Go                                            
--Update cpf_calcs Set employee_cpf=18   WHERE  (CPFCalculate = 2 Or CPFCalculate = 3) And (Age_From=51 And Age_To=55)
--GO
--Update cpf_calcs Set employee_cpf=12.5 WHERE  (CPFCalculate = 2 Or CPFCalculate = 3) And (Age_From=51 And Age_To=55)
--GO
--Update cpf_calcs Set employee_cpf=7.5  WHERE  (CPFCalculate = 2 Or CPFCalculate = 3) And (Age_From=51 And Age_To=55)
--GO
--Update cpf_calcs Set employee_cpf=5    WHERE  (CPFCalculate = 2 Or CPFCalculate = 3) And (Age_From=51 And Age_To=55)
--GO


GO
Update additions_types  Set isShared = 'NO' Where isShared is null
Update DEDUCTIONS_types Set isShared = 'NO' Where isShared is null
Update Location			Set isShared = 'NO' Where isShared is null
update additions_types	Set company_id=1000 where company_id=-1
Update Employee			Set ComputeCPFFH=1 Where ComputeCPFFH is null
Update Employee			Set ComputeFundFH=1 Where ComputeFundFH is null
Update Employee			Set PayrollType=1 Where PayrollType is null
Update Company			Set isTSRemarks=0 Where isTSRemarks is null
Update Company			Set PwdRequired = 'No' Where PwdRequired='Yes'
Update Company			Set projectassign = 1 Where projectassign is null
Update Employee			Set HalfSalary=0 Where HalfSalary is null
Update Project			Set isShared = 'NO' Where isShared is null
Update SubProject		Set Active = 1 Where Active is null
Update [deductions_types] set cpf='No' Where cpf = 'NO'
Update [deductions_types] set cpf='Yes' Where cpf = 'YES'
Update [deductions_types] set isShared='No' Where isShared='NO'
Update [deductions_types] set isShared='Yes' Where isShared='YES'

Update [additions_types] set cpf='No' Where cpf='NO'
Update [additions_types] set cpf='Yes' Where cpf='YES'

Update [additions_types] set tax_payable='No' Where tax_payable='NO'
Update [additions_types] set tax_payable='Yes' Where tax_payable='YES'
Update [additions_types] set isShared='No' Where isShared='NO'
Update [additions_types] set isShared='Yes' Where isShared='YES'
GO

--Update SubProject		Set Active = 0 Where ID in (22,	4,	6,	7,	86,	46,	16,	44,	47,	45,	17,	8,	21,	26,	2,	23,	93,	1,	54,	20,	34,	91,	27,	28,	30,	89,	12,	31,	10,	29,	52,	85,	88,	53,	84,	49,	83,	90,	25,	32,	67,	11,	48,	51,	9,	40,	24,	50,	33)

---CPF Ceiling realted changes ---Changes Additional Wages  in table CPFAmount_detail So  
---it will take CPFCalculate column with ID =4
---CPF 2011
Update PayrollMonthlyDetail SET CPFCalculate=4 Where ROWID >=57  AND ROWID <=168

Update PayrollMonthlyDetail SET CPFCalculate=4 Where ROWID >=281  

--Custom Report Writer -->Employee tab
--old condition -->case  marital_status When 'M' Then 'Married' when 'S' Then 'Single'  Else 'Divorce' End 
UPDATE TABLEOBJATTRIB SET Table_Source='case  marital_status When ''MARRIED '' Then ''Married'' When ''M'' Then ''Married'' When ''SINGLE'' Then ''Single''when ''S'' Then ''Single'' Else marital_status End' Where Field_Name ='marital_status'
UPDATE TABLEOBJATTRIB SET Table_Source='' Where Field_Name ='place_of_birth'

UPDATE Company SET AdvTs=-1 WHERE AdvTs IS NULL


--remove reports link in main menu
delete from UserRights where Rightid='69'