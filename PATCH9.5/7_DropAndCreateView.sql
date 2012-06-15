/****** Object:  View [dbo].[PayRollView]    Script Date: 01/15/2009 11:32:41 ******/
------IF EXISTS ( SELECT  xtype
------            FROM    sysobjects
------            WHERE   name = N'PayRollView' AND
------                    xtype = 'V' ) 
------   DROP VIEW PayRollView
------GO
------
------CREATE VIEW [dbo].[PayRollView]
------AS
------SELECT     dbo.employee.emp_code, dbo.employee.emp_name, dbo.employee.emp_lname, dbo.prepare_payroll_hdr.trx_id, 
------                      dbo.prepare_payroll_hdr.start_period, dbo.prepare_payroll_hdr.end_period, dbo.prepare_payroll_detail.basic_pay, dbo.prepare_payroll_detail.status, 
------                      dbo.prepare_payroll_detail.OT1Rate, dbo.prepare_payroll_detail.OT2Rate, dbo.prepare_payroll_detail.OT1_e, dbo.prepare_payroll_detail.OT2_e, 
------                      dbo.prepare_payroll_detail.Wdays, dbo.prepare_payroll_detail.NetPay, dbo.prepare_payroll_detail.total_additions, 
------                      dbo.prepare_payroll_detail.total_deductions, dbo.prepare_payroll_detail.cpfAdd_Ordinary, dbo.prepare_payroll_detail.cpfAdd_Additional, 
------                      dbo.prepare_payroll_detail.cpfNet, dbo.prepare_payroll_detail.empCPF, dbo.prepare_payroll_detail.employerCPF, 
------                      dbo.prepare_payroll_detail.cpfAmount, dbo.prepare_payroll_detail.unpaid_leaves_amount, dbo.prepare_payroll_detail.unpaid_leaves, 
------                      dbo.prepare_payroll_detail.total_gross, dbo.prepare_payroll_detail.SDL, dbo.prepare_payroll_detail.FWL, dbo.prepare_payroll_detail.OT1_wh, 
------                      dbo.prepare_payroll_detail.OT2_wh
------FROM         dbo.prepare_payroll_hdr INNER JOIN
------                      dbo.prepare_payroll_detail ON dbo.prepare_payroll_hdr.trx_id = dbo.prepare_payroll_detail.trx_id INNER JOIN
------                      dbo.employee ON dbo.prepare_payroll_detail.emp_id = dbo.employee.emp_code
------
------GO
------EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
------Begin DesignProperties = 
------   Begin PaneConfigurations = 
------      Begin PaneConfiguration = 0
------         NumPanes = 4
------         Configuration = "(H (1[34] 4[15] 2[3] 3) )"
------      End
------      Begin PaneConfiguration = 1
------         NumPanes = 3
------         Configuration = "(H (1 [50] 4 [25] 3))"
------      End
------      Begin PaneConfiguration = 2
------         NumPanes = 3
------         Configuration = "(H (1 [50] 2 [25] 3))"
------      End
------      Begin PaneConfiguration = 3
------         NumPanes = 3
------         Configuration = "(H (4 [30] 2 [40] 3))"
------      End
------      Begin PaneConfiguration = 4
------         NumPanes = 2
------         Configuration = "(H (1 [56] 3))"
------      End
------      Begin PaneConfiguration = 5
------         NumPanes = 2
------         Configuration = "(H (2 [66] 3))"
------      End
------      Begin PaneConfiguration = 6
------         NumPanes = 2
------         Configuration = "(H (4 [50] 3))"
------      End
------      Begin PaneConfiguration = 7
------         NumPanes = 1
------         Configuration = "(V (3))"
------      End
------      Begin PaneConfiguration = 8
------         NumPanes = 3
------         Configuration = "(H (1[56] 4[18] 2) )"
------      End
------      Begin PaneConfiguration = 9
------         NumPanes = 2
------         Configuration = "(H (1 [75] 4))"
------      End
------      Begin PaneConfiguration = 10
------         NumPanes = 2
------         Configuration = "(H (1[66] 2) )"
------      End
------      Begin PaneConfiguration = 11
------         NumPanes = 2
------         Configuration = "(H (4 [60] 2))"
------      End
------      Begin PaneConfiguration = 12
------         NumPanes = 1
------         Configuration = "(H (1) )"
------      End
------      Begin PaneConfiguration = 13
------         NumPanes = 1
------         Configuration = "(V (4))"
------      End
------      Begin PaneConfiguration = 14
------         NumPanes = 1
------         Configuration = "(V (2))"
------      End
------      ActivePaneConfig = 0
------   End
------   Begin DiagramPane = 
------      Begin Origin = 
------         Top = 0
------         Left = 0
------      End
------      Begin Tables = 
------         Begin Table = "prepare_payroll_hdr"
------            Begin Extent = 
------               Top = 3
------               Left = 250
------               Bottom = 241
------               Right = 452
------            End
------            DisplayFlags = 280
------            TopColumn = 0
------         End
------         Begin Table = "prepare_payroll_detail"
------            Begin Extent = 
------               Top = 26
------               Left = 522
------               Bottom = 261
------               Right = 820
------            End
------            DisplayFlags = 280
------            TopColumn = 0
------         End
------         Begin Table = "employee"
------            Begin Extent = 
------               Top = 6
------               Left = 38
------               Bottom = 242
------               Right = 220
------            End
------            DisplayFlags = 280
------            TopColumn = 0
------         End
------      End
------   End
------   Begin SQLPane = 
------   End
------   Begin DataPane = 
------      Begin ParameterDefaults = ""
------      End
------      Begin ColumnWidths = 18
------         Width = 284
------         Width = 1500
------         Width = 1500
------         Width = 1500
------         Width = 1500
------         Width = 1500
------         Width = 1500
------         Width = 1500
------         Width = 1500
------         Width = 1500
------         Width = 1500
------         Width = 1500
------         Width = 1500
------         Width = 1500
------         Width = 1500
------         Width = 1500
------         Width = 1500
------         Width = 1500
------      End
------   End
------   Begin CriteriaPane = 
------      Begin ColumnWidths = 11
------         Column = 1440
------         Alias = 900
------         Table = 1170
------         Output = 720
------         Append = 1400
------         NewValue = 1170
------         SortType = 1350
------         SortOrder = 1410
------         GroupBy = 1350
------         Filter = 1350
------         Or = 1350
------         Or = 1350
------         Or = 1350
------      End
------   End
------End
------' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PayRollView'
------GO
------EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PayRollView'
------
------GO
------Merging 9.0

/****** Object:  View [dbo].[View_emp_deductions]    Script Date: 01/15/2009 11:32:41 ******/
------IF EXISTS ( SELECT  xtype
------            FROM    sysobjects
------            WHERE   name = N'ViewDeductions' AND
------                    xtype = 'V' ) 
------   DROP VIEW ViewDeductions
------GO
------
------/****** Object:  View [dbo].[ViewDeductions]    Script Date: 12/09/2009 20:59:18 ******/
------SET ANSI_NULLS ON
------GO
------SET QUOTED_IDENTIFIER ON
------GO
------CREATE VIEW [dbo].[ViewDeductions] AS
------select id, [desc] as  description,company_id,cpf from deductions_types
------GO
------Merging 9.0

/****** Object:  View [dbo].[ViewAdditionTypesDesc]    Script Date: 01/15/2009 11:32:41 ******/
----IF EXISTS ( SELECT  xtype
----            FROM    sysobjects
----            WHERE   name = N'ViewAdditionTypesDesc' AND
----                    xtype = 'V' ) 
----   DROP VIEW ViewAdditionTypesDesc
----GO
----
----CREATE VIEW [dbo].[ViewAdditionTypesDesc]
----AS
----select id,[desc] as description,cpf,company_id,type_of_wage,optionselection,code,formulatype,formulacalc,tax_payable,tax_payable_options from additions_types
------Merging 9.0

IF EXISTS ( SELECT  xtype
            FROM    sysobjects
            WHERE   name = N'View_emp_deductions' AND
                    xtype = 'V' ) 
   DROP VIEW View_emp_deductions
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_emp_deductions]
AS
SELECT a.trx_id, a.trx_type, b.[desc], a.trx_amount, a.trx_period, a.created_on, a.created_by, a.modified_on, a.modified_by, a.emp_code, a.status
FROM emp_deductions a, deductions_TYPES b 
WHERE a.trx_type = b.id



/****** Object:  View [dbo].[View_emp_additions]    Script Date: 01/15/2009 11:32:14 ******/
GO
IF EXISTS ( SELECT  xtype
            FROM    sysobjects
            WHERE   name = N'View_emp_additions' AND
                    xtype = 'V' ) 
   DROP VIEW View_emp_additions
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_emp_additions]  
AS  
SELECT     a.trx_id, a.trx_type, b.[desc], a.trx_amount, a.trx_period, a.created_on, a.created_by, a.modified_on, a.modified_by, a.emp_code, a.status, b.cpf  
FROM         dbo.emp_additions AS a INNER JOIN  
dbo.additions_types AS b ON a.trx_type = b.id  
GO
EXEC sys.sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1[50] 4[25] 3) )"
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
         Configuration = "(H (2[66] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4[50] 3) )"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3) )"
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
      ActivePaneConfig = 5
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 190
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 228
               Bottom = 121
               Right = 380
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
   End
   Begin CriteriaPane = 
      PaneHidden = 
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
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_emp_additions'
GO
EXEC sys.sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA',
    @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'View_emp_additions'
    
--8.5 B  
IF EXISTS ( SELECT  *
            FROM    sys.objects
            WHERE   object_id = OBJECT_ID(N'VIEW_GET_DATABASE_LOG_DETAILS'))
   DROP VIEW VIEW_GET_DATABASE_LOG_DETAILS
IF EXISTS ( SELECT  xtype
            FROM    sysobjects
            WHERE   name = N'ViewDeductions' AND
                    xtype = 'V' ) 
   DROP VIEW ViewDeductions
GO
IF EXISTS ( SELECT  xtype
            FROM    sysobjects
            WHERE   name = N'ViewAdditionTypesDesc' AND
                    xtype = 'V' ) 
   DROP VIEW ViewAdditionTypesDesc
GO
IF EXISTS ( SELECT  xtype
            FROM    sysobjects
            WHERE   name = N'PayRollView' AND
                    xtype = 'V' ) 
   DROP VIEW PayRollView
GO

IF EXISTS ( SELECT  xtype
            FROM    sysobjects
            WHERE   name = N'PayRollView1' AND
                    xtype = 'V' ) 
   DROP VIEW PayRollView1
GO


CREATE VIEW [dbo].[PayRollView]
AS
SELECT     dbo.Company.Company_name, dbo.employee.emp_code, dbo.employee.emp_name, dbo.employee.emp_lname, dbo.prepare_payroll_hdr.trx_id, 
                      dbo.prepare_payroll_hdr.start_period, dbo.prepare_payroll_hdr.end_period, dbo.prepare_payroll_detail.basic_pay, dbo.prepare_payroll_detail.status, 
                      dbo.prepare_payroll_detail.OT1Rate, dbo.prepare_payroll_detail.OT2Rate, dbo.prepare_payroll_detail.OT1_e, dbo.prepare_payroll_detail.OT2_e, 
                      dbo.prepare_payroll_detail.Wdays, dbo.prepare_payroll_detail.NetPay, dbo.prepare_payroll_detail.total_additions, 
                      dbo.prepare_payroll_detail.total_deductions, dbo.prepare_payroll_detail.cpfAdd_Ordinary, dbo.prepare_payroll_detail.cpfAdd_Additional, 
                      dbo.prepare_payroll_detail.cpfNet, dbo.prepare_payroll_detail.empCPF, dbo.prepare_payroll_detail.employerCPF, 
                      dbo.prepare_payroll_detail.cpfAmount, dbo.prepare_payroll_detail.unpaid_leaves_amount, dbo.prepare_payroll_detail.unpaid_leaves, 
                      dbo.prepare_payroll_detail.total_gross, dbo.prepare_payroll_detail.SDL, dbo.prepare_payroll_detail.FWL, dbo.prepare_payroll_detail.OT1_wh, 
                      dbo.prepare_payroll_detail.OT2_wh, dbo.employee.Company_Id, dbo.department.DeptName
FROM         dbo.prepare_payroll_hdr INNER JOIN
                      dbo.prepare_payroll_detail ON dbo.prepare_payroll_hdr.trx_id = dbo.prepare_payroll_detail.trx_id INNER JOIN
                      dbo.employee ON dbo.prepare_payroll_detail.emp_id = dbo.employee.emp_code INNER JOIN
                      dbo.Company ON dbo.employee.Company_Id = dbo.Company.Company_Id Left Outer JOIN
                      dbo.department ON dbo.employee.dept_id = dbo.department.id
GO
/***************** Custom report --grouping (converted column) ******************************/

CREATE VIEW [dbo].[PayRollView1]
AS
SELECT     dbo.Company.Company_name, dbo.employee.emp_code, dbo.employee.emp_name, dbo.employee.emp_lname, dbo.prepare_payroll_hdr.trx_id, 
                      dbo.prepare_payroll_hdr.start_period, dbo.prepare_payroll_hdr.end_period, dbo.prepare_payroll_detail.basic_pay, dbo.prepare_payroll_detail.status, 
                      CAST(dbo.prepare_payroll_detail.OT1Rate AS float)as OT1Rate, 
                      CAST(dbo.prepare_payroll_detail.OT2Rate AS float)as OT2Rate, 
                      CAST(dbo.prepare_payroll_detail.OT1_e AS float)as OT1_e, 
                      CAST(dbo.prepare_payroll_detail.OT2_e AS float)as OT2_e, 
                      dbo.prepare_payroll_detail.Wdays, 
                      dbo.prepare_payroll_detail.NetPay, 
                      CAST(dbo.prepare_payroll_detail.total_additions AS float)as total_additions, 
                      CAST(dbo.prepare_payroll_detail.total_deductions AS float)as total_deductions, 
                      CAST(dbo.prepare_payroll_detail.cpfAdd_Ordinary AS float)as cpfAdd_Ordinary, 
                      dbo.prepare_payroll_detail.cpfAdd_Additional, 
                      CAST(dbo.prepare_payroll_detail.cpfNet AS float)as cpfNet, 
                      CAST(dbo.prepare_payroll_detail.empCPF AS float)as empCPF, 
                      CAST(dbo.prepare_payroll_detail.employerCPF AS float)as employerCPF, 
                      CAST(dbo.prepare_payroll_detail.cpfAmount AS float)as cpfAmount, 
                      dbo.prepare_payroll_detail.unpaid_leaves_amount, 
                      dbo.prepare_payroll_detail.unpaid_leaves, 
                      dbo.prepare_payroll_detail.total_gross, 
                      dbo.prepare_payroll_detail.SDL, 
                      dbo.prepare_payroll_detail.FWL, 
                      dbo.prepare_payroll_detail.OT1_wh, 
                      dbo.prepare_payroll_detail.OT2_wh, 
                      dbo.employee.Company_Id, 
                      dbo.department.DeptName,
                      dbo.prepare_payroll_detail.fund_type,
                      CAST(dbo.prepare_payroll_detail.fund_amount AS float)as fund_amount

FROM         dbo.prepare_payroll_hdr INNER JOIN
                      dbo.prepare_payroll_detail ON dbo.prepare_payroll_hdr.trx_id = dbo.prepare_payroll_detail.trx_id INNER JOIN
                      dbo.employee ON dbo.prepare_payroll_detail.emp_id = dbo.employee.emp_code INNER JOIN
                      dbo.Company ON dbo.employee.Company_Id = dbo.Company.Company_Id Left Outer JOIN
                      dbo.department ON dbo.employee.dept_id = dbo.department.id
GO
/***************** END Custom report --grouping (converted column) ******************************/

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[34] 4[15] 2[3] 3) )"
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
         Begin Table = "prepare_payroll_hdr"
            Begin Extent = 
               Top = 3
               Left = 250
               Bottom = 241
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "prepare_payroll_detail"
            Begin Extent = 
               Top = 26
               Left = 522
               Bottom = 261
               Right = 820
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "employee"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 242
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 60
         End
         Begin Table = "Company"
            Begin Extent = 
               Top = 6
               Left = 858
               Bottom = 121
               Right = 1063
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
      Begin ColumnWidths = 18
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
         Outp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PayRollView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'ut = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PayRollView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PayRollView'
GO
CREATE VIEW [dbo].[ViewAdditionTypesDesc]
AS
SELECT     id, [desc] AS description, cpf, company_id, type_of_wage, optionselection, code, formulatype, formulacalc, tax_payable, tax_payable_options, 
                      isShared
FROM         dbo.additions_types

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Begin Table = "additions_types"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 268
               Right = 220
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
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewAdditionTypesDesc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewAdditionTypesDesc'
GO
CREATE VIEW [dbo].[ViewDeductions] AS
select id, REPLACE([desc], ' ', '') as  description,company_id,cpf,isShared from deductions_types
GO

CREATE VIEW VIEW_GET_DATABASE_LOG_DETAILS  
As  
	SELECT  [LogDetails] As LogMessage ,[ErrorLogDateTime] As LogTime,  
	[Log_Type] As [Status]
	FROM DataBaseBackupLog 
GO