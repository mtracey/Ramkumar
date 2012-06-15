<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomReportNew_TimeSheet.aspx.cs" Inherits="SMEPayroll.Reports.CustomReportNew_TimeSheet" %>
<%@ Register TagPrefix="uc1" TagName="TopRightControl" Src="~/Frames/TopRightMenu.ascx" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="radG" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <title>SMEPayroll</title>
    <link rel="stylesheet" href="../STYLE/PMSStyle.css" type="text/css" />
    
        <style type="text/css"> 
    
    .SelectedRow
    { 
        background: #ffffff !important; /*white */ 
        height: 22px; 
        border: solid 1px #e5e5e5; 
        border-top: solid 1px #e9e9e9; 
        border-bottom: solid 1px white; 
        padding-left: 4px; 
    }
    
    .SelectedRowLock
    { 
        background: #dcdcdc !important; /*Lock Row */         
        height: 22px; 
        border: solid 1px #e5e5e5; 
        border-top: solid 1px #e9e9e9; 
        border-bottom: solid 1px white; 
        padding-left: 4px; 
    }
     
    .SelectedRowExceptionForOuttime
    { 
        background: #996633 !important; /*Maroon*/
        height: 22px; 
        border: solid 1px #e5e5e5; 
        border-top: solid 1px #e9e9e9; 
        border-bottom: solid 1px white; 
        padding-left: 4px; 
    } 
    
    .SelectedRowExceptionFlexibleInOutTimeCompareProject
    { 
        background: #99FFCC !important;   /*Green */
        height: 22px; 
        border: solid 1px #e5e5e5; 
        border-top: solid 1px #e9e9e9; 
        border-bottom: solid 1px white; 
        padding-left: 4px; 
    } 

    
    .SelectedRowExceptionForIntimeWithEarylyInByTime
    { 
        background: #FFFFCC !important; /*Yellow */
        height: 22px; 
        border: solid 1px #e5e5e5; 
        border-top: solid 1px #e9e9e9; 
        border-bottom: solid 1px white; 
        padding-left: 4px; 
    } 
    
    .SelectedRowException
    { 
        background: #CCFF33 !important; /*purple*/
        height: 22px; 
        border: solid 1px #e5e5e5; 
        border-top: solid 1px #e9e9e9; 
        border-bottom: solid 1px white; 
        padding-left: 4px; 
    } 
    
    .SelectedRowExceptionForInorOutBlank
    { 
        background: #800000  !important; /*Red */
        height: 22px; 
        border: solid 1px #e5e5e5; 
        border-top: solid 1px #e9e9e9; 
        border-bottom: solid 1px white; 
        padding-left: 4px; 
    } 
    
    .NormalRecordChk
    { 
        background: #E5E5E5  !important; /*Red */
        height: 22px; 
        border: solid 1px #e5e5e5; 
        border-top: solid 1px #e9e9e9; 
        border-bottom: solid 1px white; 
        padding-left: 4px; 
    } 
    

</style>
    
    
</head>
<body style="margin-left: auto">
    <form id="form1" runat="server">
     <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        </telerik:RadScriptManager>
           <telerik:RadFormDecorator ID="RadFormDecorator1" runat="server" Skin="Outlook" DecoratedControls="all" />
        <uc1:TopRightControl ID="TopRightControl1" runat="server" />
    <div>
         <table cellpadding="0" cellspacing="0" width="100%" border="0">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td align="right" style="height: 25px">
                            </td>
                            <td valign="middle" align="left" style="background-image: url(images/Reports/exporttowordl.jpg)">
                                <asp:ImageButton ID="btnExportWord" AlternateText="Export To Word" OnClick="btnExportWord_click"
                                    runat="server" ImageUrl="~/frames/images/Reports/exporttoWordl.jpg" />
                                <asp:ImageButton ID="btnExportExcel" AlternateText="Export To Excel" OnClick="btnExportExcel_click"
                                    runat="server" ImageUrl="~/frames/images/Reports/exporttoexcel.jpg" />
                                <asp:ImageButton ID="btnExportPdf" AlternateText="Export To PDF" OnClick="btnExportPdf_click"
                                    runat="server" ImageUrl="~/frames/images/Reports/exporttopdf.jpg" />
                            </td>
                            <td align="right" style="height: 25px">
                                <input id="Button1" type="button" onclick="history.go(-1)" value="Close" class="textfields"
                                    style="width: 80px; height: 22px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>  
                    <radG:RadGrid ID="RadGrid1" AllowFilteringByColumn="true"   runat="server" 
                        GridLines="None" Skin="Outlook" Width="99%" ShowFooter="true" ClientSettings-AllowDragToGroup="true"    ShowGroupPanel="true" 
                         OnGroupsChanging="RadGrid1_GroupsChanging" >
                        <MasterTableView AutoGenerateColumns="False"  
                            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" TableLayout="Auto" ShowGroupFooter="true" >
                            <FilterItemStyle HorizontalAlign="left" />
                            <HeaderStyle ForeColor="Navy" />
                            <ItemStyle BackColor="White" Height="20px" />
                            <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                            <Columns>
                            
                                 <radG:GridBoundColumn DataField="Time_Card_No" AllowFiltering="false" 
                                    HeaderText="Time_Card_No" SortExpression="Time_Card_No" UniqueName="Time_Card_No">
                                </radG:GridBoundColumn>
                                 <radG:GridBoundColumn DataField="Full_Name" AllowFiltering="false" 
                                    HeaderText="Full_Name" SortExpression="Full_Name" UniqueName="Full_Name">
                                </radG:GridBoundColumn>
                                 <radG:GridBoundColumn DataField="Trade" AllowFiltering="false" 
                                    HeaderText="Trade" SortExpression="Trade" UniqueName="Trade">
                                </radG:GridBoundColumn>
                                 <radG:GridBoundColumn DataField="Sub_Project_name" AllowFiltering="false" 
                                    HeaderText="Sub Project" SortExpression="Sub_Project_name" UniqueName="Sub_Project_name">
                                </radG:GridBoundColumn>
                                 <radG:GridBoundColumn DataField="trade_id" AllowFiltering="false" Display="False"
                                    HeaderText="trade_id" SortExpression="Trade" UniqueName="trade_id">
                                </radG:GridBoundColumn>                           
                               
                                  <radG:GridBoundColumn DataField="NHInMin" Aggregate="Sum" FooterText="&nbsp;"  AllowFiltering="false"  DataType="System.decimal"
                                    HeaderText="NH" SortExpression="NH" UniqueName="NH">
                                </radG:GridBoundColumn>
                                   <radG:GridBoundColumn DataField="Ot1InMin" Aggregate="Sum" FooterText="&nbsp;"   AllowFiltering="false"  DataType="System.decimal"
                                    HeaderText="OT1" SortExpression="OT1" UniqueName="OT1">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="ot2InMin" Aggregate="Sum" FooterText="&nbsp;"   AllowFiltering="false"  DataType="System.decimal"
                                    HeaderText="OT2" SortExpression="OT2" UniqueName="OT2">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Hourly_Rate" Aggregate="Sum" FooterText="&nbsp;"   AllowFiltering="false"  DataType="System.decimal"
                                    HeaderText="Hourly_Rate" SortExpression="Hourly_Rate" UniqueName="Hourly_Rate">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="OT1_Rate" Aggregate="Sum" FooterText="&nbsp;"   AllowFiltering="false"  DataType="System.decimal"
                                    HeaderText="OT1_Rate" SortExpression="OT1_Rate" UniqueName="OT1_Rate">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="OT2_Rate" Aggregate="Sum" FooterText="&nbsp;"   AllowFiltering="false"  DataType="System.decimal"
                                    HeaderText="OT2_Rate" SortExpression="OT2_Rate" UniqueName="OT2_Rate">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Tot_NH" Aggregate="Sum" FooterText="&nbsp;"   AllowFiltering="false"  DataType="System.decimal"
                                    HeaderText="Tot_NH" SortExpression="Tot_NH" UniqueName="Tot_NH">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="TotOT1" Aggregate="Sum" FooterText="&nbsp;"  AllowFiltering="false"  DataType="System.decimal"
                                    HeaderText="TotOT1" SortExpression="TotOT1" UniqueName="TotOT1">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="TotOT2" Aggregate="Sum" FooterText="&nbsp;"   AllowFiltering="false"  DataType="System.decimal"
                                    HeaderText="TotOT2" SortExpression="TotOT2" UniqueName="TotOT2">
                                </radG:GridBoundColumn>
                       
                            </Columns>
                            <ExpandCollapseColumn Visible="False">
                                <HeaderStyle Width="19px" />
                            </ExpandCollapseColumn>
                            <RowIndicatorColumn Visible="False">
                                <HeaderStyle Width="20px" />
                            </RowIndicatorColumn>
                        </MasterTableView>
                               <ClientSettings Resizing-ClipCellContentOnResize="true" >
                                    </ClientSettings>
                         <GroupingSettings ShowUnGroupButton="false"   RetainGroupFootersVisibility="true"  />
                    </radG:RadGrid>
                </td>
            </tr>
            <tr>
                <td>
                    <radG:RadGrid ID="RadGrid2" Visible="false" AllowFilteringByColumn="true"   runat="server" 
                        GridLines="None" Skin="Outlook" Width="99%" ShowFooter="true" ClientSettings-AllowDragToGroup="true"    ShowGroupPanel="true" 
                         OnGroupsChanging="RadGrid2_GroupsChanging" OnItemDataBound="RadGrid2_ItemDataBound" >
                        <MasterTableView AutoGenerateColumns="False"  
                            AllowAutomaticInserts="True" AllowAutomaticUpdates="True" TableLayout="Auto" ShowGroupFooter="true" >
                            <FilterItemStyle HorizontalAlign="left" />
                            <HeaderStyle ForeColor="Navy" />
                            <ItemStyle BackColor="White" Height="20px" />
                            <AlternatingItemStyle BackColor="#E5E5E5" Height="20px" />
                            <Columns>
                                 <radG:GridBoundColumn DataField="Roster_id" AllowFiltering="false"  Display="False"
                                    HeaderText="Roster_id" SortExpression="Roster_id" UniqueName="Roster_id">
                                </radG:GridBoundColumn>
                                
                                <radG:GridBoundColumn DataField="Sub_project_id" AllowFiltering="false"  Display="False"
                                    HeaderText="Sub_project_id" SortExpression="Sub_project_id" UniqueName="Sub_project_id">
                                </radG:GridBoundColumn>
                                
                                 <radG:GridBoundColumn DataField="Time_Card_No" AllowFiltering="false" 
                                    HeaderText="Time_Card_No" SortExpression="Time_Card_No" UniqueName="Time_Card_No">
                                </radG:GridBoundColumn>
                                 <radG:GridBoundColumn DataField="Full_Name" AllowFiltering="false" 
                                    HeaderText="Full_Name" SortExpression="Full_Name" UniqueName="Full_Name">
                                </radG:GridBoundColumn>
                                 <radG:GridBoundColumn DataField="Sub_Project_Name" AllowFiltering="false" 
                                    HeaderText="Sub_Project_Name" SortExpression="Sub_Project_Name" UniqueName="Sub_Project_Name">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Date" AllowFiltering="false" 
                                    HeaderText="Date" SortExpression="Date" UniqueName="Date">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="In_Time"   AllowFiltering="false"  
                                    HeaderText="In_Time" SortExpression="In_Time" UniqueName="In_Time">
                                </radG:GridBoundColumn>
                                 <radG:GridBoundColumn DataField="Out_Time"   AllowFiltering="false"  
                                    HeaderText="Out_Time" SortExpression="Out_Time" UniqueName="Out_Time">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Hours_Worked"  Aggregate="Sum" FooterText="&nbsp;"  AllowFiltering="false"  DataType="System.decimal"
                                    HeaderText="Hours_Worked" SortExpression="Hours_Worked" UniqueName="Hours_Worked">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="NH"  AllowFiltering="false"  DataType="System.decimal"
                                    HeaderText="NH" SortExpression="NH" UniqueName="NH">
                                </radG:GridBoundColumn>
                                   <radG:GridBoundColumn DataField="OT1" Aggregate="Sum" FooterText="&nbsp;"   AllowFiltering="false"  DataType="System.decimal"
                                    HeaderText="OT1" SortExpression="OT1" UniqueName="OT1">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="OT2" Aggregate="Sum" FooterText="&nbsp;"   AllowFiltering="false"  DataType="System.decimal"
                                    HeaderText="OT2" SortExpression="OT2" UniqueName="OT2">
                                </radG:GridBoundColumn>
                                <radG:GridBoundColumn DataField="Emp_Code" AllowFiltering="false" 
                                    HeaderText="Emp_Code" SortExpression="Emp_Code" UniqueName="Emp_Code">
                                </radG:GridBoundColumn>
                       
                            </Columns>
                            <ExpandCollapseColumn Visible="False">
                                <HeaderStyle Width="19px" />
                            </ExpandCollapseColumn>
                            <RowIndicatorColumn Visible="False">
                                <HeaderStyle Width="20px" />
                            </RowIndicatorColumn>
                        </MasterTableView>
                               <ClientSettings Resizing-ClipCellContentOnResize="true" >
                                    </ClientSettings>
                         <GroupingSettings ShowUnGroupButton="false"   RetainGroupFootersVisibility="true"  />
                    </radG:RadGrid>  
                </td>
            </tr>
         </table>
    </div>
    </form>
</body>
</html>
