IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_getItemPrice') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_getItemPrice
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'ConvertToRound') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION ConvertToRound
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_GrossCommissionAmountStart') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_GrossCommissionAmountStart
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_GrossCommissionAmountEnd') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_GrossCommissionAmountEnd
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_CompensationRetrenchmentbenefitsAmount') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_CompensationRetrenchmentbenefitsAmount
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_GratuityNoticePymExGratiaPaid') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_GratuityNoticePymExGratiaPaid
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_CompensationRetrenchmentBenefitsPaid') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_CompensationRetrenchmentBenefitsPaid
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_getSumCPF') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_getSumCPF
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_AdditionalSalary') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_AdditionalSalary
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_getMonthFundDetails') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_getMonthFundDetails
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_getMonthFundDetailsMBMF') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_getMonthFundDetailsMBMF
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_getMonthSumCPF') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_getMonthSumCPF
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_MonthAdditionalSalary') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_MonthAdditionalSalary
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_MonthBonus') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_MonthBonus
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_MonthDirectorsFee') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_MonthDirectorsFee
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_MonthGetOtherInfo') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_MonthGetOtherInfo
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_MonthGrossCommissionAmount') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_MonthGrossCommissionAmount
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_MonthSalary') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_MonthSalary
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_Salary') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_Salary
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_CalculateCPFAW') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_CalculateCPFAW
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'F_AGE_IN_YEARS') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION F_AGE_IN_YEARS
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'GET_EmpGroupId') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION GET_EmpGroupId
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'GetEmployerCPFPCT') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION GetEmployerCPFPCT
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'GetEmployeeCPFPCT') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION GetEmployeeCPFPCT
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_GENPayrollAWCalc') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_GENPayrollAWCalc
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_CalculateAdditionWagesBetMonth') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_CalculateAdditionWagesBetMonth
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_getPRYears_Emp') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_getPRYears_Emp
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_getFundDetailsMBMF') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_getFundDetailsMBMF
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_getFundDetails') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_getFundDetails
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fnGetFundAmt') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fnGetFundAmt
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'GetEmpFundContribution') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION GetEmpFundContribution
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_GetEmpCPF_Amount') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_GetEmpCPF_Amount
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_ApprovalObtainedFromIRASApproveDate') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_ApprovalObtainedFromIRASApproveDate
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_GrossSalary') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_GrossSalary
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'get_available_leaves_prorated2') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION get_available_leaves_prorated2
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_GetDailyRate') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_GetDailyRate
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'get_available_leaves_prorated') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION get_available_leaves_prorated
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_getSDLAmount') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_getSDLAmount
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_getCountryName') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_getCountryName
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_getDesignation') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_getDesignation
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_getEmpDept') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_getEmpDept
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_GrossCommissionAmount') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_GrossCommissionAmount
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_ApprovalObtainedFromIRAS') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_ApprovalObtainedFromIRAS
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_GrossCommissionIndicator') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_GrossCommissionIndicator
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_Bonus') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_Bonus
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_DirectorsFee') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_DirectorsFee
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_GetOtherInfo') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_GetOtherInfo
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_GratuityNoticePayment') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_GratuityNoticePayment
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_getEmpNationality') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_getEmpNationality
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_getReligion') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_getReligion
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_getFund') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_getFund
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_getRace') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_getRace
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_CessationProvisions') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_CessationProvisions
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'IsHoliday') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION IsHoliday
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'Fn_NoWds') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION Fn_NoWds
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'get_available_leaves_prorated1') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION get_available_leaves_prorated1
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_GetLeaveAvailable') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_GetLeaveAvailable
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_GetNoOfWorkingDays') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_GetNoOfWorkingDays
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_GetAgeGroup') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_GetAgeGroup
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'ConvertToHours') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION ConvertToHours
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'ConvertToMinutes') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION ConvertToMinutes
      
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'fn_MonthAdditionalSalary_NHE') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION fn_MonthAdditionalSalary_NHE
   
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'ufn_IsLeapYear') AND
                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
   DROP FUNCTION ufn_IsLeapYear
   
   
   

GO
/****** Object:  UserDefinedFunction [dbo].[ConvertToMinutes]    Script Date: 09/02/2009 12:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertToMinutes] (@Hour DECIMAL(10, 2))  
RETURNS INT  
-- Input like 1.30 One and half an hour  
    BEGIN  
		Declare @RET AS DECIMAL(10,2)
		if @Hour > 0 
		beGIN
			SET @RET = FLOOR(@Hour) * 60 + ABS(((@Hour % 1) * 100.0 ))
		END
		ELSE
		BEGIN
			SET @RET = -(FLOOR(ABS(@Hour)) * 60 + ABS(((@Hour % 1) * 100.0 )))
		END
		RETURN @RET
	END
GO
/****** Object:  UserDefinedFunction [dbo].[ConvertToHours]    Script Date: 09/02/2009 12:55:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertToHours] (@Minutes INT)      
RETURNS DECIMAL(10, 2)      
-- Returns like 1.30 One and half an hour      
    BEGIN  
  --return CAST( CAST((@Minutes / 60) as varchar(10)) + '.' + CAST((@Minutes % 60) as varchar(10)) as decimal(10,2))      
        RETURN CAST(CAST(@Minutes/60 AS VARCHAR(5)) + '.' + RIGHT('0' + CAST(ABS(@Minutes)%60 AS VARCHAR(2)), 2) AS DECIMAL(10,2))  
  --RETURN CAST(CAST(@Minutes/60 AS VARCHAR(5)) + '.' + RIGHT('0' + CAST(abs(@Minutes)%60 AS VARCHAR(2)), 2) AS DECIMAL(10,2))  
    END  
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getSDLAmount]    Script Date: 09/02/2009 12:55:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_getSDLAmount] (@fundgrossamount INT)
RETURNS FLOAT
AS 
    BEGIN       
        DECLARE @sdlamt FLOAT
        SELECT  @sdlamt = CASE WHEN SDL > 0 AND
                                    SDL <= 2 THEN 2
                               ELSE SDL
                          END
        FROM    (SELECT SDL = CASE WHEN (@fundgrossamount > 0 AND
                                         @fundgrossamount <= 4500
                                        ) THEN (@fundgrossamount * 0.0025)
                                   WHEN (@fundgrossamount >= 4500.00000001) THEN (4500 * 0.0025)
                                   WHEN (@fundgrossamount <= 0) THEN 0
                              END
                ) D
        RETURN @sdlamt
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getPRYears_Emp]    Script Date: 09/02/2009 12:55:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_getPRYears_Emp] (@prDate DATETIME)
RETURNS INT
AS 
    BEGIN   
        DECLARE @dtYears INT  
  
        DECLARE @dtDiff INT  
        SELECT  @dtDiff = DATEDIFF(m, @prDate, GETDATE())
        IF @dtDiff > 24 
           BEGIN   
                 SET @dtYears = 3  
           END   
        IF @dtDiff > 12 AND
           @dtDiff <= 24 
           BEGIN   
                 SET @dtYears = 2  
           END   
        IF @dtDiff <= 12 
           BEGIN   
                 SET @dtYears = 1  
           END   
 
        RETURN @dtYears  
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getFundDetails]    Script Date: 09/02/2009 12:55:12 ******/
/***Olderversionstarts***/
/*SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  
FUNCTION [dbo].[fn_getFundDetails]
       (
        @emp_code INT ,
        @year INT
       )
RETURNS INT
AS 
    BEGIN  
        DECLARE @FundSum INT   
        SELECT  @FundSum = SUM(fund_amount)
        FROM    prepare_payroll_detail
        WHERE   emp_id = @emp_code AND
                Status = 'G' AND
                fund_type IN ('ECF', 'SINDA', 'CCHEST', 'CDAC') AND
                trx_id IN (SELECT   trx_id
                           FROM     prepare_payroll_hdr
                           WHERE    YEAR(start_period) = @year)   
        RETURN @FundSum   
    END
GO
*/
/***Olderversionends***/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE FUNCTION [dbo].[fn_getFundDetails]  
	(  
		@emp_code INT ,  
		@year INT  
	)  
	RETURNS INT  
	AS  
		BEGIN    
			DECLARE @FundSum INT     
			DECLARE @cnt INT
			DECLARE @cnt1 int	
			
			SELECT @cnt = (SELECT COUNT(*) 
				FROM    prepare_payroll_detail  
				WHERE   emp_id = @emp_code AND  
				Status = 'G' AND  
				fund_type IN ('ECF', 'SINDA', 'CCHEST', 'CDAC') AND  
				trx_id IN (SELECT   trx_id  
				FROM     prepare_payroll_hdr  
				WHERE    YEAR(start_period) = @year)     
				)
			--SET @cnt=0
			SELECT @cnt1 =(SELECT count(*) FROM EmployeeEarning where emp_id=@emp_code AND IRYear=@year+1 )  
			IF @cnt>0
					IF (@cnt1>0)
						SELECT @FundSum =(SUM(A.fund_amount)+ SUM(E.Funds)/@cnt) FROM
							(
								SELECT fund_amount,emp_id
								FROM    prepare_payroll_detail  
								WHERE   emp_id = @emp_code AND  
								Status = 'G' AND  
								fund_type IN ('ECF', 'SINDA', 'CCHEST', 'CDAC') AND  
								trx_id IN (SELECT   trx_id  
										   FROM     prepare_payroll_hdr  
										   WHERE    YEAR(start_period) = @year)     
						)A INNER JOIN EmployeeEarning E ON A.emp_id  =E.emp_id AND E.IRYear= @year+1	
					ELSE
						SELECT @FundSum =SUM(A.fund_amount)FROM
						(
								SELECT fund_amount,emp_id
								FROM    prepare_payroll_detail  
								WHERE   emp_id = @emp_code AND  
								Status = 'G' AND  
								fund_type IN ('ECF', 'SINDA', 'CCHEST', 'CDAC') AND  
								trx_id IN (SELECT   trx_id  
										   FROM     prepare_payroll_hdr  
										   WHERE    YEAR(start_period) = @year)     
						)A 
		
			ELSE
				SELECT @FundSum = Funds FROM EmployeeEarning  WHERE Emp_id=@emp_code AND IRYear=@year+1
     
			 RETURN @FundSum       
		END 
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getFundDetailsMBMF]    Script Date: 09/02/2009 12:55:13 ******/
/****Olderversionstarts****/
/*
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE 
FUNCTION [dbo].[fn_getFundDetailsMBMF]
       (
        @emp_code INT ,
        @year INT
       )
RETURNS INT
AS 
    BEGIN  
        DECLARE @FundSum INT   
        SELECT  @FundSum = SUM(fund_amount)
        FROM    prepare_payroll_detail
        WHERE   emp_id = @emp_code AND
                Status = 'G' AND
                fund_type IN ('MBMF') AND
                trx_id IN (SELECT   trx_id
                           FROM     prepare_payroll_hdr
                           WHERE    YEAR(start_period) = @year)   
        RETURN @FundSum   
    END
GO*/
/****Olderversionends****/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_getFundDetailsMBMF]  
(  
	@emp_code INT ,  
	@year INT  
)  
RETURNS INT  
AS   
BEGIN    
	DECLARE @FundSum INT     
	DECLARE @cnt  INT
	DECLARE @cnt1 int	
	
	SELECT @cnt =(
					SELECT COUNT(*) FROM    prepare_payroll_detail  
					WHERE   emp_id = @emp_code AND  
			                Status = 'G' AND  
			                fund_type IN ('MBMF') AND  
			                trx_id IN 
			                (
								SELECT   trx_id
								FROM     prepare_payroll_hdr  
								WHERE    YEAR(start_period) = @year
			                )
				)
		
		--SELECT  @cnt =1
		SELECT @cnt1 =(SELECT count(*) FROM EmployeeEarning where emp_id=@emp_code AND IRYear=@year+1 )  
		IF @cnt>0
			IF @cnt1 >0		
				SELECT  @FundSum = (SUM(A.fund_amount) +SUM(E.MBMF)/@cnt)
				FROM
				(	
					SELECT  fund_amount,emp_id  
					FROM    prepare_payroll_detail  
					WHERE   emp_id = @emp_code AND  
						Status = 'G' AND  
						fund_type IN ('MBMF') AND  
						trx_id IN (SELECT   trx_id  
								   FROM     prepare_payroll_hdr  
								   WHERE    YEAR(start_period) = @year)     
				)A INNER JOIN EmployeeEarning E ON A.emp_id  =E.emp_id AND E.IRYear= @year+1	
			
			ELSE
				SELECT  @FundSum = SUM(A.fund_amount)
				FROM
				(	
					SELECT  fund_amount,emp_id  
					FROM    prepare_payroll_detail  
					WHERE   emp_id = @emp_code AND  
						Status = 'G' AND  
						fund_type IN ('MBMF') AND  
						trx_id IN (SELECT   trx_id  
								   FROM     prepare_payroll_hdr  
								   WHERE    YEAR(start_period) = @year)     
				)A 
		ELSE 
			SELECT @FundSum = MBMF  FROM EmployeeEarning WHERE Emp_id=@emp_code AND IRYear=@year+1
	RETURN @FundSum     
END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_CalculateAdditionWagesBetMonth]    Script Date: 09/02/2009 12:55:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Fn_calculateadditionwagesbetmonth] (@month  INT,
                                                          @cuyear INT,
                                                          @empid  INT)
RETURNS FLOAT
AS
    BEGIN
        DECLARE @layear		INT
        DECLARE @AWCIL		FLOAT
        DECLARE @cpfawcil	FLOAT
        DECLARE @LYOW		FLOAT
        DECLARE @CYOW		FLOAT
        DECLARE @cpfceil	FLOAT
        DECLARE @AWCM		FLOAT
        DECLARE @AWB4CM		FLOAT
        DECLARE @retval		FLOAT

        SET @cpfceil = 4500
        SET @layear = @cuyear - 1
        SET @cpfawcil = 76500
        SET @AWCIL = 0

        --Calculate Last Year Ordinary Wage CPF, Ordinary CPF Ceiling  
        SELECT @LYOW = D.OrdinaryWagesLY
        FROM   (SELECT SUM(T.OrdinaryWagesLY) OrdinaryWagesLY
                FROM   (SELECT Emp_ID,OrdinaryWagesLY = CASE
                                                          WHEN OrdinaryWagesLY >= @cpfceil THEN @cpfceil
                                                          ELSE Isnull(OrdinaryWagesLY, 0)
                                                        END
                        FROM   (SELECT Te.Emp_ID,SUM(OrdinaryWagesLY) OrdinaryWagesLY
                                FROM   (SELECT pd.emp_id,MONTH(ph.start_period) Mth,(pd.cpfnet - pd.cpfAdd_Additional) OrdinaryWagesLY
                                        FROM   prepare_payroll_hdr ph
                                               INNER JOIN prepare_payroll_detail pd ON ph.trx_id = pd.trx_id
                                        WHERE  pd.status = 'G'
                                           AND YEAR(ph.start_period) = @layear
                                           AND pd.CPFNet > 0
                                           AND pd.emp_id = @empid
                                        UNION
                                        SELECT Emp_Code Emp_ID,0 Mth,LYTotalOW OrdinaryWagesLY
                                        FROM   Employee
                                        WHERE  Emp_Code = @empid) TE
                                GROUP  BY TE.Emp_ID) R) T
                GROUP  BY Emp_ID) D

        --Calculate Current Year Ordinary Wage CPF, Ordinary CPF Ceiling  
        SELECT @CYOW = D.OrdinaryWagesCY
        FROM   (SELECT SUM(T.OrdinaryWagesCY) OrdinaryWagesCY
                FROM   (SELECT Emp_ID,OrdinaryWagesCY = CASE
                                                          WHEN OrdinaryWagesCY >= @cpfceil THEN @cpfceil
                                                          ELSE Isnull(OrdinaryWagesCY, 0)
                                                        END
                        FROM   (SELECT pd.emp_id,MONTH(ph.start_period) Mth,(pd.cpfnet - pd.cpfAdd_Additional) OrdinaryWagesCY
                                FROM   prepare_payroll_hdr ph
                                       INNER JOIN prepare_payroll_detail pd ON ph.trx_id = pd.trx_id
                                WHERE  pd.status = 'G'
                                   AND MONTH(ph.start_period) <= @month
                                   AND YEAR(ph.start_period) = @cuyear
                                   AND pd.CPFNet > 0
                                   AND pd.emp_id = @empid) R) T
                GROUP  BY Emp_ID) D

        --Calculate Current Year Addition Wages Paid of current month.  
        SELECT @AWCM = R.AWPaidCYMonth
        FROM   (SELECT R.Emp_Code,SUM(R.AWPaidCYMonth) AWPaidCYMonth
                FROM   (SELECT Emp_Code,MONTH(trx_period) [Mth],SUM(trx_amount) AWPaidCYMonth
                        FROM   emp_additions EA
                               INNER JOIN Additions_types AT ON EA.Trx_Type = AT.ID
                        WHERE  --Status='L' And   
                       (MONTH(trx_period) = @month
                        AND YEAR(trx_period) = @cuyear)
                       AND AT.CPF = 'Yes'
                       AND AT.Type_Of_Wage = 'A'
                       AND Emp_Code = @empid
                        GROUP  BY Emp_Code,MONTH(trx_period)) AS R
                GROUP  BY R.Emp_Code) R

        --Calculate Current Year Addition Wages Paid Less than current month.  
        SELECT @AWB4CM = R.AWPaidCY
        FROM   (SELECT R.Emp_Code,SUM(R.AWPaidCY) AWPaidCY
                FROM   (SELECT Emp_Code,MONTH(trx_period) [Mth],SUM(trx_amount) AWPaidCY
                        FROM   emp_additions EA
                               INNER JOIN Additions_types AT ON EA.Trx_Type = AT.ID
                        WHERE  Status = 'L'
                           AND (MONTH(trx_period) < @month
                                AND YEAR(trx_period) = @cuyear)
                           AND AT.CPF = 'Yes'
                           AND AT.Type_Of_Wage = 'A'
                           AND Emp_Code = @empid
                        GROUP  BY Emp_Code,MONTH(trx_period)) AS R
                GROUP  BY R.Emp_Code) R

        SET @LYOW = Isnull(@LYOW, 0)
        SET @CYOW = Isnull(@CYOW, 0)
        SET @AWCM = Isnull(@AWCM, 0)
        SET @AWB4CM = Isnull(@AWB4CM, 0)

        IF (@LYOW = 0
            AND @CYOW > 0
            AND @AWCM > 0
            AND @AWB4CM >= 0)
            BEGIN
                SET @AWCIL = @cpfawcil - @CYOW

                IF (@AWCIL <= @AWCM)
                    BEGIN
                        SET @retval = @AWCIL
                    END
                ELSE
                    BEGIN
                        SET @retval = @AWCM
                    END
            END

        IF (@LYOW > 0
            AND @CYOW > 0
            AND @AWCM > 0
            AND @AWB4CM >= 0
            AND @month < 12)
            BEGIN
                SET @AWCIL = @cpfawcil - @LYOW

                IF (@AWCIL <= @AWCM)
                    BEGIN
                        SET @retval = @AWCIL
                    END
                ELSE
                    BEGIN
                        SET @retval = @AWCM
                    END
            END

        RETURN @retval
    END 
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GENPayrollAWCalc]    Script Date: 09/02/2009 12:55:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GENPayrollAWCalc]
       (
        @month INT ,
        @cuyear INT ,
        @empid INT ,
        @basicascmow FLOAT      
       )
RETURNS FLOAT
AS 
    BEGIN      
      
--Declare @month  int      
--Declare @cuyear  int      
--Declare @empid  int      
        DECLARE @layear INT      
        DECLARE @AWCIL FLOAT      
        DECLARE @cpfawcil FLOAT      
        DECLARE @LYOW FLOAT      
        DECLARE @CYOW FLOAT      
        DECLARE @CMOW FLOAT      
        DECLARE @cpfceil FLOAT      
        DECLARE @AWCM FLOAT      
        DECLARE @AWB4CM FLOAT      
        DECLARE @retval FLOAT      
        DECLARE @monthid INT      
        DECLARE @awinloop FLOAT      
        DECLARE @awinloopsum FLOAT      
        DECLARE @leftcumonth INT      
        DECLARE @ACTCIL FLOAT      
--Declare @basicascmow float      
      
--Set @month   = 12      
--Set @empid   = 3      
--Set @cuyear  = 2008      
        SET @layear = @cuyear - 1      
        SET @awinloopsum = 0      
        SET @awinloop = 0      
        SET @cpfceil = 4500      
        SET @cpfawcil = 76500      
        SET @AWCIL = 0      
        SET @retval = 0      
        SELECT  @leftcumonth = MONTH(termination_date)
        FROM    Employee
        WHERE   Emp_Code = @empid AND
                MONTH(termination_date) < 12      
--Calculate Last Year Ordinary Wage CPF, Ordinary CPF Ceiling      
        SELECT  @LYOW = D.OrdinaryWagesLY
        FROM    (SELECT SUM(T.OrdinaryWagesLY) OrdinaryWagesLY
                 FROM   (SELECT Emp_ID, SUM(OrdinaryWagesLY) OrdinaryWagesLY
                         FROM   (SELECT Emp_ID ,
                                        OrdinaryWagesLY = CASE WHEN OrdinaryWagesLY >= @cpfceil THEN @cpfceil
                                                               ELSE ISNULL(OrdinaryWagesLY, 0)
                                                          END
                                 FROM   (SELECT Te.Emp_ID ,
                                                OrdinaryWagesLY OrdinaryWagesLY
                                         FROM   (SELECT pd.emp_id ,
                                                        MONTH(ph.start_period) Mth ,
                                                        (pd.cpfnet - pd.cpfAdd_Additional) OrdinaryWagesLY
                                                 FROM   prepare_payroll_hdr ph
                                                 INNER JOIN prepare_payroll_detail pd ON ph.trx_id = pd.trx_id
                                                 WHERE  pd.status = 'G' AND
                                                        YEAR(ph.start_period) = @layear AND
                                                        pd.CPFNet > 0 AND
                                                        pd.emp_id = @empid
                                                ) TE
                                        ) R
                                ) D
                         GROUP BY Emp_ID
                         UNION
                         SELECT Emp_Code Emp_ID, ISNULL(LYTotalOW, 0) OrdinaryWagesLY
                         FROM   Employee
                         WHERE  Emp_Code = @empid AND
                                OWLastYear = @cuyear
                        ) T
                 GROUP BY Emp_ID
                ) D      
      
--Calculate Current Year Ordinary Wage CPF, Ordinary CPF Ceiling      
        SELECT  @CYOW = D.OrdinaryWagesCY
        FROM    (SELECT SUM(T.OrdinaryWagesCY) OrdinaryWagesCY
                 FROM   (SELECT Emp_ID ,
                                OrdinaryWagesCY = CASE WHEN OrdinaryWagesCY >= @cpfceil THEN @cpfceil
                                                       ELSE ISNULL(OrdinaryWagesCY, 0)
                                                  END
                         FROM   (SELECT pd.emp_id ,
                                        MONTH(ph.start_period) Mth ,
                                        (pd.cpfnet - pd.cpfAdd_Additional) OrdinaryWagesCY
                                 FROM   prepare_payroll_hdr ph
                                 INNER JOIN prepare_payroll_detail pd ON ph.trx_id = pd.trx_id
                                 WHERE  pd.status = 'G' AND
                                        MONTH(ph.start_period) < @month AND
                                        YEAR(ph.start_period) = @cuyear AND
                                        pd.CPFNet > 0 AND
                                        pd.emp_id = @empid
                                ) R
                        ) T
                 GROUP BY Emp_ID
                ) D      
      
      
----Calculate Current Year Current Month Ordinary Wages.       
        SELECT  @CMOW = CASE WHEN R.AWPaidCYMonth >= @cpfceil THEN @cpfceil
                             ELSE ISNULL(R.AWPaidCYMonth, 0)
                        END
        FROM    (SELECT R.Emp_Code, SUM(R.AWPaidCYMonth) AWPaidCYMonth
                 FROM   (SELECT Emp_Code, MONTH(trx_period) [Mth], SUM(trx_amount) AWPaidCYMonth
                         FROM   emp_additions EA
                         INNER JOIN Additions_types AT ON EA.Trx_Type = AT.ID
                         WHERE  --Status='L' And       
                                (MONTH(trx_period) = @month AND
                                 YEAR(trx_period) = @cuyear
                                ) AND
                                AT.CPF = 'Yes' AND
                                (AT.Type_Of_Wage = 'O' OR
                                 AT.Type_Of_Wage IS NULL
                                ) AND
                                Emp_Code = @empid
                         GROUP BY Emp_Code, MONTH(trx_period)
                        ) AS R
                 GROUP BY R.Emp_Code
                ) R      
      
  --'CMOW if null or no record found then set it to zero'  
        SET @CMOW = ISNULL(@CMOW, 0)  
  
        IF @LYOW <= 0 
           BEGIN      
     --Change on December 8th 2009  
--                 IF @basicascmow >= 4500   
--                    BEGIN      
--                          SET @basicascmow = 4500      
--                    END      
--                 IF @basicascmow <= 0   
--                    BEGIN      
--                          SET @basicascmow = 0      
--                    END      
--                 SET @CYOW = ISNULL(@CYOW, 0) + ISNULL(@CMOW, 0) + ISNULL(@basicascmow, 0)      
  
                 IF (ISNULL(@CMOW, 0) + ISNULL(@basicascmow, 0)) >= 4500 
                    BEGIN      
                          SET @basicascmow = 4500      
                    END      
                 IF ISNULL(@CMOW, 0) + ISNULL(@basicascmow, 0) <= 0 
                    BEGIN      
                          SET @basicascmow = 0      
                    END  
                 SET @CYOW = ISNULL(@CYOW, 0) + ISNULL(@basicascmow, 0)      
           END      
      
      
--Calculate Current Year Addition Wages Paid of current month.      
        SELECT  @AWCM = R.AWPaidCYMonth
        FROM    (SELECT R.Emp_Code, SUM(R.AWPaidCYMonth) AWPaidCYMonth
                 FROM   (SELECT Emp_Code, MONTH(trx_period) [Mth], SUM(trx_amount) AWPaidCYMonth
                         FROM   emp_additions EA
                         INNER JOIN Additions_types AT ON EA.Trx_Type = AT.ID
                         WHERE  --Status='L' And       
                                (MONTH(trx_period) = @month AND
                                 YEAR(trx_period) = @cuyear
                                ) AND
                                AT.CPF = 'Yes' AND
                                AT.Type_Of_Wage = 'A' AND
                                Emp_Code = @empid
                         GROUP BY Emp_Code, MONTH(trx_period)
                        ) AS R
                 GROUP BY R.Emp_Code
                ) R      
      
      
--Calculate Current Year Addition Wages Paid Less than current month.      
        SELECT  @AWB4CM = R.AWPaidCY
        FROM    (SELECT R.Emp_Code, SUM(R.AWPaidCY) AWPaidCY
                 FROM   (SELECT Emp_Code, MONTH(trx_period) [Mth], SUM(trx_amount) AWPaidCY
                         FROM   emp_additions EA
                         INNER JOIN Additions_types AT ON EA.Trx_Type = AT.ID
                         WHERE  Status = 'L' AND
                                (MONTH(trx_period) < @month AND
                                 YEAR(trx_period) = @cuyear
                                ) AND
                                AT.CPF = 'Yes' AND
                                AT.Type_Of_Wage = 'A' AND
                                Emp_Code = @empid
                         GROUP BY Emp_Code, MONTH(trx_period)
                        ) AS R
                 GROUP BY R.Emp_Code
                ) R      
      
        SET @LYOW = ISNULL(@LYOW, 0)      
        SET @CYOW = ISNULL(@CYOW, 0)      
        SET @AWCM = ISNULL(@AWCM, 0)      
        SET @AWB4CM = ISNULL(@AWB4CM, 0)      
        SET @leftcumonth = ISNULL(@leftcumonth, 0)      
      
      
        IF @month < 12 AND
           @AWCM <= 0 AND
           @leftcumonth != @month 
           BEGIN      
                 RETURN @retval      
           END      
      
        IF (@LYOW = 0 AND
            @CYOW >= 0 AND
            @AWCM > 0 AND
            @AWB4CM = 0
           ) 
           BEGIN       
                 SET @AWCIL = @cpfawcil - @CYOW      
                 IF (@AWCIL <= @AWCM) 
                    BEGIN      
                          SET @retval = @AWCIL      
                    END       
                 ELSE 
                    BEGIN      
                          SET @retval = @AWCM      
                    END      
           END      
      
        IF (@LYOW > 0 AND
            @CYOW > 0 AND
            @AWCM > 0 AND
            @AWB4CM = 0 AND
            @month < 12
           ) 
           BEGIN       
                 SET @AWCIL = @cpfawcil - @LYOW      
                 IF (@AWCIL <= @AWCM) 
                    BEGIN      
                          SET @retval = @AWCIL      
                    END       
                 ELSE 
                    BEGIN      
                          SET @retval = @AWCM      
                    END      
           END      
      
      
      
        IF (@LYOW >= 0 AND
            @CYOW >= 0 AND
            @AWCM >= 0 AND
            @AWB4CM >= 0 AND
            @month <= 12
           ) 
           BEGIN      
 --Print 'Loop Start'      
      
                 DECLARE db_cursor CURSOR FOR        
                 SELECT MONTH(trx_period) [Mth]      
                 FROM emp_additions EA      
                 INNER JOIN Additions_types AT      
                 ON EA.Trx_Type=AT.ID      
                 WHERE Status='L'      
                 AND (MONTH(trx_period) < @month AND YEAR(trx_period) = @cuyear)      
                 AND AT.CPF='Yes' AND AT.Type_Of_Wage = 'A' AND Emp_Code = @empid      
                 GROUP BY Emp_Code, MONTH(trx_period)       
                 OPEN db_cursor         
                 FETCH NEXT FROM db_cursor INTO @monthid      
    
    
                 WHILE @@FETCH_STATUS = 0 
                       BEGIN    
                             SELECT @awinloop = dbo.fn_CalculateAdditionWagesBetMonth(@monthid, @cuyear, @empid)      
                             SET @awinloopsum = @awinloopsum + ISNULL(@awinloop, 0)    
                             FETCH NEXT FROM db_cursor INTO @monthid      
                       END         
      
 --Print @awinloopsum      
                 CLOSE db_cursor         
                 DEALLOCATE db_cursor       
      
 --Print 'Loop End'      
                 IF @month < 12 AND
                    @LYOW > 0 
                    BEGIN      
                          SET @ACTCIL = @cpfawcil - @LYOW      
                    END      
                 ELSE 
                    BEGIN      
                          SET @ACTCIL = @cpfawcil - @CYOW      
                    END      
      
                 IF @month < 12 
                    BEGIN      
                          SET @AWCIL = @cpfawcil - @LYOW      
                    END       
      
                 IF @month = 12 AND
                    @LYOW > 0 
                    BEGIN      
                          SET @AWCIL = @cpfawcil - @LYOW      
                    END      
                 IF @month = 12 AND
                    @LYOW <= 0 
                    BEGIN      
                          SET @AWCIL = @cpfawcil - @CYOW      
                    END      
      
                 IF @leftcumonth = @month 
                    BEGIN      
                          SET @AWCIL = @AWCIL - @AWB4CM      
                    END      
      
      
                 IF @month < 12 
                    BEGIN      
                          IF @LYOW <= 0 
                             BEGIN      
                                   SET @retval = (@AWCIL - @CYOW) - ISNULL(@awinloopsum, 0)      
                                   IF (@retval > @AWCM) 
                                      BEGIN      
                                            SET @retval = @AWCM      
                                      END      
                             END      
                          ELSE 
                             BEGIN      
                                   IF @LYOW > 0 --And @leftcumonth = @month Removed if Left Current Month...      
                                      BEGIN      
                                            IF @ACTCIL <= (@AWB4CM + @AWCM) 
                                               BEGIN       
                                                     SET @retval = @ACTCIL - ISNULL(@awinloopsum, 0)      
                                               END      
                                            IF @ACTCIL > (@AWB4CM + @AWCM) 
                                               BEGIN       
                                                     SET @retval = (@AWB4CM + @AWCM) - ISNULL(@awinloopsum, 0)  
                                               END      
      
                                            IF @retval >= @AWCIL 
                                               BEGIN       
                                                     SET @retval = @AWCIL      
                                               END      
                                      END      
                             END      
                    END      
      
                 IF @month = 12 
                    BEGIN     
       --change on dec 8 2009 for goodwood   
--                          SET @retval = @AWCIL - ISNULL(@awinloopsum, 0)      
--                          IF @ACTCIL > (@AWCM + @AWB4CM)   
--                             BEGIN      
--                                   SET @retval = (@AWCM + @AWB4CM)      
--                             END      
--                          ELSE   
--                             BEGIN      
--                                   IF (@cpfawcil - (@CMOW + @CYOW)) < (@AWCM + @AWB4CM) AND  
--                                      @LYOW > 0   
--                                      BEGIN      
--                                            IF (@AWCIL >= @ACTCIL)   
--                                               BEGIN      
--                                                     SET @retval = 0      
--                                               END      
--                                      END       
--                             END  
  
                          IF (ISNULL(@CMOW, 0) + ISNULL(@basicascmow, 0)) >= 4500 
                             BEGIN      
                                   SET @basicascmow = 4500      
                             END      
                          IF ISNULL(@CMOW, 0) + ISNULL(@basicascmow, 0) <= 0 
                             BEGIN      
                                   SET @basicascmow = 0      
                             END  
  
                          SET @CYOW = ISNULL(@CYOW, 0) + ISNULL(@basicascmow, 0) 
                          SET @ACTCIL = @cpfawcil - @CYOW
                          IF (@ACTCIL >= (@AWCM + @AWB4CM) AND
                              @AWCM > 0
                             ) 
                             BEGIN    
                                   SET @retval = @AWCM
                             END  
                          IF (@ACTCIL >= (@AWCM + @AWB4CM) AND
                              @AWCM <= 0
                             ) 
                             BEGIN    
                                   SET @retval = 0
                             END  
                          IF (@ACTCIL < (@AWCM + @AWB4CM) AND
                              @AWCM >= 0
                             ) 
                             BEGIN    
                                   SET @retval = @ACTCIL - (@AWCM + @AWB4CM)
                             END  
                          IF (@ACTCIL < (@AWCM + @AWB4CM) AND
                              @AWCM < 0
                             ) 
                             BEGIN    
                                   SET @retval = 0
                             END    
                    END      
           END      
      
        IF (@AWCM + @AWB4CM) > 0 
           BEGIN      
                 SET @retval = ISNULL(@retval, 0)      
           END      
        ELSE 
           BEGIN      
                 SET @retval = 0      
           END     
--  SELECT  @CMOW CMOW, @LYOW LYOW, @CYOW CYOW, @cpfawcil CPFAWCIL,@AWCIL EST_AWCIL, @ACTCIL ACTCIL, @AWCM AWCM, @AWB4CM AWB4CM,  
-- (@AWCM + @AWB4CM) AWCM_AWB4CM, @retval AWCPF  
  
--Print 'LY   OW:' + Convert(varchar,isnull(@LYOW,0))      
--Print 'CY   OW:' + Convert(varchar,isnull(@CYOW,0))      
--Print 'CM   AW:' + Convert(varchar,isnull(@AWCM,0))      
--Print 'B4CM AW:' + Convert(varchar,isnull(@AWB4CM,0))      
--Print 'Est AW Ceiling:' + Convert(varchar,isnull(@AWCIL,0))      
--Print 'Actual Ceiling:' + Convert(varchar,isnull(@ACTCIL,0)) + ' Applies only on Last Month'      
--Print 'AW CPF Subject:' + Convert(varchar,isnull(@retval,0))      
      
--        IF @retval < 0 AND  
--           @leftcumonth != @month   
--           BEGIN      
--                 SET @retval = 0      
--           END      
--      
--        IF @retval < 0 AND  
--           @leftcumonth = @month   
--           BEGIN      
--    SET @retval = ABS(@retval)      
--           END  
             
        RETURN @retval  
    END 
GO
/****** Object:  UserDefinedFunction [dbo].[fnGetFundAmt]    Script Date: 09/02/2009 12:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fnGetFundAmt]
       (
        @sal AS NUMERIC(18, 2) ,
        @race AS VARCHAR(50)
       )
RETURNS NUMERIC(18, 2)
AS 
    BEGIN
        DECLARE @type AS VARCHAR(50)
        DECLARE @amt AS NUMERIC(18, 2)
        DECLARE @row AS INTEGER

        SELECT  @amt = 0
        IF @race LIKE '%INDIA%' 
           SELECT   @type = 'SINDA'
        IF @race LIKE '%MALAY%' 
           SELECT   @type = 'MBMF'
        IF @race LIKE '%EURA%' 
           SELECT   @type = 'ECF'
        IF @race LIKE '%CHIN%' 
           SELECT   @type = 'CDAC'

--select top 1 @amt = fund_amount from funds_calcs where fund_type = @type
--and sal_to < @sal order by row_id desc
        SELECT TOP 1
                @row = row_id
        FROM    funds_calcs
        WHERE   fund_type = @type AND
                sal_to < @sal
        ORDER BY row_id DESC

        SELECT TOP 1
                @amt = fund_amount
        FROM    funds_calcs
        WHERE   fund_type = @type AND
                row_id > @row
        ORDER BY row_id 

        RETURN @amt
    END
GO
/****** Object:  UserDefinedFunction [dbo].[GetEmpFundContribution]    Script Date: 09/02/2009 12:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetEmpFundContribution]
       (
        @salary MONEY ,
        @fund_type VARCHAR(10)
       )
RETURNS FLOAT
AS 
    BEGIN 
        DECLARE @fund_amount FLOAT 
	
        IF @fund_type = 'MBMF' AND
           @salary < 200 
           BEGIN
                 SET @fund_amount = 0
           END	
        ELSE 
           IF @fund_type = 'SDL' 
              BEGIN
                    SELECT  @fund_amount = @salary * (fund_amount / 100)
                    FROM    funds_calcs
                    WHERE   fund_type = 'SDL'

                    IF @fund_amount < 2 
                       SET @fund_amount = 2
              END
           ELSE 
              BEGIN
                    IF (@fund_type = 'MBMF' AND
                        YEAR(GETDATE()) <= 2009 AND
                        MONTH(GETDATE()) <= 2
                       ) --This is done becoz MBMF is got changed from March 
                       BEGIN
                             IF (@salary BETWEEN 1 AND 1000) 
                                BEGIN
                                      SET @fund_amount = 2
                                END
                             ELSE 
                                IF (@salary BETWEEN 1001 AND 2000) 
                                   BEGIN
                                         SET @fund_amount = 3
                                   END
                                ELSE 
                                   IF (@salary BETWEEN 2001 AND 3000) 
                                      BEGIN
                                            SET @fund_amount = 4
                                      END
                                   ELSE 
                                      IF (@salary BETWEEN 3001 AND 4000) 
                                         BEGIN
                                               SET @fund_amount = 8.5
                                         END
                                      ELSE 
                                         IF (@salary BETWEEN 4001 AND 100000) 
                                            BEGIN
                                                  SET @fund_amount = 11
                                            END
                       END
                    ELSE 
                       BEGIN
                             SELECT @fund_amount = fund_amount
                             FROM   funds_calcs
                             WHERE  (@salary BETWEEN sal_from AND sal_to) AND
                                    fund_type = @fund_type
                       END
              END
	
        RETURN ISNULL(@fund_amount, 0)
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetEmpCPF_Amount]    Script Date: 09/02/2009 12:55:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetEmpCPF_Amount]
       (
        @pr_years INT ,
        @sal FLOAT ,
        @emp_group INT ,
        @age_group INT
       )
RETURNS FLOAT
    BEGIN
        IF @sal > 500 AND
           @sal < 501 
           SET @sal = 501
        IF @sal > 750 AND
           @sal < 751 
           SET @sal = 751
        IF @sal > 1200 AND
           @sal < 1201 
           SET @sal = 1201

        DECLARE @rowID INT
        SELECT  @rowID = row_id
        FROM    CPFAmount_hdr
        WHERE   pr_years = @pr_years AND
                emp_group = @emp_group AND
                @sal BETWEEN sal_from AND sal_to

        DECLARE @comp NVARCHAR(50)
        DECLARE @param NVARCHAR(50)
        DECLARE @rez FLOAT
        SELECT  @comp = employer_cpf
        FROM    CPFAmount_detail
        WHERE   hdr_id = @rowID AND
                age_group = @age_group	
        SET @comp = N'set @rez= ' + @comp
        SET @param = N'@rez float output, @SAL float'
        EXEC sp_executesql @comp, @param, @rez OUTPUT, @sal
        RETURN @rez
	
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetLeaveAvailable]    Script Date: 09/02/2009 12:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetLeaveAvailable]
       (
        @empid INT ,
        @leavetype INT ,
        @stDate VARCHAR(10) ,
        @enDate VARCHAR(10)
       )
RETURNS NUMERIC(9, 1)
AS 
    BEGIN        
        DECLARE @LeaveAvail AS NUMERIC(9, 1)
        DECLARE @startdtsub DATETIME    
        DECLARE @enddtsub DATETIME  
        DECLARE @year INT

        SET @year = YEAR(CONVERT(DATETIME, @stDate, 103))
        SET @startdtsub = CONVERT(DATETIME, '01/01/' + CAST(@year AS VARCHAR(4)), 103)    
        SET @enddtsub = CONVERT(DATETIME, '31/12/' + CAST(@year AS VARCHAR(4)), 103)  


        SELECT  @LeaveAvail = (LeaveAllowed - PaidLeaves)
        FROM    (SELECT Re.ID ,
                        Re.Emp_ID ,
                        Re.Leave_Year ,
                        Re.Type ,
                        CompanyLeaveAllowed = CASE WHEN LA.Leaves_Allowed IS NULL THEN 0
                                                   ELSE LA.Leaves_Allowed
                                              END ,
                        LeaveAllowed = CASE WHEN EL.Leaves_Allowed IS NULL THEN 0
                                            ELSE EL.Leaves_Allowed
                                       END ,
                        PaidLeaves = CASE WHEN Re.PaidLeaves IS NULL THEN 0
                                          ELSE RE.PaidLeaves
                                     END ,
                        UnpaidLeaves = CASE WHEN Re.UnpaidLeaves IS NULL THEN 0
                                            ELSE RE.UnpaidLeaves
                                       END
                 FROM   (SELECT @empid Emp_ID, @year Leave_Year, D.ID, D.Type, SUM(PaidLeaves) PaidLeaves,
                                SUM(UnPaidLeaves) UnPaidLeaves
                         FROM   (SELECT D.ID ,
                                        DATENAME(month, '1900/' + CAST(D.Mth AS VARCHAR(2)) + '/01') Mthname ,
                                        D.Type ,
                                        E.PaidLeaves ,
                                        F.UnpaidLeaves
                                 FROM   (SELECT DISTINCT
                                                (MONTH(DateInYear)) Mth, L.ID, L.Type
                                         FROM   DateInYear
                                         CROSS JOIN Leave_Types L
                                         WHERE  L.CompanyID = -1
                                        ) D
                                 LEFT OUTER JOIN (SELECT    Emp_ID, leave_type, Mth, SUM(PaidLeaves) PaidLeaves
                                                  FROM      (SELECT El.Emp_ID, el.leave_type, MONTH(Eld.leave_date) Mth,
                                                                    CONVERT(DECIMAL(8, 1), CONVERT(DECIMAL(8, 2), COUNT(Eld.halfday_leave)) /
                                                                    2) PaidLeaves
                                                             FROM   Emp_Leaves el
                                                             INNER JOIN emp_Leaves_Detail Eld ON el.trx_id = eld.trx_id
                                                             WHERE  El.Emp_ID = @empid AND
                                                                    (Eld.Leave_Date >= @startdtsub AND
                                                                     Eld.Leave_Date <= @enddtsub
                                                                    ) AND
                                                                    (Eld.unpaid_leave = 0 AND
                                                                     eld.halfday_leave = 1
                                                                    ) AND
                                                                    El.Status = 'Approved'
                                                             GROUP BY El.Emp_Id, el.leave_type, MONTH(Eld.leave_date)
                                                             UNION ALL
                                                             SELECT El.Emp_Id, el.leave_type, MONTH(Eld.leave_date) Mth,
                                                                    COUNT(Eld.unpaid_leave) PaidLeaves
                                                             FROM   Emp_Leaves el
                                                             INNER JOIN emp_Leaves_Detail Eld ON el.trx_id = eld.trx_id
                                                             WHERE  El.Emp_ID = @empid AND
                                                                    (Eld.Leave_Date >= @startdtsub AND
                                                                     Eld.Leave_Date <= @enddtsub
                                                                    ) AND
                                                                    (Eld.unpaid_leave = 0 AND
                                                                     eld.halfday_leave = 0
                                                                    ) AND
                                                                    El.Status = 'Approved'
                                                             GROUP BY El.Emp_Id, el.leave_type, MONTH(Eld.leave_date)
                                                            ) D
                                                  GROUP BY  D.Emp_ID, D.leave_type, D.Mth
                                                 ) E ON D.Mth = E.Mth AND
                                                        E.Leave_Type = D.ID
                                 LEFT OUTER JOIN (SELECT    Emp_ID, leave_type, Mth, SUM(UnpaidLeaves) UnpaidLeaves
                                                  FROM      (SELECT El.Emp_Id, el.leave_type, MONTH(Eld.leave_date) Mth,
                                                                    SUM(Eld.unpaid_leave) / 2 UnpaidLeaves
                                                             FROM   Emp_Leaves el
                                                             INNER JOIN emp_Leaves_Detail Eld ON el.trx_id = eld.trx_id
                                                             WHERE  El.Emp_ID = @empid AND
                                                                    (Eld.Leave_Date >= @startdtsub AND
                                                                     Eld.Leave_Date <= @enddtsub
                                                                    ) AND
                                                                    (Eld.unpaid_leave = 1 AND
                                                                     eld.halfday_leave = 1
                                                                    ) AND
                                                                    El.Status = 'Approved'
                                                             GROUP BY El.Emp_Id, EL.Leave_Type, MONTH(Eld.leave_date)
                                                             UNION ALL
                                                             SELECT El.Emp_Id, el.leave_type, MONTH(Eld.leave_date) Mth,
                                                                    SUM(Eld.unpaid_leave) UnpaidLeaves
                                                             FROM   Emp_Leaves el
                                                             INNER JOIN emp_Leaves_Detail Eld ON el.trx_id = eld.trx_id
                                                             WHERE  El.Emp_ID = @empid AND
                                                                    (Eld.Leave_Date >= @startdtsub AND
                                                                     Eld.Leave_Date <= @enddtsub
                                                                    ) AND
                                                                    (Eld.unpaid_leave = 1 AND
                                                                     eld.halfday_leave = 0
                                                                    ) AND
                                                                    El.Status = 'Approved'
                                                             GROUP BY El.Emp_Id, EL.Leave_Type, MONTH(Eld.leave_date)
                                                            ) D
                                                  GROUP BY  D.Emp_ID, D.leave_type, D.Mth
                                                 ) F ON D.Mth = E.Mth AND
                                                        F.Leave_Type = D.ID
                                ) D
                         GROUP BY D.ID, D.Type
                        ) Re
                 LEFT OUTER JOIN EmployeeLeavesAllowed EL ON RE.Emp_ID = EL.Emp_ID AND
                                                             RE.ID = EL.Leave_Type AND
                                                             RE.Leave_Year = EL.Leave_Year
                 LEFT OUTER JOIN Leaves_allowed LA ON RE.ID = LA.Leave_Type AND
                                                      LA.Leave_Year = @year
                ) F
        WHERE   ID = @leavetype

        RETURN  @LeaveAvail     
    END
GO
/****** Object:  UserDefinedFunction [dbo].[get_available_leaves_prorated1]    Script Date: 09/02/2009 12:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Select dbo.get_available_leaves_prorated1('30/04/2010',2, 'HPS18')  
--Update Employee Set Joining_Date='12/01/2009' Where Emp_Code=53
--Update EmployeeLeavesAllowed Set Leaves_Allowed=13,LY_Leaves_Bal=3  Where EMp_ID=53
--Select dbo.get_available_leaves_prorated1('30/08/2010',2, 'HPS53')  
CREATE FUNCTION [dbo].[Get_available_leaves_prorated1] (@enDate   VARCHAR(10),
                                                        @compid   INT,
                                                        @username VARCHAR(50))
RETURNS FLOAT
AS
    BEGIN
--          DECLARE  @enDate   VARCHAR(10),      
--                   @compid   INT,      
--                   @username VARCHAR(50)      
--          SELECT @enDate = '30/08/2010',      
--                 @compid = 2,      
--                 @username = 'HPS53'      
        DECLARE @mthdiff AS FLOAT
        DECLARE @roundfor INT
        DECLARE @dt_leave_prorate FLOAT
        DECLARE @dt_leave_earn FLOAT
        DECLARE @denominator INT
        DECLARE @retVal FLOAT
        DECLARE @dt_enDate DATETIME
        DECLARE @dt_joiningDate DATETIME
        DECLARE @dt_leave_allowed FLOAT
        DECLARE @dt_leave_remaining FLOAT
        DECLARE @dt_last_year_leaves FLOAT
        DECLARE @dt_leaves_taken FLOAT
        DECLARE @dt_leaves_taken_ded FLOAT
        DECLARE @group_id INT
        DECLARE @emp_code INT
        DECLARE @leave_model INT

        SET @retVal = 0.0
        SET @dt_enDate = CONVERT(DATETIME, @enDate, 103)
        SET @dt_last_year_leaves = 0.0

        SELECT @leave_model = Isnull(leave_model, 5)
        FROM   company
        WHERE  company_id = @compid

        SELECT @emp_code = emp_code,@group_id = emp_group_id,@dt_joiningDate = joining_date
        FROM   employee
        WHERE  username = @username

        SELECT @dt_leave_allowed = Isnull(leaves_allowed, 0)
        FROM   leaves_allowed
        WHERE  group_id = @group_id
           AND leave_type = 8
           AND leave_year = YEAR(@dt_enDate)

        --        IF (@dt_leave_remaining < @dt_leave_allowed)    
        --            BEGIN    
        --                --PRINT 'Step-1'      
        --                SET @dt_last_year_leaves = Isnull(@dt_leave_remaining, 0) - Isnull(@dt_leave_allowed, 0)    
        --                SET @dt_last_year_leaves = 0    
        --            END    
        --        ELSE    
        --            BEGIN    
        --                --PRINT 'Step-2'      
        --                SET @dt_last_year_leaves = Isnull(@dt_leave_remaining, 0) - Isnull(@dt_leave_allowed, 0)    
        --            END    
        SELECT @dt_leave_remaining = SUM(Isnull(leaves_allowed, 0)),@dt_last_year_leaves = SUM(Isnull(LY_Leaves_Bal, 0))
        FROM   employeeleavesallowed
        WHERE  emp_id = @emp_code
           AND leave_year <= YEAR(@dt_enDate)
           AND leave_type = 8

        IF MONTH(@dt_enDate) = 12
            BEGIN
                SET @roundfor = 50
            END
        ELSE
            BEGIN
                SET @roundfor = 50
            END

        --IF (YEAR(@dt_joiningDate) = YEAR(@dt_enDate)) ---THIS IF CONDITIONS NEED TO BE DELETED AND KEEP ONLY ELSE CONDITION NO NED OF THIS NOW on 19 march 2010 onwards      
        IF (YEAR(@dt_joiningDate) = 132123)
            BEGIN
                --PRINT 'Step-3'      
                IF (MONTH(@dt_joiningDate) > MONTH(Dateadd(m, -1, @dt_enDate)))
                    BEGIN
                        --PRINT 'Step-4'      
                        SET @retVal = @dt_last_year_leaves + 0
                    END
                ELSE
                    BEGIN
                        --PRINT 'Step-5'      
                        IF (@leave_model != 7)
                            BEGIN
                                SET @dt_leave_allowed = (Round(Isnull(@dt_leave_allowed, 0) / 12, @roundfor)) * (12 - (MONTH(@dt_joiningDate) - 1)) --12                                    
                            END

                        IF (YEAR(@dt_joiningDate) != YEAR(@dt_enDate))
                            BEGIN
                                --PRINT 'Step-6'      
                                SET @dt_leave_prorate = Round((CAST(@dt_leave_allowed AS FLOAT) / (12)), @roundfor) --santy                    
                            END
                        ELSE
                            BEGIN
                                --PRINT 'Step-7'      
                                SET @dt_leave_prorate = Round((CAST(@dt_leave_allowed AS FLOAT) / (13 - MONTH(@dt_joiningDate))), @roundfor) --santy                    
                            --select year(@dt_joiningDate), year(@dt_enDate), @dt_leave_prorate      
                            END

                        IF (MONTH(Dateadd(m, -1, @dt_joiningDate)) = 12) --Same Year but Month gets set back i.e 12 on this case set it back to 1                   
                            BEGIN
                                --PRINT 'Step-8'      
                                SET @dt_leave_earn = @dt_leave_prorate * ((MONTH(@dt_enDate)) - (0))
                            END
                        ELSE
                            BEGIN
                                --PRINT 'Step-9'      
                                IF ((YEAR(@dt_joiningDate) != YEAR(@dt_enDate))
                                    AND (MONTH(@dt_joiningDate) = 1))
                                    BEGIN
                                        --PRINT 'Step-10'      
                                        SET @dt_leave_earn = @dt_leave_prorate * ((MONTH(@dt_enDate)) - (MONTH(Dateadd(m, -1, @dt_joiningDate))))
                                    END
                                ELSE
                                    BEGIN
                                        --PRINT 'Step-11'      
                                        IF (MONTH(@dt_enDate) = 12)
                                            BEGIN
                                                --PRINT 'Step-12'      
                                                SET @dt_leave_earn = @dt_leave_prorate * ((MONTH(@dt_enDate)) - (MONTH(Dateadd(m, -1, @dt_joiningDate))))
                                            END
                                        ELSE
                                            BEGIN
                                                --PRINT 'Step-13'      
                                                SET @dt_leave_earn = @dt_leave_prorate * ((MONTH(@dt_enDate)) - (MONTH(Dateadd(m, 0, @dt_joiningDate))))
                                            END
                                    END
                            END

                        SELECT @dt_leave_remaining = Isnull(leave_remaining, 0)
                        FROM   leaves_annual
                        WHERE  leave_year = YEAR(@dt_enDate)
                           AND emp_id = @emp_code

                        IF (@dt_leave_remaining > @dt_leave_allowed)
                            BEGIN
                                --PRINT 'Step-14'      
                                SET @retVal = (@dt_leave_remaining - @dt_leave_allowed) + @dt_leave_earn
                            END
                        ELSE
                            BEGIN
                                --PRINT 'Step-15'      
                                IF @dt_last_year_leaves < 0
                                    BEGIN
                                        --PRINT 'Step-16'      
                                        SET @retVal = @dt_leave_earn
                                        SET @retVal = @dt_leave_earn - (@dt_leave_allowed - @dt_leave_remaining)
                                    END
                                ELSE
                                    BEGIN
                                        --PRINT 'Step-17'      
                                        SET @retVal = @dt_leave_earn - (@dt_leave_allowed - @dt_leave_remaining)
                                    END
                            --Select @retVal retval, @dt_leave_earn dt_leave_earn, @dt_leave_allowed dt_leave_allowed, @dt_leave_remaining dt_leave_remaining      
                            END
                    END
            END
        ELSE
            BEGIN
                --PRINT 'Step-18'      
                IF (@dt_leave_remaining >= @dt_leave_allowed)
                    BEGIN
                        --PRINT 'Step-19'      
                        IF (MONTH(@dt_enDate) = 1)
                            BEGIN
                                --PRINT 'Step-20'      
                                --START-01 JAN 2011-- ON 2nd Jan we find the issue of LY Leaves getting forwared in the SP and the function both of which
								-- calling LY Leave and it get double only in the month of january if leave remaing is greater than= leaves allowed
                                --SET @retVal = @dt_last_year_leaves
                                SET @retVal = 0
								--END
                            END
                        ELSE
                            BEGIN
                                --PRINT 'Step-21'      
                                --                                IF (MONTH(@dt_enDate) = 12)    
                                --                                    BEGIN    
                                --                                        --Select @dt_last_year_leaves, Round(((Isnull(@dt_leave_allowed,0)) / 12),@roundfor), (Month(Dateadd(m,-1,@dt_enDate)))      
                                --                                        SET @retVal = @dt_last_year_leaves + Isnull((Round(((Isnull(@dt_leave_allowed, 0)) / 12), @roundfor) * (MONTH(Dateadd(m, 0, @dt_enDate)))), 0)    
                                --                                    END    
                                --                                ELSE    
                                --                                    BEGIN    
                                --                                        SET @retVal = @dt_last_year_leaves + Isnull((Round(((Isnull(@dt_leave_allowed, 0)) / 12), @roundfor) * (MONTH(Dateadd(m, -1, @dt_enDate)))), 0)    
                                --                                    END    
                                IF (YEAR(@dt_joiningDate) = YEAR(@dt_enDate))
                                    BEGIN
                                        SET @mthdiff = MONTH(@dt_enDate) - MONTH(@dt_joiningDate)
                                        SET @retVal = Isnull((Round(((Isnull(@dt_leave_remaining, 0)) / 12), @roundfor) * (MONTH(Dateadd(m, -@mthdiff, @dt_enDate)))), 0)
										IF (Month(@dt_joiningDate) = 1)
										BEGIN
											SET @retVal = (Isnull((Round(((Isnull(@dt_leave_remaining, 0)) / 12), @roundfor) * (@mthdiff)), 0)) 
										END
										IF (Month(@dt_joiningDate) > 1 And Month(@dt_joiningDate) < 12)
										BEGIN
											SET @retVal = (Isnull((Round(((Isnull(@dt_leave_remaining, 0)) / (12 - (MONTH(@dt_joiningDate) - 1))), @roundfor) * (abs(@mthdiff))), 0))
										END
                                    END
                                ELSE
                                    BEGIN
										--ON DEC 2010 we got issue of leaves not getting calculated for the month of December hence the below line is commented and the rest of code is write
										--SET @retVal = Isnull((Round(((Isnull(@dt_leave_remaining, 0)) / 12), @roundfor) * (MONTH(Dateadd(m, -1, @dt_enDate)))), 0)
										--//START
                                        IF (MONTH(@dt_enDate) = 12)
                                            BEGIN
												SET @retVal = Isnull((Round(((Isnull(@dt_leave_remaining, 0)) / 12), @roundfor) * (MONTH(Dateadd(m, 0, @dt_enDate)))), 0)
											END
										ELSE
										BEGIN
												SET @retVal = Isnull((Round(((Isnull(@dt_leave_remaining, 0)) / 12), @roundfor) * (MONTH(Dateadd(m, -1, @dt_enDate)))), 0)
										END
										--//END
                                    END
                            END
                    END
                ELSE
                    BEGIN
                        --PRINT 'Step-22'      
                        -- Overwrite  Last Year Leaves with current year leaves taken.      
                        SELECT @dt_leaves_taken = SUM(leavetaken)
                        FROM   (SELECT leavetaken = CASE
                                                      WHEN (halfday_leave = 0) THEN 1
                                                      ELSE 0.5
                                                    END
                                FROM   emp_leaves_detail eld
                                WHERE  eld.trx_id IN (SELECT el.trx_id
                                                      FROM   emp_leaves el
                                                      WHERE  el.emp_id = @emp_code
                                                         AND el.leave_type = 8)
                                   AND YEAR(eld.leave_date) = YEAR(Getdate())
                                   AND unpaid_leave = 0) d

                        --Select @dt_leave_allowed LA, isnull(@dt_leaves_taken,0) LT, @dt_leave_remaining LR      
                        SET @dt_leaves_taken_ded = (@dt_leave_allowed - @dt_leave_remaining) - Isnull(@dt_leaves_taken, 0)

                        IF (Isnull(@dt_leaves_taken, 0) < @dt_leaves_taken_ded)
                            BEGIN
                                --PRINT 'Step-23'      
                                SET @dt_leaves_taken_ded = Isnull(@dt_leaves_taken, 0)
                            END

                        IF (Isnull(@dt_leaves_taken, 0) >= @dt_leaves_taken_ded)
                            BEGIN
                                --PRINT 'Step-24'      
                                SET @dt_leaves_taken_ded = @dt_leaves_taken_ded
                            END

                        IF (@dt_leaves_taken_ded < 0)
                            BEGIN
                                --PRINT 'Step-25'      
                                SET @dt_leaves_taken_ded = 0
                            END

                        --Select @dt_leave_allowed LA, isnull(@dt_leaves_taken,0) LT, @dt_leave_remaining LR, @dt_leaves_taken_ded LTD, MONTH(DATEADD(m, 0,@dt_enDate))      
                        IF (MONTH(@dt_enDate) = 1
                             OR MONTH(@dt_enDate) = 12)
                            BEGIN
                                --PRINT 'Step-26'      
                                IF (@dt_leave_remaining < @dt_leave_allowed)
                                    BEGIN
                                        --PRINT 'Step-27'      
                                        IF (MONTH(@dt_enDate) = 1)
                                            BEGIN
                                                --PRINT 'Step-28'      
												--PRINT 'Step-20'      
												--START-01 JAN 2011-- ON 2nd Jan we find the issue of LY Leaves getting forwared in the SP and the function both of which
												-- calling LY Leave and it get double only in the month of january if leave remaing is greater than= leaves allowed
												--SET @retVal = @dt_last_year_leaves
												SET @retVal = 0
												--END
                                            END
                                        ELSE
                                            BEGIN
                                                --PRINT 'Step-29'      
                                                SET @retVal = (Isnull((Round(((Isnull(@dt_leave_remaining, 0)) / 12), @roundfor) * (MONTH(Dateadd(m, 0, @dt_enDate)))), 0)) - Abs(@dt_last_year_leaves)
                                            END
                                    END
                                ELSE
                                    BEGIN
                                        --PRINT 'Step-30'      
                                        IF (MONTH(@dt_enDate) = 1)
                                            BEGIN
                                                --PRINT 'Step-31'      
                                                SET @retVal = @dt_last_year_leaves
                                            END
                                        ELSE
                                            BEGIN
                                                --PRINT 'Step-32'      
                                                --SET @retVal = (Isnull((Round(((Isnull(@dt_leave_allowed, 0)) / 12), @roundfor) * (MONTH(Dateadd(m, 0, @dt_enDate)))), 0) - @dt_leaves_taken_ded) - Abs(@dt_last_year_leaves)    
                                                SET @retVal = (Isnull((Round(((Isnull(@dt_leave_remaining, 0)) / 12), @roundfor) * (MONTH(Dateadd(m, 0, @dt_enDate)))), 0) - @dt_leaves_taken_ded) - Abs(@dt_last_year_leaves)
                                            END
                                    END
                            END
                        ELSE
                            BEGIN
                                --PRINT 'Step-33'      
                                IF (@dt_leave_remaining < @dt_leave_allowed)
                                    BEGIN
                                        --PRINT 'Step-34'  
                                        IF (YEAR(@dt_joiningDate) = YEAR(@dt_enDate))
                                            BEGIN
                                                SET @mthdiff = MONTH(@dt_enDate) - MONTH(@dt_joiningDate)
												IF (Month(@dt_joiningDate) = 1)
												BEGIN
													SET @retVal = (Isnull((Round(((Isnull(@dt_leave_remaining, 0)) / 12), @roundfor) * (MONTH(Dateadd(m, -1, @dt_enDate)))), 0)) --- Abs(@dt_last_year_leaves)  
												END
												IF (Month(@dt_joiningDate) > 1 And Month(@dt_joiningDate) < 12)
												BEGIN
													SET @retVal = (Isnull((Round(((Isnull(@dt_leave_remaining, 0)) / (12-(MONTH(@dt_joiningDate)-1))), @roundfor) * (@mthdiff)), 0)) --- Abs(@dt_last_year_leaves)  
												END
                                            END
                                        ELSE
                                            BEGIN
                                                SET @retVal = (Isnull((Round(((Isnull(@dt_leave_remaining, 0)) / 12), @roundfor) * (MONTH(Dateadd(m, -1, @dt_enDate)))), 0)) --- Abs(@dt_last_year_leaves)
                                            END
                                    END
                                ELSE
                                    BEGIN
                                        --PRINT 'Step-35'  
                                        IF (YEAR(@dt_joiningDate) = YEAR(@dt_enDate))
                                            BEGIN
                                                SET @mthdiff = MONTH(@dt_enDate) - MONTH(@dt_joiningDate)
												IF (Month(@dt_joiningDate) = 1)
												BEGIN
													SET @retVal = (Isnull((Round(((Isnull(@dt_leave_remaining, 0)) / 12), @roundfor) * (MONTH(Dateadd(m, -1, @dt_enDate)))), 0)) - Abs(@dt_last_year_leaves)  
												END
												IF (Month(@dt_joiningDate) > 1 And Month(@dt_joiningDate) < 12)
												BEGIN
													SET @retVal = (Isnull((Round(((Isnull(@dt_leave_remaining, 0)) / (12-(MONTH(@dt_joiningDate)-1))), @roundfor) * (@mthdiff)), 0)) - Abs(@dt_last_year_leaves)  
												END
                                            END
                                        ELSE
                                            BEGIN
                                                --SET @retVal = (Isnull((Round(((Isnull(@dt_leave_allowed, 0)) / 12), @roundfor) * (MONTH(Dateadd(m, -1, @dt_enDate)))), 0) - @dt_leaves_taken_ded) - Abs(@dt_last_year_leaves)    
                                                SET @retVal = (Isnull((Round(((Isnull(@dt_leave_remaining, 0)) / 12), @roundfor) * (MONTH(Dateadd(m, -1, @dt_enDate)))), 0) - @dt_leaves_taken_ded) - Abs(@dt_last_year_leaves)
                                            END
                                    END
                            END
                    END
            END

        IF @retVal < 0
            BEGIN
                --PRINT 'Step-36'      
                SET @retVal = 0
            END

        IF @leave_model = 2
            BEGIN
                --PRINT 'Step-37'      
                SET @retVal = Floor(@retVal)
            END

        IF (@leave_model = 5)
            BEGIN
                --PRINT 'Step-38'      
                SET @retVal = Ceiling(@retVal)
            END

        IF @leave_model = 7
            BEGIN
                --PRINT 'Step-39'      
                SET @retVal = @retVal
            END

        --PRINT @retVal      
        RETURN @retVal
    END 
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getDesignation]    Script Date: 09/02/2009 12:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_getDesignation]
       (
        @designation_code INT
       )
RETURNS VARCHAR(50)
AS 
    BEGIN       
        DECLARE @designation VARCHAR(50)  
        SELECT  @designation = designation
        FROM    [dbo].[designation]
        WHERE   id = @designation_code  
        RETURN @designation   
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getEmpDept]    Script Date: 09/02/2009 12:55:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_getEmpDept] (@dep_code INT)
RETURNS VARCHAR(50)
AS 
    BEGIN       
        DECLARE @depName VARCHAR(50)  
        SELECT  @depName = DeptName
        FROM    [dbo].[department]
        WHERE   id = @dep_code  
  
        RETURN @depName   
    END
GO
/***Olderversionstart***/
/****** Object:  UserDefinedFunction [dbo].[fn_GrossCommissionAmount]    Script Date: 09/02/2009 12:55:17 ******/
/*
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create  FUNCTION [dbo].[fn_GrossCommissionAmount]
       (
        @emp_code INT ,
        @year INT
       )
RETURNS VARCHAR(50)
AS 
    BEGIN       
        DECLARE @TotalBonus VARCHAR(40)  
        DECLARE @BonusStartDate VARCHAR(10) 
        DECLARE @BonusEndDate VARCHAR(10)  

 
        SELECT  @TotalBonus = SUM(trx_amount), @BonusStartDate = MIN(CONVERT(VARCHAR(8), trx_period, 112)),
                @BonusEndDate = MAX(CONVERT(VARCHAR(8), trx_period, 112))
        FROM    emp_additions
        WHERE   Emp_code = @emp_code AND
                status = 'L' AND
                YEAR(trx_period) = @year AND
                trx_type IN (SELECT id
                             FROM   additions_types
                             WHERE  tax_payable = 'Yes' AND
                                    tax_payable_options IN (13, 14))   
    
        --SET @TotalBonus = @TotalBonus + '-' + @BonusStartDate + '-' + @BonusEndDate
		SET @TotalBonus = @TotalBonus 
        RETURN @TotalBonus  
    END

GO
*/
/***Olderversionend***/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create FUNCTION [dbo].[fn_GrossCommissionAmount]  
(  
	@emp_code INT ,  
	@year INT  
)  
RETURNS VARCHAR(50)  
AS   
BEGIN         
	DECLARE @cnt int
	DECLARE @TotalBonus VARCHAR(40)    
	DECLARE @BonusStartDate VARCHAR(10)   
	DECLARE @BonusEndDate VARCHAR(10)    
		DECLARE @cnt1 int	
	--SELECT @emp_code =1043
	--SELECT @year =2009

	SELECT @cnt =( SELECT COUNT(*)
					FROM    emp_additions  
					WHERE   Emp_code =@emp_code AND  
					status = 'L' AND  
					YEAR(trx_period) = @year AND  
					trx_type IN (SELECT id  
					FROM   additions_types  
					WHERE  tax_payable = 'Yes' AND  
				    tax_payable_options IN (13, 14))     
				  )		
	--SET @cnt=1
	SELECT @cnt1 =(SELECT count(*) FROM EmployeeEarning where emp_id=@emp_code AND IRYear=@year+1 )  
	IF(@cnt>0)
		IF (@cnt1>0)
				SELECT @TotalBonus=(SUM(trx_amount)+(SUM(E.Commission)/@cnt)) FROM
				(
					SELECT  trx_amount,emp_code
					FROM    emp_additions  
					WHERE   Emp_code =@emp_code AND  
					status = 'L' AND  
					YEAR(trx_period) = @year AND  
					trx_type IN (SELECT id  
								 FROM   additions_types  
								 WHERE  tax_payable = 'Yes' AND  
								 tax_payable_options IN (13, 14)
								)
				)A INNER JOIN EmployeeEarning E ON A.emp_code =E.Emp_id AND E.IRYear= @year+1
		 ELSE
				SELECT @TotalBonus= SUM(A.trx_amount) FROM
				(
					SELECT  trx_amount,emp_code
					FROM    emp_additions  
					WHERE   Emp_code =@emp_code AND  
					status = 'L' AND  
					YEAR(trx_period) = @year AND  
					trx_type IN (SELECT id  
								 FROM   additions_types  
								 WHERE  tax_payable = 'Yes' AND  
								 tax_payable_options IN (13, 14)
								)
			     )A		
	ELSE
		SELECT @TotalBonus = Commission FROM EmployeeEarning  WHERE Emp_id=@emp_code AND IRYear=@year+1			
	
		RETURN @TotalBonus    
	END  
GO




/****** Object:  UserDefinedFunction [dbo].[fn_ApprovalObtainedFromIRASApproveDate]    Script Date: 09/02/2009 12:55:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_ApprovalObtainedFromIRASApproveDate]  
       (  
        @emp_code INT ,  
        @year INT  
       )  
RETURNS VARCHAR(100)  
AS   
    BEGIN    
    
        DECLARE @retcar VARCHAR(10)  
    
    
        SELECT TOP 11  
                @retcar = CONVERT(VARCHAR(10), iras_approval_date, 103)  
        FROM    emp_additions  
        WHERE   Emp_code = @emp_code AND  
                status = 'L' AND  
                YEAR(trx_period) = @year AND  
                iras_approval = 'Yes' AND  
                trx_type IN (SELECT id  
                             FROM   additions_types  
                             WHERE  tax_payable_options = 9)     
  
  
        IF @retcar IS NULL   
           BEGIN  
                 RETURN  NULL  
           END  
    SET @retcar =CONVERT(NVARCHAR(10),  CAST( @retcar AS DATETIME), 112)
        RETURN  @retcar  
    END  


GO
/****** Object:  UserDefinedFunction [dbo].[fn_GrossCommissionIndicator]    Script Date: 09/02/2009 12:55:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GrossCommissionIndicator]
       (
        @emp_code INT ,
        @year INT
       )
RETURNS VARCHAR
AS 
    BEGIN  
  
        DECLARE @retcar VARCHAR
        DECLARE @par1 INT
        DECLARE @par2 INT

        SET @par1 = 0
        SET @par2 = 0

        SELECT  @par1 = COUNT(trx_id)
        FROM    emp_additions
        WHERE   Emp_code = @emp_code AND
                status = 'L' AND
                YEAR(trx_period) = @year AND
                trx_type IN (SELECT id
                             FROM   additions_types
                             WHERE  (tax_payable = 'Yes' AND
                                     tax_payable_options = 13
                                    ))

        SELECT  @par2 = COUNT(trx_id)
        FROM    emp_additions
        WHERE   Emp_code = @emp_code AND
                status = 'L' AND
                YEAR(trx_period) = @year AND
                trx_type IN (SELECT id
                             FROM   additions_types
                             WHERE  (tax_payable = 'Yes' AND
                                     tax_payable_options = 14
                                    ))

        IF (@par1 = 0 AND
            @par2 = 0
           ) 
           BEGIN
                 SET @retcar = ''
           END

        IF (@par1 > 0 AND
            @par2 > 0
           ) 
           BEGIN
                 SET @retcar = 'B'
           END

        IF (@par1 > 0 AND
            @par2 <= 0
           ) 
           BEGIN
                 SET @retcar = 'M'
           END

        IF (@par1 <= 0 AND
            @par2 > 0
           ) 
           BEGIN
                 SET @retcar = 'O'
           END

        RETURN @retcar
    END

GO
/****** Object:  UserDefinedFunction [dbo].[fn_ApprovalObtainedFromIRAS]    Script Date: 09/02/2009 12:55:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_ApprovalObtainedFromIRAS]  
       (  
        @emp_code INT ,  
        @year INT  
       )  
RETURNS VARCHAR  
AS   
    BEGIN    
    
        DECLARE @retcar VARCHAR  
    
        DECLARE @TotalAmount INT     
    
        DECLARE @ApprovalDate DATETIME     
    
        SELECT  @TotalAmount = SUM(trx_amount)  
        FROM    emp_additions  
        WHERE   Emp_code = @emp_code AND  
                status = 'L' AND  
                YEAR(trx_period) = @year AND  
                iras_approval = 'Yes' AND  
                trx_type IN (SELECT id  
                             FROM   additions_types  
                             WHERE  tax_payable_options = 9)     
  
        IF @TotalAmount IS NULL OR  @TotalAmount = 0   
           BEGIN  
                 RETURN  'N'  
           END  
    
        SET @retcar = 'Y'  
        RETURN  @retcar  
    END  


GO
/***OlderVersionstart***/
/****** Object:  UserDefinedFunction [dbo].[fn_Bonus]    Script Date: 09/02/2009 12:55:07 ******/
/*
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_Bonus]
       (
        @emp_code INT ,
        @year INT
       )
RETURNS INT
AS 
    BEGIN       
        DECLARE @TotalBonus INT  
  
        SELECT  @TotalBonus = SUM(trx_amount)
        FROM    emp_additions
        WHERE   Emp_code = @emp_code AND
                status = 'L' AND
                YEAR(additionsforyear) = @year AND
                trx_type IN (SELECT id
                             FROM   additions_types
                             WHERE  tax_payable = 'Yes' AND
                                    tax_payable_options IN (1, 2))   
  
    
        RETURN @TotalBonus  
    END
GO
*/
/***OlderVersion end***/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE  FUNCTION [dbo].[fn_Bonus]  
		(  
			@emp_code INT ,  
			@year INT  
		)  
		RETURNS INT
		AS   
		BEGIN
			DECLARE @cnt1 int	
		DECLARE @cnt int
		SELECT @cnt =(
			SELECT count(*)FROM    emp_additions  
			WHERE   Emp_code = @emp_code AND  
			status = 'L' AND  
			YEAR(additionsforyear) = @year AND  
			trx_type IN (SELECT id  
			FROM   additions_types  
			WHERE  tax_payable = 'Yes' AND  tax_payable_options IN (1, 2))     
			)
				
				
		DECLARE @TotalBonus INT 
		--SELECT @cnt1 =(SELECT count(*) FROM EmployeeEarning where emp_id=@emp_code AND IRYear=@year+1 )  
		SELECT @cnt1 =(SELECT count(*) FROM EmployeeEarning where emp_id=@emp_code AND IRYear=@year+1 AND Bonus IS NOT NULL )  
		--SET @cnt=0
		IF @cnt>0
			IF (@cnt1>0)
					SELECT  @TotalBonus =(Sum(A.trx_amount)+Sum(E.Bonus)/@cnt)FROM
					(
						(SELECT  trx_amount ,emp_code 
						 FROM    emp_additions  
						 WHERE   Emp_code = @emp_code AND  
						 status = 'L' AND  
						 YEAR(additionsforyear) = @year AND  
						 trx_type IN (SELECT id  
						 FROM   additions_types  
						 WHERE  tax_payable = 'Yes' AND  
						 tax_payable_options IN (1, 2))     
						 )A INNER JOIN EmployeeEarning E ON A.emp_code =E.Emp_id AND E.IRYear=@year+1
					)
			ELSE
					SELECT  @TotalBonus =Sum(A.trx_amount)FROM
					(
						(SELECT  trx_amount ,emp_code 
						 FROM    emp_additions  
						 WHERE   Emp_code = @emp_code AND  
						 status = 'L' AND  
						 YEAR(additionsforyear) = @year AND  
						 trx_type IN (SELECT id  
						 FROM   additions_types  
						 WHERE  tax_payable = 'Yes' AND  
						 tax_payable_options IN (1, 2))     
						 )
					)A
		ELSE
				SELECT @TotalBonus = Bonus FROM EmployeeEarning  WHERE Emp_id=@emp_code AND IRYear=@year+1

				RETURN @TotalBonus    
		END
GO

/****** Object:  UserDefinedFunction [dbo].[fn_GratuityNoticePayment]    Script Date: 09/02/2009 12:55:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_GratuityNoticePayment]
       (
        @emp_code INT ,
        @year INT 
       )
RETURNS INT
AS 
    BEGIN       
        DECLARE @returnval INT  
  
/*  Pension amount_type = 4   
  TransportAllowance amount_type = 5   
  EntertainmentAllowance amount_type = 6   
  OtherAllowance amount_type = 7 */  
  
        SELECT  @returnval = SUM(trx_amount)
        FROM    emp_additions
        WHERE   Emp_code = @emp_code AND
                status = 'L' AND
                YEAR(trx_period) = @year AND
                trx_type IN (SELECT id
                             FROM   additions_types
                             WHERE  tax_payable = 'Yes' AND
                                    tax_payable_options IN (8, 10, 11))   
    
        RETURN @returnval  
    END
GO

/***Olderversionstart***/
/****** Object:  UserDefinedFunction [dbo].[fn_DirectorsFee]    Script Date: 09/02/2009 12:55:08 ******/
/*
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_DirectorsFee]
       (
        @emp_code INT ,
        @year INT
       )
RETURNS INT
AS 
    BEGIN       
        DECLARE @TotalBonus INT  
  
        SELECT  @TotalBonus = SUM(trx_amount)
        FROM    emp_additions
        WHERE   Emp_code = @emp_code AND
                status = 'L' AND
                YEAR(trx_period) = @year AND
                trx_type IN (SELECT id
                             FROM   additions_types
                             WHERE  tax_payable = 'Yes' AND
                                    tax_payable_options = 3)   
    
        RETURN @TotalBonus  
    END
GO
*/
/***Olderversionend***/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_DirectorsFee]  
(  
	@emp_code INT ,  
	@year INT  
)  
RETURNS INT  
AS   
	BEGIN   
	DECLARE @Cnt INT		
	SELECT @Cnt =(SELECT Count(*)    
				  FROM    emp_additions  
				  WHERE   Emp_code = @emp_code AND  
				  status = 'L' AND  
				  YEAR(trx_period) = @year AND  
				  trx_type IN (SELECT id  
                  FROM   additions_types  
		          WHERE  tax_payable = 'Yes' AND  
                  tax_payable_options = 3)   
				)	
		--SELECT @Cnt=1
		DECLARE @TotalBonus INT 
		DECLARE @cnt1 int
		SELECT @cnt1 =(SELECT count(*) FROM EmployeeEarning where emp_id=@emp_code AND IRYear=@year+1)
		
		IF @Cnt>0
			IF (@cnt1>0)
					SELECT @TotalBonus=(Sum(A.trx_amount)+(Sum(E.DirectorFee)/@Cnt) )  FROM 	
					(
						SELECT  trx_amount ,emp_code
						FROM    emp_additions  
						WHERE   Emp_code = @emp_code AND  
						status = 'L' AND  
						YEAR(trx_period) =  @year AND  
						trx_type IN (SELECT id  
						FROM   additions_types
						WHERE  tax_payable = 'Yes' AND  
						tax_payable_options = 3)
					)A INNER JOIN EmployeeEarning E ON A.emp_code =E.Emp_id AND E.IRYear= @year+1
			ELSE
					SELECT @TotalBonus=(Sum(A.trx_amount))  FROM 
					(
						SELECT  trx_amount ,emp_code
						FROM    emp_additions  
						WHERE   Emp_code = @emp_code AND  
						status = 'L' AND  
						YEAR(trx_period) =  @year AND  
						trx_type IN (SELECT id  
						FROM   additions_types
						WHERE  tax_payable = 'Yes' AND  
						tax_payable_options = 3)
					)A 
		ELSE
			SELECT @TotalBonus = DirectorFee FROM EmployeeEarning  WHERE Emp_id=@emp_code AND IRYear=@year+1
			RETURN @TotalBonus
		END  
GO

/***olderversionstart***/
/****** Object:  UserDefinedFunction [dbo].[fn_GetOtherInfo]    Script Date: 09/02/2009 12:55:15 ******/
/*
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_GetOtherInfo]
       (
        @emp_code INT ,
        @year INT ,
        @amount_type INT 
       )
RETURNS INT
AS 
    BEGIN       
        DECLARE @returnval INT  
  
-- Pension amount_type = 4   
 -- TransportAllowance amount_type = 5   
 -- EntertainmentAllowance amount_type = 6   
 -- OtherAllowance amount_type = 7 
 
        SELECT  @returnval = SUM(trx_amount)
        FROM    emp_additions
        WHERE   Emp_code = @emp_code AND
                status = 'L' AND
                YEAR(trx_period) = @year AND
                trx_type IN (SELECT id
                             FROM   additions_types
                             WHERE  tax_payable_options = @amount_type)   
    
        RETURN @returnval  
    END
GO
*/

/***Olderversionends***/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_GetOtherInfo]    
 (    
  @emp_code INT ,    
  @year INT ,    
  @amount_type INT     
 )    
RETURNS INT    
 AS     
 BEGIN           
  DECLARE @returnval INT      
  DECLARE   @cnt INT  
  /*  Pension amount_type = 4       
   TransportAllowance amount_type = 5       
    EntertainmentAllowance amount_type = 6       
    OtherAllowance amount_type = 7   
  */  
     DECLARE @cnt1 int  
  SELECT @cnt1 =(SELECT count(*) FROM EmployeeEarning where emp_id=@emp_code AND IRYear=@year+1)    
  SELECT @cnt =   
   (   
    SELECT COUNT(*) FROM  
     emp_additions    
     WHERE   Emp_code = @emp_code AND    
     status = 'L' AND    
     YEAR(trx_period) = @year AND    
     trx_type IN (SELECT id    
     FROM   additions_types    
     WHERE  tax_payable_options = @amount_type)  
   )  
  --SET @cnt=1  
   IF @amount_type=4   
  IF @cnt>0   
	 BEGIN
		 SELECT @cnt1 =(SELECT count(*) FROM EmployeeEarning where emp_id=@emp_code AND IRYear=@year+1 AND Pension IS NOT NULL)     
		 IF (@cnt1>0)  
		   SELECT @returnval=(SUM(trx_amount)+(SUM(E.Pension)/@cnt)) FROM  
		   (  
			SELECT  trx_amount,emp_code    
			FROM    emp_additions    
			WHERE   Emp_code = @emp_code AND    
			status = 'L' AND    
			YEAR(trx_period) = @year AND    
			trx_type IN (SELECT id    
				FROM   additions_types    
				WHERE  tax_payable_options = @amount_type)      
			 )A INNER JOIN EmployeeEarning E ON A.emp_code =E.Emp_id AND E.IRYear= @year+1     
		 ELSE  
		  SELECT @returnval=SUM(A.trx_amount) FROM  
		  (  
		   SELECT  trx_amount,emp_code    
		   FROM    emp_additions    
		   WHERE   Emp_code = @emp_code AND    
		   status = 'L' AND    
		   YEAR(trx_period) = @year AND    
		   trx_type IN (SELECT id    
		   FROM   additions_types    
		   WHERE  tax_payable_options = @amount_type)      
		  )A   
	 END
  ELSE  
	BEGIN
     SELECT @returnval  = Pension FROM EmployeeEarning  WHERE Emp_id=@emp_code AND IRYear=@year+1  
    END 
  ELSE IF @amount_type=5  
		BEGIN
			SELECT @cnt1 =(SELECT count(*) FROM EmployeeEarning where emp_id=@emp_code AND IRYear=@year+1 AND TransAllow IS NOT NULL)       
			IF @cnt>0    
				BEGIN	
				  IF (@cnt1>0)  
					SELECT @returnval=(SUM(trx_amount)+(SUM(E.TransAllow)/@cnt)) FROM  
					(  
					SELECT  trx_amount,emp_code    
					FROM    emp_additions    
					WHERE   Emp_code = @emp_code AND    
					status = 'L' AND    
					YEAR(trx_period) = @year AND    
					trx_type IN (SELECT id    
						FROM   additions_types    
						WHERE  tax_payable_options = @amount_type  
						)  
					)A INNER JOIN EmployeeEarning E ON A.emp_code =E.Emp_id AND E.IRYear= @year+1     
				  ELSE  
				   SELECT @returnval=(SUM(A.trx_amount)) FROM  
					 (  
					SELECT  trx_amount,emp_code    
					FROM    emp_additions    
					WHERE   Emp_code = @emp_code AND    
					status = 'L' AND    
					YEAR(trx_period) = @year AND    
					trx_type IN (SELECT id    
						FROM   additions_types    
						WHERE  tax_payable_options = @amount_type  
						)  
				   )A   				 
				END           
		 ELSE  
			BEGIN
			 SELECT @returnval  = TransAllow FROM EmployeeEarning  WHERE Emp_id=@emp_code AND IRYear=@year+1   
			END 
		END
  ELSE IF @amount_type=6
			BEGIN
				SELECT @cnt1 =(SELECT count(*) FROM EmployeeEarning where emp_id=@emp_code AND IRYear=@year+1 AND EntAllow IS NOT NULL)   
				IF @cnt>0   
					BEGIN	
						 IF (@cnt1>0)  
						  SELECT @returnval=(SUM(trx_amount)+(SUM(E.EntAllow)/@cnt)) FROM  
							(  
							 SELECT  trx_amount,emp_code    
							 FROM    emp_additions    
							 WHERE   Emp_code = @emp_code AND    
							 status = 'L' AND    
							 YEAR(trx_period) = @year AND    
							 trx_type IN (SELECT id    
								 FROM   additions_types    
								 WHERE  tax_payable_options = @amount_type)      
							)A INNER JOIN EmployeeEarning E ON A.emp_code =E.Emp_id AND E.IRYear= @year+1     
						 ELSE  
						  SELECT @returnval=SUM(A.trx_amount) FROM  
							(  
							 SELECT  trx_amount,emp_code    
							 FROM    emp_additions    
							 WHERE   Emp_code = @emp_code AND    
							 status = 'L' AND    
							 YEAR(trx_period) = @year AND    
							 trx_type IN (SELECT id    
								 FROM   additions_types    
								 WHERE  tax_payable_options = @amount_type)      
							)A 
						END  
			 ELSE  
				BEGIN
					SELECT @returnval  = EntAllow FROM EmployeeEarning  WHERE Emp_id=@emp_code AND IRYear=@year+1  
				END	
			END			
  ELSE IF @amount_type=7  	
	BEGIN
		IF @cnt>0
			  BEGIN	
				  SELECT @cnt1 =(SELECT count(*) FROM EmployeeEarning where emp_id=@emp_code AND IRYear=@year+1 AND OtherAllow IS NOT NULL)    
				  IF (@cnt1>0)  
						SELECT @returnval=(SUM(trx_amount)+(SUM(E.OtherAllow)/@cnt)) FROM  
						(  
					   SELECT  trx_amount,emp_code    
					   FROM    emp_additions    
					   WHERE   Emp_code = @emp_code AND    
					   status = 'L' AND    
					   YEAR(trx_period) = @year AND    
					   trx_type IN (SELECT id    
						   FROM   additions_types    
						   WHERE  tax_payable_options = @amount_type)      
						)A INNER JOIN EmployeeEarning E ON A.emp_code =E.Emp_id AND E.IRYear= @year+1     
				  ELSE  
				  
						   SELECT @returnval=(SUM(A.trx_amount)) FROM  
							   (  
						   SELECT  trx_amount,emp_code    
						   FROM    emp_additions    
						   WHERE   Emp_code = @emp_code AND    
						   status = 'L' AND    
						   YEAR(trx_period) = @year AND    
						   trx_type IN (SELECT id    
							   FROM   additions_types    
							   WHERE  tax_payable_options = @amount_type)      
						   )A   
			 END         
		ELSE  
			BEGIN
				SELECT @returnval  = OtherAllow FROM EmployeeEarning  WHERE Emp_id=@emp_code AND IRYear=@year+1  
			END
	END
	
          RETURN  @returnval    
 END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GrossSalary]    Script Date: 09/02/2009 12:55:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_GrossSalary]
       (
        @emp_code INT ,
        @year INT
       )
RETURNS FLOAT
AS 
    BEGIN       
        DECLARE @TotalSalary FLOAT  
        SELECT  @TotalSalary = SUM(trx_amount)
        FROM    emp_additions
        WHERE   Emp_code = @emp_code AND
                status = 'L' AND
                YEAR(trx_period) = @year AND
                trx_type IN (SELECT id
                             FROM   additions_types
                             WHERE  tax_payable = 'Yes' AND
                                    tax_payable_options IN (15))   
        RETURN @TotalSalary  
    END
GO
/****** Object:  UserDefinedFunction [dbo].[get_available_leaves_prorated2]    Script Date: 09/02/2009 12:55:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Update Employee Set Termination_Date=null, joining_date = '04/10/2009' where emp_code=18
--Select * From EMployeeleavesallowed  
--select * From prorated_leaves  
--Update Company Set leave_model=8  
--Update Employee Set Joining_Date='01/06/1992' Where Emp_Code=53            
--SELECT   dbo.Get_available_leaves_prorated2('30/04/2010',  2, 'HPS18')
CREATE FUNCTION [dbo].[Get_available_leaves_prorated2] (@enDate  VARCHAR(10),  
                                                       @compid   INT,  
                                                       @username VARCHAR(50))  
RETURNS FLOAT  
AS  
    BEGIN  
        --  DECLARE  @enDate   VARCHAR(10),      
        --           @compid   INT,      
        --           @username VARCHAR(50)      
        --        
        --  SET @enDate = '01/04/2010'      
        --  SET @compid = 17    
        --  SET @username = 'KKSAdmin'      
        DECLARE @roundfor INT  
        DECLARE @leave_model INT  
        DECLARE @retVal FLOAT  
        DECLARE @dt_enDate DATETIME  
        DECLARE @dt_joiningDate DATETIME  
        DECLARE @dt_joiningDateproxy DATETIME  
        DECLARE @dt_leave_allowed FLOAT  
        DECLARE @dt_leave_remaining FLOAT  
        DECLARE @dt_last_year_leaves FLOAT  
        DECLARE @group_id INT  
        DECLARE @year_of_service INT  
        DECLARE @months_of_service INT  
        DECLARE @empid INT  
        DECLARE @mofserviceproxy INT  
        DECLARE @ELMonth INT  
        DECLARE @dt_leave_prorate FLOAT  
        DECLARE @dt_leave_earn FLOAT  
        DECLARE @dt_joining_month INT  
        DECLARE @dt1 FLOAT  
        DECLARE @dt2 FLOAT  
        DECLARE @dt3 FLOAT  
        DECLARE @denominator INT  
  
        SET @retVal = 0.0  
        SET @dt_enDate = CONVERT(DATETIME, @enDate, 103)  
        SET @dt_last_year_leaves = 0.0  
        SET @year_of_service = 1  
        SET @months_of_service = 0  
  
        IF MONTH(@dt_enDate) = 12  
            BEGIN  
                SET @roundfor = 50  
            END  
        ELSE  
            BEGIN  
                SET @roundfor = 50  
            END  
  
        SELECT @group_id = (SELECT emp_group_id  
                            FROM   employee  
                            WHERE  username = @username)  
  
        SELECT @empid = (SELECT emp_code  
                         FROM   employee  
                         WHERE  username = @username)  
  
        SELECT @dt_joiningDate = joining_date,@dt_joiningDateproxy = joining_date  
        FROM   employee  
        WHERE  username = @username  
  
        SET @months_of_service = Datediff(m, @dt_joiningDate, @dt_enDate)  
        SET @dt1 = @months_of_service  
        SET @dt2 = 12  
        SET @dt3 = @dt1 / @dt2  
  
        IF @year_of_service = 0  
            SET @year_of_service = 1  
  
        --  SELECT @ELMonth = Isnull(Max(e.leave_year),0)      
        --  FROM   employeeleavesallowed e      
        --  WHERE  e.emp_id = @empid      
        SELECT @ELMonth = Isnull(MAX(YEAR(y.startdate)), 0)  
        FROM   YOSLeavesAllowed y  
        WHERE  y.emp_id = @empid  
           AND LeavesAllowed > 0  
  
        IF (@ELMonth) <= 0  
            BEGIN  
                RETURN 0  
            --PRINT 0      
            END  
  
        SET @dt_joiningDateproxy = CONVERT(DATETIME, CAST(DAY(@dt_joiningDateproxy) AS VARCHAR) + '/' + CAST(MONTH(@dt_joiningDateproxy) AS VARCHAR) + '/' + CAST(@ELMonth AS VARCHAR), 103)  
        SET @mofserviceproxy = Datediff(m, @dt_joiningDateproxy, @dt_enDate)  
  
        IF (@dt_joiningDateproxy > @dt_enDate)  
            BEGIN  
                SET @year_of_service = Ceiling(@dt3) + 1  
  
                SELECT @dt_leave_allowed = Isnull(leaves_allowed, 0)  
                FROM   prorated_leaves  
                WHERE  group_id = @group_id  
                   AND comp_id = @compid  
                   AND year_of_service = @year_of_service  
  
                --      SELECT @retVal = (Isnull(leaves_allowed,0) - @dt_leave_allowed)      
                --      FROM   employeeleavesallowed      
                --      WHERE  emp_id = @empid      
                --             AND leave_type = 8      
                SELECT @retVal = (Isnull(y.leavesallowed, 0) - @dt_leave_allowed)  
                FROM   YOSLeavesAllowed y  
                WHERE  y.emp_id = @empid  
                   AND LeavesAllowed > 0  
  
                IF (@retVal < 0)  
                    BEGIN  
                        SET @retVal = 0  
  
                        RETURN @retVal  
                    --PRINT @retVal      
                    END  
            END  
        ELSE  
            BEGIN  
                IF (@mofserviceproxy = 0)  
                    BEGIN  
                        SET @year_of_service = Ceiling(@dt3 + 1)  
                    END  
                ELSE  
                    BEGIN  
                        SET @year_of_service = Ceiling(@dt3)  
                    END  
  
                SELECT @dt_leave_allowed = Isnull(leaves_allowed, 0)  
                FROM   prorated_leaves  
                WHERE  group_id = @group_id  
                   AND comp_id = @compid  
                   AND year_of_service = @year_of_service  
  
                IF (@year_of_service > 10)  
                    BEGIN  
                        SELECT @dt_leave_allowed = Isnull(leaves_allowed, 0)  
                        FROM   prorated_leaves  
                        WHERE  group_id = @group_id  
                           AND comp_id = @compid  
                           AND year_of_service = 10  
                    END  
  
                --      SELECT @dt_leave_remaining = Sum(Isnull(leaves_allowed,0))      
                --      FROM   employeeleavesallowed      
                --      WHERE  emp_id = (SELECT emp_code      
                --                       FROM   employee      
                --                       WHERE  username = @username)      
                --             AND leave_year <= Year(@dt_enDate)      
                --             AND leave_type = 8      
  
--                IF (@dt_leave_remaining > @dt_leave_allowed)  
--                    SET @dt_last_year_leaves = Isnull(@dt_leave_remaining, 0) - Isnull(@dt_leave_allowed, 0)  
--                ELSE  
--                    SET @dt_last_year_leaves = 0.0  
  
                SELECT @dt_leave_remaining = (Isnull(y.leavesallowed, 0)), @dt_last_year_leaves = (Isnull(y.LY_Leaves_Bal, 0))  
                FROM   YOSLeavesAllowed y  
                WHERE  y.emp_id = @empid  
                   AND LeavesAllowed > 0  
  
  
                --Select @dt_leave_remaining, @dt_leave_allowed, abs(@dt_last_year_leaves)      
                SET @dt_joining_month = Datepart(m, @dt_joiningDateproxy)  
                SET @dt_leave_prorate = @dt_leave_allowed / 12  
                SET @dt_leave_earn = @dt_leave_prorate * ((MONTH(@dt_enDate)) - @dt_joining_month)  
  
                IF (@dt_leave_allowed > @dt_leave_remaining)  
                    SET @retVal = @dt_leave_earn - (@dt_leave_allowed - @dt_leave_remaining)  
                ELSE  
                    SET @retVal = @dt_leave_earn + (@dt_leave_remaining - @dt_leave_allowed)  
  
                --IF (YEAR(@dt_joiningDate) = YEAR(Getdate()))  Commented On 13th Aug 2010
				IF (1=2)
                    BEGIN  
                        IF (MONTH(@dt_joiningDateproxy) >= MONTH(Dateadd(m, -1, @dt_enDate)))  
                            BEGIN  
                                SET @retVal = @dt_last_year_leaves + 0  
                            END  
                        ELSE  
                            BEGIN  
                                SET @denominator = 12 - (Isnull(MONTH(@dt_joiningDateproxy), 0))  
                                SET @retVal = Isnull((((Isnull(@dt_leave_allowed, 0)) / (Isnull(@denominator, 1))) * (MONTH(Dateadd(m, -1, @dt_enDate)))), 0)  
                            END  
                    END  
                ELSE  
                    BEGIN  
                        ---     
  
                        IF (@mofserviceproxy = 0)  
                            BEGIN  
                                --select @dt_last_year_leaves, @dt_leave_allowed, @mofserviceproxy      
--                                IF (@dt_leave_remaining < @dt_leave_allowed)  
--                                    BEGIN  
--                                        SET @retVal = @dt_last_year_leaves + Isnull((((Isnull(@dt_leave_remaining, 0)) / 12) * (@mofserviceproxy)), 0)  
--                                    END  
--                                ELSE  
--                                    BEGIN  
--                                        SET @retVal = @dt_last_year_leaves + Isnull((((Isnull(@dt_leave_allowed, 0)) / 12) * (@mofserviceproxy)), 0)  
--                                    END  
                                        SET @retVal = Isnull((((Isnull(@dt_leave_remaining, 0)) / 12) * (@mofserviceproxy)), 0)  
                            END  
                        ELSE  
                            IF (@mofserviceproxy >= 11  
                                AND @mofserviceproxy <= 12)  
                                BEGIN  
                                    SET @mofserviceproxy = 12  
									SET @retVal = Isnull((((Isnull(@dt_leave_remaining, 0)) / 12) * (@mofserviceproxy)), 0)  
--                                    IF (@dt_leave_remaining < @dt_leave_allowed)  
--                                        BEGIN  
--                                            SET @retVal = @dt_last_year_leaves + Isnull((((Isnull(@dt_leave_remaining, 0)) / 12) * (@mofserviceproxy)), 0)  
--                                        END  
--                                    ELSE  
--                                        BEGIN  
--                                            SET @retVal = @dt_last_year_leaves + Isnull((((Isnull(@dt_leave_allowed, 0)) / 12) * (@mofserviceproxy)), 0)  
--                                        END  
                                END  
                            ELSE  
                                BEGIN  
--                                    IF (@dt_leave_remaining < @dt_leave_allowed)  
--                                        BEGIN  
--                                            SET @retVal = @dt_last_year_leaves + Isnull((((Isnull(@dt_leave_remaining, 0)) / 12) * (@mofserviceproxy)), 0)  
--                                        END  
--                                    ELSE  
--                                        BEGIN  
--                                            SET @retVal = @dt_last_year_leaves + Isnull((((Isnull(@dt_leave_allowed, 0)) / 12) * (@mofserviceproxy)), 0)  
--                                        END  
                                            SET @retVal = Isnull((((Isnull(@dt_leave_remaining, 0)) / 12) * (@mofserviceproxy)), 0)  
                                END  
                    END  
            END  
  
        IF @retVal < 0  
            SET @retVal = 0  
  
        SET @leave_model = 6  
  
        SELECT @leave_model = Isnull(leave_model, 6)  
        FROM   company  
        WHERE  company_id = @compid  
  
        IF @leave_model = 4  
            BEGIN  
                SET @retVal = Floor(@retVal)  
            END  
  
        IF @leave_model = 6  
            BEGIN  
                SET @retVal = Ceiling(@retVal)  
            END  
  
        IF @leave_model = 8  
            BEGIN  
                SET @retVal = Round(@retVal, 2)  
            END  
  
        IF Datediff(m, @dt_joiningDateproxy, @dt_enDate) > 11  
            BEGIN  
                SET @retVal = 0  
            END  
  
        --PRINT @retVal      
        RETURN @retVal  
    END   
GO
/****** Object:  UserDefinedFunction [dbo].[get_available_leaves_prorated]    Script Date: 09/02/2009 12:55:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[get_available_leaves_prorated]
       (
        @enDate VARCHAR(10) ,
        @compid INT ,
        @username VARCHAR(50)
       )
RETURNS FLOAT
AS 
    BEGIN        
        
        DECLARE @year_of_service INT        
        DECLARE @months_of_service INT        
        DECLARE @annual_leaves_allowed FLOAT         
        DECLARE @max_years_defined INT        
        DECLARE @temp FLOAT        
        DECLARE @earned_leave_per_month FLOAT        
        DECLARE @requested_leave_end_month INT        
        DECLARE @dtAllowed FLOAT         
        DECLARE @group_id INT       
--Added by Vishal    
        DECLARE @dt_enDate DATETIME    
        DECLARE @dt_joiningDate DATETIME    
        SET @dt_enDate = CONVERT(DATETIME, @enDate, 103)  
        SET @dt_enDate = DATEADD(dd, -1, @dt_enDate)
        SELECT  @dt_joiningDate = joining_date
        FROM    employee
        WHERE   username = @username       
      
        SET @requested_leave_end_month = MONTH(CONVERT(DATETIME, @enDate, 103))      
      
    
        SELECT  @months_of_service = DATEDIFF(month, joining_date, CONVERT(DATETIME, @enDate, 103))
        FROM    employee
        WHERE   username = @username         
        IF @months_of_service <= 12 
           SET @requested_leave_end_month = @months_of_service      
        ELSE 
           BEGIN    
  --SET @requested_leave_end_month = @months_of_service-12  --month(convert(datetime,@enDate,103))    
                 DECLARE @DT_JOIN DATETIME    
                 SET @DT_JOIN = (CONVERT(VARCHAR(10), MONTH(@dt_joiningDate)) + '/' +
                                 CONVERT(VARCHAR(10), DAY(@dt_joiningDate)) + '/' +
                                 CONVERT(VARCHAR(10), (YEAR(@dt_enDate) - 1)))    
                 SET @requested_leave_end_month = DATEDIFF(MONTH, @DT_JOIN, @dt_enDate)           
           END      
      
        SELECT  @group_id = (SELECT emp_group_id FROM employee WHERE username = @username
                            )        
        
-- get Year of Service        
        SELECT  @year_of_service = DATEDIFF(year, joining_date, GETDATE())
        FROM    employee
        WHERE   username = @username         
        IF @year_of_service = 0 
           SET @year_of_service = 1        
        
        SELECT  @max_years_defined = MAX(year_of_service)
        FROM    prorated_leaves
        WHERE   comp_id = @compid AND
                group_id = @group_id        
        
        IF @year_of_service > @max_years_defined 
           SET @year_of_service = @max_years_defined        
         
-- get Allowed Annual Leaves w.r.t Year of Service        
        SELECT  @annual_leaves_allowed = leaves_allowed
        FROM    prorated_leaves
        WHERE   comp_id = @compid AND
                group_id = @group_id AND
                year_of_service = @year_of_service        
        
-- get Earned Leaves as of End Date of Leave duration        
        SELECT  @earned_leave_per_month = CONVERT(FLOAT, @annual_leaves_allowed) / CONVERT(FLOAT, 12)        
        SELECT  @earned_leave_per_month = ROUND(@earned_leave_per_month * @requested_leave_end_month, 0)        
        
        SELECT  @dtAllowed = leaves_remaining
        FROM    employee
        WHERE   username = @username         
        
        IF @dtAllowed > @annual_leaves_allowed 
           SET @dtAllowed = @dtAllowed - @annual_leaves_allowed        
        ELSE 
           SET @dtAllowed = 0        
        
        SET @dtAllowed = @dtAllowed + @earned_leave_per_month        
        
        RETURN @dtAllowed        
        
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getEmpNationality]    Script Date: 09/02/2009 12:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_getEmpNationality]
       (
        @nationality_code INT
       )
RETURNS VARCHAR(50)
AS 
    BEGIN       
        DECLARE @nationality VARCHAR(50)  
        DECLARE @nationalityCode VARCHAR(50)   
        SELECT  @nationality = nationality, @nationalityCode = ir8a_code
        FROM    [dbo].[nationality]
        WHERE   id = @nationality_code  
        RETURN @nationality +'|' + @nationalityCode  
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getCountryName]    Script Date: 09/02/2009 12:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_getCountryName] (@country_code INT)
RETURNS VARCHAR(50)
AS 
    BEGIN       
        DECLARE @Country VARCHAR(50)  
        DECLARE @CountryCode VARCHAR(50)  
        SELECT  @Country = country, @CountryCode = ir8a_code
        FROM    [dbo].[country]
        WHERE   id = @country_code  
        RETURN @Country +'|' + @CountryCode  
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getReligion]    Script Date: 09/02/2009 12:55:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_getReligion] (@religion_code INT)
RETURNS VARCHAR(50)
AS 
    BEGIN       
        DECLARE @religion VARCHAR(50)  
        SELECT  @religion = religion
        FROM    [dbo].[religion]
        WHERE   id = @religion_code  
        RETURN @religion   
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_CessationProvisions]    Script Date: 09/02/2009 12:55:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE  FUNCTION [dbo].[fn_CessationProvisions]
       (
        @emp_code INT ,
        @year INT
       )
RETURNS NVARCHAR
AS 
    BEGIN       
        DECLARE @IsRecord INT  
        DECLARE @IRecord NVARCHAR  
        SET @IsRecord = 0  
        SELECT  @IsRecord = COUNT(*)
        FROM    employee
        WHERE   Emp_code = @emp_code AND
                YEAR(joining_date) < 1969 AND
                YEAR(termination_date) = @year  
    
IF @IsRecord = 0 
BEGIN
SET @IRecord ='N'
END 
ELSE
BEGIN
SET @IRecord ='Y'
END 
        RETURN @IRecord  
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getFund]    Script Date: 09/02/2009 12:55:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_getFund] (@emp_code INT)
RETURNS INT
AS 
    BEGIN       
        DECLARE @FundSum INT  
        SELECT  @FundSum = sinda_fund + cdac_fund + cchest_fund + ecf_fund
        FROM    employee
        WHERE   emp_code = @emp_code  
        RETURN @FundSum  
    END
GO
/****** Object:  UserDefinedFunction [dbo].[Fn_NoWds]    Script Date: 09/02/2009 12:55:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Fn_NoWds]
       (
        @empid INT ,
        @startdate DATETIME ,
        @enddate DATETIME 
       )
RETURNS NUMERIC(9, 1)
AS 
    BEGIN        
        DECLARE @Wds AS NUMERIC(9, 1)        
        DECLARE @NoLeaveDays AS NUMERIC(9, 1)        
        DECLARE @i AS INTEGER        
        DECLARE @compid AS INTEGER        
        DECLARE @tempdate DATETIME        
        
        SELECT  @NoLeaveDays = 0, @tempdate = @startdate         
--Select @Wds = no_work_days from company where company_id = @empid        
-- No of working days in a week from Employee not from Company      
        SELECT  @Wds = ISNULL(wdays_per_week, 5.5), @compid=Company_ID
        FROM    employee
        WHERE   emp_code = @empid        
        
        WHILE (@tempdate <= @enddate) 
              BEGIN        
                    SELECT  @i = 0        
                    SELECT  @i = COUNT(*)
                    FROM    public_holidays
                    WHERE   holiday_date = @tempdate And (CompanyID=@compid Or CompanyID=-1)
        
  
    
                    IF @Wds = 6 
                       IF @i = 0 AND
                          DATEPART(dw, @tempdate) <> 1 
                          SELECT    @NoLeaveDays = @NoLeaveDays + 1        
        
                    IF @Wds = 5.5 
                       BEGIN        
                             IF @i = 0 AND
                                DATEPART(dw, @tempdate) <> 1 
                                SELECT  @NoLeaveDays = @NoLeaveDays + 1        
                             IF @i = 0 AND
                                DATEPART(dw, @tempdate) = 7 
                                SELECT  @NoLeaveDays = @NoLeaveDays - 0.5        
                       END        
        
                    IF @Wds = 5 
                       IF @i = 0 AND
                          DATEPART(dw, @tempdate) <> 1 AND
                          DATEPART(dw, @tempdate) <> 7 
                          SELECT    @NoLeaveDays = @NoLeaveDays + 1        
  
                    IF @Wds = 7 
                       IF @i = 0 
                          SELECT    @NoLeaveDays = @NoLeaveDays + 1    
        
                    SELECT  @tempdate = DATEADD(dd, 1, @tempdate)        
              END       
        RETURN  @NoLeaveDays     
     
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetAgeGroup]    Script Date: 09/02/2009 12:55:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetAgeGroup]
       (
        @emp_code INT ,
        @dt_date DATETIME    
       )
RETURNS INT
    BEGIN    
        DECLARE @age_group INT    
        DECLARE @age DATETIME    
        DECLARE @age_diff FLOAT    
        SELECT  @age = date_of_birth
        FROM    Employee
        WHERE   emp_code = @emp_code    
 --SET @age_diff = DATEDIFF(m,@age,GETDATE())    
        SET @age_diff = DATEDIFF(m, @age, @dt_date)    
        SET @age_diff = @age_diff / 12    
  
        IF @age_diff <= 35 
           SET @age_group = 1  
        IF @age_diff > 35 AND
           @age_diff <= 50 
           SET @age_group = 2    
        IF @age_diff > 50 AND
           @age_diff <= 55 
           SET @age_group = 3    
        IF @age_diff > 55 AND
           @age_diff <= 60 
           SET @age_group = 4    
        IF @age_diff > 60 AND
           @age_diff <= 65 
           SET @age_group = 5    
        IF @age_diff > 65 
           SET @age_group = 6    
        RETURN @age_group     
    END
GO
/****** Object:  UserDefinedFunction [dbo].[IsHoliday]    Script Date: 09/02/2009 12:55:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[IsHoliday]
       (
        @company_id INT ,
        @sDate DATETIME
       )
RETURNS INT
AS 
    BEGIN	
        DECLARE @holiday_count INT
        DECLARE @compPolicy FLOAT

        SELECT  @holiday_count = COUNT(*)
        FROM    public_holidays
        WHERE   holiday_date = @sDate  And (CompanyID=@company_id Or CompanyID=-1)

        IF @holiday_count > 0 
           RETURN 1

        RETURN 0
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_getRace]    Script Date: 09/02/2009 12:55:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  FUNCTION [dbo].[fn_getRace] (@race_code INT)
RETURNS VARCHAR(50)
AS 
    BEGIN       
        DECLARE @race VARCHAR(50)  
        SELECT  @race = race
        FROM    [dbo].[race]
        WHERE   id = @race_code  
        RETURN @race   
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetDailyRate]    Script Date: 09/02/2009 12:55:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from DaysInMonth

CREATE FUNCTION [dbo].[fn_GetDailyRate]
       (
        @BasicPay FLOAT ,
        @days_week FLOAT
       )
RETURNS FLOAT
AS 
    BEGIN  
        DECLARE @dtDays FLOAT  
        SET @dtDays = 1  
        DECLARE @dailyRate FLOAT  
        IF @days_week = 5 
           SELECT   @dtDays = days_week5
           FROM     DaysInMonth
           WHERE    year = YEAR(GETDATE()) AND
                    month = MONTH(GETDATE())  
        IF @days_week = 5.5 
           SELECT   @dtDays = days_week512
           FROM     DaysInMonth
           WHERE    year = YEAR(GETDATE()) AND
                    month = MONTH(GETDATE())  
        IF @days_week = 6 
           SELECT   @dtDays = days_week6
           FROM     DaysInMonth
           WHERE    year = YEAR(GETDATE()) AND
                    month = MONTH(GETDATE())  

        IF @days_week = 7 
           SELECT   @dtDays = days_week7
           FROM     DaysInMonth
           WHERE    year = YEAR(GETDATE()) AND
                    month = MONTH(GETDATE())  
  
        SET @dailyRate = ISNULL((@BasicPay / @dtDays), 0)  
  
        RETURN ROUND(@dailyRate,2)  
    END
GO
/****** Object:  UserDefinedFunction [dbo].[fn_GetNoOfWorkingDays]    Script Date: 09/02/2009 12:55:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GetNoOfWorkingDays]
       (
        @wdays_per_week FLOAT ,
        @month INT ,
        @year INT
       )
RETURNS FLOAT
AS 
    BEGIN   
        DECLARE @DaysInMonth FLOAT  
  
        IF @wdays_per_week = 5 
           SELECT   @DaysInMonth = days_week5
           FROM     DaysInMonth
           WHERE    year = @year AND
                    month = @month  
  
        IF @wdays_per_week = 5.5 
           SELECT   @DaysInMonth = days_week512
           FROM     DaysInMonth
           WHERE    year = @year AND
                    month = @month  
  
        IF @wdays_per_week = 6 
           SELECT   @DaysInMonth = days_week6
           FROM     DaysInMonth
           WHERE    year = @year AND
                    month = @month  

        IF @wdays_per_week = 7 
           SELECT   @DaysInMonth = days_week7
           FROM     DaysInMonth
           WHERE    year = @year AND
                    month = @month  
  
        RETURN ISNULL(@DaysInMonth,0)  
  

  
/*    
declare @companyPolicy float    
SET @companyPolicy = @compPolicy    
declare @date varchar(50)    
set @date = cast(@year as varchar) + '/' + cast(@month as varchar) + '/01'    
declare @rowCount int    
declare @noOfSatSun float    
SET @noOfSatSun = 0.0    
SET @rowCount = 1    
declare @DaysInMonth int    
--select @DaysInMonth = datepart(dd,dateadd(dd,-1,dateadd(mm,1,'2007/12/01')))    
select @DaysInMonth = datepart(dd,dateadd(dd,-1,dateadd(mm,1,@date)))    
while @DaysInMonth > 0     
BEGIN      
 declare @dateName varchar(20)    
 IF @companyPolicy = 5    
 BEGIN     
  select @dateName = datename(dw,cast(@year as varchar) + '/' + cast(@month as varchar) + '/' + cast(@rowCount as varchar))     
  IF @dateName = 'Saturday' or @dateName = 'Sunday'     
  BEGIN     
   SET @noOfSatSun = @noOfSatSun + 1     
  END     
 END      
 IF @companyPolicy =  5.5     
 BEGIN     
  select @dateName = datename(dw,cast(@year as varchar) + '/' + cast(@month as varchar) + '/' + cast(@rowCount as varchar))     
  IF @dateName = 'Saturday'     
  BEGIN     
   SET @noOfSatSun = @noOfSatSun + .5     
  END     
  IF @dateName = 'Sunday'     
  BEGIN     
   SET @noOfSatSun = @noOfSatSun + 1    
  END     
 END     
 IF @companyPolicy = 6    
 BEGIN     
  select @dateName = datename(dw,cast(@year as varchar) + '/' + cast(@month as varchar) + '/' + cast(@rowCount as varchar))     
  IF @dateName = 'Sunday'     
  BEGIN     
   SET @noOfSatSun = @noOfSatSun + 1     
  END     
 END     
 SET @rowCount = @rowCount + 1    
 SET @DaysInMonth = @DaysInMonth - 1    
END     
--select @DaysInMonth = datepart(dd,dateadd(dd,-1,dateadd(mm,1,'2007/10/01')))    
select @DaysInMonth = datepart(dd,dateadd(dd,-1,dateadd(mm,1,@date)))    
    
RETURN (@DaysInMonth - @noOfSatSun)  */  
    END
GO
/****** Object:  UserDefinedFunction [dbo].[GetEmployeeCPFPCT]    Script Date: 09/02/2009 12:55:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetEmployeeCPFPCT]  
       (  
        @emp_group INT ,  
        @emp_age FLOAT ,  
        @pr_year INT,
		@CPFCalculate INT
       )  
RETURNS FLOAT  
AS   
    BEGIN     
        DECLARE @employee_cpf_pct FLOAT     
        IF @pr_year > 3   
           SELECT   @pr_year = 3   
  
        IF @emp_age > 35 AND  
           @emp_age < 36   
           SET @emp_age = 36      
        IF @emp_age > 50 AND  
           @emp_age < 51   
           SET @emp_age = 51      
        IF @emp_age > 55 AND  
           @emp_age < 56   
           SET @emp_age = 56      
        IF @emp_age > 60 AND  
           @emp_age < 61   
           SET @emp_age = 61      
        IF @emp_age > 65 AND  
           @emp_age < 66   
           SET @emp_age = 66      
   
     
        SELECT  @employee_cpf_pct = employee_cpf  
        FROM    cpf_calcs  
        WHERE   (pr_year = @pr_year) AND  
                (emp_group = @emp_group) AND  
                (@emp_age >= age_from) AND  
                (@emp_age <= age_to) And
				(CPFCalculate = @CPFCalculate)
     
        IF @employee_cpf_pct IS NULL   
           SET @employee_cpf_pct = 0    
     
        RETURN @employee_cpf_pct    
    END  
GO
/****** Object:  UserDefinedFunction [dbo].[GetEmployerCPFPCT]    Script Date: 09/02/2009 12:55:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Getemployercpfpct] (@emp_group    INT,
                                           @emp_age      FLOAT,
                                           @pr_year      INT,
                                           @CPFCalculate INT)
RETURNS FLOAT
AS
    BEGIN
        --Declare @CPFCalculate INT
        DECLARE @employer_cpf_pct FLOAT

        --Select @CPFCalculate = CPFCalculate From PayrollMOnthlyDetail Where RowID = @monthidintbl
        IF @pr_year > 3
            SELECT @pr_year = 3

        IF @emp_age > 35
           AND @emp_age < 36
            SET @emp_age = 36

        IF @emp_age > 50
           AND @emp_age < 51
            SET @emp_age = 51

        IF @emp_age > 55
           AND @emp_age < 56
            SET @emp_age = 56

        IF @emp_age > 60
           AND @emp_age < 61
            SET @emp_age = 61

        IF @emp_age > 65
           AND @emp_age < 66
            SET @emp_age = 66

        SELECT @employer_cpf_pct = employer_cpf
        FROM   cpf_calcs
        WHERE  (pr_year = @pr_year)
           AND (emp_group = @emp_group)
           AND (@emp_age >= age_from)
           AND (@emp_age <= age_to)
           AND (CPFCalculate = @CPFCalculate)

        IF @employer_cpf_pct IS NULL
            SET @employer_cpf_pct = 0

        RETURN @employer_cpf_pct
    END 
GO

/****** Object:  UserDefinedFunction [dbo].[GET_EmpGroupId]    Script Date: 10/13/2009 12:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GET_EmpGroupId] (@eid INT)
RETURNS INT
-- Input like 1.30 One and half an hour
    BEGIN
        DECLARE @group_id VARCHAR(10)
        SELECT  @group_id = (SELECT emp_group_id FROM employee WHERE emp_code = @eid
                            )      

        RETURN @group_id
    END

GO

/****** Object:  UserDefinedFunction [dbo].F_AGE_IN_YEARS    Script Date: 10/13/2009 12:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[F_AGE_IN_YEARS]
       (
        @START_DATE DATETIME ,
        @END_DATE DATETIME
       )
RETURNS INT
AS /*
Function F_AGE_IN_YEARS computes Age in years.

	Input parameters @START_DATE and @END_DATE
	are required.  If either or both parameters
	are null, the function returns null.
	if @START_DATE midnight is greater than
	@END_DATE midnight, the function returns NULL.

	Age is defined as the number of anniversary dates
	reached or passed from @START_DATE through @END_DATE.

	Age is calculated based on midnight (00:00:00.000)
	of parameters @START_DATE and @END_DATE.
	Time of day is not used in the calculation.

	For example, someone born 2000-02-15
	would be 5 years old on 2006-02-14, 
	but 6 years old on 2000-02-15.

	Someone born on Feb 29 would be a year
	older on Feb 28 in non-leap years, but
	would be a year older on Feb 29 in leap years.

	Function is valid for entire range of datetime
	values from 1753-01-01 00:00:00.000 to 
	9999-12-31 23:59:59.997.

*/

       
       
    BEGIN

        DECLARE @AGE_IN_YEARS INT

        SELECT  @START_DATE = DATEADD(dd, DATEDIFF(dd, 0, @START_DATE), 0),
                @END_DATE = DATEADD(dd, DATEDIFF(dd, 0, @END_DATE), 0)

        IF @START_DATE > @END_DATE 
           BEGIN
                 RETURN NULL
           END

        SELECT  @AGE_IN_YEARS = DATEDIFF(yy, StartDateYearStart, EndDateYearStart) +
	-- Subtract 1 if anniversary date is after end date
                CASE WHEN AnniversaryThisYear <= @END_DATE THEN 0
                     ELSE -1
                END
        FROM    (SELECT AnniversaryThisYear = DATEADD(yy, DATEDIFF(yy, StartDateYearStart, EndDateYearStart),
                                                      @START_DATE) ,
                        StartDateYearStart ,
                        EndDateYearStart
                 FROM   (SELECT StartDateYearStart = DATEADD(yy, DATEDIFF(yy, 0, @START_DATE), 0) ,
                                EndDateYearStart = DATEADD(yy, DATEDIFF(yy, 0, @END_DATE), 0)
                        ) aa
                ) a

        RETURN @AGE_IN_YEARS

    END
go


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_CalculateCPFAW]   
 -- Add the parameters for the stored procedure here  
(   
 @company_id FLOAT ,    
 @month INT ,    
 @cuyear INT ,    
 @empid INT ,    
 @basicascmow FLOAT    
)  
  
  
RETURNS @MyTable TABLE (EMP_ID int, CMOW float, LYOW float, CYOW float, CPFAWCIL float, EST_AWCIL float, ACTCIL float,    
                AWCM float, AWB4CM float, AWCM_AWB4CM float, AWCPF  float     
)  
AS  
BEGIN  
       DECLARE @startsubpay VARCHAR(10)                                                                                                
       DECLARE @endsubpay VARCHAR(10)                                                                                                
       DECLARE @startdtsub DATETIME                                                                                                
       DECLARE @enddtsub DATETIME                                                                                                
    
       DECLARE @layear INT          
       DECLARE @AWCIL FLOAT          
       DECLARE @cpfawcil FLOAT          
       DECLARE @LYOW FLOAT          
       DECLARE @CYOW FLOAT          
       DECLARE @CMOW FLOAT          
       DECLARE @cpfceil FLOAT          
       DECLARE @AWCM FLOAT          
       DECLARE @AWB4CM FLOAT          
       DECLARE @retval FLOAT          
       DECLARE @monthid INT          
       DECLARE @awinloop FLOAT          
       DECLARE @awinloopsum FLOAT          
       DECLARE @leftcumonth INT          
       DECLARE @ACTCIL FLOAT         
       DECLARE @lastdaymonth VARCHAR(2)                                                                                
  declare @RowNumber int  
  
       SELECT TOP 1    
                @lastdaymonth = dateinyear    
       FROM     (SELECT CONVERT(FLOAT, DATENAME(dd, DateInYear)) dateinyear    
                 FROM   DateInYear    
                 WHERE  MONTH(DateInYear) = @month AND    
                        DATENAME(yy, DateInYear) = @cuyear    
                ) DY    
       ORDER BY dateinyear DESC                                                                                
            
    
       SET @startsubpay = '01/' + CAST(@month AS VARCHAR) + '/' + CAST(@cuyear AS VARCHAR)                                                                                                
       SET @endsubpay = @lastdaymonth + '/' + CAST(@month AS VARCHAR) + '/' + CAST(@cuyear AS VARCHAR)                                                                                      
       SET @startdtsub = CONVERT(DATETIME, @startsubpay, 103)                                                                                                
       SET @enddtsub = CONVERT(DATETIME, @endsubpay, 103)                                                        
            
--    
--       SELECT   EMP_CODE    
--       INTO     #Employee    
--       FROM     EMPLOYEE EM    
--       WHERE    (Em.Payrate IS NOT NULL) AND    
--                (Em.Joining_Date <= @enddtsub) AND    
--                (Em.Termination_Date IS NULL OR    
--                 (Em.termination_date >= @startdtsub)    
--                ) AND    
--                (Em.Company_id = @company_id) AND    
--                (Em.StatusID = 1 OR    
--                 (Em.StatusID = 2 AND    
--                  @enddtsub <= Em.termination_date    
--                 ) OR    
--                 (Em.StatusID = 2 AND    
--                  Em.termination_date >= @startdtsub AND    
--                  Em.termination_date <= @enddtsub    
--                 )    
--                )    
       
--  DECLARE db_cursor_old CURSOR FOR SELECT Emp_Code FROM #Employee    
--  OPEN db_cursor_old                                                                                                   
--  FETCH NEXT FROM db_cursor_old INTO @empid    
--  WHILE @@FETCH_STATUS = 0         
--  BEGIN                                                                                                   
    
       SET @layear = @cuyear - 1          
     SET @awinloopsum = 0          
       SET @awinloop = 0          
       SET @cpfceil = 4500          
       SET @cpfawcil = 76500          
       SET @AWCIL = 0          
       SET @retval = 0     
    
       
       SELECT   @leftcumonth = MONTH(termination_date)    
       FROM     Employee    
       WHERE    Emp_Code = @empid AND    
                MONTH(termination_date) < 12          
 --Calculate Last Year Ordinary Wage CPF, Ordinary CPF Ceiling          
       SELECT   @LYOW = D.OrdinaryWagesLY    
       FROM     (SELECT SUM(T.OrdinaryWagesLY) OrdinaryWagesLY    
                 FROM   (SELECT Emp_ID, SUM(OrdinaryWagesLY) OrdinaryWagesLY    
                         FROM   (SELECT Emp_ID ,    
                                        OrdinaryWagesLY = CASE WHEN OrdinaryWagesLY >= @cpfceil THEN @cpfceil    
                                                               ELSE ISNULL(OrdinaryWagesLY, 0)    
                                                          END    
                                 FROM   (SELECT Te.Emp_ID ,    
                                                OrdinaryWagesLY OrdinaryWagesLY    
                                         FROM   (SELECT pd.emp_id ,    
                                                        MONTH(ph.start_period) Mth ,    
                                                        (pd.cpfnet - pd.cpfAdd_Additional) OrdinaryWagesLY    
                                                 FROM   prepare_payroll_hdr ph    
                                                 INNER JOIN prepare_payroll_detail pd ON ph.trx_id = pd.trx_id    
                                                 WHERE  pd.status = 'G' AND    
                                                        YEAR(ph.start_period) = @layear AND    
                                                        pd.CPFNet > 0 AND    
                                                        pd.emp_id = @empid    
                                                ) TE    
                                        ) R    
                                ) D    
                         GROUP BY Emp_ID    
                         UNION    
                         SELECT Emp_Code Emp_ID, ISNULL(LYTotalOW, 0) OrdinaryWagesLY    
                         FROM   Employee    
                         WHERE  Emp_Code = @empid AND    
                                OWLastYear = @cuyear    
                        ) T    
                 GROUP BY Emp_ID    
                ) D          
           
 --Calculate Current Year Ordinary Wage CPF, Ordinary CPF Ceiling          
       SELECT   @CYOW = D.OrdinaryWagesCY    
       FROM     (SELECT SUM(T.OrdinaryWagesCY) OrdinaryWagesCY    
                 FROM   (SELECT Emp_ID ,    
                                OrdinaryWagesCY = CASE WHEN OrdinaryWagesCY >= @cpfceil THEN @cpfceil    
                                                       ELSE ISNULL(OrdinaryWagesCY, 0)    
                                                  END    
                         FROM   (SELECT pd.emp_id ,    
                                        MONTH(ph.start_period) Mth ,    
                                        (pd.cpfnet - pd.cpfAdd_Additional) OrdinaryWagesCY    
                                 FROM   prepare_payroll_hdr ph    
                                 INNER JOIN prepare_payroll_detail pd ON ph.trx_id = pd.trx_id    
                                 WHERE  pd.status = 'G' AND    
                                        MONTH(ph.start_period) < @month AND    
                                        YEAR(ph.start_period) = @cuyear AND    
                                        pd.CPFNet > 0 AND    
                                        pd.emp_id = @empid    
                                ) R    
                        ) T    
                 GROUP BY Emp_ID    
                ) D          
           
           
 ----Calculate Current Year Current Month Ordinary Wages.           
       SELECT   @CMOW = CASE WHEN R.AWPaidCYMonth >= @cpfceil THEN @cpfceil    
                             ELSE ISNULL(R.AWPaidCYMonth, 0)    
                        END    
       FROM     (SELECT R.Emp_Code, SUM(R.AWPaidCYMonth) AWPaidCYMonth    
                 FROM   (SELECT Emp_Code, MONTH(trx_period) [Mth], SUM(trx_amount) AWPaidCYMonth    
                         FROM   emp_additions EA    
                         INNER JOIN Additions_types AT ON EA.Trx_Type = AT.ID    
                         WHERE  --Status='L' And           
                                (MONTH(trx_period) = @month AND    
                                 YEAR(trx_period) = @cuyear    
                                ) AND    
                                AT.CPF = 'Yes' AND    
                                (AT.Type_Of_Wage = 'O' OR    
                                 AT.Type_Of_Wage IS NULL    
                                ) AND    
                                Emp_Code = @empid    
                         GROUP BY Emp_Code, MONTH(trx_period)    
                        ) AS R    
                 GROUP BY R.Emp_Code    
                ) R          
           
   --'CMOW if null or no record found then set it to zero'      
       SET @CMOW = ISNULL(@CMOW, 0)      
       
       IF @LYOW <= 0     
          BEGIN          
   --Change on December 8th 2009      
 --                 IF @basicascmow >= 4500       
 --                    BEGIN          
 --                          SET @basicascmow = 4500          
 --                    END          
 --                 IF @basicascmow <= 0       
 --                    BEGIN          
 --                          SET @basicascmow = 0          
 --                    END          
 --                 SET @CYOW = ISNULL(@CYOW, 0) + ISNULL(@CMOW, 0) + ISNULL(@basicascmow, 0)          
       
                IF (ISNULL(@CMOW, 0) + ISNULL(@basicascmow, 0)) >= 4500     
                   BEGIN          
                         SET @basicascmow = 4500          
                   END          
                IF ISNULL(@CMOW, 0) + ISNULL(@basicascmow, 0) <= 0     
                   BEGIN          
                         SET @basicascmow = 0          
                   END      
                SET @CYOW = ISNULL(@CYOW, 0) + ISNULL(@basicascmow, 0)          
          END          
           
           
 --Calculate Current Year Addition Wages Paid of current month.          
       SELECT   @AWCM = R.AWPaidCYMonth    
       FROM     (SELECT R.Emp_Code, SUM(R.AWPaidCYMonth) AWPaidCYMonth    
                 FROM   (SELECT Emp_Code, MONTH(trx_period) [Mth], SUM(trx_amount) AWPaidCYMonth    
                         FROM   emp_additions EA    
                         INNER JOIN Additions_types AT ON EA.Trx_Type = AT.ID    
                         WHERE  --Status='L' And           
                                (MONTH(trx_period) = @month AND    
                                 YEAR(trx_period) = @cuyear    
                                ) AND    
                                AT.CPF = 'Yes' AND    
                                AT.Type_Of_Wage = 'A' AND    
                                Emp_Code = @empid    
                         GROUP BY Emp_Code, MONTH(trx_period)    
                        ) AS R    
                 GROUP BY R.Emp_Code    
                ) R          
           
           
 --Calculate Current Year Addition Wages Paid Less than current month.          
       SELECT   @AWB4CM = R.AWPaidCY    
       FROM     (SELECT R.Emp_Code, SUM(R.AWPaidCY) AWPaidCY    
                 FROM   (SELECT Emp_Code, MONTH(trx_period) [Mth], SUM(trx_amount) AWPaidCY    
                         FROM   emp_additions EA    
                         INNER JOIN Additions_types AT ON EA.Trx_Type = AT.ID    
                         WHERE  Status = 'L' AND    
                                (MONTH(trx_period) < @month AND    
                                 YEAR(trx_period) = @cuyear    
                                ) AND    
                                AT.CPF = 'Yes' AND    
             AT.Type_Of_Wage = 'A' AND    
                                Emp_Code = @empid    
                         GROUP BY Emp_Code, MONTH(trx_period)    
                        ) AS R    
                 GROUP BY R.Emp_Code    
                ) R          
           
       SET @LYOW = ISNULL(@LYOW, 0)          
       SET @CYOW = ISNULL(@CYOW, 0)          
       SET @AWCM = ISNULL(@AWCM, 0)       
       SET @AWB4CM = ISNULL(@AWB4CM, 0)          
       SET @leftcumonth = ISNULL(@leftcumonth, 0)          
           
           
 --        IF @month < 12 AND      
 --           @AWCM <= 0 AND      
 --           @leftcumonth != @month       
 --           BEGIN          
 --                 RETURN @retval          
 --           END          
           
       IF (@LYOW = 0 AND    
           @CYOW >= 0 AND    
           @AWCM > 0 AND    
           @AWB4CM = 0    
          )     
          BEGIN           
                SET @AWCIL = @cpfawcil - @CYOW          
                IF (@AWCIL <= @AWCM)     
                   BEGIN          
                         SET @retval = @AWCIL          
                   END           
                ELSE     
                   BEGIN          
                         SET @retval = @AWCM          
                   END          
          END          
           
       IF (@LYOW > 0 AND    
           @CYOW > 0 AND    
           @AWCM > 0 AND    
           @AWB4CM = 0 AND    
           @month < 12    
          )     
          BEGIN           
                SET @AWCIL = @cpfawcil - @LYOW          
                IF (@AWCIL <= @AWCM)     
                   BEGIN          
                         SET @retval = @AWCIL          
                   END           
                ELSE     
                   BEGIN          
                         SET @retval = @AWCM          
                   END          
          END          
           
           
           
       IF (@LYOW >= 0 AND    
           @CYOW >= 0 AND    
           @AWCM >= 0 AND    
           @AWB4CM >= 0 AND    
           @month <= 12    
          )     
          BEGIN          
  --Print 'Loop Start'          
           
                DECLARE db_cursor CURSOR FOR            
                SELECT MONTH(trx_period) [Mth]          
                FROM emp_additions EA          
                INNER JOIN Additions_types AT          
                ON EA.Trx_Type=AT.ID          
                WHERE Status='L'          
                AND (MONTH(trx_period) < @month AND YEAR(trx_period) = @cuyear)          
                AND AT.CPF='Yes' AND AT.Type_Of_Wage = 'A' AND Emp_Code = @empid          
                GROUP BY Emp_Code, MONTH(trx_period)           
                OPEN db_cursor             
                FETCH NEXT FROM db_cursor INTO @monthid          
         
         
                WHILE @@FETCH_STATUS = 0     
                      BEGIN        
                            SELECT  @awinloop = dbo.fn_CalculateAdditionWagesBetMonth(@monthid, @cuyear, @empid)          
                            SET @awinloopsum = @awinloopsum + ISNULL(@awinloop, 0)        
                            FETCH NEXT FROM db_cursor INTO @monthid          
                      END             
           
  --Print @awinloopsum          
                CLOSE db_cursor             
                DEALLOCATE db_cursor           
           
  --Print 'Loop End'          
                IF @month < 12 AND    
                   @LYOW > 0     
                   BEGIN          
                         SET @ACTCIL = @cpfawcil - @LYOW          
                   END          
                ELSE     
                   BEGIN          
                         SET @ACTCIL = @cpfawcil - @CYOW          
                   END          
           
                IF @month < 12     
                   BEGIN          
                         SET @AWCIL = @cpfawcil - @LYOW          
                   END           
           
                IF @month = 12 AND    
                   @LYOW > 0     
                   BEGIN          
                         SET @AWCIL = @cpfawcil - @LYOW          
                   END          
                IF @month = 12 AND    
                   @LYOW <= 0     
                   BEGIN          
                         SET @AWCIL = @cpfawcil - @CYOW          
                   END          
           
                IF @leftcumonth = @month     
                   BEGIN          
                         SET @AWCIL = @AWCIL - @AWB4CM          
                   END          
           
           
                IF @month < 12     
                   BEGIN          
               IF @LYOW <= 0     
                            BEGIN          
                                  SET @retval = (@AWCIL - @CYOW) - ISNULL(@awinloopsum, 0)          
                                  IF (@retval > @AWCM)     
                                     BEGIN          
                                           SET @retval = @AWCM          
                                     END          
                            END          
                         ELSE     
                            BEGIN          
                                  IF @LYOW > 0 --And @leftcumonth = @month Removed if Left Current Month...          
                                     BEGIN          
                                           IF @ACTCIL <= (@AWB4CM + @AWCM)     
                                              BEGIN           
                                                    SET @retval = @ACTCIL - ISNULL(@awinloopsum, 0)          
                                              END          
                                           IF @ACTCIL > (@AWB4CM + @AWCM)     
                                              BEGIN           
                                                    SET @retval = (@AWB4CM + @AWCM) - ISNULL(@awinloopsum, 0)      
                                              END          
           
                                           IF @retval >= @AWCIL     
                                              BEGIN           
                                                    SET @retval = @AWCIL          
                                              END          
                                     END          
                            END          
                   END          
           
                IF @month = 12     
                   BEGIN         
     --change on dec 8 2009 for goodwood       
 --                          SET @retval = @AWCIL - ISNULL(@awinloopsum, 0)          
 --                          IF @ACTCIL > (@AWCM + @AWB4CM)       
 --                             BEGIN          
 --                                   SET @retval = (@AWCM + @AWB4CM)          
 --                             END          
 --                          ELSE       
 --                             BEGIN          
 --                                   IF (@cpfawcil - (@CMOW + @CYOW)) < (@AWCM + @AWB4CM) AND      
 --                                      @LYOW > 0       
 --                                      BEGIN          
 --                                            IF (@AWCIL >= @ACTCIL)       
 --                                               BEGIN          
 --                                                     SET @retval = 0          
 --                                               END          
 --                                      END           
 --                             END      
       
                         IF (ISNULL(@CMOW, 0) + ISNULL(@basicascmow, 0)) >= 4500     
                            BEGIN          
                                  SET @basicascmow = 4500          
                            END          
                         IF ISNULL(@CMOW, 0) + ISNULL(@basicascmow, 0) <= 0     
                            BEGIN          
                                  SET @basicascmow = 0          
                            END      
       
                         SET @CYOW = ISNULL(@CYOW, 0) + ISNULL(@basicascmow, 0)       
                         SET @ACTCIL = @cpfawcil - @CYOW      
--                         IF (@ACTCIL >= (@AWCM + @AWB4CM) AND    
--                             @AWCM > 0    
--                            )     
--                            BEGIN          
--                                  SET @retval = @AWCM     
--                            END        
--                         IF (@ACTCIL >= (@AWCM + @AWB4CM) AND    
--                             @AWCM <= 0    
--                            )     
--                            BEGIN          
--                                  SET @retval = 0      
--                            END        
--                         IF (@ACTCIL < (@AWCM + @AWB4CM) AND    
--           @AWCM >= 0    
--                            )     
--                            BEGIN          
--                                  SET @retval = @ACTCIL - (@AWCM + @AWB4CM)      
--                            END        
--                         IF (@ACTCIL < (@AWCM + @AWB4CM) AND    
--                             @AWCM < 0    
--                            )     
--                            BEGIN          
--                                  SET @retval = 0      
--                            END         
    
                         IF (@ACTCIL < @AWB4CM)     
                            BEGIN    
                                  SET @retval = @ACTCIL - @AWB4CM    
                            END    
                         IF (@ACTCIL >= @AWB4CM)     
                            BEGIN    
                                  IF ((@ACTCIL - @AWB4CM) > @AWCM)     
                                     BEGIN    
                                           SET @retval = @AWCM    
                                     END    
                                  IF ((@ACTCIL - @AWB4CM) <= @AWCM)     
                                     BEGIN    
                                           SET @retval = @ACTCIL - @AWB4CM    
                                     END    
                            END     
                   END          
          END          
           
       IF (@AWCM + @AWB4CM) > 0     
          BEGIN          
                SET @retval = ISNULL(@retval, 0)          
          END          
       ELSE     
          BEGIN          
                SET @retval = 0          
          END         
  
INSERT @MYTable  
Select @empid, @CMOW , @LYOW , @CYOW , @cpfawcil , @AWCIL , @ACTCIL ,    
                @AWCM , @AWB4CM , (@AWCM + @AWB4CM) , @retval  
RETURN  
--   INSERT INTO @CPFAWCALC    
--   (    
--    EMP_ID,CMOW,LYOW,CYOW,CPFAWCIL ,EST_AWCIL ,ACTCIL  ,  AWCM ,  AWB4CM ,  AWCM_AWB4CM ,  AWCPF     
--   )  Values    
--   (@empid , @CMOW , @LYOW , @CYOW , @cpfawcil ,@AWCIL , @ACTCIL , @AWCM , @AWB4CM ,      
--   (@AWCM + @AWB4CM) , @retval)    
    
       
 --Print 'LY   OW:' + Convert(varchar,isnull(@LYOW,0))          
 --Print 'CY   OW:' + Convert(varchar,isnull(@CYOW,0))          
 --Print 'CM   AW:' + Convert(varchar,isnull(@AWCM,0))          
 --Print 'B4CM AW:' + Convert(varchar,isnull(@AWB4CM,0))          
 --Print 'Est AW Ceiling:' + Convert(varchar,isnull(@AWCIL,0))          
 --Print 'Actual Ceiling:' + Convert(varchar,isnull(@ACTCIL,0)) + ' Applies only on Last Month'          
 --Print 'AW CPF Subject:' + Convert(varchar,isnull(@retval,0))          
           
 --        IF @retval < 0 AND      
 --           @leftcumonth != @month       
 --           BEGIN          
 --                 SET @retval = 0          
 --           END          
 --          
 --        IF @retval < 0 AND      
 --           @leftcumonth = @month       
 --           BEGIN          
 --    SET @retval = ABS(@retval)          
 --           END      
--   FETCH NEXT FROM db_cursor_old INTO @empid    
--  END                                                                                                   
--                                                                                
--  CLOSE db_cursor_old                                                                                  
--  DEALLOCATE db_cursor_old                                                                       
       --DROP TABLE #Employee    

END  
GO

/****** Object:  UserDefinedFunction [dbo].[fn_Salary]    Script Date: 01/18/2010 20:02:17 ******/
/****Older version****/
/* 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE Function [dbo].[fn_Salary](@emp_code int, @year int)          
	RETURNS float        
	AS          
	BEGIN           
	Declare @Salary float      
	Select @Salary = SUM (total_gross) -  SUM (TOTAL_ADDITIONS) from prepare_payroll_detail pd   
	INNER JOIN prepare_payroll_hdr ph  
	on pd.trx_id = ph.trx_id  
	WHERE Emp_id = @emp_code AND status =  'G' AND  year(start_period) = @year and year(end_period)= @year  
	RETURN @Salary      
	END
GO
*/

/****** Object:  UserDefinedFunction [dbo].[fn_Salary]    Script Date: 03/01/2011 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE Function [dbo].[fn_Salary](@emp_code int, @year int)              
		  RETURNS float            
		  AS              
		  BEGIN               
		  Declare @cnt int  
		  DECLARE @cnt1 int	
		  Select @cnt =  (SELECT Count(*)  
			   FROM  prepare_payroll_detail pd       
			   INNER JOIN prepare_payroll_hdr ph           
			   ON pd.trx_id = ph.trx_id      
			   WHERE Emp_id = @emp_code AND status =  'G'   
			   AND  year(start_period) = @year   
			   AND year(end_period)= @year)  
         
		  DECLARE @Salary float  
		   -- SET @cnt=0   
		  SELECT @cnt1 =(SELECT count(*) FROM EmployeeEarning where emp_id=@emp_code AND IRYear=@year+1)  
		  IF @cnt>0 
					IF @cnt1>0       
						Select @Salary = SUM (total_gross) -  SUM (TOTAL_ADDITIONS)+ Sum(E.GrossPay)/ @cnt +SUM(NH_e ) 
						   FROM   
						   (  
							(  
							 Select total_gross,TOTAL_ADDITIONS,Emp_id,NH_e   
							 FROM  prepare_payroll_detail pd       
							 INNER JOIN prepare_payroll_hdr ph           
							 on pd.trx_id = ph.trx_id      
							 WHERE Emp_id = @emp_code AND status =  'G' AND  year(start_period) = @year and year(end_period)=@year  
							) A INNER JOIN EmployeeEarning E ON A.Emp_id =E.Emp_id AND E.IRYear=@year+1  
						   )  
					ELSE				
							Select @Salary = SUM (A.total_gross) -  SUM (A.TOTAL_ADDITIONS)+SUM(NH_e)  
							   FROM   
								(  
								 Select total_gross,TOTAL_ADDITIONS,Emp_id,NH_e    
								 FROM  prepare_payroll_detail pd       
								 INNER JOIN prepare_payroll_hdr ph           
								 on pd.trx_id = ph.trx_id      
								 WHERE Emp_id = @emp_code AND status =  'G' AND  year(start_period) = @year and year(end_period)=@year
								)A
		   ELSE  
					SELECT @Salary = GrossPay FROM EmployeeEarning  WHERE Emp_id=@emp_code AND IRYear=@year+1  
					RETURN @Salary  
		   END  
GO


/****** Object:  UserDefinedFunction [dbo].[fn_MonthSalary]    Script Date: 01/18/2010 19:57:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[fn_MonthSalary]  
(@emp_code int, @year int,@month int)  
RETURNS float  
AS          
BEGIN           
Declare @Salary float  
Select @Salary = SUM (total_gross) -  SUM (TOTAL_ADDITIONS) from prepare_payroll_detail pd   
INNER JOIN prepare_payroll_hdr ph on pd.trx_id = ph.trx_id  
WHERE Emp_id = @emp_code AND status =  'G' AND  year(start_period) = @year and year(end_period)= @year AND  month(start_period) = @month and month(end_period)= @month  
RETURN @Salary      
END    
GO

/****** Object:  UserDefinedFunction [dbo].[fn_MonthGrossCommissionAmount]    Script Date: 01/18/2010 19:58:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  function [dbo].[fn_MonthGrossCommissionAmount](@emp_code int, @year int ,@month int)      
RETURNS varchar(50)    
AS      
BEGIN       
 declare @TotalBonus varchar(40)  
 declare @BonusStartDate varchar(10) 
 declare @BonusEndDate varchar(10)  

 
  select @TotalBonus = SUM (trx_amount), @BonusStartDate = Min(CONVERT(VARCHAR(8), trx_period, 112)), @BonusEndDate = MAX(CONVERT(VARCHAR(8), trx_period, 112)) from emp_additions  
  WHERE Emp_code = @emp_code AND status =  'L' AND  year(trx_period) =  @year  AND  month(trx_period) =  @month  
  AND trx_type IN (select  id from additions_types where tax_payable = 'Yes' and tax_payable_options in (13,14))   
    

  RETURN @TotalBonus  
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  function [dbo].[fn_MonthGetOtherInfo](@emp_code int, @year int, @month int, @amount_type int )      
RETURNS int    
AS      
BEGIN       
  declare @returnval int  
  
/*  Pension amount_type = 4   
  TransportAllowance amount_type = 5   
  EntertainmentAllowance amount_type = 6   
  OtherAllowance amount_type = 7 */  
  
   select @returnval = SUM (trx_amount) from emp_additions  
  WHERE Emp_code = @emp_code AND status =  'L' AND  year(trx_period) =  @year  AND  month(trx_period) =  @month  
  AND trx_type IN (select  id from additions_types where tax_payable_options  = @amount_type)   
    
  RETURN @returnval  
END
GO


/****** Object:  UserDefinedFunction [dbo].[fn_MonthDirectorsFee]    Script Date: 01/18/2010 19:58:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_MonthDirectorsFee](@emp_code int, @year int,@month int)      
RETURNS int    
AS      
BEGIN       
  declare @TotalBonus int  
  
   select @TotalBonus = SUM (trx_amount) from emp_additions  
  WHERE Emp_code = @emp_code AND status =  'L' AND  year(trx_period) =  @year and  month(trx_period) =  @month  
  AND trx_type IN (select  id from additions_types where tax_payable = 'Yes' and tax_payable_options = 3)   
    
  RETURN @TotalBonus  
END
GO


/****** Object:  UserDefinedFunction [dbo].[fn_MonthBonus]    Script Date: 01/18/2010 19:58:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  function [dbo].[fn_MonthBonus](@emp_code int, @year int,@month int)        
RETURNS int      
AS        
BEGIN         
  declare @TotalBonus int    
    
   select @TotalBonus = SUM (trx_amount) from emp_additions    
  WHERE Emp_code = @emp_code AND status =  'L' AND  year(additionsforyear) =  @year    
		and month(trx_period)=@month
  AND trx_type IN (select  id from additions_types where tax_payable = 'Yes' and tax_payable_options in (1,2))     
    
      
  RETURN @TotalBonus    
END 

GO


/****** Object:  UserDefinedFunction [dbo].[fn_MonthAdditionalSalary]    Script Date: 01/18/2010 19:57:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  function [dbo].[fn_MonthAdditionalSalary](@emp_code int, @year int ,@month int)        
RETURNS float      
AS        
BEGIN         
 declare @TotalSalary float    
 Select @TotalSalary = SUM (trx_amount) from emp_additions    
 WHERE Emp_code = @emp_code AND status =  'L' AND  year(trx_period) =  @year   and month(trx_period) =  @month  
 AND trx_type IN (select  id from additions_types where tax_payable = 'Yes' and tax_payable_options in (15))     
 RETURN @TotalSalary    
END  

GO


/****** Object:  UserDefinedFunction [dbo].[fn_getMonthSumCPF]    Script Date: 01/18/2010 19:59:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  Function [dbo].[fn_getMonthSumCPF](@emp_code int, @year int,@month int)   
	RETURNS  
	int   
	AS  
	BEGIN  
	declare @FundSum int   
	SELECT @FundSum = sum(empCpf) from PREPARE_PAYROLL_DETAIL  
	where emp_id = @emp_code AND Status = 'G' 
	AND trx_id IN ( SELECT trx_id FROM prepare_payroll_hdr where year(start_period) = @year  and month(start_period) = @month)   
	RETURN @FundSum   
	END

GO


/****** Object:  UserDefinedFunction [dbo].[fn_getMonthFundDetailsMBMF]    Script Date: 01/18/2010 20:00:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[fn_getMonthFundDetailsMBMF](@emp_code int, @year int ,@month int)   
RETURNS  
int   
AS  
BEGIN  
declare @FundSum int   
SELECT @FundSum = sum(fund_amount) from prepare_payroll_detail   
where emp_id = @emp_code AND Status = 'G' AND fund_type IN ('MBMF')   
AND trx_id IN ( SELECT trx_id FROM prepare_payroll_hdr where year(start_period) = @year and month(start_period) = @month )   
RETURN @FundSum   
END

GO


/****** Object:  UserDefinedFunction [dbo].[fn_getMonthFundDetails]    Script Date: 01/18/2010 19:59:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Function [dbo].[fn_getMonthFundDetails](@emp_code int, @year int,@month int)     
	RETURNS    
	float   
	AS    
BEGIN    
	declare @FundSum float     
	--SELECT @FundSum = sum(fund_amount) from prepare_payroll_detail     
	SELECT @FundSum = Sum(fund_amount) from prepare_payroll_detail     
	where emp_id = @emp_code AND Status = 'G' AND fund_type IN ('ECF','SINDA','CCHEST', 'CDAC')     
	AND trx_id IN ( SELECT trx_id FROM prepare_payroll_hdr where year(start_period) = @year and month(start_period) = @month )     
	RETURN @FundSum     
END  

GO

/****** Object:  UserDefinedFunction [dbo].[fn_AdditionalSalary]    Script Date: 01/18/2010 20:02:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[fn_AdditionalSalary](@emp_code int, @year int)        
RETURNS float      
AS        
BEGIN         
 declare @TotalSalary float    
 Select @TotalSalary = SUM (trx_amount) from emp_additions    
 WHERE Emp_code = @emp_code AND status =  'L' AND  year(trx_period) =  @year    
 AND trx_type IN (select  id from additions_types where tax_payable = 'Yes' and tax_payable_options in (15))     
 RETURN @TotalSalary    
END  
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_GratuityNoticePymExGratiaPaid](@emp_code int, @year int)   
RETURNS nvarchar    
AS   
BEGIN    
declare @return as nvarchar(10)  
select @return =(  
SELECT distinct  
CASE count(*)  WHEN '0' THEN 'N'  
Else 'Y'  
END As CompensationRetrenchmentBenefitsPaid  
FROM  EMP_ADDITIONS EA   
INNER JOIN ADDITIONS_TYPES A  ON EA.TRX_TYPE=A.ID  
INNER JOIN EMPLOYEE E  
ON EA.EMP_CODE = E.EMP_CODE  
WHERE E.EMP_CODE= @emp_code and TAX_PAYABLE_OPTIONS in ('8','10','11')and additionsforyear=@year)  
  
   
 RETURN @return  
END  
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fn_CompensationRetrenchmentBenefitsPaid](@emp_code int, @year int) 
RETURNS nvarchar  
AS 
BEGIN  
declare @return as nvarchar(10)
select @return =(
SELECT distinct
CASE count(*)  WHEN '0' THEN 'N'
Else 'Y'
END As CompensationRetrenchmentBenefitsPaid
FROM  EMP_ADDITIONS EA 
INNER JOIN ADDITIONS_TYPES A ON EA.TRX_TYPE=A.ID
INNER JOIN EMPLOYEE E
ON EA.EMP_CODE = E.EMP_CODE
WHERE E.EMP_CODE= @emp_code and TAX_PAYABLE_OPTIONS in ('9')and additionsforyear=@year)

 
 RETURN @return
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  function [dbo].[fn_MonthAdditionalSalary_NHE](@emp_code int, @year int ,@month int)          
RETURNS float        
AS          
BEGIN           

	declare @NheSalary float
 
	 Select @NheSalary =NH_e FROM  prepare_payroll_detail pd       
	 INNER JOIN prepare_payroll_hdr ph
	 on pd.trx_id = ph.trx_id      
	 WHERE Emp_id = @emp_code AND status =  'G' 
		AND  year(start_period) =@year  
		AND MONTH(start_period)=@month 
		AND year(end_period)=@year 
		AND MONTH(end_period)=@month   
	
	 RETURN @NheSalary
END    
GO

/***Olderversionstarts***/
/*
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  
function [dbo].[fn_getSumCPF](@emp_code int, @year int)   
RETURNS  
int   
AS  
BEGIN  
declare @FundSum int   
SELECT @FundSum = sum(empCpf) from PREPARE_PAYROLL_DETAIL  
where emp_id = @emp_code AND Status = 'G' 
AND trx_id IN ( SELECT trx_id FROM prepare_payroll_hdr where year(start_period) = @year )   
RETURN @FundSum   
END
GO
*/
/***Olderversionends***/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE FUNCTION [dbo].[fn_getSumCPF](@emp_code int, @year int)
		RETURNS    
		int     
	AS    
		BEGIN    
		DECLARE @FundSum int     
		DECLARE @cnt int
		DECLARE @cnt1 int	
		
		SELECT @cnt =(  
						SELECT COUNT(*) from PREPARE_PAYROLL_DETAIL
						WHERE emp_id = @emp_code AND Status = 'G'   
						AND trx_id IN ( SELECT trx_id FROM prepare_payroll_hdr where year(start_period) = @year )     
					)
					
		--SET @cnt=0
		--SELECT @cnt1 =(SELECT count(*) FROM EmployeeEarning where emp_id=@emp_code AND IRYear=@year+1 )  		
		SELECT @cnt1 =(SELECT count(*) FROM EmployeeEarning where emp_id=@emp_code AND IRYear=@year+1 AND EmployeeCPF IS NOT NULL)
		
		IF(@cnt>0)
			IF (@cnt1>0)
				SELECT @FundSum = (SUM(empCpf) + SUM(EmployeeCPF)/@cnt) FROM
				(
					SELECT empCpf,emp_id from PREPARE_PAYROLL_DETAIL
					where emp_id = @emp_code AND Status = 'G'   
					AND trx_id IN ( SELECT trx_id FROM prepare_payroll_hdr where year(start_period) = @year)
				)A INNER JOIN EmployeeEarning E ON A.emp_id  =E.emp_id AND E.IRYear= @year+1	
			ELSE
				SELECT @FundSum = (SUM(empCpf)) FROM
				(
						SELECT empCpf,emp_id from PREPARE_PAYROLL_DETAIL
						where emp_id = @emp_code AND Status = 'G'   
						AND trx_id IN ( SELECT trx_id FROM prepare_payroll_hdr where year(start_period) = @year)
				)A 
		ELSE
			SELECT @FundSum = EmployeeCPF FROM EmployeeEarning  WHERE Emp_id=@emp_code AND IRYear=@year+1
					
		RETURN @FundSum
	END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create FUNCTION [dbo].[fn_CompensationRetrenchmentbenefitsAmount]
       (
        @emp_code INT ,
        @year INT 
       )
RETURNS INT
AS 
    BEGIN       
        DECLARE @returnval INT  
  
/*  Pension amount_type = 4   
  TransportAllowance amount_type = 5   
  EntertainmentAllowance amount_type = 6   
  OtherAllowance amount_type = 7 */  
  
        SELECT  @returnval = SUM(trx_amount)
        FROM    emp_additions
        WHERE   Emp_code = @emp_code AND
                status = 'L' AND
                YEAR(trx_period) = @year AND
                trx_type IN (SELECT id
                             FROM   additions_types
                             WHERE  tax_payable = 'Yes' AND
                                    tax_payable_options IN (9))   
    
        RETURN @returnval  
    END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create  FUNCTION [dbo].[fn_GrossCommissionAmountEnd]
       (
        @emp_code INT ,
        @year INT
       )
RETURNS VARCHAR(50)
AS 
    BEGIN       
        DECLARE @TotalBonus VARCHAR(40)  
        DECLARE @BonusStartDate VARCHAR(10) 
        DECLARE @BonusEndDate VARCHAR(10)  

 
        SELECT  @TotalBonus = SUM(trx_amount), @BonusStartDate = MAX(CONVERT(VARCHAR(8), trx_period, 112)),
                @BonusEndDate = MAX(CONVERT(VARCHAR(8), trx_period, 112))
        FROM    emp_additions
        WHERE   Emp_code = @emp_code AND
                status = 'L' AND
                YEAR(trx_period) = @year AND
                trx_type IN (SELECT id
                             FROM   additions_types
                             WHERE  tax_payable = 'Yes' AND
                                    tax_payable_options IN (13, 14))   
    
        --SET @TotalBonus = @TotalBonus + '-' + @BonusStartDate + '-' + @BonusEndDate
		SET @TotalBonus = @BonusEndDate 
        RETURN @TotalBonus  
    END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create  FUNCTION [dbo].[fn_GrossCommissionAmountStart]
       (
        @emp_code INT ,
        @year INT
       )
RETURNS VARCHAR(50)
AS 
    BEGIN       
        DECLARE @TotalBonus VARCHAR(40)  
        DECLARE @BonusStartDate VARCHAR(10) 
        DECLARE @BonusEndDate VARCHAR(10)  

 
        SELECT  @TotalBonus = SUM(trx_amount), @BonusStartDate = MIN(CONVERT(VARCHAR(8), trx_period, 112)),
                @BonusEndDate = MAX(CONVERT(VARCHAR(8), trx_period, 112))
        FROM    emp_additions
        WHERE   Emp_code = @emp_code AND
                status = 'L' AND
                YEAR(trx_period) = @year AND
                trx_type IN (SELECT id
                             FROM   additions_types
                             WHERE  tax_payable = 'Yes' AND
                                    tax_payable_options IN (13, 14))   
    
        --SET @TotalBonus = @TotalBonus + '-' + @BonusStartDate + '-' + @BonusEndDate
		SET @TotalBonus = @BonusStartDate 
        RETURN @TotalBonus  
    END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ConvertToRound]   
(@VAL Float,  
 @FORM INT  
)  
RETURNS   
FLOAT  
BEGIN  
  
DECLARE @FLOAT AS FLOAT  
--DECLARE @FORM AS INT  
--DECLARE @VAL AS FLOAT  
SET @FLOAT = @VAL --86.568813  
--Set @VAL = Round(@FLOAT,2,1)  
  
--PRINT @VAL  
--SET @FORM = 2  
  
IF @FORM = 1  
SET @VAL = Round(@VAL,0,1)  
  
IF @FORM = 2  
SET @VAL = Round(@VAL,0)  
  
IF @FORM = 3  
SET @VAL = Round(@VAL,1,2)  
  
IF @FORM = 4  
SET @VAL = Round(@VAL,1,0)  
  
  
--PRINT @VAL  
 RETURN @VAL  
END  
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Fn_getitemprice] (@ItCode INT)
RETURNS INT
AS
    BEGIN
        DECLARE @Price AS INT

        SELECT @Price = Price
        FROM   TRANSACTIONDETAILS
        WHERE  TransSubId = (SELECT MAX(TransSubId)
                             FROM   TRANSACTIONDETAILS
                             WHERE  ItemCode = @ItCode)
           AND ItemCode = @ItCode

        RETURN @Price
    END 
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufn_IsLeapYear] ( @pDate    INT )
RETURNS BIT
AS
BEGIN

    IF (( @pDate ) % 4 = 0 AND ( @pDate ) % 100 != 0) OR
        ( @pDate ) % 400 = 0
        RETURN 1

    RETURN 0

END
GO



------go
------IF EXISTS ( SELECT  *
------            FROM    sys.objects
------            WHERE   object_id = OBJECT_ID(N'ConvertToHours') AND
------                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
------   DROP FUNCTION ConvertToHours
------go
------IF EXISTS ( SELECT  *
------            FROM    sys.objects
------            WHERE   object_id = OBJECT_ID(N'ConvertToMinutes') AND
------                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
------   DROP FUNCTION ConvertToMinutes

------GO
------
------IF EXISTS ( SELECT  *
------            FROM    sys.objects
------            WHERE   object_id = OBJECT_ID(N'Get_available_leaves_prorated2') AND
------                    type IN (N'FN', N'IF', N'TF', N'FS', N'FT') ) 
------   DROP FUNCTION Get_available_leaves_prorated2
------GO
--------Update Employee Set Termination_Date=null, joining_date = '04/10/2009' where emp_code=18
--------Select * From EMployeeleavesallowed  
--------select * From prorated_leaves  
--------Update Company Set leave_model=8  
--------Update Employee Set Joining_Date='01/06/1992' Where Emp_Code=53            
--------SELECT   dbo.Get_available_leaves_prorated2('30/04/2010',  2, 'HPS18')
------CREATE FUNCTION [dbo].[Get_available_leaves_prorated2] (@enDate  VARCHAR(10),  
------                                                       @compid   INT,  
------                                                       @username VARCHAR(50))  
------RETURNS FLOAT  
------AS  
------    BEGIN  
------        --  DECLARE  @enDate   VARCHAR(10),      
------        --           @compid   INT,      
------        --           @username VARCHAR(50)      
------        --        
------        --  SET @enDate = '01/04/2010'      
------        --  SET @compid = 17    
------        --  SET @username = 'KKSAdmin'      
------        DECLARE @roundfor INT  
------        DECLARE @leave_model INT  
------        DECLARE @retVal FLOAT  
------        DECLARE @dt_enDate DATETIME  
------        DECLARE @dt_joiningDate DATETIME  
------        DECLARE @dt_joiningDateproxy DATETIME  
------        DECLARE @dt_leave_allowed FLOAT  
------        DECLARE @dt_leave_remaining FLOAT  
------        DECLARE @dt_last_year_leaves FLOAT  
------        DECLARE @group_id INT  
------        DECLARE @year_of_service INT  
------        DECLARE @months_of_service INT  
------        DECLARE @empid INT  
------        DECLARE @mofserviceproxy INT  
------        DECLARE @ELMonth INT  
------        DECLARE @dt_leave_prorate FLOAT  
------        DECLARE @dt_leave_earn FLOAT  
------        DECLARE @dt_joining_month INT  
------        DECLARE @dt1 FLOAT  
------        DECLARE @dt2 FLOAT  
------        DECLARE @dt3 FLOAT  
------        DECLARE @denominator INT  
------  
------        SET @retVal = 0.0  
------        SET @dt_enDate = CONVERT(DATETIME, @enDate, 103)  
------        SET @dt_last_year_leaves = 0.0  
------        SET @year_of_service = 1  
------        SET @months_of_service = 0  
------  
------        IF MONTH(@dt_enDate) = 12  
------            BEGIN  
------                SET @roundfor = 50  
------            END  
------        ELSE  
------            BEGIN  
------                SET @roundfor = 50  
------            END  
------  
------        SELECT @group_id = (SELECT emp_group_id  
------                            FROM   employee  
------                            WHERE  username = @username)  
------  
------        SELECT @empid = (SELECT emp_code  
------                         FROM   employee  
------                         WHERE  username = @username)  
------  
------        SELECT @dt_joiningDate = joining_date,@dt_joiningDateproxy = joining_date  
------        FROM   employee  
------        WHERE  username = @username  
------  
------        SET @months_of_service = Datediff(m, @dt_joiningDate, @dt_enDate)  
------        SET @dt1 = @months_of_service  
------        SET @dt2 = 12  
------        SET @dt3 = @dt1 / @dt2  
------  
------        IF @year_of_service = 0  
------            SET @year_of_service = 1  
------  
------        --  SELECT @ELMonth = Isnull(Max(e.leave_year),0)      
------        --  FROM   employeeleavesallowed e      
------        --  WHERE  e.emp_id = @empid      
------        SELECT @ELMonth = Isnull(MAX(YEAR(y.startdate)), 0)  
------        FROM   YOSLeavesAllowed y  
------        WHERE  y.emp_id = @empid  
------           AND LeavesAllowed > 0  
------  
------        IF (@ELMonth) <= 0  
------            BEGIN  
------                RETURN 0  
------            --PRINT 0      
------            END  
------  
------        SET @dt_joiningDateproxy = CONVERT(DATETIME, CAST(DAY(@dt_joiningDateproxy) AS VARCHAR) + '/' + CAST(MONTH(@dt_joiningDateproxy) AS VARCHAR) + '/' + CAST(@ELMonth AS VARCHAR), 103)  
------        SET @mofserviceproxy = Datediff(m, @dt_joiningDateproxy, @dt_enDate)  
------  
------        IF (@dt_joiningDateproxy > @dt_enDate)  
------            BEGIN  
------                SET @year_of_service = Ceiling(@dt3) + 1  
------  
------                SELECT @dt_leave_allowed = Isnull(leaves_allowed, 0)  
------                FROM   prorated_leaves  
------                WHERE  group_id = @group_id  
------                   AND comp_id = @compid  
------                   AND year_of_service = @year_of_service  
------  
------                --      SELECT @retVal = (Isnull(leaves_allowed,0) - @dt_leave_allowed)      
------                --      FROM   employeeleavesallowed      
------                --      WHERE  emp_id = @empid      
------                --             AND leave_type = 8      
------                SELECT @retVal = (Isnull(y.leavesallowed, 0) - @dt_leave_allowed)  
------                FROM   YOSLeavesAllowed y  
------                WHERE  y.emp_id = @empid  
------                   AND LeavesAllowed > 0  
------  
------                IF (@retVal < 0)  
------                    BEGIN  
------                        SET @retVal = 0  
------  
------                        RETURN @retVal  
------                    --PRINT @retVal      
------                    END  
------            END  
------        ELSE  
------            BEGIN  
------                IF (@mofserviceproxy = 0)  
------                    BEGIN  
------                        SET @year_of_service = Ceiling(@dt3 + 1)  
------                    END  
------                ELSE  
------                    BEGIN  
------                        SET @year_of_service = Ceiling(@dt3)  
------                    END  
------  
------                SELECT @dt_leave_allowed = Isnull(leaves_allowed, 0)  
------                FROM   prorated_leaves  
------                WHERE  group_id = @group_id  
------                   AND comp_id = @compid  
------                   AND year_of_service = @year_of_service  
------  
------                IF (@year_of_service > 10)  
------                    BEGIN  
------                        SELECT @dt_leave_allowed = Isnull(leaves_allowed, 0)  
------                        FROM   prorated_leaves  
------                        WHERE  group_id = @group_id  
------                           AND comp_id = @compid  
------                           AND year_of_service = 10  
------                    END  
------  
------                --      SELECT @dt_leave_remaining = Sum(Isnull(leaves_allowed,0))      
------                --      FROM   employeeleavesallowed      
------                --      WHERE  emp_id = (SELECT emp_code      
------                --                       FROM   employee      
------                --                       WHERE  username = @username)      
------                --             AND leave_year <= Year(@dt_enDate)      
------                --             AND leave_type = 8      
------  
--------                IF (@dt_leave_remaining > @dt_leave_allowed)  
--------                    SET @dt_last_year_leaves = Isnull(@dt_leave_remaining, 0) - Isnull(@dt_leave_allowed, 0)  
--------                ELSE  
--------                    SET @dt_last_year_leaves = 0.0  
------  
------                SELECT @dt_leave_remaining = (Isnull(y.leavesallowed, 0)), @dt_last_year_leaves = (Isnull(y.LY_Leaves_Bal, 0))  
------                FROM   YOSLeavesAllowed y  
------                WHERE  y.emp_id = @empid  
------                   AND LeavesAllowed > 0  
------  
------  
------                --Select @dt_leave_remaining, @dt_leave_allowed, abs(@dt_last_year_leaves)      
------                SET @dt_joining_month = Datepart(m, @dt_joiningDateproxy)  
------                SET @dt_leave_prorate = @dt_leave_allowed / 12  
------                SET @dt_leave_earn = @dt_leave_prorate * ((MONTH(@dt_enDate)) - @dt_joining_month)  
------  
------                IF (@dt_leave_allowed > @dt_leave_remaining)  
------                    SET @retVal = @dt_leave_earn - (@dt_leave_allowed - @dt_leave_remaining)  
------                ELSE  
------                    SET @retVal = @dt_leave_earn + (@dt_leave_remaining - @dt_leave_allowed)  
------  
------                --IF (YEAR(@dt_joiningDate) = YEAR(Getdate()))  Commented On 13th Aug 2010
------				IF (1=2)
------                    BEGIN  
------                        IF (MONTH(@dt_joiningDateproxy) >= MONTH(Dateadd(m, -1, @dt_enDate)))  
------                            BEGIN  
------                                SET @retVal = @dt_last_year_leaves + 0  
------                            END  
------                        ELSE  
------                            BEGIN  
------                                SET @denominator = 12 - (Isnull(MONTH(@dt_joiningDateproxy), 0))  
------                                SET @retVal = Isnull((((Isnull(@dt_leave_allowed, 0)) / (Isnull(@denominator, 1))) * (MONTH(Dateadd(m, -1, @dt_enDate)))), 0)  
------                            END  
------                    END  
------                ELSE  
------                    BEGIN  
------                        ---     
------  
------                        IF (@mofserviceproxy = 0)  
------                            BEGIN  
------                                --select @dt_last_year_leaves, @dt_leave_allowed, @mofserviceproxy      
--------                                IF (@dt_leave_remaining < @dt_leave_allowed)  
--------                                    BEGIN  
--------                                        SET @retVal = @dt_last_year_leaves + Isnull((((Isnull(@dt_leave_remaining, 0)) / 12) * (@mofserviceproxy)), 0)  
--------                                    END  
--------                                ELSE  
--------                                    BEGIN  
--------                                        SET @retVal = @dt_last_year_leaves + Isnull((((Isnull(@dt_leave_allowed, 0)) / 12) * (@mofserviceproxy)), 0)  
--------                                    END  
------                                        SET @retVal = Isnull((((Isnull(@dt_leave_remaining, 0)) / 12) * (@mofserviceproxy)), 0)  
------                            END  
------                        ELSE  
------                            IF (@mofserviceproxy >= 11  
------                                AND @mofserviceproxy <= 12)  
------                                BEGIN  
------                                    SET @mofserviceproxy = 12  
------									SET @retVal = Isnull((((Isnull(@dt_leave_remaining, 0)) / 12) * (@mofserviceproxy)), 0)  
--------                                    IF (@dt_leave_remaining < @dt_leave_allowed)  
--------                                        BEGIN  
--------                                            SET @retVal = @dt_last_year_leaves + Isnull((((Isnull(@dt_leave_remaining, 0)) / 12) * (@mofserviceproxy)), 0)  
--------                                        END  
--------                                    ELSE  
--------                                        BEGIN  
--------                                            SET @retVal = @dt_last_year_leaves + Isnull((((Isnull(@dt_leave_allowed, 0)) / 12) * (@mofserviceproxy)), 0)  
--------                                        END  
------                                END  
------                            ELSE  
------                                BEGIN  
--------                                    IF (@dt_leave_remaining < @dt_leave_allowed)  
--------                                        BEGIN  
--------                                            SET @retVal = @dt_last_year_leaves + Isnull((((Isnull(@dt_leave_remaining, 0)) / 12) * (@mofserviceproxy)), 0)  
--------                                        END  
--------                                    ELSE  
--------                                        BEGIN  
--------                                            SET @retVal = @dt_last_year_leaves + Isnull((((Isnull(@dt_leave_allowed, 0)) / 12) * (@mofserviceproxy)), 0)  
--------                                        END  
------                                            SET @retVal = Isnull((((Isnull(@dt_leave_remaining, 0)) / 12) * (@mofserviceproxy)), 0)  
------                                END  
------                    END  
------            END  
------  
------        IF @retVal < 0  
------            SET @retVal = 0  
------  
------        SET @leave_model = 6  
------  
------        SELECT @leave_model = Isnull(leave_model, 6)  
------        FROM   company  
------        WHERE  company_id = @compid  
------  
------        IF @leave_model = 4  
------            BEGIN  
------                SET @retVal = Floor(@retVal)  
------            END  
------  
------        IF @leave_model = 6  
------            BEGIN  
------                SET @retVal = Ceiling(@retVal)  
------            END  
------  
------        IF @leave_model = 8  
------            BEGIN  
------                SET @retVal = Round(@retVal, 2)  
------            END  
------  
------        IF Datediff(m, @dt_joiningDateproxy, @dt_enDate) > 11  
------            BEGIN  
------                SET @retVal = 0  
------            END  
------  
------        --PRINT @retVal      
------        RETURN @retVal  
------    END   
------GO

------CREATE FUNCTION [dbo].[ConvertToHours] (@Minutes INT)        
------RETURNS DECIMAL(10, 2)        
-------- Returns like 1.30 One and half an hour        
------    BEGIN    
------  --return CAST( CAST((@Minutes / 60) as varchar(10)) + '.' + CAST((@Minutes % 60) as varchar(10)) as decimal(10,2))        
------        RETURN CAST(CAST(@Minutes/60 AS VARCHAR(5)) + '.' + RIGHT('0' + CAST(ABS(@Minutes)%60 AS VARCHAR(2)), 2) AS DECIMAL(10,2))    
------  --RETURN CAST(CAST(@Minutes/60 AS VARCHAR(5)) + '.' + RIGHT('0' + CAST(abs(@Minutes)%60 AS VARCHAR(2)), 2) AS DECIMAL(10,2))    
------    END    
------
------GO

------CREATE FUNCTION [dbo].[ConvertToMinutes] (@Hour DECIMAL(10, 2))  
------RETURNS INT  
-------- Input like 1.30 One and half an hour  
------    BEGIN  
------		Declare @RET AS DECIMAL(10,2)
------		if @Hour > 0 
------		beGIN
------			SET @RET = FLOOR(@Hour) * 60 + ABS(((@Hour % 1) * 100.0 ))
------		END
------		ELSE
------		BEGIN
------			SET @RET = -(FLOOR(ABS(@Hour)) * 60 + ABS(((@Hour % 1) * 100.0 )))
------		END
------		RETURN @RET
------	END
------
------GO
------Merging 9.0